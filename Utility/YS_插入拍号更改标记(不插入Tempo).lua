--[[
 * ReaScript Name: 插入拍号更改标记(不插入Tempo)
 * Version: 1.0
 * Author: YS
 * provides: [main=main] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

pos=reaper.GetCursorPosition()
QN = reaper.TimeMap2_timeToQN(0, pos)
retval, qnMeasureStart, qnMeasureEnd = reaper.TimeMap_QNToMeasures(0, QN)
if qnMeasureStart~=QN then reaper.MB('请移动光标到小节开始处！','位置错误！',0) return end
retval, msg=reaper.GetUserInputs('插入拍号信息！',2,'                                Beats Per:,                                Beat      /','4,4')
if retval then per,beat=string.match(msg,"(%d+),(%d+)")
per=tonumber(per) beat=tonumber(beat)
reaper.AddTempoTimeSigMarker(0, pos, 0, per, beat, false) end
reaper.Main_OnCommand(41044,0)
reaper.Main_OnCommand(41045,0)
