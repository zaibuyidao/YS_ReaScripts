--[[
 * ReaScript Name: 克隆所选音符位置
 * Version: 1.0
 * Author: YS
 * provides: [main=midi_editor] .
--]]

--[[
 * Changelog:
 * v1.0 (2023-2-1)
  + Initial release
--]]

local editor = reaper.MIDIEditor_GetActive()
take = reaper.MIDIEditor_GetTake(editor)
selnotecount = 0
x, y = reaper.GetMousePosition()

selst, selend = reaper.GetSet_LoopTimeRange(false, false, 0, 0, false)
ProjectLength = reaper.GetProjectLength(0)

if selst == 0 and selend == 0 then
    selend = ProjectLength
    reaper.TrackCtl_SetToolTip('没有选择范围，将处理所有音符！',
                               x, y - 30, true)
end
selstppq = reaper.MIDI_GetPPQPosFromProjTime(take, selst)
selendppq = reaper.MIDI_GetPPQPosFromProjTime(take, selend)

notetick_tb = {}

takeindex = 0
take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take ~= nil do

    reaper.MIDI_DisableSort(take)
    idx = -1

    integer = reaper.MIDI_EnumSelNotes(take, idx)
    retval, selected, muted, startppqpos1, endppqpos, chan, pitch, vel =
        reaper.MIDI_GetNote(take, integer)
    StartOfMeasure1 = reaper.MIDI_GetPPQPos_StartOfMeasure(take,
                                                           startppqpos1 + 1)
    EndOfMeasure1 = reaper.MIDI_GetPPQPos_EndOfMeasure(take, startppqpos1 + 1)
    measurelen = EndOfMeasure1 - StartOfMeasure1
    measurelen = math.floor(measurelen)

    while (integer ~= -1) do

        integer = reaper.MIDI_EnumSelNotes(take, idx)

        retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel =
            reaper.MIDI_GetNote(take, integer)

        startppqpos = math.floor(startppqpos)

        StartOfMeasure = reaper.MIDI_GetPPQPos_StartOfMeasure(take, startppqpos)

        StartOfMeasure = math.floor(StartOfMeasure)

        from = startppqpos - StartOfMeasure - 10

        if from < 0 then
            from = from + measurelen
            tickRange1 = 0 .. ',' .. (startppqpos - StartOfMeasure + 10)
            tickRange2 = from .. ',' .. measurelen

            table.insert(notetick_tb, tickRange1)
            table.insert(notetick_tb, tickRange2)
        else
            tickRange = from .. ',' .. (startppqpos - StartOfMeasure + 10)

            table.insert(notetick_tb, tickRange)
        end

        idx = integer
        integer = reaper.MIDI_EnumSelNotes(take, idx)
    end

    reaper.MIDI_Sort(take)

    takeindex = takeindex + 1
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
end -- while take end

-- reaper.SN_FocusMIDIEditor()

function table_unique(t)
    check = {}
    new_table = {}
    for key, value in pairs(t) do
        if not check[value] then
            table.insert(new_table, value)
            check[value] = value
        end
    end
    return new_table
end

table_unique(notetick_tb)

takeindex = 0
take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take ~= nil do

    reaper.MIDI_DisableSort(take)

    idx = 0

    retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)

    while idx < notecnt do

        retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel =
            reaper.MIDI_GetNote(take, idx)

        StartOfMeasure = reaper.MIDI_GetPPQPos_StartOfMeasure(take, startppqpos)

        notetick = startppqpos - StartOfMeasure

        for i, v in ipairs(new_table) do
            qian, hou = string.match(v, '(%d+),(%d+)')
            qian = tonumber(qian)
            hou = tonumber(hou)
            if startppqpos >= selstppq and startppqpos < selendppq then
                if notetick >= qian and notetick < hou then
                    reaper.MIDI_SetNote(take, idx, true, NULL, NULL, NULL, NULL,
                                        NULL, NULL, false)
                    selnotecount = selnotecount + 1
                end
            end
        end

        idx = idx + 1
    end

    reaper.MIDI_Sort(take)

    takeindex = takeindex + 1
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
end -- while take end

if selnotecount == 0 then
    reaper.TrackCtl_SetToolTip('所选范围内没有任何音符被选中！',
                               x, y - 30, true)
else
    reaper.TrackCtl_SetToolTip('有 ' .. selnotecount ..
                                   ' 个同一位置音符被选中！',
                               x, y - 30, true)
end
