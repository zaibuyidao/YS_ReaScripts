--[[
 * ReaScript Name: CYM ROLL 滚擦生成器
 * Version: 1.0.2
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2024-4-29)
  + Initial release
--]]

function cymroll()
    editor = reaper.MIDIEditor_GetActive()
    take = reaper.MIDIEditor_GetTake(editor)
    reaper.MIDI_SelectAll(take, false)
    From, Thru = reaper.GetSet_LoopTimeRange(false, true, 0, 0, true)

    if From == 0 and Thru == 0 then
        x, y = reaper.GetMousePosition()
        reaper.TrackCtl_SetToolTip('没有设定时间范围！', x, y + 20, true)
        return
    end

    ms = ms_sub / 1000
    minvel = 5
    juli = Thru - From
    note_num = juli / ms
    note_num_int = math.floor(note_num + 0.5)
    vel = (maxvel - minvel) / note_num
    buchang = 0.008 / note_num -- 补偿+毫秒值=下面的计算值

    if not dub then
        c = 1
        add = 1
    else
        c = 0.5
        add = 0.5
        sindub = 1
    end
    reaper.Undo_BeginBlock()
    reaper.MIDI_DisableSort(take)
    noteST1 = From
    noteST1 = reaper.MIDI_GetPPQPosFromProjTime(take, noteST1)

    -- 初始音符插入
    if dub then
        reaper.MIDI_InsertNote(take, true, false, noteST1, noteST1 + 10, 0, 49, minvel, false)
    else
        reaper.MIDI_InsertNote(take, true, false, noteST1, noteST1 + 10, 0, notepitch, minvel, false)
    end

    -- 新增曲线计算逻辑
    local curve_factor = math.abs(curve) * 0.2 -- 将档位转换为强度系数
    local curve_sign = curve > 0 and 1 or -1 -- 确定曲线方向

    while c < note_num_int do
        -- 应用抛物线曲线
        local t = c / note_num_int -- 标准化位置（0-1）
        local curve_effect = 0

        if curve ~= 0 then
            if curve_sign > 0 then
                curve_effect = t ^ (1 + curve_factor) -- 正抛物线
            else
                curve_effect = 1 - (1 - t) ^ (1 + curve_factor) -- 负抛物线
            end
        else
            curve_effect = t -- 线性
        end

        noteST = From + ((ms + 0.008) - (buchang * c)) * c
        noteST = reaper.MIDI_GetPPQPosFromProjTime(take, noteST)
        notevel = math.modf(minvel + (maxvel - minvel) * curve_effect) -- 应用曲线效果

        -- 力度范围限制
        notevel = math.max(minvel, math.min(maxvel, notevel))

        if dub then
            if sindub % 2 == 1 then
                reaper.MIDI_InsertNote(take, true, false, noteST, noteST + 10, 0, 57, notevel, false)
            else
                reaper.MIDI_InsertNote(take, true, false, noteST, noteST + 10, 0, 49, notevel, false)
            end
            sindub = sindub + 1
        else
            reaper.MIDI_InsertNote(take, true, false, noteST, noteST + 10, 0, notepitch, notevel, false)
        end
        c = c + add
    end

    reaper.MIDI_Sort(take)
    reaper.MarkTrackItemsDirty(reaper.GetMediaItemTake_Track(take), reaper.GetMediaItemTake_Item(take))
    reaper.Undo_EndBlock('Cym Roll', -1)
    flag = false
end

note_array = {0}
reaper_array = reaper.new_array(note_array)
From, Thru = reaper.GetSet_LoopTimeRange(false, true, 0, 0, true)
function Curve_Preview()
    note_array = {}
    From, Thru = reaper.GetSet_LoopTimeRange(false, true, 0, 0, true)

    if From == 0 and Thru == 0 then
        note_array = {0}
    else
        ms = ms_sub / 1000
        minvel = 5
        juli = Thru - From
        note_num = juli / ms
        note_num_int = math.floor(note_num + 0.5)

        if not dub then
            c = 1
            add = 1
        else
            c = 0.5
            add = 0.5
        end

        table.insert(note_array, minvel)

        -- 新增曲线计算逻辑
        local curve_factor = math.abs(curve) * 0.2 -- 将档位转换为强度系数
        local curve_sign = curve > 0 and 1 or -1 -- 确定曲线方向

        while c < note_num_int do
            -- 应用抛物线曲线
            local t = c / note_num_int -- 标准化位置（0-1）
            local curve_effect = 0

            if curve ~= 0 then
                if curve_sign > 0 then
                    curve_effect = t ^ (1 + curve_factor) -- 正抛物线
                else
                    curve_effect = 1 - (1 - t) ^ (1 + curve_factor) -- 负抛物线
                end
            else
                curve_effect = t -- 线性
            end

            notevel = math.modf(minvel + (maxvel - minvel) * curve_effect) -- 应用曲线效果

            -- 力度范围限制
            notevel = math.max(minvel, math.min(maxvel, notevel))
            table.insert(note_array, notevel)
            c = c + add
        end
    end
    reaper_array = reaper.new_array(note_array)
end

retval, curve = reaper.GetProjExtState(0, 'CYM roll', 'curve')
if curve == '' then
    curve = 0
else
    curve = tonumber(curve)
end

local ctx = reaper.ImGui_CreateContext('CYM roll')
local size = reaper.GetAppVersion():match('OSX') and 12 or 14
local font = reaper.ImGui_CreateFont('sans-serif', size)
reaper.ImGui_Attach(ctx, font)

x, y = reaper.GetMousePosition()
x, y = reaper.ImGui_PointConvertNative(ctx, x, y)
reaper.ImGui_SetNextWindowPos(ctx, x, y)

windows_flag = reaper.ImGui_WindowFlags_TopMost()
windows_flag = windows_flag | reaper.ImGui_WindowFlags_AlwaysAutoResize()
flag = true
maxvel = 100
temp_maxvel, temp_ms_sub, temp_curve, temp_From, temp_Thru = -1, -1, -6, -1, -1

retval, ms_sub = reaper.GetProjExtState(0, 'CYM Roll', 'ms_sub')
if ms_sub == '' then
    ms_sub = 75
else
    ms_sub = tonumber(ms_sub)
end
function loop()
    reaper.ImGui_PushFont(ctx, font)
    local visible, open = reaper.ImGui_Begin(ctx, 'Cym Roll', true, windows_flag)
    if visible then

        if reaper.ImGui_Button(ctx, 'Cym 49') then
            notepitch = 49
            cymroll()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_SmallButton(ctx, 'Cym 57') then
            notepitch = 57
            cymroll()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_SmallButton(ctx, 'Cym 49 & 57') then
            dub = true
            cymroll()
            dub = false
        end
        reaper.ImGui_Spacing(ctx)
        retval, maxvel = reaper.ImGui_SliderInt(ctx, 'Max Velocity', maxvel, 40, 127, "%d")
        retval, ms_sub = reaper.ImGui_SliderInt(ctx, 'Interval ms', ms_sub, 60, 90, "%d")
        retval, curve = reaper.ImGui_SliderInt(ctx, 'Curve', curve, -5, 5, "%d")
        From, Thru = reaper.GetSet_LoopTimeRange(false, true, 0, 0, true)

        if maxvel ~= temp_maxvel or ms_sub ~= temp_ms_sub or curve ~= temp_curve or From ~= temp_From or Thru ~= temp_Thru then
            Curve_Preview()
            temp_maxvel = maxvel
            temp_ms_sub = ms_sub
            temp_curve = curve
            temp_From = From
            temp_Thru = Thru
        end

        reaper.ImGui_PlotHistogram(ctx, '', reaper_array, 0, 'Preview', 0, 127, 300, 200)

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
        reaper.SetProjExtState(0, 'CYM Roll', 'ms_sub', ms_sub)
        reaper.SetProjExtState(0, 'CYM Roll', 'curve', curve)
        reaper.SN_FocusMIDIEditor()
    end
end

reaper.defer(loop)

