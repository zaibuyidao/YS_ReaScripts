--[[
 * ReaScript Name: Bend 推弦
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

From,Thru = reaper.GetSet_LoopTimeRange(false, true, 0, 0, true)

local From_tick=reaper.MIDI_GetPPQPosFromProjTime(take, From)
local Thru_tick=reaper.MIDI_GetPPQPosFromProjTime(take, Thru)

retval,shuru= reaper.GetUserInputs('Bend 推弦',1,"PitchRange = (0,2048)",'1366')  
 
 wanyin_num=tonumber(shuru) 
 
 a = (Thru_tick - From_tick ) * 0.4
 b = (Thru_tick - From_tick ) * 0.6
 
 
 if (Thru ~= 0) then 
if (wanyin_num > 0)
then
if (wanyin_num > 8191) then wanyin_num = 8191 end
if (wanyin_num < -8192) then wanyin_num = -8191 end

local beishu = math.modf( wanyin_num / 128 )
local yushu = math.fmod( wanyin_num, 128 ) 
if (beishu < 0)
then beishu=beishu-1
end
reaper.MIDI_InsertCC(take, true, false, From_tick , 224, 0,0,64)
reaper.MIDI_InsertCC(take, false, false,Thru_tick , 224, 0,0,64)
reaper.MIDI_InsertCC(take, false, false, From_tick+a , 224, 0,yushu,64+beishu)
reaper.MIDI_InsertCC(take, true, false, From_tick+b , 224, 0,yushu,64+beishu)
end 
end 
ccidx = -1
repeat
     integer = reaper.MIDI_EnumSelCC(take, ccidx)
    reaper.MIDI_SetCCShape(take, ccidx, 2, 0, true)
    reaper.MIDI_SetCC(take, ccidx, false, false, NULL,NULL, NULL, NULL, NULL, true)
    ccidx=integer
until integer==-1

reaper.SN_FocusMIDIEditor()





