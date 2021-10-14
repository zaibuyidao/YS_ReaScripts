--[[
 * ReaScript Name: insert Wheel
 * Version: 1.1
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

retval,banyin= reaper.GetUserInputs('Insert Wheel Multi Track',1,'输入-12到12 Wheel Val=','0') 
if retval==false then reaper.SN_FocusMIDIEditor() return end
banyinsub=tonumber (banyin)

local num=reaper.GetCursorPositionEx(0)

local editor=reaper.MIDIEditor_GetActive()

takeindex = 0
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take~=nil do

startpos=reaper.MIDI_GetPPQPosFromProjTime(take, num)
pitch = 683*banyinsub 

if (pitch > 8191) then pitch = 8191 end
if (pitch < -8192) then pitch = -8191 end

local beishu = math.modf( pitch / 128 )
local yushu = math.fmod( pitch, 128 ) 
if (beishu < 0)
then beishu=beishu-1
end

reaper.MIDI_InsertCC(take, false, false, startpos , 224, 0,yushu,64+beishu)

takeindex=takeindex+1
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
end -- while take end

reaper.MIDIEditor_OnCommand(editor, 40366) --show pitch
reaper.SN_FocusMIDIEditor()

