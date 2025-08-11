-- @description 选择相同段落的数据
-- @version 1.0
-- @author YS
-- @changelog New Script
-- @provides [main=midi_editor] .

local regions_comb_sort = {}
local regions_comb = {}
local editor = reaper.MIDIEditor_GetActive()

function createregions()
    local markidx = 0
    local mark_tb = {}
    local non_name = {}
    non_name['vox in'] = true
    non_name['vox out'] = true

    -- 获取所有标记
    local retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(markidx)
    while retval ~= 0 do
        name = string.match(name, '%D+')
        if name then
            namelow = string.lower(name)
            local keycheck = string.match(namelow, 'key=')
            if non_name[namelow] == nil and not keycheck then
                table.insert(mark_tb, {
                    pos = pos - 0.001,
                    name = name
                })
            end
        end
        markidx = markidx + 1
        retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(markidx)
    end

    -- 找到标记所代表的段落
    local project_length = reaper.GetProjectLength(0)

    local regions = {}
    for i, v in ipairs(mark_tb) do
        local end_pos
        if i < #mark_tb then
            end_pos = mark_tb[i + 1].pos
        else
            end_pos = project_length
        end
        table.insert(regions, {
            name = v.name,
            start_pos = v.pos,
            end_pos = end_pos
        })
    end

    -- 合并相同段落并获取区间
    regions_comb = {}
    for i, v in ipairs(regions) do
        regions_comb[v.name] = regions_comb[v.name] or {}
        table.insert(regions_comb[v.name], {
            start_pos = v.start_pos,
            end_pos = v.end_pos
        })
    end

    regions_comb_sort = {}
    for i, v in pairs(regions_comb) do
        table.insert(regions_comb_sort, {
            name = i,
            pos = v[1].start_pos
        })
    end
    table.sort(regions_comb_sort, function(a, b)
        return a.pos < b.pos
    end)
end

createregions()

local StateChangeCount_old = reaper.GetProjectStateChangeCount(0)

-- 根据mark名称选中段落数据
function sel_regions(markname)
    reaper.MIDIEditor_OnCommand(editor, 40214) -- 编辑: 取消全选 ⇌ Edit: Unselect all
    local takeindex = 0
    local take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    while take ~= nil do
        local notes = {}
        local ccs = {}
        local texts = {}
        reaper.MIDI_DisableSort(take)
        local retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
        if notecnt > 0 and selnote then
            for noteidx = 0, notecnt - 1 do
                local retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take,
                    noteidx)
                local ProjTime = reaper.MIDI_GetProjTimeFromPPQPos(take, startppqpos)
                for i, v in pairs(regions_comb) do
                    if i == markname then
                        for ii, pos in ipairs(v) do
                            if ProjTime >= pos.start_pos and ProjTime < pos.end_pos then
                                notes[noteidx] = true
                            end
                        end
                    end
                end
            end
        end
        if ccevtcnt > 0 and selcc then
            for ccidx = 0, ccevtcnt - 1 do
                local retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
                local ProjTime = reaper.MIDI_GetProjTimeFromPPQPos(take, ppqpos)
                for i, v in pairs(regions_comb) do
                    if i == markname then
                        for ii, pos in ipairs(v) do
                            if ProjTime >= pos.start_pos and ProjTime < pos.end_pos then
                                ccs[ccidx] = true
                            end
                        end
                    end
                end
            end
        end
        if #notes > 2000 then
            reaper.TrackCtl_SetToolTip(#notes .. '个音符被选中', 50, 0, true)
        end
        for i, v in pairs(notes) do
            reaper.MIDI_SetNote(take, i, true, nil, nil, nil, nil, nil, nil, false)
        end
        if #ccs > 2000 then
            reaper.TrackCtl_SetToolTip(#ccs .. '个CC数据被选中', 50, 0, true)
        end
        for i, v in pairs(ccs) do
            reaper.MIDI_SetCC(take, i, true, nil, nil, nil, nil, nil, nil, false)
        end
        reaper.MIDI_Sort(take)

        takeindex = takeindex + 1
        take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    end                                        -- while take end
    reaper.MIDIEditor_OnCommand(editor, 40440) -- 导航: 将编辑光标移动到选定事件的开始处
end

selnote = reaper.GetExtState('select section', 'selnote')
if selnote == 'true' then
    selnote = true
else
    selnote = false
end

selcc = reaper.GetExtState('select section', 'selcc')
if selcc == 'true' then
    selcc = true
else
    selcc = false
end

hold = reaper.GetExtState('select section', 'hold')
if hold == 'true' then
    hold = true
else
    hold = false
end

-- 开始图形界面
local ctx = reaper.ImGui_CreateContext('选择相同段落的数据')
local font = reaper.ImGui_CreateFont('微软雅黑')
reaper.ImGui_Attach(ctx, font)

local windows_flag = reaper.ImGui_WindowFlags_TopMost()
windows_flag = windows_flag | reaper.ImGui_WindowFlags_AlwaysAutoResize()
windows_flag = windows_flag | reaper.ImGui_WindowFlags_NoCollapse()
local flag = true

function loop()
    StateChangeCount = reaper.GetProjectStateChangeCount(0)
    if StateChangeCount ~= StateChangeCount_old then
        createregions()
        StateChangeCount_old = StateChangeCount
    end
    reaper.ImGui_PushFont(ctx, font, 12)
    local visible, open = reaper.ImGui_Begin(ctx, '选择相同段落的数据', true, windows_flag)
    if visible then
        retval, hold = reaper.ImGui_Checkbox(ctx, '始终在最前', hold)
        if hold then
            SetExt_hold = 'true'
        else
            SetExt_hold = 'false'
        end
        retval, selnote = reaper.ImGui_Checkbox(ctx, 'note', selnote)
        if selnote then
            SetExt_selnote = 'true'
        else
            SetExt_selnote = 'false'
        end
        reaper.ImGui_SameLine(ctx)
        retval, selcc = reaper.ImGui_Checkbox(ctx, 'cc', selcc)
        if selcc then
            SetExt_selcc = 'true'
        else
            SetExt_selcc = 'false'
        end

        for i, v in pairs(regions_comb_sort) do
            if reaper.ImGui_Button(ctx, v.name) then
                sel_regions(v.name)
                reaper.SN_FocusMIDIEditor()
                if not hold then
                    flag = false
                end
            end
            reaper.ImGui_SameLine(ctx)
        end
        reaper.ImGui_End(ctx)
    end
    reaper.ImGui_PopFont(ctx)
    retval = reaper.ImGui_IsKeyPressed(ctx, reaper.ImGui_Key_Escape(), nil)
    if retval then
        flag = false
    end
    editor = reaper.MIDIEditor_GetActive()
    if not editor then
        flag = false
    end

    if open and flag then
        reaper.defer(loop)
    else
        reaper.SetExtState('select section', 'selnote', SetExt_selnote, true)
        reaper.SetExtState('select section', 'selcc', SetExt_selcc, true)
        reaper.SetExtState('select section', 'hold', SetExt_hold, true)
        reaper.SN_FocusMIDIEditor()
    end
end

reaper.defer(loop)


_, _, sectionID, ownCommandID, _, _, _ = reaper.get_action_context()
reaper.SetToggleCommandState(sectionID, ownCommandID, 1)
reaper.RefreshToolbar2(sectionID, ownCommandID)

function exit()
    reaper.SetToggleCommandState(sectionID, ownCommandID, 0)
    reaper.RefreshToolbar2(sectionID, ownCommandID)
end

reaper.atexit(exit)
