-- @description GetSet NoteName
-- @version 1.0
-- @author YS
-- @changelog New Script
-- @provides [main=midi_editor] .

editor = reaper.MIDIEditor_GetActive()
NoteName_tb = {}
function getnotename()
    NoteName_tb = {}
    NoteName_str = ''
    take = reaper.MIDIEditor_GetTake(editor)
    track = reaper.GetMediaItemTake_Track(take)
    for pitch = 0, 127 do
        MIDINoteName = reaper.GetTrackMIDINoteNameEx(0, track, pitch, -1)
        if MIDINoteName and MIDINoteName ~= '' then
            NoteName_tb[pitch] = MIDINoteName
            NoteName_str = NoteName_str .. pitch .. ' : ' .. MIDINoteName .. '\n'
        end
    end
end

function setnotename()
    track_tb = {}
    if not editor then
        return
    end
    takeindex = 0
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    while take ~= nil do
        track = reaper.GetMediaItemTake_Track(take)
        TRACKNUMBER = reaper.GetMediaTrackInfo_Value(track, 'IP_TRACKNUMBER') - 1
        track_tb[TRACKNUMBER] = track
        takeindex = takeindex + 1
        take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    end -- while take end

    for tracknum, vv in pairs(track_tb) do
        for i, v in pairs(NoteName_tb) do
            reaper.SetTrackMIDINoteName(tracknum, i, -1, v)
        end
        for i = 0, 127 do
            if NoteName_tb[i] == nil then
                reaper.SetTrackMIDINoteName(tracknum, i, -1, '')
            end
        end
    end
end

function cleannotename()
    track_tb = {}
    if not editor then
        return
    end
    takeindex = 0
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    while take ~= nil do
        track = reaper.GetMediaItemTake_Track(take)
        TRACKNUMBER = reaper.GetMediaTrackInfo_Value(track, 'IP_TRACKNUMBER') - 1
        track_tb[TRACKNUMBER] = track
        takeindex = takeindex + 1
        take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    end -- while take end

    for tracknum, vv in pairs(track_tb) do
        for i = 0, 127 do
            reaper.SetTrackMIDINoteName(tracknum, i, -1, '')
        end
    end
end

function table_leng(t)
    leng = 0
    for k, v in pairs(t) do
        leng = leng + 1
    end
    return leng
end

local ctx = reaper.ImGui_CreateContext('GetSetNoteName')
local size = reaper.GetAppVersion():match('OSX') and 12 or 14
local font = reaper.ImGui_CreateFont('微软雅黑')
reaper.ImGui_Attach(ctx, font)

windows_flag = reaper.ImGui_WindowFlags_TopMost()
windows_flag = windows_flag | reaper.ImGui_WindowFlags_AlwaysAutoResize()
flag = true
function loop()
    reaper.ImGui_PushFont(ctx, font, 12)
    local visible, open = reaper.ImGui_Begin(ctx, 'NoteName', true, windows_flag)
    if visible then

        if reaper.ImGui_Button(ctx, 'Clean Note Name') then
            cleannotename()
            flag = false
        end

        if reaper.ImGui_Button(ctx, 'Get Note Name') then
            getnotename()
            reaper.TrackCtl_SetToolTip(NoteName_str, 0, 0, true)
        end

        if table_leng(NoteName_tb) ~= 0 then
            reaper.ImGui_SameLine(ctx)
            if reaper.ImGui_Button(ctx, 'Set Note Name') then
                setnotename()
                flag = false
                reaper.TrackCtl_SetToolTip('Set successful\n' .. NoteName_str, 0, 0, true)
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

