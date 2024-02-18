--[[
 * ReaScript Name: Flam Note
 * Version: 1.1.1
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2024-2-18)
  + Initial release
--]]

editor = reaper.MIDIEditor_GetActive()
reaper.MIDIEditor_OnCommand(editor, 40440) -- move cursor
take = reaper.MIDIEditor_GetTake(editor)
pos = reaper.GetCursorPosition()
ppq1 = reaper.MIDI_GetPPQPosFromProjTime(take, pos)
ppq2 = reaper.MIDI_GetPPQPosFromProjTime(take, pos + 0.032)
jiange = math.floor(ppq2 - ppq1)
input = jiange .. ',-10'
local retval, shuzhi = reaper.GetUserInputs('Flam Note', 2, '音符距离 Tick (建议值),力度增减值,', input)
if retval == false then
    reaper.SN_FocusMIDIEditor()
    return
end

tick_sub, chazhi_sub = string.match(shuzhi, "(-?%d+),(-?%d+)")
local tick = tonumber(tick_sub)
local chazhi = tonumber(chazhi_sub)

if tick < 0 then
    tick_sub = tick * (-1)
else
    tick_sub = tick
end

if tick_sub >= 5 then

    takeindex = 0
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    while take ~= nil do

        reaper.MIDI_DisableSort(take)
        idx = -1
        repeat
            integer = reaper.MIDI_EnumSelNotes(take, idx)
            if integer ~= -1 then
                retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
                if tick > 0 then
                    reaper.MIDI_SetNote(take, integer, true, false, startppqpos, startppqpos + tick - 1, NULL, NULL, NULL, false)
                end
                new_vel = vel + chazhi
                if new_vel < 1 then
                    new_vel = 1
                end
                if new_vel > 127 then
                    new_vel = 127
                end
                if tick < 0 then
                    reaper.MIDI_InsertNote(take, false, false, startppqpos + tick, startppqpos - 1, chan, pitch, new_vel, false)
                else
                    reaper.MIDI_InsertNote(take, false, false, startppqpos + tick, endppqpos + tick, chan, pitch, new_vel, false)
                end
                idx = integer
            end
        until integer == -1
        reaper.MIDI_Sort(take)

        takeindex = takeindex + 1
        take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    end -- while take end

end -- >=5
reaper.SN_FocusMIDIEditor()
