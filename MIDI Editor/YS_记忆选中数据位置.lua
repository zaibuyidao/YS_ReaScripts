--[[
 * ReaScript Name: 记忆选中数据位置
 * Version: 1.0
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2024-4-29)
  + Initial release
--]]

pos_tb = {}

function event_position()
    pos_tb = {}
    local editor = reaper.MIDIEditor_GetActive()
    local take = reaper.MIDIEditor_GetTake(editor)

    reaper.MIDI_DisableSort(take)
    idx = -1
    tempmeasure = -2
    idx = reaper.MIDI_EnumSelEvts(take, idx)
    if idx == -1 then
        x, y = reaper.GetMousePosition()
        reaper.TrackCtl_SetToolTip('当前 take 没有任何数据被选中！', x, y + 20, true)
        reaper.SN_FocusMIDIEditor()
    end
    while idx ~= -1 do
        retval, selected, muted, startppqpos, msg = reaper.MIDI_GetEvt(take, idx)
        eventkind = msg:byte(1)
        if eventkind < 128 or eventkind > 143 then
            TimeFromPPQPos = reaper.MIDI_GetProjTimeFromPPQPos(take, startppqpos)
            retval, measures, cml, fullbeats, cdenom = reaper.TimeMap2_timeToBeats(0, TimeFromPPQPos)
            if measures ~= tempmeasure then
                table.insert(pos_tb, TimeFromPPQPos)
            end
            tempmeasure = measures
        end
        idx = reaper.MIDI_EnumSelEvts(take, idx)
    end
    reaper.MIDI_Sort(take)
end

function Jumpfirst()
    reaper.SetEditCurPos(pos_tb[1], false, true)
    reaper.SN_FocusMIDIEditor()
end

function Jumpback()
    now = reaper.GetCursorPosition()
    if now >= pos_tb[#pos_tb] then
        x, y = reaper.GetMousePosition()
        reaper.TrackCtl_SetToolTip('右边没有位置记忆了！', x, y + 20, true)
    else
        for i, v in ipairs(pos_tb) do
            if v > now + 0.001 then
                reaper.SetEditCurPos(v, false, true)
                break
            end
        end
    end
    reaper.SN_FocusMIDIEditor()
end

function JumpForward()
    now = reaper.GetCursorPosition()
    if now <= pos_tb[1] then
        x, y = reaper.GetMousePosition()
        reaper.TrackCtl_SetToolTip('左边没有位置记忆了！', x, y + 20, true)
    else
        pos_tb_rev = {}
        revidx = #pos_tb
        for i, v in ipairs(pos_tb) do
            pos_tb_rev[revidx] = v
            revidx = revidx - 1
        end
        for i, v in ipairs(pos_tb_rev) do
            if v < now - 0.001 then
                reaper.SetEditCurPos(v, false, true)
                break
            end
        end
    end
    reaper.SN_FocusMIDIEditor()
end

function Jumpend()
    reaper.SetEditCurPos(pos_tb[#pos_tb], false, true)
    reaper.SN_FocusMIDIEditor()
end

local ctx = reaper.ImGui_CreateContext('position memory')
local size = reaper.GetAppVersion():match('OSX') and 12 or 14
local font = reaper.ImGui_CreateFont('sans-serif', size)
reaper.ImGui_Attach(ctx, font)

windows_flag = reaper.ImGui_WindowFlags_TopMost()
windows_flag = windows_flag | reaper.ImGui_WindowFlags_AlwaysAutoResize()
windows_flag = windows_flag | reaper.ImGui_WindowFlags_NoTitleBar()
flag = true
function loop()
    reaper.ImGui_PushFont(ctx, font)
    local visible, open = reaper.ImGui_Begin(ctx, 'Position Memory', true, windows_flag)
    if visible then

        if reaper.ImGui_Button(ctx, 'Sel event position memory') then
            event_position()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_SmallButton(ctx, 'X') then
            flag = false
        end
        reaper.ImGui_Spacing(ctx)

        if #pos_tb ~= 0 then
            if reaper.ImGui_Button(ctx, 'Jump First') then
                Jumpfirst()
            end
            reaper.ImGui_SameLine(ctx)
            if reaper.ImGui_ArrowButton(ctx, 'Jump Left', reaper.ImGui_Dir_Left()) then
                JumpForward()
            end
            reaper.ImGui_SameLine(ctx)
            if reaper.ImGui_ArrowButton(ctx, 'Jump Right', reaper.ImGui_Dir_Right()) then
                Jumpback()
            end
            reaper.ImGui_SameLine(ctx)
            if reaper.ImGui_Button(ctx, 'Jump End') then
                Jumpend()
            end
        end

        retval = reaper.ImGui_IsKeyPressed(ctx, reaper.ImGui_Key_Escape(), nil)
        if retval then
            flag = false
        end

        editor = reaper.MIDIEditor_GetActive()
        if not editor then
            flag = false
        end

        reaper.ImGui_End(ctx)
    end
    reaper.ImGui_PopFont(ctx)

    if open and flag then
        reaper.defer(loop)
    else

        reaper.SN_FocusMIDIEditor()
    end
end

reaper.defer(loop)

