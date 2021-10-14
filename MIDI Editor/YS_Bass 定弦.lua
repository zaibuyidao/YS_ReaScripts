--[[
 * ReaScript Name: Bass 定弦
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

local num=reaper.GetCursorPositionEx(0)

local editor=reaper.MIDIEditor_GetActive()

local take=reaper.MIDIEditor_GetTake(editor)


retval,xian= reaper.GetUserInputs('BASS定弦插件',1,'输入1-4之间的数值代表弦数','0') 
xian_sub=tonumber(xian)
idx=-1
if (xian_sub > 0 and xian_sub <5)
then
 repeat 
 integer = reaper.MIDI_EnumSelNotes(take, idx)
 if integer ~= -1 then
 retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
 reaper.MIDI_InsertNote(take, false, false, startppqpos-10, startppqpos+120, 0, 104-xian_sub, 100, true)
 end
 idx=integer
 until integer==-1
end
reaper.MIDI_Sort(take)
reaper.SN_FocusMIDIEditor()
