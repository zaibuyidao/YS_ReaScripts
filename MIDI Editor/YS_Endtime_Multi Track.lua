--[[
 * ReaScript Name: Endtime_Multi Track
 * Version: 1.1
 * Author: YS
 * provides: [main=midi_editor] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

editor=reaper.MIDIEditor_GetActive()

takeindex = 0
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take~=nil do

num=reaper.GetCursorPositionEx(0)
dur=reaper.MIDI_GetPPQPosFromProjTime(take, num)
 reaper.MIDI_DisableSort(take)
local idx=-1 
tbnote={}
repeat 
  n_idx = reaper.MIDI_EnumSelNotes(take,idx)  
   retval, sel, mute, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, n_idx)
   if startppqpos < dur then
  if tbnote[pitch]~=nil then 
  reaper.MIDI_SetNote(take, tbnote[pitch], true, false, NULL, startppqpos, NULL, NULL, NULL, false)
  end
 tbnote[pitch]=n_idx
 end
idx=n_idx
n_idx = reaper.MIDI_EnumSelNotes(take,idx) 
until (n_idx==-1) 
key=0
 while key < 128 do
    if tbnote[key] ~= nil then
    reaper.MIDI_SetNote(take, tbnote[key], true, false, NULL, dur, NULL, NULL, NULL, false)
    end
    key = key + 1
end 
reaper.MIDI_Sort(take)

takeindex=takeindex+1
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
end -- while take end

