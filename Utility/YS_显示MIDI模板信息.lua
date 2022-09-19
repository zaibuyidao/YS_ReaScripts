--[[
 * ReaScript Name: 显示MIDI模板信息
 * Version: 1.0.2
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

_, _, sectionID, ownCommandID, _, _, _ = reaper.get_action_context()
reaper.SetToggleCommandState(sectionID, ownCommandID, 1)
reaper.RefreshToolbar2(sectionID, ownCommandID)

function getset_track_info(take)
    reaper.Undo_BeginBlock()
    MediaTrack = reaper.GetMediaItemTake_Track(take)
    retval, tk_name = reaper.GetSetMediaTrackInfo_String(MediaTrack, 'P_NAME', '', false)
    tk_name = string.gsub(tk_name, '\'', '\a')
    num = reaper.GetMediaTrackInfo_Value(MediaTrack, 'I_MIDIHWOUT')
    if num == -1 then
        port = 0
        chan = 0
    else
        port = math.modf(num / 32) + 1
        chan = math.fmod(num, 32)
        chan = string.match(chan, '%d+')
    end
    msg = tk_name .. ',' .. port .. ',' .. chan
    bl, input = reaper.GetUserInputs('GetSet Track Info', 3, 'Track Name 轨道名称:,Track Midi Port 端口:,Track Midi Channel 通道 :,extrawidth=200', msg)
    if bl == false then return end
    idx = string.find(input, ',', 1)
    name_in = string.sub(input, 0, idx - 1)
    name_in = string.gsub(name_in, '\a', '\'')
    reaper.GetSetMediaTrackInfo_String(MediaTrack, 'P_NAME', name_in, true)
    input2 = string.sub(input, idx + 1)
    port_new, chan_new = string.match(input2, '(%d+),(%d+)')
    port_new = tonumber(port_new) - 1
    if port_new > 15 then port_new = 15 end
    chan_new = tonumber(chan_new)
    if chan_new > 16 then chan_new = 16 end
    num_new = port_new * 32 + chan_new
    reaper.SetMediaTrackInfo_Value(MediaTrack, 'I_MIDIHWOUT', num_new)
    reaper.Undo_EndBlock('',0)
    
end -- function end

function O_Song_Time()
    wavitem_pos = 0
    wavitem1 = reaper.GetMediaItem(0, 0)
    wavitem2 = reaper.GetMediaItem(0, 1)
    if wavitem1 then
        take1 = reaper.GetTake(wavitem1, 0)
        if not reaper.TakeIsMIDI(take1) then
            wavitem_pos = reaper.GetMediaItemInfo_Value(wavitem1, 'D_POSITION')
        else
            if wavitem2 then
                take2 = reaper.GetTake(wavitem2, 0)
                if not reaper.TakeIsMIDI(take2) then
                    wavitem_pos = reaper.GetMediaItemInfo_Value(wavitem2, 'D_POSITION')
                end
            end
        end
    end

end -- function end
O_Song_Time()

function getmark()
    idx = 0
    marktb = {}
    MKname = ''
    retval, isrgn, pos, rgnend, markname, markrgnindexnumber = reaper.EnumProjectMarkers(idx)
    while retval ~= 0 do
        if markname ~= '' then
            table.insert(marktb, pos .. ',' .. markname)
        end
        idx = idx + 1
        retval, isrgn, pos, rgnend, markname, markrgnindexnumber = reaper.EnumProjectMarkers(idx)
    end
end -- getmark end
getmark()

function Maxsound()
    noteinfo = {}
    notelist = {}
    maxpos = 0
    notedata = ''
    timemax = 0
    integer = reaper.CountMediaItems(0)
    idx = 0
    while idx < integer do
        MediaItem = reaper.GetMediaItem(0, idx)
        idx = idx + 1
        take = reaper.GetTake(MediaItem, 0)
        if take ~= nil and reaper.TakeIsMIDI(take) then

            retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
            if notecnt > 0 then
                noteidx = 0
                retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)

                while noteidx < notecnt do
                    retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
                    table.insert(noteinfo, startppqpos + (endppqpos / 100000000))
                    if maxpos < endppqpos then
                        maxpos = endppqpos
                    end
                    noteidx = noteidx + 1
                end
            end
            MIDItake=take
        end
    end -- while end
    table.sort(noteinfo)

    maxnote = 0
    checkst = 0
    tbidx = 1
    count = 0
    noteall = 0

    while checkst < maxpos do
        noteover = 0

        while tbidx <= #noteinfo do
            notest, noteend = math.modf(noteinfo[tbidx])
            noteend = math.modf(noteend * 100000000)
            if noteend > checkst and notest <= checkst then
                noteover = noteover + 1
            end
            if notest > checkst then break end
            tbidx = tbidx + 1
        end
        tbidx = tbidx - 150
        if tbidx < 1 then tbidx = 1 end
        if noteover > 0 then
            noteall = noteall + noteover
            count = count + 1
        end

        if noteover > maxnote then
            maxnote = noteover
            posmax = reaper.MIDI_GetProjTimeFromPPQPos(MIDItake, checkst)
            timemax = reaper.format_timestr_pos(posmax, '', 2)
        end

        checkst = checkst + 60

    end
    average = noteall / count
    average = math.floor(average + 0.5)
    notedata = '最大发音数在 ' .. timemax .. ' 同时音符数量为： ' .. maxnote .. '\n' .. '平均发音数：' .. average
    reaper.ClearConsole()
    reaper.ShowConsoleMsg(notedata)
end



function miditempinfo()
    out = ''
    info_tb = {}
    take_tb = {}
    ccidx_tb = {}
    count = reaper.CountTracks(0)
    idx = 0
    while idx < count do
        track = reaper.GetTrack(0, idx)
        item = reaper.GetTrackMediaItem(track, 0)
        if item ~= nil then
            take = reaper.GetMediaItemTake(item, 0)
            if reaper.TakeIsMIDI(take) then
                retval, name = reaper.GetSetMediaTrackInfo_String(track, 'P_NAME', '', false)

                retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
                ccidx = 0
                if ccevtcnt ~= 0 then
                    bank = '-1    '
                    PC = '-1  '
                    vol = '-1  '
                    pan = '-1  '
                    rev = '-1  '
                    cho = '-1  '
                    delay = '-1  '
                    cc7_idx, cc10_idx, cc91_idx, cc93_idx, cc94_idx, cc0_idx, cc32_idx, pc_idx = '', '', '', '', '', '', '', ''
                    while ccidx < ccevtcnt do
                        retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
                        if chanmsg == 176 then

                            if msg2 == 0 then
                                cc0 = msg3
                                cc0_idx = ccidx
                            end
                            if msg2 == 32 then
                                bank = cc0 * 128 + msg3
                                cc32_idx = ccidx
                                bank = tostring(bank)
                            end

                            if msg2 == 7 then
                                vol = msg3
                                vol = tostring(vol)
                                cc7_idx = ccidx
                            end

                            if msg2 == 10 then
                                pan = msg3
                                pan = tostring(pan)
                                cc10_idx = ccidx
                            end

                            if msg2 == 91 then
                                rev = msg3
                                rev = tostring(rev)
                                cc91_idx = ccidx
                            end

                            if msg2 == 93 then
                                cho = msg3
                                cho = tostring(cho)
                                cc93_idx = ccidx

                            end

                            if msg2 == 94 then
                                delay = msg3
                                delay = tostring(delay)
                                cc94_idx = ccidx
                            end

                        end -- chanmsg==176

                        if chanmsg == 192 then
                            PC = msg2
                            PC = tostring(PC)
                            pc_idx = ccidx
                        end

                        ccidx = ccidx + 1
                    end -- while
                    -- out=out..name..' Bank='..bank..' Patch='..PC..' Vol='..vol..' Pan='..pan..' Rev='..rev..' Cho='..cho..' Delay='..delay..'\n---------------------------------------------------------------------------------------\n'
                    table.insert(info_tb, name .. '|Bank=' .. bank .. '|Patch=' .. PC .. '|Vol=' .. vol .. '|Pan=' .. pan .. '|Rev=' .. rev .. '|Cho=' .. cho .. '|Delay=' .. delay)
                    table.insert(take_tb, take)
                    table.insert(ccidx_tb, 'cc7_idx=' .. cc7_idx .. 'cc10_idx=' .. cc10_idx .. 'cc91_idx=' .. cc91_idx .. 'cc93_idx=' .. cc93_idx .. 'cc94_idx=' .. cc94_idx .. 'pc_idx=' .. pc_idx .. 'cc0_idx=' .. cc0_idx .. 'cc32_idx=' .. cc32_idx)
                end -- ccevtcnt~=0
            end -- TakeIsMIDI
        end -- item~=nil
        idx = idx + 1
    end
    -- reaper.ShowConsoleMsg('')
    -- reaper.ShowConsoleMsg(out)
end -- function end
miditempinfo()

local ctx = reaper.ImGui_CreateContext('tempinfo')
local size = reaper.GetAppVersion():match('OSX') and 12 or 14
local font = reaper.ImGui_CreateFont('sans-serif', size)
reaper.ImGui_AttachFont(ctx, font)
reaper.ImGui_SetNextWindowSize(ctx, 690, 900)

take_hash = ''
take_hash_old = ''
for i, v in ipairs(take_tb) do
    ret, hash = reaper.MIDI_GetHash(v, false)
    take_hash_old = take_hash_old .. hash
end

item_count_old = reaper.CountMediaItems(0)

function loop()
    item_count = reaper.CountMediaItems(0)
    if item_count ~= item_count_old then
        miditempinfo()
        reaper.TrackCtl_SetToolTip('item count change', 50, 0, true)
        item_count_old = item_count
    end

    take_hash = ''
    for i, v in ipairs(take_tb) do
        ret, hash = reaper.MIDI_GetHash(v, false)
        take_hash = take_hash .. hash
    end
    if take_hash ~= take_hash_old then
        miditempinfo()
        take_hash_old = take_hash
    end

    reaper.ImGui_PushFont(ctx, font)
    playmode = reaper.GetToggleCommandStateEx(0, 1007)
    if playmode == 1 then
        tpos = reaper.GetPlayPosition()
    else
        tpos = reaper.GetCursorPosition()
    end
    for i, v in ipairs(marktb) do
        markpos, name = string.match(v, '(%d+%.%d+),(%S+)')
        if markpos and name then
            markpos = tonumber(markpos)
            if tpos > markpos then MKname = name end
        end
    end

    O_pos = tpos - wavitem_pos
    time_buf = reaper.format_timestr_pos(tpos, '', 5)
    Original_song_time = reaper.format_timestr_pos(O_pos, '', 5)
    ptidx = reaper.FindTempoTimeSigMarker(0, tpos)
    retval, timepos, measurepos, beatpos, bpm, timesig_num, timesig_denom, lineartempo = reaper.GetTempoTimeSigMarker(0, ptidx)
    bpm = string.format("%3.3f", bpm)

    local visible, open = reaper.ImGui_Begin(ctx, 'MIDI Template information', true)
    if visible then

        if reaper.ImGui_Button(ctx, 'Refresh') then
            miditempinfo()
            O_Song_Time()
            getmark()
        end
        reaper.ImGui_SameLine(ctx)
        reaper.ImGui_Button(ctx, 'Project time: ' .. time_buf)
        reaper.ImGui_SameLine(ctx)
        reaper.ImGui_Button(ctx, 'Audio time: ' .. Original_song_time)
        reaper.ImGui_SameLine(ctx)
        reaper.ImGui_Button(ctx, 'Tempo: ' .. bpm)
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Marker: ' .. MKname) then
        reaper.Main_OnCommand(40326,0)
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'MaxVoice') then Maxsound() end

        for i, v in ipairs(info_tb) do
            reaper.ImGui_PushID(ctx, i)
            a, b, c, d, e, f, g, h = string.match(v, '(.+)|(.+)|(.+)|(.+)|(.+)|(.+)|(.+)|(.+)')
            if reaper.ImGui_Button(ctx, a, 180) then
                getset_track_info(take_tb[i])  miditempinfo()
            end

            reaper.ImGui_SameLine(ctx)
            if reaper.ImGui_Button(ctx, b, 80) then
                retval, Val = reaper.GetUserInputs('Edit Val', 1, '输入 Bank = ', string.gsub(b, 'Bank=', ''))
                shuru = tonumber(Val)
                if shuru then
                    cc0_idx = string.match(ccidx_tb[i], 'cc0_idx=%d+')
                    cc0_idx = string.gsub(cc0_idx, 'cc0_idx=', '')
                    cc0_idx = tonumber(cc0_idx)
                    cc32_idx = string.match(ccidx_tb[i], 'cc32_idx=%d+')
                    cc32_idx = string.gsub(cc32_idx, 'cc32_idx=', '')
                    cc32_idx = tonumber(cc32_idx)
                    MSB = math.modf(shuru / 128)
                    LSB = shuru % 128
                    reaper.MIDI_SetCC(take_tb[i], cc0_idx, NULL, false, NULL, NULL, NULL, NULL, MSB, true)
                    reaper.MIDI_SetCC(take_tb[i], cc32_idx, NULL, false, NULL, NULL, NULL, NULL, LSB, true)
                    reaper.MIDI_SetCC(take_tb[i], pc_idx, NULL, false, NULL, NULL, NULL, NULL, NULL, true)
                    if playmode == 1 then
                        reaper.Main_OnCommand(1008, 0)
                        reaper.Main_OnCommand(1008, 0)
                    end
                end
            end
            reaper.ImGui_SameLine(ctx)
            if reaper.ImGui_Button(ctx, c, 70) then
                retval, Val = reaper.GetUserInputs('Edit Val', 1, '输入 Patch = ', string.gsub(c, 'Patch=', ''))
                shuru = tonumber(Val)
                pc_idx = string.match(ccidx_tb[i], 'pc_idx=%d+')
                pc_idx = string.gsub(pc_idx, 'pc_idx=', '')
                pc_idx = tonumber(pc_idx)
                reaper.MIDI_SetCC(take_tb[i], pc_idx, NULL, false, NULL, NULL, NULL, shuru, NULL, true)
                if playmode == 1 then
                    reaper.Main_OnCommand(1008, 0)
                    reaper.Main_OnCommand(1008, 0)
                end
            end
            reaper.ImGui_SameLine(ctx)
            if reaper.ImGui_Button(ctx, d, 56) then
                retval, Val = reaper.GetUserInputs('Edit Val', 1, '输入 CC7 = ', string.gsub(d, 'Vol=', ''))
                shuru = tonumber(Val)
                cc7_idx = string.match(ccidx_tb[i], 'cc7_idx=%d+')
                cc7_idx = string.gsub(cc7_idx, 'cc7_idx=', '')
                cc7_idx = tonumber(cc7_idx)
                reaper.MIDI_SetCC(take_tb[i], cc7_idx, NULL, NULL, NULL, NULL, NULL, NULL, shuru, true)
                if playmode == 1 then
                    reaper.Main_OnCommand(1008, 0)
                    reaper.Main_OnCommand(1008, 0)
                end

            end
            reaper.ImGui_SameLine(ctx)
            if reaper.ImGui_Button(ctx, e, 56) then
                retval, Val = reaper.GetUserInputs('Edit Val', 1, '输入 CC10 = ', string.gsub(e, 'Pan=', ''))
                shuru = tonumber(Val)
                cc10_idx = string.match(ccidx_tb[i], 'cc10_idx=%d+')
                cc10_idx = string.gsub(cc10_idx, 'cc10_idx=', '')
                cc10_idx = tonumber(cc10_idx)
                reaper.MIDI_SetCC(take_tb[i], cc10_idx, NULL, NULL, NULL, NULL, NULL, NULL, shuru, true)
                if playmode == 1 then
                    reaper.Main_OnCommand(1008, 0)
                    reaper.Main_OnCommand(1008, 0)
                end
            end
            reaper.ImGui_SameLine(ctx)
            if reaper.ImGui_Button(ctx, f, 56) then
                retval, Val = reaper.GetUserInputs('Edit Val', 1, '输入 CC91 = ', string.gsub(f, 'Rev=', ''))
                shuru = tonumber(Val)
                cc91_idx = string.match(ccidx_tb[i], 'cc91_idx=%d+')
                cc91_idx = string.gsub(cc91_idx, 'cc91_idx=', '')
                cc91_idx = tonumber(cc91_idx)
                reaper.MIDI_SetCC(take_tb[i], cc91_idx, NULL, NULL, NULL, NULL, NULL, NULL, shuru, true)
                if playmode == 1 then
                    reaper.Main_OnCommand(1008, 0)
                    reaper.Main_OnCommand(1008, 0)
                end
            end
            reaper.ImGui_SameLine(ctx)
            if reaper.ImGui_Button(ctx, g, 56) then
                retval, Val = reaper.GetUserInputs('Edit Val', 1,
                                                   '输入 CC93 = ',
                                                   string.gsub(g, 'Cho=', ''))
                shuru = tonumber(Val)
                cc93_idx = string.match(ccidx_tb[i], 'cc93_idx=%d+')
                cc93_idx = string.gsub(cc93_idx, 'cc93_idx=', '')
                cc93_idx = tonumber(cc93_idx)
                reaper.MIDI_SetCC(take_tb[i], cc93_idx, NULL, NULL, NULL, NULL, NULL, NULL, shuru, true)
                if playmode == 1 then
                    reaper.Main_OnCommand(1008, 0)
                    reaper.Main_OnCommand(1008, 0)
                end
            end
            reaper.ImGui_SameLine(ctx)
            if reaper.ImGui_Button(ctx, h, 65) then
                retval, Val = reaper.GetUserInputs('Edit Val', 1,
                                                   '输入 CC94 = ',
                                                   string.gsub(h, 'Delay=', ''))
                shuru = tonumber(Val)
                cc94_idx = string.match(ccidx_tb[i], 'cc94_idx=%d+')
                cc94_idx = string.gsub(cc94_idx, 'cc94_idx=', '')
                cc94_idx = tonumber(cc94_idx)
                reaper.MIDI_SetCC(take_tb[i], cc94_idx, NULL, NULL, NULL, NULL, NULL, NULL, shuru, true)
                if playmode == 1 then
                    reaper.Main_OnCommand(1008, 0)
                    reaper.Main_OnCommand(1008, 0)
                end
            end
            reaper.ImGui_PopID(ctx)
        end

        reaper.ImGui_End(ctx)
    end
    reaper.ImGui_PopFont(ctx)

    if open then

        reaper.defer(loop)
    else
        reaper.ImGui_DestroyContext(ctx)
    end
end

reaper.defer(loop)

function exit()
    reaper.SetToggleCommandState(sectionID, ownCommandID, 0)
    reaper.RefreshToolbar2(sectionID, ownCommandID)
end
reaper.atexit(exit)

