--[[
 * ReaScript Name: slide in V2
 * Version: 1.0.3
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2024-8-28)
  + Initial release
--]]

retval, slide_mode = reaper.GetProjExtState(0, 'slide in', 'mode')
if slide_mode == '' then
    slide_mode = 0
end

function slideIn()
    c = 1
    txt = ''

    local editor = reaper.MIDIEditor_GetActive()

    local take = reaper.MIDIEditor_GetTake(editor)

    From, Thru = reaper.GetSet_LoopTimeRange(false, true, 0, 0, true)

    if From == 0 and Thru == 0 then
        x, y = reaper.GetMousePosition()
        reaper.TrackCtl_SetToolTip('请设置好时间范围！', x, y + 20, true)
        return
    end

    local From_tick = reaper.MIDI_GetPPQPosFromProjTime(take, From)
    local Thru_tick = reaper.MIDI_GetPPQPosFromProjTime(take, Thru)

    if wanyin_num < 0 then
        jiange = wanyin_num * -1
    else
        jiange = wanyin_num
    end

    juli = Thru_tick - From_tick
    b = juli / wanyin_num

    reaper.Undo_BeginBlock()
    reaper.MIDI_DisableSort(take)
    if (Thru ~= 0) then
        if (wanyin_num > 0) -- zhengshu
        then
            pitch = 683 * wanyin_num

            if (pitch > 8191) then
                pitch = 8191
            end
            if (pitch < -8192) then
                pitch = -8191
            end

            local beishu = math.modf(pitch / 128)
            local yushu = math.fmod(pitch, 128)
            if (beishu < 0) then
                beishu = beishu - 1
            end

            reaper.MIDI_InsertCC(take, false, false, From_tick, 224, 0, yushu, 64 + beishu)
            if slide_mode == 2 then

                retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
                reaper.MIDI_SetCCShape(take, ccevtcnt - 1, 5, 0.25, false)
            end

            if slide_mode == 0 then
                TempTick = -10
                while (c <= wanyin_num) do
                    pitch = 683 * (wanyin_num - c)

                    if (pitch > 8191) then
                        pitch = 8191
                    end
                    if (pitch < -8192) then
                        pitch = -8191
                    end

                    local beishu = math.modf(pitch / 128)
                    local yushu = math.fmod(pitch, 128)
                    if (beishu < 0) then
                        beishu = beishu - 1
                    end
                    --[[if jiange > 3 then
                        subjiange = jiange * 2
                        subjuli = juli / 0.74
                    else
                                                subjiange = jiange + (c * 0.85)
                        subjuli = juli
                    end --]]
                    -- InsertTick = From_tick + subjuli * c / (subjiange - (c * 0.65))
                    InsertTick = From_tick + juli * ((c + c) / (jiange + c))
                    if InsertTick - TempTick < 9 then
                        txt = txt .. '警告 : 弯音 ' .. pitch .. ' 间隔低于 10 tick!\n'
                    end
                    TempTick = InsertTick
                    reaper.MIDI_InsertCC(take, false, false, InsertTick, 224, 0, yushu, 64 + beishu)
                    c = c + 1
                end -- while end

            else
                reaper.MIDI_InsertCC(take, false, false, Thru_tick, 224, 0, 0, 64)
            end -- if slide_mode end
        end
    end -- thru  zhengshu

    if (Thru ~= 0) then
        if (wanyin_num < 0) then
            pitch = 683 * wanyin_num

            if (pitch > 8191) then
                pitch = 8191
            end
            if (pitch < -8192) then
                pitch = -8191
            end

            local beishu = math.modf(pitch / 128)
            local yushu = math.fmod(pitch, 128)
            if (beishu < 0) then
                beishu = beishu - 1
            end

            reaper.MIDI_InsertCC(take, false, false, From_tick, 224, 0, yushu, 64 + beishu)
            if slide_mode == 2 then

                retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
                reaper.MIDI_SetCCShape(take, ccevtcnt - 1, 5, 0.25, false)
            end

            if slide_mode == 0 then
                TempTick = -10
                while (c <= wanyin_num * -1) do
                    pitch = 683 * (wanyin_num + c)

                    if (pitch > 8191) then
                        pitch = 8191
                    end
                    if (pitch < -8192) then
                        pitch = -8191
                    end

                    local beishu = math.modf(pitch / 128)
                    local yushu = math.fmod(pitch, 128)
                    if (beishu < 0) then
                        beishu = beishu - 1
                    end
                    InsertTick = From_tick + juli * ((c + c) / (jiange + c))
                    if InsertTick - TempTick < 9 then
                        txt = txt .. '警告 : 弯音 ' .. pitch .. ' 间隔低于 10 tick!\n'
                    end
                    TempTick = InsertTick
                    reaper.MIDI_InsertCC(take, false, false, InsertTick, 224, 0, yushu, 64 + beishu)
                    c = c + 1
                end -- while end
            else
                reaper.MIDI_InsertCC(take, false, false, Thru_tick, 224, 0, 0, 64)
            end -- if slide_mode end
        end
    end -- thru fushu
    reaper.MIDI_Sort(take)

    reaper.MarkTrackItemsDirty(reaper.GetMediaItemTake_Track(take), reaper.GetMediaItemTake_Item(take))
    reaper.Undo_EndBlock('slide in', -1)
    reaper.SetProjExtState(0, 'slide in', 'mode', slide_mode)

    if txt ~= '' then
        reaper.ShowConsoleMsg(txt)
    end

    flag = false

    reaper.SN_FocusMIDIEditor()

    reaper.MIDIEditor_OnCommand(editor, 40366)

end

----------------------------------------------------------------

local ctx = reaper.ImGui_CreateContext('SLIDEIN')
local size = reaper.GetAppVersion():match('OSX') and 12 or 14
local font = reaper.ImGui_CreateFont('微软雅黑')
reaper.ImGui_Attach(ctx, font)

x, y = reaper.GetMousePosition()
x, y = reaper.ImGui_PointConvertNative(ctx, x, y)
reaper.ImGui_SetNextWindowPos(ctx, x, y)
windows_flag = reaper.ImGui_WindowFlags_TopMost()
windows_flag = windows_flag | reaper.ImGui_WindowFlags_AlwaysAutoResize()
windows_flag = windows_flag | reaper.ImGui_WindowFlags_NoCollapse()
flag = true
function loop()
    reaper.ImGui_PushFont(ctx, font, 12)
    local visible, open = reaper.ImGui_Begin(ctx, 'Slide In', true, windows_flag)
    if visible then

        if reaper.ImGui_Button(ctx, '-1') then
            wanyin_num = -1
            slideIn()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, '-2') then
            wanyin_num = -2
            slideIn()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, '-3') then
            wanyin_num = -3
            slideIn()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, '-4') then
            wanyin_num = -4
            slideIn()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, '-5') then
            wanyin_num = -5
            slideIn()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, '-6') then
            wanyin_num = -6
            slideIn()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, '-7') then
            wanyin_num = -7
            slideIn()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, '-8') then
            wanyin_num = -8
            slideIn()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, '-9') then
            wanyin_num = -9
            slideIn()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, '-10') then
            wanyin_num = -10
            slideIn()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, '-11') then
            wanyin_num = -11
            slideIn()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, '-12') then
            wanyin_num = -12
            slideIn()
        end

        if reaper.ImGui_Button(ctx, ' 1') then
            wanyin_num = 1
            slideIn()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, ' 2') then
            wanyin_num = 2
            slideIn()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, ' 3') then
            wanyin_num = 3
            slideIn()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, ' 4') then
            wanyin_num = 4
            slideIn()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, ' 5') then
            wanyin_num = 5
            slideIn()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, ' 6') then
            wanyin_num = 6
            slideIn()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, ' 7') then
            wanyin_num = 7
            slideIn()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, ' 8') then
            wanyin_num = 8
            slideIn()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, ' 9') then
            wanyin_num = 9
            slideIn()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, ' 10') then
            wanyin_num = 10
            slideIn()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, ' 11') then
            wanyin_num = 11
            slideIn()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, ' 12') then
            wanyin_num = 12
            slideIn()
        end

        reaper.ImGui_Spacing(ctx)

        retval, slide_mode = reaper.ImGui_RadioButtonEx(ctx, '品格', slide_mode, 0)
        reaper.ImGui_SameLine(ctx)
        retval, slide_mode = reaper.ImGui_RadioButtonEx(ctx, '击勾弦', slide_mode, 1)
        reaper.ImGui_SameLine(ctx)
        retval, slide_mode = reaper.ImGui_RadioButtonEx(ctx, '平滑', slide_mode, 2)
        
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

        reaper.SetProjExtState(0, 'slide in', 'mode', slide_mode)
        reaper.SN_FocusMIDIEditor()
    end
end

reaper.defer(loop)

