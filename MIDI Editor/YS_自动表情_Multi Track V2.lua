--[[
 * ReaScript Name: 自动表情_Multi Track V2
 * Version: 1.1.4
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

function bpm_average()
    left = math.huge
    right = -1
    editor = reaper.MIDIEditor_GetActive()

    takeindex = 0
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    while take ~= nil do

        reaper.MIDI_DisableSort(take)
        i = -1
        repeat
            integer = reaper.MIDI_EnumSelNotes(take, i)
            if integer ~= -1 then
                retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
                if startppqpos < left then
                    left = startppqpos
                end
                if endppqpos > right then
                    right = endppqpos
                end
            end
            i = integer
            integer = reaper.MIDI_EnumSelNotes(take, i)
        until (integer == -1)
        reaper.MIDI_Sort(take)

        takeindex = takeindex + 1
        take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)

    end -- while take end get select time
    take = reaper.MIDIEditor_EnumTakes(editor, 0, true)
    firstQN = reaper.MIDI_GetProjQNFromPPQPos(take, left)
    endpos = reaper.MIDI_GetProjTimeFromPPQPos(take, right)

    --------------------------------------------------------

    bpmadd = 0
    QN = 0
    pos = reaper.TimeMap_QNToTime(firstQN)
    ptidx = reaper.FindTempoTimeSigMarker(0, pos)
    retval, timepos, measurepos, beatpos, bpm, timesig_num, timesig_denom, lineartempo = reaper.GetTempoTimeSigMarker(0, ptidx)

    while pos < endpos do
        bpmadd = bpmadd + bpm
        QN = QN + 1
        firstQN = firstQN + 1
        pos = reaper.TimeMap_QNToTime(firstQN)
        ptidx = reaper.FindTempoTimeSigMarker(0, pos)
        retval, timepos, measurepos, beatpos, bpm, timesig_num, timesig_denom, lineartempo = reaper.GetTempoTimeSigMarker(0, ptidx)
    end
    bpm_average = bpmadd / QN
end -- function end

bpm_average()

function selTopNote()
    reaper.MIDI_DisableSort(take)
    i, idx = 2, -1

    tbidx = {}
    tbst = {}
    tbpitch = {}
    selidx = {}
    tempst = -11
    integer = reaper.MIDI_EnumSelNotes(take, idx)

    while (integer ~= -1) do

        integer = reaper.MIDI_EnumSelNotes(take, idx)

        retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
        juli = startppqpos - tempst
        if juli < 0 then
            juli = juli * -1
        end
        if juli <= 10 then
            tbidx[i] = integer
            tbpitch[i] = pitch
            tbst[i] = startppqpos
            i = i + 1
        else
            -- STRUM it
            top = tbpitch[1]

            for i, v in ipairs(tbpitch) do
                if (top > v) then
                    top = top
                else
                    top = v
                end
            end -- get top note

            for i, vv in ipairs(tbidx) do
                retval, _, _, _, _, _, pitch_b, _ = reaper.MIDI_GetNote(take, vv)
                if pitch_b == top then
                    table.insert(selidx, vv)
                end -- select end
            end -- for end
            tbidx = {}
            tbpitch = {}
            tbst = {}

            tbidx[1] = integer
            tbst[1] = startppqpos
            tbpitch[1] = pitch
            i = 2
        end -- if end
        tempst = startppqpos
        idx = integer
    end -- while end
    reaper.MIDI_SelectAll(take, false)
    for i, v in ipairs(selidx) do
        reaper.MIDI_SetNote(take, v, true, NULL, NULL, NULL, NULL, NULL, NULL, false)
    end

    ------------------------------------------------------
    noteidx = -1
    tempend = -1
    temppitch = 0

    integer = reaper.MIDI_EnumSelNotes(take, noteidx)

    while (integer ~= -1) do

        retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)

        if startppqpos < tempend and pitch < temppitch then
            reaper.MIDI_SetNote(take, integer, false, NULL, NULL, NULL, NULL, NULL, NULL, false)
        else
            tempend = endppqpos
            temppitch = pitch
        end

        noteidx = integer
        integer = reaper.MIDI_EnumSelNotes(take, noteidx)
    end
end
reaper.MIDI_Sort(take)

--  sel Top Note

local retval, shuzhi = reaper.GetUserInputs('自动表情 平均速度: ' .. bpm_average, 7,
    'CC min Val=,CC Max Val=,1:悠扬 2:强烈 3:手动,起音形状 1:正 2:反,弧度 0-100 ,音尾形状 1:正 2:反,弧度 0-100',
    '88,127,1,1,25,1,40')
local min_sub, max_sub, moshi_sub, qiyin_sub, hudu1_sub, yinwei_sub, hudu2_sub = string.match(shuzhi, "(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)")
local min_val = tonumber(min_sub)
local max_val = tonumber(max_sub)
local moshi = tonumber(moshi_sub)
local qiyin = tonumber(qiyin_sub)
local hudu1 = tonumber(hudu1_sub)
local yinwei = tonumber(yinwei_sub)
local hudu2 = tonumber(hudu2_sub)

if retval then

    if moshi == 3 then
        if qiyin == 1 then
            bsl_in = hudu1 / 100 * -1
        else
            bsl_in = hudu1 / 100
        end
        if yinwei == 1 then
            bsl_out = hudu2 / 100
        else
            bsl_out = hudu2 / 100 * -1
        end
    end
    if moshi == 1 then
        bsl_in = -0.2
        bsl_out = 0.4
    end
    if moshi == 2 then
        bsl_in = 0.25
        bsl_out = 0.4
    end

    -- geiinput

    editor = reaper.MIDIEditor_GetActive()

    takeindex = 0
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    while take ~= nil do
        selTopNote()

        local idx = -1
        biaoji = 0
        quaver = false
        repeat
            local n_idx = reaper.MIDI_EnumSelNotes(take, idx)
            local retval, sel, mute, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, n_idx)

            local dur = endppqpos - startppqpos
            if dur > 960 then
                reaper.MIDI_InsertCC(take, true, false, startppqpos, 176, 0, 11, min_val)
                reaper.MIDI_InsertCC(take, false, false, startppqpos + 720, 176, 0, 11, max_val)
            end
            if dur == 960 then
                reaper.MIDI_InsertCC(take, true, false, startppqpos, 176, 0, 11, min_val)
                reaper.MIDI_InsertCC(take, false, false, startppqpos + 480, 176, 0, 11, max_val)
            end
            if dur >= 480 and dur < 960 then
                reaper.MIDI_InsertCC(take, true, false, startppqpos, 176, 0, 11, min_val)
                reaper.MIDI_InsertCC(take, false, false, startppqpos + 360, 176, 0, 11, max_val)
            end -- 480-960
            if bpm_average < 96 then
                if dur >= 240 and dur < 480 then
                    if quaver == false then
                        reaper.MIDI_InsertCC(take, true, false, startppqpos, 176, 0, 11, min_val)
                        quaver = true
                    else
                        reaper.MIDI_InsertCC(take, true, false, startppqpos, 176, 0, 11, math.modf(min_val + ((max_val - min_val) / 3)))
                    end
                    reaper.MIDI_InsertCC(take, false, false, startppqpos + 190, 176, 0, 11, max_val)
                else
                    quaver = false
                end
            end -- 240-480
            if bpm_average < 96 then
                notedur = 240
            else
                notedur = 480
            end
            if (dur > 0 and dur < notedur) then
                if biaoji == 0 then
                    reaper.MIDI_InsertCC(take, false, false, startppqpos, 176, 0, 11, max_val)
                    biaoji = 1
                end
            else
                biaoji = 0
            end -- <240
            idx = n_idx
        until n_idx == -1
        reaper.MIDI_Sort(take)

        -- write end
        reaper.MIDI_DisableSort(take)
        local ccidx = -1
        repeat
            integer = reaper.MIDI_EnumSelCC(take, ccidx)
            reaper.MIDI_SetCCShape(take, ccidx, 5, bsl_in, true)
            reaper.MIDI_SetCC(take, ccidx, false, false, NULL, NULL, NULL, NULL, NULL, true)
            ccidx = integer
        until integer == -1
        reaper.MIDI_Sort(take)
        -- shape first

        reaper.MIDI_DisableSort(take)
        local idx = -1
        repeat
            local n_idx = reaper.MIDI_EnumSelNotes(take, idx)
            local retval, sel, mute, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, n_idx)

            local dur = endppqpos - startppqpos
            if (dur >= 960) then
                reaper.MIDI_InsertCC(take, true, false, endppqpos - 360, 176, 0, 11, max_val)
                min_sub = math.modf(((max_val - min_val) / max_val) * 65) + min_val
                reaper.MIDI_InsertCC(take, false, false, endppqpos - 20, 176, 0, 11, min_sub)
            end
            idx = n_idx
        until (n_idx == -1)
        reaper.MIDI_Sort(take)

        -- write end
        reaper.MIDI_DisableSort(take)
        local ccidx = -1
        repeat
            integer = reaper.MIDI_EnumSelCC(take, ccidx)
            reaper.MIDI_SetCCShape(take, ccidx, 5, bsl_out, true)
            reaper.MIDI_SetCC(take, ccidx, false, false, NULL, NULL, NULL, NULL, NULL, true)
            ccidx = integer
        until integer == -1
        reaper.MIDI_Sort(take)
        -- shape first

        takeindex = takeindex + 1
        take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    end -- while take end

    reaper.MIDIEditor_OnCommand(editor, 40249)
end
reaper.SN_FocusMIDIEditor()
