-- @description 扫弦音符反粘连(制谱用)
-- @version 1.0
-- @author YS
-- @changelog New Script
-- @provides [main=main, midi_editor] .

local editor = reaper.MIDIEditor_GetActive()

function OverNoteFix2()
    local note_tb = {}
    retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
    local noteidx = 0
    while noteidx < notecnt do
        retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
        if note_tb[pitch] ~= nil then
            tempidx, temp_endpos = string.match(note_tb[pitch], '(%d+),(%d+%.0)')
            tempidx = tonumber(tempidx)
            temp_endpos = tonumber(temp_endpos)
            if startppqpos < temp_endpos then
                reaper.TrackCtl_SetToolTip('发现重叠音符正在处理！', 50, 0, true)
                reaper.MIDI_SetNote(take, tempidx, NULL, NULL, NULL, startppqpos, NULL, NULL, NULL, true) -- MIDI sort
                retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
            end
        end
        note_tb[pitch] = noteidx .. ',' .. endppqpos
        noteidx = noteidx + 1
    end

end -- function end

-- 反扫弦小音符粘连
function Reactionglue()
    reaper.MIDI_DisableSort(take)
    local noteidx = -1
    local notepos = {}
    local notepossort = {}
    local notevel = {}
    local temppos = -40
    noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
    while noteidx ~= -1 do
        retval, _, _, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
        --[[if startppqpos - temppos < 40 and startppqpos ~= temppos then
            ProjTime = reaper.MIDI_GetProjTimeFromPPQPos(take, startppqpos)
            buf = reaper.format_timestr_pos(ProjTime, '', 1)
            Track = reaper.GetMediaItemTake_Track(take)
            ret, TrackName = reaper.GetTrackName(Track)
            reaper.MB(TrackName .. ' ' .. buf .. ' 音符间隔小于 40 tick，请重新选择数据！', '反粘连处理失败', 0)
            reaper.SN_FocusMIDIEditor()
            return
        end --]]
        temppos = startppqpos
        if not notepos[startppqpos] then
            notepos[startppqpos] = vel
        end
        if not notepos[endppqpos] then
            notepos[endppqpos] = 'end'
        end
        if notepos[startppqpos] == 'end' then
            notepos[startppqpos] = vel
        end

        noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
    end
    for i, v in pairs(notepos) do
        table.insert(notepossort, {
            pos = i,
            vel = v
        })
    end
    table.sort(notepossort, function(a, b)
        return a.pos < b.pos
    end)

    noteidx = -1
    noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
    while noteidx ~= -1 do
        retval, _, _, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
        i = 1
        while i < #notepossort do
            if startppqpos == notepossort[i].pos and endppqpos > notepossort[i + 1].pos then
                reaper.MIDI_SetNote(take, noteidx, nil, nil, nil, notepossort[i + 1].pos, nil, nil, nil, false)
                ii = i + 1
                while endppqpos > notepossort[ii].pos and ii < #notepossort do
                    newvel = notepossort[ii].vel
                    if type(newvel) ~= 'string' then
                        reaper.MIDI_InsertNote(take, true, false, notepossort[ii].pos, notepossort[ii + 1].pos, chan, pitch, newvel, false)
                    end
                    ii = ii + 1
                end
            end
            i = i + 1
        end
        noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
    end
    reaper.MIDI_Sort(take)
end

function sel_no_strum()
    reaper.MIDI_DisableSort(take)
    -- 初始化分组存储表
    local groups = {}
    local hasNotes = false

    -- 第一次遍历：处理已选中的音符 -------------------------------------------------
    local note_count = reaper.MIDI_CountEvts(take)
    for i = 0, note_count - 1 do
        local ret, selected, muted, startppq, endppq, chan, pitch, vel = reaper.MIDI_GetNote(take, i)

        if selected then
            hasNotes = true
            -- 按起始位置分组
            groups[startppq] = groups[startppq] or {}
            table.insert(groups[startppq], i)
        end
    end

    if hasNotes then
        -- 过滤2音以下的音组 --------------------------------------------------------
        local validPositions = {}
        for pos, noteidx in pairs(groups) do
            if #noteidx < 2 then
                table.insert(validPositions, noteidx)
            end
        end

        -- 执行选中任务
        if #validPositions ~= 0 then
            for i, v in ipairs(validPositions) do
                reaper.MIDI_SetNote(take, v[1], false, nil, nil, nil, nil, nil, nil, false)
            end
        end

    end

    reaper.MIDI_Sort(take)
end

-- tick对齐
reaper.Undo_BeginBlock()
new = 0
old = 6
takeindex = 0
take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take ~= nil do
    reaper.MIDI_DisableSort(take)

    first = 0
    tempst, i, idx = -1, 1, -1
    integer = reaper.MIDI_EnumSelNotes(take, idx)

    while integer ~= -1 do

        integer = reaper.MIDI_EnumSelNotes(take, idx)

        retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
        juli = startppqpos - tempst
        if juli <= old and juli >= 0 then
            if endppqpos < first + (i * new) then
                endppqpos = first + (i * new) + 1
            end
            reaper.MIDI_SetNote(take, integer, true, false, first + (i * new), endppqpos, NULL, NULL, NULL, false)
            i = i + 1
        else
            first = startppqpos
            i = 1
        end -- if end

        tempst = startppqpos

        idx = integer
    end -- while end

    OverNoteFix2() -- 处理重叠音符
    reaper.MIDI_Sort(take)

    sel_no_strum()

    Reactionglue()

    takeindex = takeindex + 1
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
end -- while take end

reaper.TrackCtl_SetToolTip('吉他扫弦对齐tick反粘连处理成功', 50, 0, true)
take = reaper.MIDIEditor_GetTake(editor)
reaper.MarkTrackItemsDirty(reaper.GetMediaItemTake_Track(take), reaper.GetMediaItemTake_Item(take))
reaper.Undo_EndBlock('吉他扫弦对齐tick反粘连', -1)

