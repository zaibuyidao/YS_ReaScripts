--[[
 * ReaScript Name: slide Left 10 tick_Multi Track
 * Version: 1.1
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

reaper.PreventUIRefresh(1)

local editor=reaper.MIDIEditor_GetActive()

takeindex = 0
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take~=nil do

idx=-1
    
reaper.MIDI_DisableSort(take)
integer = reaper.MIDI_EnumSelEvts(take, idx)

while integer ~= -1 do

integer = reaper.MIDI_EnumSelEvts(take, idx)

if integer~=-1 then

retval, selected, muted, ppqpos, msg = reaper.MIDI_GetEvt(take, integer, true, false, -1, '')

reaper.MIDI_SetEvt(take, integer, NULL, NULL,  ppqpos-10, '', false)

idx=integer

end -- if end 

end -- while end

reaper.MIDI_Sort(take)

takeindex=takeindex+1
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)

end -- while take end

reaper.PreventUIRefresh(-1)
