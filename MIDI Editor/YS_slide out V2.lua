--[[
 * ReaScript Name: slide out V2
 * Version: 1.0
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2024-8-28)
  + Initial release
--]]

retval, slide_mode = reaper.GetProjExtState(0, 'slide out', 'mode')
if slide_mode == '' then
    slide_mode = 0
end

function slideout()
    c = 0
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

    reaper.MIDI_DisableSort(take)

    if (Thru ~= 0) then
        if (wanyin_num > 0) -- zhengshu
        then
            pitch = 683 * wanyin_num

            if (pitch > 8191) then
                pitch = 8191
            end

            local beishu = math.modf(pitch / 128)
            local yushu = math.fmod(pitch, 128)

            if slide_mode == 2 then
                reaper.MIDI_InsertCC(take, false, false, From_tick, 224, 0, 0, 64)
                retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
                reaper.MIDI_SetCCShape(take, ccevtcnt - 1, 5, 0.25, false)
                reaper.MIDI_InsertCC(take, false, false, Thru_tick - 20, 224, 0, yushu, 64 + beishu)
                reaper.MIDI_InsertCC(take, false, false, Thru_tick, 224, 0, 0, 64)
            end

            if slide_mode == 1 then
                reaper.MIDI_InsertCC(take, false, false, From_tick, 224, 0, 0, 64)
                reaper.MIDI_InsertCC(take, false, false, From_tick + (juli / 2), 224, 0, yushu, 64 + beishu)
                reaper.MIDI_InsertCC(take, false, false, Thru_tick, 224, 0, 0, 64)
            end

            if slide_mode == 0 then
                TempTick = -10
                while (c <= wanyin_num) do
                    pitch = 683 * c

                    if (pitch > 8191) then
                        pitch = 8191
                    end

                    local beishu = math.modf(pitch / 128)
                    local yushu = math.fmod(pitch, 128)

                    InsertTick = From_tick + juli * ((c + c) / (jiange + c + 1))
                    if InsertTick - TempTick < 10 then
                        txt = txt .. '警告 : 弯音 ' .. pitch .. ' 距离低于 10 tick!\n'
                    end
                    TempTick = InsertTick
                    reaper.MIDI_InsertCC(take, false, false, InsertTick, 224, 0, yushu, 64 + beishu)

                    c = c + 1
                end
                if Thru_tick - TempTick < 9 then
                    txt = txt .. '警告 : 弯音 ' .. '0' .. ' 距离低于 10 tick!\n'
                end
                reaper.MIDI_InsertCC(take, false, false, Thru_tick, 224, 0, 0, 64)
            end
        end
    end -- thru zhengshu
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
            wanyin_num = wanyin_num * -1

            if slide_mode == 2 then
                reaper.MIDI_InsertCC(take, false, false, From_tick, 224, 0, 0, 64)
                retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
                reaper.MIDI_SetCCShape(take, ccevtcnt - 1, 5, 0.25, false)
                reaper.MIDI_InsertCC(take, false, false, Thru_tick - 20, 224, 0, yushu, 64 + beishu)
                reaper.MIDI_InsertCC(take, false, false, Thru_tick, 224, 0, 0, 64)
            end

            if slide_mode == 1 then
                reaper.MIDI_InsertCC(take, false, false, From_tick, 224, 0, 0, 64)
                reaper.MIDI_InsertCC(take, false, false, From_tick + (juli / 2), 224, 0, yushu, 64 + beishu)
                reaper.MIDI_InsertCC(take, false, false, Thru_tick, 224, 0, 0, 64)
            end

            if slide_mode == 0 then
                TempTick = -10
                while (c <= wanyin_num) do
                    pitch = 683 * c * -1

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
                    if jiange > 3 then
                        subjiange = jiange * 2
                    else
                        subjiange = jiange + (c * 0.8) + 1
                    end
                    InsertTick = From_tick + juli * c / (subjiange - (c * 0.65)) * 1.2

                    if InsertTick - TempTick < 10 then
                        txt = txt .. '警告 : 弯音 ' .. pitch .. ' 距离低于 10 tick!\n'
                    end
                    TempTick = InsertTick
                    reaper.MIDI_InsertCC(take, false, false, InsertTick, 224, 0, yushu, 64 + beishu)
                    c = c + 1
                end
                if Thru_tick - TempTick < 9 then
                    txt = txt .. '警告 : 弯音 ' .. '0' .. ' 距离低于 10 tick!\n'
                end
                reaper.MIDI_InsertCC(take, false, false, Thru_tick, 224, 0, 0, 64)
            end
        end
    end -- thru fushu

    reaper.MIDI_Sort(take)

    reaper.SetProjExtState(0, 'slide out', 'mode', slide_mode)

    if txt ~= '' then
        reaper.ShowConsoleMsg(txt)
    end

    flag = false

    reaper.SN_FocusMIDIEditor()

    reaper.MIDIEditor_OnCommand(editor, 40366)

end

----------------------------------------------------------------

local ctx = reaper.ImGui_CreateContext('SLIDEOUT')
local size = reaper.GetAppVersion():match('OSX') and 12 or 14
local font = reaper.ImGui_CreateFont('sans-serif', size)
reaper.ImGui_Attach(ctx, font)

x, y = reaper.GetMousePosition()
x, y = reaper.ImGui_PointConvertNative(ctx, x, y)
reaper.ImGui_SetNextWindowPos(ctx, x, y)
windows_flag = reaper.ImGui_WindowFlags_TopMost()
windows_flag = windows_flag | reaper.ImGui_WindowFlags_AlwaysAutoResize()
windows_flag = windows_flag | reaper.ImGui_WindowFlags_NoCollapse()
flag = true
function loop()
    reaper.ImGui_PushFont(ctx, font)
    local visible, open = reaper.ImGui_Begin(ctx, 'Slide Out', true, windows_flag)
    if visible then

        if reaper.ImGui_Button(ctx, '-1') then
            wanyin_num = -1
            slideout()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, '-2') then
            wanyin_num = -2
            slideout()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, '-3') then
            wanyin_num = -3
            slideout()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, '-4') then
            wanyin_num = -4
            slideout()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, '-5') then
            wanyin_num = -5
            slideout()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, '-6') then
            wanyin_num = -6
            slideout()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, '-7') then
            wanyin_num = -7
            slideout()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, '-8') then
            wanyin_num = -8
            slideout()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, '-9') then
            wanyin_num = -9
            slideout()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, '-10') then
            wanyin_num = -10
            slideout()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, '-11') then
            wanyin_num = -11
            slideout()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, '-12') then
            wanyin_num = -12
            slideout()
        end

        if reaper.ImGui_Button(ctx, ' 1') then
            wanyin_num = 1
            slideout()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, ' 2') then
            wanyin_num = 2
            slideout()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, ' 3') then
            wanyin_num = 3
            slideout()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, ' 4') then
            wanyin_num = 4
            slideout()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, ' 5') then
            wanyin_num = 5
            slideout()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, ' 6') then
            wanyin_num = 6
            slideout()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, ' 7') then
            wanyin_num = 7
            slideout()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, ' 8') then
            wanyin_num = 8
            slideout()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, ' 9') then
            wanyin_num = 9
            slideout()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, ' 10') then
            wanyin_num = 10
            slideout()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, ' 11') then
            wanyin_num = 11
            slideout()
        end
        reaper.ImGui_SameLine(ctx)

        if reaper.ImGui_Button(ctx, ' 12') then
            wanyin_num = 12
            slideout()
        end

        reaper.ImGui_Spacing(ctx)

        retval, slide_mode = reaper.ImGui_RadioButtonEx(ctx, 'Character', slide_mode, 0)
        reaper.ImGui_SameLine(ctx)
        retval, slide_mode = reaper.ImGui_RadioButtonEx(ctx, 'Hammer', slide_mode, 1)
        reaper.ImGui_SameLine(ctx)
        retval, slide_mode = reaper.ImGui_RadioButtonEx(ctx, 'Smooth', slide_mode, 2)
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, ' ?') then
            help = [[Character 模式为品格滑弦，以半音为单位滑动。
Hammer 模式为击勾弦，直接归零。
Smooth 模式为平滑。
模式跟随工程记忆。]]
            reaper.MB(help, '说明', 0)
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

        reaper.SetProjExtState(0, 'slide out', 'mode', slide_mode)
        reaper.SN_FocusMIDIEditor()
    end
end

reaper.defer(loop)

