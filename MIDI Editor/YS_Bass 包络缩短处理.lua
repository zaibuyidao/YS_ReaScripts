--[[
 * ReaScript Name: Bass 包络缩短处理
 * Version: 1.0.2
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2021-10-14)
  + Initial release
--]]

tick9 = 0
txt = ''
local editor = reaper.MIDIEditor_GetActive()

local take = reaper.MIDIEditor_GetTake(editor)

ret, scv = reaper.GetUserInputs('bass 包络缩短处理', 1, '缩短 TICK 数：', '4')
scv = tonumber(scv)
if scv < 0 then scv = scv * -1 end

reaper.MIDI_DisableSort(take)

tempend, i, idx, temppitch = -1, 1, -1, -1
integer = reaper.MIDI_EnumSelNotes(take, idx)
while (integer ~= -1) do
    integer = reaper.MIDI_EnumSelNotes(take, idx)

    retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)

    local tick_m = startppqpos - reaper.MIDI_GetPPQPos_StartOfMeasure(take, startppqpos)
    local tick_10 = tick_m % 10
    if tick_10 > 7 then tick9 = tick9 + 1 end
    if startppqpos - tempend < scv then
        if tempidx ~= nil then
            reaper.MIDI_SetNote(take, tempidx, NULL, NULL, NULL, tempend - scv, NULL, NULL, NULL, false)
        end
    end
        if pitch == temppitch and startppqpos - tempend < scv*2 then
            reaper.MIDI_SetNote(take, tempidx, NULL, NULL, NULL, startppqpos - (scv * 2), NULL, NULL, NULL, false)
        end -- if end
    
    tempend = endppqpos
    temppitch = pitch
    tempidx = integer
    idx = integer
    integer = reaper.MIDI_EnumSelNotes(take, idx)
end -- while end
reaper.MIDI_Sort(take)

if tick9 > 10 then
    track = reaper.GetMediaItemTake_Track(take)
    txt = txt .. ' 存在部分音符位置尾数 >=8 tick，请确认！\n'
end

reaper.SN_FocusMIDIEditor()

reaper.ClearConsole()
reaper.ShowConsoleMsg(txt)

