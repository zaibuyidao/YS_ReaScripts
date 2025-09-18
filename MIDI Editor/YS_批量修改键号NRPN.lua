-- @description 批量修改键号NRPN
-- @version 1.0
-- @author YS
-- @changelog New Script
-- @provides [main=midi_editor] .

local editor = reaper.MIDIEditor_GetActive()
local take = reaper.MIDIEditor_GetTake(editor)
local retval, shuzhi = reaper.GetUserInputs('批量修改键号NRPN', 2, '旧的 CC98 :, 新的 CC98 :', '-1,-1')
if retval == false then
    reaper.SN_FocusMIDIEditor()
    return
end
local old, new = string.match(shuzhi, "(%d+),(%d+)")
old = tonumber(old)
new = tonumber(new)
if old == false or new == false then
    reaper.SN_FocusMIDIEditor()
    return
end
reaper.Undo_BeginBlock()
reaper.MIDI_SelectAll(take, false)
local ccidx = 0
local count = 0
local flag = 0
retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
while retval do
    ccidx = ccidx + 1
    retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
    if chanmsg == 176 then
        if msg2 == 99 and msg3 == 24 then
            flag = 1
        end
        if msg2 == 98 and flag == 1 then
            if old == -1 or msg3 == old then
                reaper.MIDI_SetCC(take, ccidx, true, NULL, NULL, NULL, NULL, NULL, new, true)
                count = count + 1
            end
        end
    end
end
reaper.MIDI_Sort(take)

reaper.MarkTrackItemsDirty(reaper.GetMediaItemTake_Track(take), reaper.GetMediaItemTake_Item(take))

if count == 0 then
    reaper.TrackCtl_SetToolTip('没有任何 CC98 被修改！', 50, 0, true)
else
    reaper.TrackCtl_SetToolTip('键号 ' .. old .. ' NRPN修改为 ' .. new, 50, 0, true)
end
reaper.SN_FocusMIDIEditor()

reaper.Undo_EndBlock('批量修改键号:' .. old .. '更改为' .. new, -1)
