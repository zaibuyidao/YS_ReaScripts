--[[
 * ReaScript Name: 定时启动录制
 * Version: 1.0
 * Author: YS
 * provides: [main=main] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

sytime=os.date('%X')
retval,input= reaper.GetUserInputs('Time recording',1,'输入启动 Time：xx:xx:xx',sytime) 
function Time_recording()
sytime=os.date('%X')
if sytime==input then   reaper.Main_OnCommand(1013, 0) end
if sytime<input then  reaper.defer(Time_recording) end
end
Time_recording()
 


