--[[
 * ReaScript Name: Un-Mute All item Track
 * Version: 1.0
 * Author: YS
 * provides: [main=main] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-10-14)
  + Initial release
--]]

reaper.Main_OnCommand(40340, 0)
integer = reaper.CountMediaItems(0)
 idx = 0
 while idx < integer do
 MediaItem = reaper.GetMediaItem(0, idx)
 idx=idx+1
 reaper.SetMediaItemInfo_Value(MediaItem, 'B_MUTE', 0)
 end -- while end
reaper.UpdateArrange()
