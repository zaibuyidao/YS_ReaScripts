--[[
 * ReaScript Name: CC shaper_Linear_Multi Track
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
  ccidx = reaper.MIDI_EnumSelCC(take,idx)  
  if ccidx~=-1 then
 reaper.MIDI_SetCCShape(take, ccidx, 1, 0, false)
  end
idx=ccidx
ccidx = reaper.MIDI_EnumSelCC(take,idx) 
until (ccidx==-1) 

reaper.MIDI_Sort(take)

takeindex=takeindex+1
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
end -- while take end

