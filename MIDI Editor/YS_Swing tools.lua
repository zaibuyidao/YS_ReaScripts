--[[
 * ReaScript Name: Swing tools
 * Version: 1.0.1
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2024-4-29)
  + Initial release
--]]

help = [[工作原理：
在 16th 模式下，Tick 位置在 120-170,360-410 的音符，每次移动 10 tick。
在 8th 模式下，Tick 位置在 240-320 的音符，每次移动 10 tick。
仅限处理比较简单的情况，如果有滚奏，或者连续3连音，请排除在外。]]

function swing_add()
    noedit = 0
    editor = reaper.MIDIEditor_GetActive()
    txt = '已经是最大Swing幅度或者音符位置不规范'
    x, y = reaper.GetMousePosition()
    th3 = ''
    trackname = ''
    takeindex = 0
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    while take ~= nil do
        reaper.MIDI_DisableSort(take)
        noteidx = -1
        noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
        while noteidx ~= -1 do
            retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
            StartOfMeasure = reaper.MIDI_GetPPQPos_StartOfMeasure(take, startppqpos) - 0.5
            tick_st = (startppqpos - StartOfMeasure) % 480
            tick_st = math.modf(tick_st / 1)
            if tick_st >= 170 and tick_st < 180 then
                reaper.TrackCtl_SetToolTip(txt, x, y + 20, true)
                return
            end
            if tick_st >= 410 and tick_st < 420 then
                reaper.TrackCtl_SetToolTip(txt, x, y + 20, true)
                return
            end
            if (tick_st > 75 and tick_st < 85) or (tick_st > 315 and tick_st < 325) then
                ret, TKN = reaper.GetTrackName(reaper.GetMediaItemTake_Track(take))
                if TKN ~= trackname then
                    th3 = th3 .. TKN .. ' 轨道有 6连音被选中。\n'
                end
                trackname = TKN
            end
            --[[tick_end = (endppqpos - StartOfMeasure) % 480
            tick_end = math.modf(tick_end / 1)
            if tick_end >= 170 and tick_end < 180 then
                reaper.TrackCtl_SetToolTip(txt, x, y + 20, true)
                return
            end
            if tick_end >= 410 and tick_end < 420 then
                reaper.TrackCtl_SetToolTip(txt, x, y + 20, true)
                return
            end--]]
            noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
        end
        reaper.MIDI_Sort(take)
        takeindex = takeindex + 1
        take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    end -- while take end
    if th3 ~= '' then
        reaper.MB(th3, '错误！', 0)
        reaper.SN_FocusMIDIEditor()
        return
    end

    takeindex = 0
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    while take ~= nil do
        reaper.MIDI_DisableSort(take)
        noteidx = -1
        noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
        while noteidx ~= -1 do
            retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
            StartOfMeasure = reaper.MIDI_GetPPQPos_StartOfMeasure(take, startppqpos) - 0.5
            tick_st = (startppqpos - StartOfMeasure) % 480
            tick_st = math.modf(tick_st / 1)
            if tick_st >= 120 and tick_st < 170 then
                reaper.MIDI_SetNote(take, noteidx, NULL, NULL, startppqpos + 10, NULL, NULL, NULL, NULL, false)
                noedit = noedit + 1
            end
            if tick_st >= 360 and tick_st < 410 then
                reaper.MIDI_SetNote(take, noteidx, NULL, NULL, startppqpos + 10, NULL, NULL, NULL, NULL, false)
                noedit = noedit + 1
            end
            tick_end = (endppqpos - StartOfMeasure) % 480
            tick_end = math.modf(tick_end / 1)
            if tick_end >= 110 and tick_end < 180 then
                reaper.MIDI_SetNote(take, noteidx, NULL, NULL, NULL, endppqpos + 10, NULL, NULL, NULL, false)
                noedit = noedit + 1
            end
            if tick_end >= 350 and tick_end < 420 then
                reaper.MIDI_SetNote(take, noteidx, NULL, NULL, NULL, endppqpos + 10, NULL, NULL, NULL, false)
                noedit = noedit + 1
            end
            noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
        end
        reaper.MIDI_Sort(take)
        takeindex = takeindex + 1
        take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    end -- while take end
    if noedit == 0 then
        reaper.TrackCtl_SetToolTip('没有需要处理的音符！', x, y + 20, true)
    end
    reaper.SN_FocusMIDIEditor()
end -- function end

function swing_add_8th()
    noedit = 0
    editor = reaper.MIDIEditor_GetActive()
    txt = '已经是最大Swing幅度或者音符位置不规范'
    x, y = reaper.GetMousePosition()
    th3 = ''
    trackname = ''
    takeindex = 0
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    while take ~= nil do
        reaper.MIDI_DisableSort(take)
        noteidx = -1
        noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
        while noteidx ~= -1 do
            retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
            StartOfMeasure = reaper.MIDI_GetPPQPos_StartOfMeasure(take, startppqpos) - 0.5
            tick_st = (startppqpos - StartOfMeasure) % 480
            tick_st = math.modf(tick_st / 1)
            if tick_st >= 330 and tick_st < 340 then
                reaper.TrackCtl_SetToolTip(txt, x, y + 20, true)
                return
            end
            if tick_st > 155 and tick_st < 165 then
                ret, TKN = reaper.GetTrackName(reaper.GetMediaItemTake_Track(take))
                if TKN ~= trackname then
                    th3 = th3 .. TKN .. ' 轨道有 3连音被选中。\n'
                end
                trackname = TKN
            end
            if (tick_st > 115 and tick_st < 125) or (tick_st > 355 and tick_st < 365) then
                ret, TKN = reaper.GetTrackName(reaper.GetMediaItemTake_Track(take))
                if TKN ~= trackname then
                    th3 = th3 .. TKN .. ' 轨道有 16分音符被选中。\n'
                end
                trackname = TKN
            end

            noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
        end
        reaper.MIDI_Sort(take)
        takeindex = takeindex + 1
        take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    end -- while take end
    if th3 ~= '' then
        reaper.MB(th3, '错误！', 0)
        reaper.SN_FocusMIDIEditor()
        return
    end

    takeindex = 0
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    while take ~= nil do
        reaper.MIDI_DisableSort(take)
        noteidx = -1
        noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
        while noteidx ~= -1 do
            retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
            StartOfMeasure = reaper.MIDI_GetPPQPos_StartOfMeasure(take, startppqpos) - 0.5
            tick_st = (startppqpos - StartOfMeasure) % 480
            tick_st = math.modf(tick_st / 1)
            if tick_st >= 240 and tick_st < 330 then
                reaper.MIDI_SetNote(take, noteidx, NULL, NULL, startppqpos + 10, NULL, NULL, NULL, NULL, false)
                noedit = noedit + 1
            end
            tick_end = (endppqpos - StartOfMeasure) % 480
            tick_end = math.modf(tick_end / 1)
            if tick_end >= 230 and tick_end < 320 then
                reaper.MIDI_SetNote(take, noteidx, NULL, NULL, NULL, endppqpos + 10, NULL, NULL, NULL, false)
                noedit = noedit + 1
            end
            noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
        end
        reaper.MIDI_Sort(take)
        takeindex = takeindex + 1
        take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    end -- while take end
    if noedit == 0 then
        reaper.TrackCtl_SetToolTip('没有需要处理的音符！', x, y + 20, true)
    end
    reaper.SN_FocusMIDIEditor()
end -- function end

function Normal()
    noedit = 0
    editor = reaper.MIDIEditor_GetActive()
    txt = '已经是Straight或者音符位置不规范'
    th3 = ''
    trackname = ''
    x, y = reaper.GetMousePosition()

    takeindex = 0
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    while take ~= nil do
        reaper.MIDI_DisableSort(take)
        noteidx = -1
        noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
        while noteidx ~= -1 do
            retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
            StartOfMeasure = reaper.MIDI_GetPPQPos_StartOfMeasure(take, startppqpos) - 0.5
            tick_st = (startppqpos - StartOfMeasure) % 480
            tick_st = math.modf(tick_st / 1)
            if tick_st >= 120 and tick_st < 130 then
                reaper.TrackCtl_SetToolTip(txt, x, y + 20, true)
                return
            end
            if tick_st >= 360 and tick_st < 370 then
                reaper.TrackCtl_SetToolTip(txt, x, y + 20, true)
                return
            end
            if (tick_st > 75 and tick_st < 85) or (tick_st > 315 and tick_st < 325) then
                ret, TKN = reaper.GetTrackName(reaper.GetMediaItemTake_Track(take))
                if TKN ~= trackname then
                    th3 = th3 .. TKN .. ' 轨道有 6连音被选中。\n'
                end
                trackname = TKN
            end
            noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
        end
        reaper.MIDI_Sort(take)
        takeindex = takeindex + 1
        take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    end -- while take end
    if th3 ~= '' then
        reaper.MB(th3, '错误！', 0)
        reaper.SN_FocusMIDIEditor()
        return
    end

    takeindex = 0
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    while take ~= nil do
        reaper.MIDI_DisableSort(take)
        noteidx = -1
        noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
        while noteidx ~= -1 do
            retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
            StartOfMeasure = reaper.MIDI_GetPPQPos_StartOfMeasure(take, startppqpos) - 0.5
            tick_st = (startppqpos - StartOfMeasure) % 480
            tick_st = math.modf(tick_st / 1)
            if tick_st >= 130 and tick_st < 180 then
                reaper.MIDI_SetNote(take, noteidx, NULL, NULL, startppqpos - 10, NULL, NULL, NULL, NULL, false)
                noedit = noedit + 1
            end
            if tick_st >= 370 and tick_st < 420 then
                reaper.MIDI_SetNote(take, noteidx, NULL, NULL, startppqpos - 10, NULL, NULL, NULL, NULL, false)
                noedit = noedit + 1
            end
            tick_end = (endppqpos - StartOfMeasure) % 480
            tick_end = math.modf(tick_end / 1)
            if tick_end >= 110 and tick_end < 190 then
                reaper.MIDI_SetNote(take, noteidx, NULL, NULL, NULL, endppqpos - 10, NULL, NULL, NULL, false)
                noedit = noedit + 1
            end
            if tick_end >= 350 and tick_end < 430 then
                reaper.MIDI_SetNote(take, noteidx, NULL, NULL, NULL, endppqpos - 10, NULL, NULL, NULL, false)
                noedit = noedit + 1
            end
            noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
        end
        reaper.MIDI_Sort(take)
        takeindex = takeindex + 1
        take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    end -- while take end
    if noedit == 0 then
        reaper.TrackCtl_SetToolTip('没有需要处理的音符！', x, y + 20, true)
    end
    reaper.SN_FocusMIDIEditor()
end -- function end

function Normal_8th()
    noedit = 0
    editor = reaper.MIDIEditor_GetActive()
    txt = '已经是Straight或者音符位置不规范'
    th3 = ''
    trackname = ''
    x, y = reaper.GetMousePosition()

    takeindex = 0
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    while take ~= nil do
        reaper.MIDI_DisableSort(take)
        noteidx = -1
        noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
        while noteidx ~= -1 do
            retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
            StartOfMeasure = reaper.MIDI_GetPPQPos_StartOfMeasure(take, startppqpos) - 0.5
            tick_st = (startppqpos - StartOfMeasure) % 480
            tick_st = math.modf(tick_st / 1)
            if tick_st >= 240 and tick_st < 250 then
                reaper.TrackCtl_SetToolTip(txt, x, y + 20, true)
                return
            end
            if tick_st > 155 and tick_st < 165 then
                ret, TKN = reaper.GetTrackName(reaper.GetMediaItemTake_Track(take))
                if TKN ~= trackname then
                    th3 = th3 .. TKN .. ' 轨道有 3连音被选中。\n'
                end
                trackname = TKN
            end
            if (tick_st > 115 and tick_st < 125) or (tick_st > 355 and tick_st < 365) then
                ret, TKN = reaper.GetTrackName(reaper.GetMediaItemTake_Track(take))
                if TKN ~= trackname then
                    th3 = th3 .. TKN .. ' 轨道有 16分音符被选中。\n'
                end
                trackname = TKN
            end
            noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
        end
        reaper.MIDI_Sort(take)
        takeindex = takeindex + 1
        take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    end -- while take end
    if th3 ~= '' then
        reaper.MB(th3, '错误！', 0)
        reaper.SN_FocusMIDIEditor()
        return
    end

    takeindex = 0
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    while take ~= nil do
        reaper.MIDI_DisableSort(take)
        noteidx = -1
        noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
        while noteidx ~= -1 do
            retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
            StartOfMeasure = reaper.MIDI_GetPPQPos_StartOfMeasure(take, startppqpos) - 0.5
            tick_st = (startppqpos - StartOfMeasure) % 480
            tick_st = math.modf(tick_st / 1)
            if tick_st >= 250 and tick_st < 350 then
                reaper.MIDI_SetNote(take, noteidx, NULL, NULL, startppqpos - 10, NULL, NULL, NULL, NULL, false)
                noedit = noedit + 1
            end
            tick_end = (endppqpos - StartOfMeasure) % 480
            tick_end = math.modf(tick_end / 1)
            if tick_end >= 230 and tick_end < 360 then
                reaper.MIDI_SetNote(take, noteidx, NULL, NULL, NULL, endppqpos - 10, NULL, NULL, NULL, false)
                noedit = noedit + 1
            end
            noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
        end
        reaper.MIDI_Sort(take)
        takeindex = takeindex + 1
        take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    end -- while take end
    if noedit == 0 then
        reaper.TrackCtl_SetToolTip('没有需要处理的音符！', x, y + 20, true)
    end
    reaper.SN_FocusMIDIEditor()
end -- function end

local ctx = reaper.ImGui_CreateContext('Swing Tool')
local size = reaper.GetAppVersion():match('OSX') and 12 or 14
local font = reaper.ImGui_CreateFont('微软雅黑')
reaper.ImGui_Attach(ctx, font)
windowflag = reaper.ImGui_WindowFlags_TopMost()
windowflag = windowflag | reaper.ImGui_WindowFlags_AlwaysAutoResize()
windowflag = windowflag | reaper.ImGui_WindowFlags_NoCollapse()
flag = true

function loop()
    reaper.ImGui_PushFont(ctx, font, 12)
    local visible, open = reaper.ImGui_Begin(ctx, 'Swing Tools', true, windowflag)
    if visible then
        retval, beat_mode = reaper.ImGui_RadioButtonEx(ctx, '16TH', beat_mode, 0)
        reaper.ImGui_SameLine(ctx)
        retval, beat_mode = reaper.ImGui_RadioButtonEx(ctx, '8TH', beat_mode, 1)

        reaper.ImGui_SameLine(ctx)
        reaper.ImGui_Button(ctx, 'Help')
                if reaper.ImGui_IsItemHovered(ctx) then
            reaper.ImGui_SetTooltip(ctx, help)
        end
        if reaper.ImGui_Button(ctx, '平均') then
            if beat_mode == 0 then
                Normal()
            else
                Normal_8th()
            end
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, '摇摆') then
            if beat_mode == 0 then
                swing_add()
            else
                swing_add_8th()
            end
        end
        retval_esc = reaper.ImGui_IsKeyPressed(ctx, reaper.ImGui_Key_Escape(), nil)
        if retval_esc then
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
