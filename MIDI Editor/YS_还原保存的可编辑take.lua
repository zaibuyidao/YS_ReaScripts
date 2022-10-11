--[[
 * ReaScript Name: 还原保存的可编辑take
 * Version: 1.0
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2022-10-11)
  + Initial release
--]]

reaper.PreventUIRefresh(1)
editor = reaper.MIDIEditor_GetActive()

reaper.Main_OnCommand(reaper.NamedCommandLookup('_SWS_RESTALLSELITEMS1'), 0)

oldtake = reaper.MIDIEditor_GetTake(editor)
oldtrack = reaper.GetMediaItemTake_Track(oldtake)
selitem = reaper.GetSelectedMediaItem(0, 0)
if selitem == nil then return end
seltrack = reaper.GetMediaItemTrack(selitem)

if seltrack == oldtrack then reaper.MIDIEditor_OnCommand(editor, 40794) end

selitemcount = reaper.CountSelectedMediaItems(0)

reaper.Main_OnCommand(40153, 0)

reaper.PreventUIRefresh(-1)

