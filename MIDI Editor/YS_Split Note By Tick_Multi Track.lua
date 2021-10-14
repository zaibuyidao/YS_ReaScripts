--[[
 * ReaScript Name: Split Note By Tick_Multi Track
 * Version: 1.1
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

local editor=reaper.MIDIEditor_GetActive()

retval,tick= reaper.GetUserInputs('Split notes by Tick',1,'Split Tick','0') 
tick_sub=tonumber(tick)

takeindex = 0
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take~=nil do

reaper.MIDI_DisableSort(take)

local idx = -1


if tick_sub > 0  then

repeat

integer = reaper.MIDI_EnumSelNotes(take, idx)

retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)

local dur= endppqpos - startppqpos

if dur > tick_sub then
  
  reaper.MIDI_SetNote(take, integer, true, false, startppqpos, startppqpos+tick_sub-1, null, null, null, false)
  
  i=1
  notestart = startppqpos + tick_sub * i
  while notestart < endppqpos do
 durend = startppqpos + tick_sub * (i+1)
  if durend > endppqpos then durend = endppqpos end -- fangzhi yichu
  reaper.MIDI_InsertNote(take, false, false, notestart, durend-1, chan, pitch, vel, false)
  i=i+1
  notestart = startppqpos + tick_sub * i
   
  end --while end
end

idx = integer

until  integer == -1

end

reaper.MIDI_Sort(take)

takeindex=takeindex+1
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)

end -- while take end


reaper.SN_FocusMIDIEditor()


  
  
