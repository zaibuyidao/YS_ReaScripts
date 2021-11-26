--[[
 * ReaScript Name: slide out
 * Version: 1.0.1
 * Author: YS
 * provides: [main=midi_editor] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

--BY YS 201903
local a=0
local b=0
local c=0
local editor=reaper.MIDIEditor_GetActive()

local take=reaper.MIDIEditor_GetTake(editor)

From,Thru = reaper.GetSet_LoopTimeRange(false, true, 0, 0, true)

if From==0 and Thru==0 then reaper.MB('请设置好时间范围！','没有设定时间范围！',0) reaper.SN_FocusMIDIEditor() return end

local From_tick=reaper.MIDI_GetPPQPosFromProjTime(take, From)
local Thru_tick=reaper.MIDI_GetPPQPosFromProjTime(take, Thru)

retval,shuru= reaper.GetUserInputs('Slide Out Wheel 滑弦出',1,"PitchRange = (-12,12)",'0')  
 if retval==false then reaper.SN_FocusMIDIEditor() return end
 
wanyin_num=tonumber(shuru) 

 if wanyin_num < 0 then jiange=wanyin_num*-1 else jiange =wanyin_num  end
 a = Thru_tick - From_tick
 a = a - (a/(jiange+1))
 b= a / wanyin_num
 if (Thru ~= 0) then 
if (wanyin_num > 0)--zhengshu
then
pitch = 683*wanyin_num

if (pitch > 8191) then pitch = 8191 end

local beishu = math.modf( pitch / 128 )
local yushu = math.fmod( pitch, 128 ) 

 while (c <= wanyin_num)
  do
  pitch = 683*c
  
  if (pitch > 8191) then pitch = 8191 end
 
  local beishu = math.modf( pitch / 128 )
  local yushu = math.fmod( pitch, 128 ) 

 reaper.MIDI_InsertCC(take, false, false,From_tick +(c*b) , 224, 0,yushu,64+beishu)
 c=c+1  
end
 reaper.MIDI_InsertCC(take, false, false, Thru_tick , 224, 0,0,64)
end
end -- thru zhengshu
 if (Thru ~= 0) then 
if (wanyin_num < 0)
then
 pitch = 683*wanyin_num
 
 if (pitch > 8191) then pitch = 8191 end
 if (pitch < -8192) then pitch = -8191 end
 
 local beishu = math.modf( pitch / 128 )
 local yushu = math.fmod( pitch, 128 ) 
 if (beishu < 0)
 then beishu=beishu-1
 end
 
  while (c >= wanyin_num)
   do
   pitch = 683*c
   
   if (pitch > 8191) then pitch = 8191 end
   if (pitch < -8192) then pitch = -8191 end
   
   local beishu = math.modf( pitch / 128 )
   local yushu = math.fmod( pitch, 128 ) 
   if (beishu < 0)
   then beishu=beishu-1
   end
  reaper.MIDI_InsertCC(take, false, false,From_tick +(c*b) , 224, 0,yushu,64+beishu)
  c=c-1
  end 
  reaper.MIDI_InsertCC(take, false, false, Thru_tick , 224, 0,0,64)
end 
end --thru fushu

reaper.SN_FocusMIDIEditor()