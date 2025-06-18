-- @description zoom 切换
-- @version 1.0
-- @author YS
-- @changelog
--   New Script

editor = reaper.MIDIEditor_GetActive()
take = reaper.MIDIEditor_GetTake(editor)
item = reaper.GetMediaItemTake_Item(take)

reaper.PreventUIRefresh(1)
_, _, sectionID, ownCommandID, _, _, _ = reaper.get_action_context()
CommandState = reaper.GetToggleCommandStateEx(sectionID, ownCommandID)
if CommandState == 1 then
    oldzoom = reaper.GetExtState('zoom tool', 'oldzoom')
    oldzoom = tonumber(oldzoom)
    ret, itemstr = reaper.GetItemStateChunk(item, '', false)
    CFGEDI, pos, zoom = string.match(itemstr, '(CFGEDITVIEW) (%S+) (%S+)')
    zoom = tonumber(zoom)
    while zoom < oldzoom do
        reaper.MIDIEditor_OnCommand(editor, 1012)
        ret, itemstr = reaper.GetItemStateChunk(item, '', false)
        CFGEDI, pos, zoom = string.match(itemstr, '(CFGEDITVIEW) (%S+) (%S+)')
        zoom = tonumber(zoom)
    end
    reaper.SetToggleCommandState(sectionID, ownCommandID, 0)
else
    ret, itemstr = reaper.GetItemStateChunk(item, '', false)
    CFGEDI, pos, oldzoom = string.match(itemstr, '(CFGEDITVIEW) (%S+) (%S+)')
    reaper.SetExtState('zoom tool', 'oldzoom', oldzoom, true)
    reaper.MIDIEditor_OnCommand(editor, 40468)
    reaper.SetToggleCommandState(sectionID, ownCommandID, 1)
end

reaper.RefreshToolbar2(sectionID, ownCommandID)
reaper.PreventUIRefresh(-1)
