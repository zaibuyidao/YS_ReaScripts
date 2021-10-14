--[[
 * ReaScript Name: Bass 包络缩短处理
 * Version: 1.0
 * Author: YS
 * Repository URI: https://github.com/zaibuyidao/YS_ReaScripts
 * provides: [main=midi_editor] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-10-14)
  + Initial release
--]]

local editor=reaper.MIDIEditor_GetActive()

local take=reaper.MIDIEditor_GetTake(editor)

ret,scv=reaper.GetUserInputs('bass 包络缩短处理',1,'缩短 TICK 数：','4')
scv=tonumber(scv)

reaper.MIDI_DisableSort(take)

tempend,i,idx,temppitch=-1,1,-1,-1
integer = reaper.MIDI_EnumSelNotes(take,idx)
while (integer ~= -1) do
integer = reaper.MIDI_EnumSelNotes(take,idx)

retval,selected, muted,startppqpos,endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
if startppqpos==tempend  then
 if tempidx~=nil then
 reaper.MIDI_SetNote(take, tempidx, NULL, NULL, NULL, tempend-scv, NULL, NULL,NULL, false) end
 if pitch==temppitch  then
 reaper.MIDI_SetNote(take, tempidx, NULL, NULL, NULL, startppqpos-(scv*2), NULL, NULL,NULL, false)
 end -- if end
 end
 tempend=endppqpos temppitch=pitch tempidx=integer
 idx=integer
 integer = reaper.MIDI_EnumSelNotes(take,idx)
end -- while end
reaper.MIDI_Sort(take)

reaper.SN_FocusMIDIEditor()


