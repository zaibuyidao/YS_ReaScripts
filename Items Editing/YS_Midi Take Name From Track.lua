--[[
 * ReaScript Name: Midi Take Name From Track
 * Version: 1.0.1
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2021-10-14)
  + Initial release
--]]

integer = reaper.CountMediaItems(0)
stringNeedBig = ''
 idx = 0
 while idx < integer do
 MediaItem = reaper.GetMediaItem(0, idx)
 idx=idx+1
  take = reaper.GetTake(MediaItem, 0)
  track  = reaper.GetMediaItem_Track(MediaItem)
  buf = reaper.GetProjectName(0, '')
  num = reaper.GetMediaItemInfo_Value(MediaItem, 'IP_ITEMNUMBER')
  num = num + 1
  n1,n2 = math.modf(num)
  if reaper.TakeIsMIDI(take) then
  retval, stringNeedBig = reaper.GetSetMediaTrackInfo_String(track,'P_NAME','', false)
  reaper.GetSetMediaItemTakeInfo_String(take, 'P_NAME', buf..' - '..'['..stringNeedBig..']'..' #'..n1, true)
  end -- if midi end
 end -- while end


