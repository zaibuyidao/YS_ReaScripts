--[[
 * ReaScript Name: Delete redundant CC_Multi Track
 * Version: 1.2
 * Author: YS
 * provides: [main=midi_editor] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

local retval, shuzhi = reaper.GetUserInputs('Delete redundant CC', 2, 'CC num 控制器号 =,CC Adjacent values 前后差值 =,', '11,0')
local num_sub, adj_sub = string.match(shuzhi, "(%d+),(%d+)")
local num_val = tonumber(num_sub)
local adj_val = tonumber(adj_sub)
-- qushuzhi
local editor = reaper.MIDIEditor_GetActive()

local takeindex = 0
local take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take ~= nil do
    reaper.MIDI_DisableSort(take)
    local ccidx = -1
    local tempcc = 256
    local deletecc = {}
    ccidx = reaper.MIDI_EnumSelCC(take, ccidx)
    while ccidx ~= -1 do
        local retval, selected, muted, ppqpos, chanmsg, chan, num, val = reaper.MIDI_GetCC(take, ccidx)
        local ret, shape, bezt = reaper.MIDI_GetCCShape(take, ccidx)
        adj = val - tempcc
        if adj < 0 then
            adj = adj * -1
        end
        if num == num_val and adj <= adj_val and shape == 0 then
            deletecc[ccidx] = true
        else
            tempcc = val
        end

        ccidx = reaper.MIDI_EnumSelCC(take, ccidx)
    end
    reaper.MIDI_SelectAll(take, false)
    for i, v in pairs(deletecc) do
        reaper.MIDI_SetCC(take, i, true, nil, nil, nil, nil, nil, nil, false)
    end

    reaper.MIDI_Sort(take)

    takeindex = takeindex + 1
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
end -- while take end
reaper.MIDIEditor_OnCommand(editor, 40667) -- delete

reaper.SN_FocusMIDIEditor()
