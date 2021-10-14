--[[
 * ReaScript Name: insert CC 按选中音符
 * Version: 1.1
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

retval, shuzhi = reaper.GetUserInputs('insert CC 按选中音符 Multi Track', 3, 'CC Num=,CC Val=,Tick(-+)', '11,127,0')
if retval==false then return end
num_sub,val_sub,tick_sub=string.match(shuzhi,"(%d+),(%d+),([+-]?%d+)")
num=tonumber (num_sub)
val=tonumber (val_sub)  tick=tonumber (tick_sub)
local editor=reaper.MIDIEditor_GetActive()

takeindex = 0
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take~=nil do

retval,notecnt,ccevtcnt, extsyxevtcnt = reaper.MIDI_CountEvts(take)
tb={}
for i=0 ,notecnt,1 do
retval, sel, mute, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, i)
if (sel==true)
then
tb[i]=startppqpos

if num >= 0 and num <= 127 then
if val >= 0 and val <= 127 then
reaper.MIDI_InsertCC(take, false,false, startppqpos+tick, 176, 0, num, val)
end
end
end
end

takeindex=takeindex+1
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
end -- while take end

if num >= 0 and num <= 119 then
ID = num + 40238
reaper.MIDIEditor_OnCommand(editor, ID)
end
reaper.SN_FocusMIDIEditor()
