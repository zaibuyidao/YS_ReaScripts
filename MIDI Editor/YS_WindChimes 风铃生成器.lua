-- @description WindChimes 风铃生成器
-- @version 1.0
-- @author YS
-- @changelog New Script
-- @provides [main=midi_editor] .

function windchime()
    editor = reaper.MIDIEditor_GetActive()
    take = reaper.MIDIEditor_GetTake(editor)
    reaper.MIDI_SelectAll(take, false)
    From, Thru = reaper.GetSet_LoopTimeRange(false, true, 0, 0, true)

    if From == 0 and Thru == 0 then
        x, y = reaper.GetMousePosition()
        reaper.TrackCtl_SetToolTip('没有设定时间范围！', x, y + 20, true)
        return
    end
    mode_tb = {'Normal', 'Down', 'Up', 'Down->Up', 'Up->Down'}
    reaper.Undo_BeginBlock()
    exp = 127
    track = reaper.GetMediaItemTake_Track(take)
    
    first_take = reaper.GetMediaItemTake(reaper.GetTrackMediaItem(track, 0), 0)
    retval, _, ccevtcnt, _ = reaper.MIDI_CountEvts(first_take)
    ccidx = 0
    retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(first_take, ccidx)
    while retval do
        if chanmsg == 176 and msg2 == 11 then
            exp = msg3
            break
        end
        ccidx = ccidx + 1
        retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(first_take, ccidx)
    end

    Note_st = reaper.MIDI_GetPPQPosFromProjTime(take, From)
    Note_end = reaper.MIDI_GetPPQPosFromProjTime(take, Thru)
    jiange = Note_end - Note_st
    reaper.MIDI_DisableSort(take)

    reaper.MIDI_InsertCC(take, false, false, Note_st + (jiange * 0.3), 176, 0, 11, exp)
    reaper.MIDI_InsertCC(take, false, false, Note_end, 176, 0, 11, 5)
    reaper.MIDI_InsertNote(take, false, false, Note_st, Note_end, 0, 60, 100, false)
    retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
    reaper.MIDI_InsertCC(take, false, false, Note_st, 176, 0, 11, 5)
    reaper.MIDI_SetCCShape(take, ccevtcnt, 5, -0.3, false)
    reaper.MIDI_InsertCC(take, false, false, Note_st + (jiange * 0.4), 176, 0, 11, exp)
    reaper.MIDI_SetCCShape(take, ccevtcnt + 1, 5, 0.3, false)

    if mode == 2 then
        reaper.MIDI_InsertCC(take, false, false, Note_end, 224, 0, 0, 48)
        reaper.MIDI_InsertCC(take, false, false, Note_end + 240, 224, 0, 0, 64)
        retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
        reaper.MIDI_InsertCC(take, false, false, Note_st, 224, 0, 0, 80)
        reaper.MIDI_SetCCShape(take, ccevtcnt, 1, 0, false)
    end
    if mode == 3 then
        reaper.MIDI_InsertCC(take, false, false, Note_end, 224, 0, 0, 80)
        reaper.MIDI_InsertCC(take, false, false, Note_end + 240, 224, 0, 0, 64)
        retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
        reaper.MIDI_InsertCC(take, false, false, Note_st, 224, 0, 0, 48)
        reaper.MIDI_SetCCShape(take, ccevtcnt, 1, 0, false)
    end
    if mode == 4 then
        reaper.MIDI_InsertCC(take, false, false, Note_end, 224, 0, 0, 80)
        reaper.MIDI_InsertCC(take, false, false, Note_end + 240, 224, 0, 0, 64)
        retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
        reaper.MIDI_InsertCC(take, false, false, Note_st, 224, 0, 0, 80)
        reaper.MIDI_SetCCShape(take, ccevtcnt, 5, -0.2, false)
        reaper.MIDI_InsertCC(take, false, false, Note_st + (jiange * 0.5), 224, 0, 0, 64)
        reaper.MIDI_SetCCShape(take, ccevtcnt + 1, 5, 0.2, false)
    end
    if mode == 5 then
        reaper.MIDI_InsertCC(take, false, false, Note_end, 224, 0, 0, 48)
        reaper.MIDI_InsertCC(take, false, false, Note_end + 240, 224, 0, 0, 64)
        retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
        reaper.MIDI_InsertCC(take, false, false, Note_st, 224, 0, 0, 48)
        reaper.MIDI_SetCCShape(take, ccevtcnt, 5, -0.2, false)
        reaper.MIDI_InsertCC(take, false, false, Note_st + (jiange * 0.5), 224, 0, 0, 64)
        reaper.MIDI_SetCCShape(take, ccevtcnt + 1, 5, 0.2, false)
    end

    reaper.MIDI_Sort(take)
    retval, str = reaper.GetTrackStateChunk(track, '', false)
    new_lane = [[VELLANE 11 50 0 0 1
    VELLANE 128 50 0 0 1
    VELLANE -1 139 0 0 1]]
    str = string.gsub(str, 'VELLANE (-?%d+) (%d+) (%d+) (%d+) (%d+)', '')
    str = string.gsub(str, '<SOURCE MIDI', '<SOURCE MIDI\n' .. new_lane)
    reaper.SetTrackStateChunk(track, str, false)
    
    item=reaper.GetMediaItemTake_Item(take)
    retval,str1=reaper.GetItemStateChunk(item,'',false)
    str1=string.gsub(str1,'(CCINTERP) (%d+)','CCINTERP 24')
    reaper.SetItemStateChunk(item, str1, false)
    
    flag = false
    reaper.MarkTrackItemsDirty(reaper.GetMediaItemTake_Track(take), reaper.GetMediaItemTake_Item(take))
    reaper.Undo_EndBlock('Wind Chime : ' .. mode_tb[mode], -1)
end

local ctx = reaper.ImGui_CreateContext('WindChimes')
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
    local visible, open = reaper.ImGui_Begin(ctx, 'Wind Chimes', true, windows_flag)
    if visible then

        if reaper.ImGui_Button(ctx, 'Normal') then
            mode = 1
            windchime()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Down') then
            mode = 2
            windchime()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Up') then
            mode = 3
            windchime()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Down->Up') then
            mode = 4
            windchime()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Up->Down') then
            mode = 5
            windchime()
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
