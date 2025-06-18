--[[
 * ReaScript Name: 根据所选事件设置可编辑多Take
 * Version: 1.0.1
 * Author: YS
 * provides: [main=midi_editor] .
--]]

--[[
 * Changelog:
 * v1.0 (2022-1-15)
  + Initial release
--]]

reaper.Undo_BeginBlock()
reaper.PreventUIRefresh(1)

editor = reaper.MIDIEditor_GetActive()
oldtake = reaper.MIDIEditor_GetTake(editor)
olditem = reaper.GetMediaItemTake_Item(oldtake)
takeindex = 0
item_tb = {}
take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take ~= nil do
    if reaper.MIDI_EnumSelEvts(take, -1) ~= -1 then
        edittake = take
        edititem = reaper.GetMediaItemTake_Item(take)
        table.insert(item_tb, edititem)
    end
    takeindex = takeindex + 1
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
end -- while take end
if #item_tb == 0 then return end

reaper.SelectAllMediaItems(0, false)
for i, v in ipairs(item_tb) do reaper.SetMediaItemSelected(v, true) end

firstselitem = reaper.GetSelectedMediaItem(0, 0)

if olditem == firstselitem then
    ret, olditemstr = reaper.GetItemStateChunk(olditem, '', false)
    --reaper.ShowConsoleMsg(olditemstr)
    CFGEDI, pos, oldzoom = string.match(olditemstr, '(CFGEDITVIEW) (%S+) (%S+)')
    oldzoom = tonumber(oldzoom)
    reaper.Main_OnCommand(40153, 0)
    ret, itemstr = reaper.GetItemStateChunk(olditem, '', false)
    CFGEDI, pos, zoom = string.match(itemstr, '(CFGEDITVIEW) (%S+) (%S+)')
    zoom = tonumber(zoom)
    while zoom < oldzoom do
        reaper.MIDIEditor_OnCommand(editor, 1012)
        ret, itemstr = reaper.GetItemStateChunk(olditem, '', false)
        CFGEDI, pos, zoom = string.match(itemstr, '(CFGEDITVIEW) (%S+) (%S+)')
        zoom = tonumber(zoom)
    end
else
    reaper.Main_OnCommand(40153, 0)
end

reaper.PreventUIRefresh(-1)
reaper.Undo_EndBlock('', 0)

