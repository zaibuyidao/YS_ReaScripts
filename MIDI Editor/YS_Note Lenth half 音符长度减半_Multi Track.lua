--[[
 * ReaScript Name: Note Lenth half 音符长度减半_Multi Track
 * Version: 1.1
 * Author: YS
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

 reaper.MIDI_DisableSort(take)
idx=-1 
repeat 
  n_idx = reaper.MIDI_EnumSelNotes(take,idx)  
  if n_idx~=-1 then
   retval, sel, mute, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, n_idx)
  dur=endppqpos-startppqpos
  dur = dur / 2
  reaper.MIDI_SetNote(take, n_idx, true, false, NULL, startppqpos+dur, NULL, NULL, NULL, false)
  end
idx=n_idx
n_idx = reaper.MIDI_EnumSelNotes(take,idx) 
until (n_idx==-1) 

reaper.MIDI_Sort(take)

takeindex=takeindex+1
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
end -- while take end


