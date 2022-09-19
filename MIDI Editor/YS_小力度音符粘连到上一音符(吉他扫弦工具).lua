--[[
 * ReaScript Name: 小力度音符粘连到上一音符(吉他扫弦工具)
 * Version: 1.0.1
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

local editor = reaper.MIDIEditor_GetActive()

retval, shuzhi = reaper.GetUserInputs('小力度音符粘连到上一音符', 1, '输入力度临界值 :', '85')
if retval == false then return reaper.SN_FocusMIDIEditor() end
shuzhi = tonumber(shuzhi)

takeindex = 0
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take~=nil do

reaper.MIDI_DisableSort(take)

idx = -1
note = {}
integer = reaper.MIDI_EnumSelNotes(take, -1)
retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
note['st'] = endppqpos
note['pitch'] = pitch
note['idx'] = integer
idx = integer

while (integer ~= -1) do
    integer = reaper.MIDI_EnumSelNotes(take, idx)
    retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
       dur = endppqpos - startppqpos
    if vel < shuzhi and pitch == note['pitch'] and dur > 30 then
        reaper.MIDI_DeleteNote(take, integer)
        reaper.MIDI_SetNote(take, note['idx'], true, false, NULL, endppqpos, NULL, NULL, NULL, false)
    else
        note['st'] = endppqpos
        note['pitch'] = pitch
        note['idx'] = integer
        idx = integer
        integer = reaper.MIDI_EnumSelNotes(take, idx)
    end
end
reaper.MIDI_Sort(take)

takeindex=takeindex+1
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
end -- while take end

reaper.SN_FocusMIDIEditor()

