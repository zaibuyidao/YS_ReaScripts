--[[
 * ReaScript Name: CYM ROLL 滚擦生成器
 * Version: 1.0.1
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
    reaper.MIDI_DisableSort(take)
    noteST1 = From
    noteST1 = reaper.MIDI_GetPPQPosFromProjTime(take, noteST1)
    if dub then
        reaper.MIDI_InsertNote(take, true, false, noteST1, noteST1 + 10, 0, 49, minvel, false)
    else
        reaper.MIDI_InsertNote(take, true, false, noteST1, noteST1 + 10, 0, notepitch, minvel, false)
    end
    while c < note_num_int do
        noteST = From + ((ms + 0.008) - (buchang * c)) * c
        noteST = reaper.MIDI_GetPPQPosFromProjTime(take, noteST)
        notevel = math.modf(minvel + (vel * c))
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
    end -- while end

    reaper.MIDI_Sort(take)
    flag = false
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

retval, ms_sub = reaper.GetProjExtState(0, 'CYM Roll', 'ms_sub')
if ms_sub == '' then
    ms_sub = 75
else
    ms_sub = tonumber(ms_sub)
end
function loop()
    reaper.ImGui_PushFont(ctx, font)
    local visible, open = reaper.ImGui_Begin(ctx, 'CYM Roll', true, windows_flag)
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
        reaper.SN_FocusMIDIEditor()
    end
end

reaper.defer(loop)
