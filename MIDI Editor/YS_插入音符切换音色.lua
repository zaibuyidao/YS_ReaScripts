--[[
 * ReaScript Name: 插入音符切换音色
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
reaper.MIDI_DisableSort(take)

retval, notecnt,ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
idx = -1
jihao = ''
integer = reaper.MIDI_EnumSelNotes(take, idx)
if integer == -1 then return end
integer_first = integer
idx = integer

repeat    
 integer = reaper.MIDI_EnumSelNotes(take, idx) 
 integer_end = integer 
 idx = integer
 integer = reaper.MIDI_EnumSelNotes(take, idx) 
 until (integer == -1)
 
retval,val= reaper.GetUserInputs('Insert Note To PC',2,'输入新的音色键号,输入旧的音色键号','37,36') 
PC_new1,PC_old1=string.match(val,"(%d+),(%d+)")
PC_new=tonumber (PC_new1)
PC_old=tonumber (PC_old1)
if integer_end+1==notecnt then integer_end=integer_end-1 end
 
while  integer_first <= integer_end+1  do
retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer_first)
if selected ~= jihao and retval ~= false then 
  if selected then
reaper.MIDI_InsertNote(take, false, false, startppqpos-10, startppqpos+50, chan, PC_new,20, false)

else 
if PC_old < 128  and retval ~= false then
reaper.MIDI_InsertNote(take, false, false, startppqpos-10, startppqpos+50, chan, PC_old,20, false)
end
end  -- if1 end
end  -- if2 end
jihao = selected
integer_first = integer_first + 1
end

reaper.MIDI_Sort(take)
reaper.SN_FocusMIDIEditor()