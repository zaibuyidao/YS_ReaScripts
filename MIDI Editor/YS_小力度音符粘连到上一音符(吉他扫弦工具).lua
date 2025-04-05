--[[
 * ReaScript Name: 小力度音符粘连到上一音符(吉他扫弦工具)
 * Version: 1.0.5
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

function select_low()
    local i, idx = 2, -1
    local tbidx = {}
    local tbst = {}
    local tbpitch = {}
    selidx = {}
    local tempst = -11
    local integer = reaper.MIDI_EnumSelNotes(take, idx)

    while integer ~= -1 do

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
            low = tbpitch[1]

            for i, v in ipairs(tbpitch) do
                if low < v then
                    low = low
                else
                    low = v
                end
            end -- get top note

            if #tbidx >= 4 then
                for i, vv in ipairs(tbidx) do
                    retval, _, _, _, _, _, pitch_b, _ = reaper.MIDI_GetNote(take, vv)
                    if pitch_b == low then
                        table.insert(selidx, vv)
                    end -- select end
                end -- for end
            end
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

end -- sel low note

function select_top()
    local i, idx = 2, -1
    local tbidx = {}
    local tbst = {}
    local tbpitch = {}
    selidx = {}
    local tempst = -11
    local integer = reaper.MIDI_EnumSelNotes(take, idx)

    while integer ~= -1 do

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
                if top > v then
                    top = top
                else
                    top = v
                end
            end -- get top note

            if #tbidx >= 4 then
                for i, vv in ipairs(tbidx) do
                    retval, _, _, _, _, _, pitch_b, _ = reaper.MIDI_GetNote(take, vv)
                    if pitch_b == top then
                        table.insert(selidx, vv)
                    end -- select end
                end -- for end
            end
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

end -- sel top note

local editor = reaper.MIDIEditor_GetActive()

retval, shuzhi = reaper.GetUserInputs('小力度音符粘连到上一音符', 2, '0:低音 1:高音 2:All,输入力度临界值 :', '2,85')
if retval == false then
    return reaper.SN_FocusMIDIEditor()
end
toplow, shuzhi = string.match(shuzhi, "(.+),(.+)")
shuzhi = tonumber(shuzhi)

reaper.Undo_BeginBlock()

takeindex = 0
take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take ~= nil do

    reaper.MIDI_DisableSort(take)

    if toplow == '0' then
        select_low()
    elseif toplow == '1' then
        select_top()
    elseif toplow == '2' then
        select_low()
    else
        reaper.SN_FocusMIDIEditor()
        reaper.TrackCtl_SetToolTip('输入模式非法', 50, 0, true)
        return
    end

    note = {}
    if #selidx > 2 then
        retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, selidx[1])
        note['st'] = endppqpos
        note['pitch'] = pitch
        note['idx'] = selidx[1]
        DeleteNote = {}
        SetNote = {}
        for i = 2, #selidx do
            retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, selidx[i])
            dur = endppqpos - startppqpos
            jiange = startppqpos - note['st']
            if vel <= shuzhi and pitch == note['pitch'] and dur > 30 and jiange < 60 then
                table.insert(DeleteNote, selidx[i])
                -- reaper.MIDI_DeleteNote(take, idx)
                SetNote[note['idx']] = endppqpos
                -- reaper.MIDI_SetNote(take, note['idx'], true, false, NULL, endppqpos, NULL, NULL, NULL, false)
                note['st'] = endppqpos
            else
                note['st'] = endppqpos
                note['pitch'] = pitch
                note['idx'] = selidx[i]
            end
        end

        for i, v in pairs(SetNote) do
            reaper.MIDI_SetNote(take, i, nil, nil, nil, v, nil, nil, nil, false)
        end

        for i = #DeleteNote, 1, -1 do
            reaper.MIDI_DeleteNote(take, DeleteNote[i])
        end
    end
    reaper.MIDI_Sort(take)

    if toplow == '2' then
        reaper.MIDI_DisableSort(take)
        select_top()
        note = {}
        if #selidx > 2 then
            retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, selidx[1])
            note['st'] = endppqpos
            note['pitch'] = pitch
            note['idx'] = selidx[1]
            DeleteNote = {}
            SetNote = {}
            for i = 2, #selidx do
                retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, selidx[i])
                dur = endppqpos - startppqpos
                jiange = startppqpos - note['st']
                if vel <= shuzhi and pitch == note['pitch'] and dur > 30 and jiange < 60 then
                    table.insert(DeleteNote, selidx[i])
                    SetNote[note['idx']] = endppqpos
                    note['st'] = endppqpos
                else
                    note['st'] = endppqpos
                    note['pitch'] = pitch
                    note['idx'] = selidx[i]
                end
            end

            for i, v in pairs(SetNote) do
                reaper.MIDI_SetNote(take, i, nil, nil, nil, v, nil, nil, nil, false)
            end

            for i = #DeleteNote, 1, -1 do
                reaper.MIDI_DeleteNote(take, DeleteNote[i])
            end
        end
        reaper.MIDI_Sort(take)
    end

    reaper.MarkTrackItemsDirty(reaper.GetMediaItemTake_Track(take), reaper.GetMediaItemTake_Item(take))

    takeindex = takeindex + 1
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
end -- while take end

reaper.SN_FocusMIDIEditor()
reaper.Undo_EndBlock('扫弦小力度粘连', -1)
reaper.TrackCtl_SetToolTip('扫弦小力度粘连处理成功', 50, 0, true)

