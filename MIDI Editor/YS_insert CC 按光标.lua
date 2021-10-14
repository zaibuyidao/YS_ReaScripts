--[[
 * ReaScript Name: insert CC 按光标
 * Version: 1.1
 * Author: YS
 * provides: [main=midi_editor] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

retval,shuzhi= reaper.GetUserInputs('insert CC 按光标 Multi Track',2,'输入CC类型 CC num =,输入CC数值 CC val =','11,127') 
if retval==false then return end
num_sub,val_sub=string.match(shuzhi,"(%d+),(%d+)")
num=tonumber (num_sub)
val=tonumber (val_sub)

local pos=reaper.GetCursorPositionEx(0)

local editor=reaper.MIDIEditor_GetActive()

takeindex = 0
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take~=nil do

local startpos=reaper.MIDI_GetPPQPosFromProjTime(take, pos)


if num >= 0 and num <= 127 then
if val >= 0 and val <= 127 then

reaper.MIDI_InsertCC(take, false, false, startpos , 176, 0,num,val)

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

