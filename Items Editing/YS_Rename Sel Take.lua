--[[
 * ReaScript Name: Rename Sel Take
 * Version: 1.0
 * Author: YS
 * Repository URI: https://github.com/zaibuyidao/YS_ReaScripts
 * provides: [main=main] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-10-14)
  + Initial release
--]]

retval, txt=reaper.GetUserInputs('Rename Item',1,'New Name,extrawidth=200','')
if retval == false then return end
cont=reaper.CountSelectedMediaItems(0)
idx=0
while idx<cont do
item=reaper.GetSelectedMediaItem(0 ,idx)
tk= reaper.GetMediaItemTake(item, 0)
retval, txt = reaper.GetSetMediaItemTakeInfo_String(tk, 'P_NAME', txt, true)
idx=idx+1
end

