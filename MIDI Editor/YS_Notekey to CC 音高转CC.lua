-- @description Notekey to CC 音高转CC
-- @version 1.0
-- @author YS
-- @changelog New Script
-- @provides [main=midi_editor] .

local editor = reaper.MIDIEditor_GetActive()

retval, shuzhi = reaper.GetUserInputs('insert CC 按选中音符音高', 2, 'CC Num=,前后 tick', '74,-2')
if retval == false then
    return
end
num_sub, tick_sub = string.match(shuzhi, "(%d+),([+-]?%d+)")
num = tonumber(num_sub)
tick = tonumber(tick_sub)

if not (num and tick) then
    return
end

reaper.Undo_BeginBlock()

takeindex = 0
take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take ~= nil do

    reaper.MIDI_DisableSort(take)

    retval, notecnt, ccevtcnt, extsyxevtcnt = reaper.MIDI_CountEvts(take)

    for i = 0, notecnt, 1 do
        retval, sel, mute, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, i)
        if sel then
            if num >= 0 and num <= 127 then
                reaper.MIDI_InsertCC(take, true, false, startppqpos + tick, 176, 0, num, pitch)
            end
        end
    end

    if num >= 0 and num <= 119 then
        ID = num + 40238
        reaper.MIDIEditor_OnCommand(editor, ID)
    end
    reaper.MIDI_Sort(take)
    ---insert CC

    reaper.MIDI_DisableSort(take)

    ccidx = -1
    tempcc = 256
    delecc = {}
    repeat
        integer = reaper.MIDI_EnumSelCC(take, ccidx)
        retval, selected, muted, ppqpos, chanmsg, chan, num_cc, val = reaper.MIDI_GetCC(take, integer)
        if num_cc == num then
            adj = val - tempcc
            if adj == 0 then
                -- reaper.MIDI_DeleteCC(take, integer)
                table.insert(delecc, integer)
            end
            tempcc = val
        end
        ccidx = integer
    until integer == -1
    for i = #delecc, 1, -1 do
        reaper.MIDI_DeleteCC(take, delecc[i])
    end
    -- delete CC 
    reaper.MIDI_Sort(take)

    reaper.MarkTrackItemsDirty(reaper.GetMediaItemTake_Track(take), reaper.GetMediaItemTake_Item(take))

    takeindex = takeindex + 1
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
end -- while take end

reaper.Undo_EndBlock('音符音高转 CC', -1)

reaper.SN_FocusMIDIEditor()
