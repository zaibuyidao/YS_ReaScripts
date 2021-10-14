--[[
 * ReaScript Name: guitar 定弦
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

retval,xian= reaper.GetUserInputs('吉他定弦插件',1,'输入1-6 的数值代表起始弦数','0') 
xian_sub=tonumber(xian)
idx=-1
if (xian_sub > 0 and xian_sub <7)
then
 repeat 
 integer = reaper.MIDI_EnumSelNotes(take, idx)
 if integer ~= -1 then
 retval, selected, muted, startpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
boolean = reaper.MIDI_InsertNote(take, false, false, startpos-1, startpos+80, 0, 37-xian_sub, 100, true)
xian_sub = xian_sub - 1
 end
 idx=integer
integer = reaper.MIDI_EnumSelNotes(take, idx)
 until integer==-1 or xian_sub < 1
end
reaper.MIDI_Sort(take)
reaper.SN_FocusMIDIEditor()
