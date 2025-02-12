--[[
 * ReaScript Name: 鼓模板数据规范
 * Version: 1.0
 * Author: YS
 * provides: [main=midi_eventlisteditor] .
--]]

--[[
 * Changelog:
 * v1.0 (2025-2-12)
  + Initial release
--]]

local editor = reaper.MIDIEditor_GetActive()
local take = reaper.MIDIEditor_GetTake(editor)

CCtb = {}
reaper.Undo_BeginBlock()
reaper.MIDI_DisableSort(take)

tb_NRPN = {}
tb_NRPN[24] = 'pitch'
tb_NRPN[26] = 'level'
tb_NRPN[28] = 'pan'
tb_NRPN[29] = 'reverb'
tb_NRPN[30] = 'chorus'
tb_NRPN[31] = 'delay'
flag = false

preview_98 = -1
preview_98_idx = -1
cc99_pos = 0
retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
ccidx = 0
while ccidx < ccevtcnt do
    retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
    if (chanmsg == 176 and msg2 == 99) and tb_NRPN[msg3] ~= nil then
        flag = true
        if #CCtb >= 1 then
            table.sort(CCtb, function(a, b)
                return a.cc98 < b.cc98
            end)
            for i, v in ipairs(CCtb) do
                cc99_pos = cc99_pos + 20
                reaper.MIDI_SetCC(take, v.cc98idx, NULL, NULL, cc99_pos - 10, NULL, NULL, NULL, NULL, false)
                reaper.MIDI_SetCC(take, v.cc6idx, NULL, NULL, cc99_pos, NULL, NULL, NULL, NULL, false)
            end
        end
        CCtb = {}
        cc99_pos = ppqpos
    end
    if flag then
        if chanmsg == 176 and msg2 == 98 then
            preview_98 = msg3
            preview_98_idx = ccidx
        end
        if (chanmsg == 176 and msg2 == 6) and preview_98 ~= -1 then
            table.insert(CCtb, {
                cc98 = preview_98,
                cc98idx = preview_98_idx,
                cc6idx = ccidx
            })
            preview_98 = -1
        end
    end
    ccidx = ccidx + 1
end

-- last table
if #CCtb >= 1 then
    table.sort(CCtb, function(a, b)
        return a.cc98 < b.cc98
    end)
    for i, v in ipairs(CCtb) do
        cc99_pos = cc99_pos + 20
        reaper.MIDI_SetCC(take, v.cc98idx, NULL, NULL, cc99_pos - 10, NULL, NULL, NULL, NULL, false)
        reaper.MIDI_SetCC(take, v.cc6idx, NULL, NULL, cc99_pos, NULL, NULL, NULL, NULL, false)
    end
end

reaper.MIDI_Sort(take)
reaper.MarkTrackItemsDirty(reaper.GetMediaItemTake_Track(take), reaper.GetMediaItemTake_Item(take))
reaper.Undo_EndBlock("鼓模板数据规范", -1)

reaper.TrackCtl_SetToolTip('处理成功，NRPN已重新排列！', 50, 0, true)

