--[[
 * ReaScript Name: Glue note 胶合音符_Multi Track
 * Version: 1.0
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2021-10-14)
  + Initial release
--]]

local editor=reaper.MIDIEditor_GetActive()


takeindex = 0
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take~=nil do

reaper.MIDI_DisableSort(take)
 tb={}
 idx=-1
 integer = reaper.MIDI_EnumSelNotes(take,idx)
 
 while integer~=-1 do
 
 retval,selected, muted,startppqpos,endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
 
  if tb[pitch]==nil then 
  tb[pitch]=integer
  idx=integer
  else 
  reaper.MIDI_DeleteNote(take , integer)
  reaper.MIDI_SetNote(take, tb[pitch], NULL, NULL, NULL, endppqpos, NULL, NULL,NULL, false) 
  end
 
 integer = reaper.MIDI_EnumSelNotes(take,idx)
 
 end -- while end

reaper.MIDI_Sort(take)

takeindex=takeindex+1
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
end -- while take end




