--[[
 * ReaScript Name: 自动模板锁定
 * Version: 1.0.2
 * Author: YS
 * provides: [main=main,midi_editor] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

_, _, sectionID, ownCommandID, _, _, _ = reaper.get_action_context()
reaper.SetToggleCommandState(sectionID, ownCommandID, 1)
reaper.RefreshToolbar2(sectionID, ownCommandID)

project = reaper.EnumProjects(0)
editpos = reaper.GetCursorPositionEx(project)
reaper.Main_OnCommand(40042, 0)
flag = 1  itemend = 0

function getitem()
    idx = 0
    repeat
        item0 = reaper.GetMediaItem(project, idx)
        if item0 == nil then return end
        take0 = reaper.GetTake(item0, 0)
        idx = idx + 1
    until reaper.TakeIsMIDI(take0)
    itemst = reaper.GetMediaItemInfo_Value(item0, 'D_POSITION')
    itemend = reaper.GetMediaItemInfo_Value(item0, 'D_LENGTH')
    itemend = itemend + itemst
end
getitem()
postem = -1
function automute()
    item0 = reaper.GetMediaItem(project, 0)
    if item0 ~= nil then
        pos = reaper.GetPlayPositionEx(project)
        if pos > itemend and flag == 0 then
            -- reaper.ShowConsoleMsg('mute  ')
            getitem()
            integer = reaper.CountMediaItems(project)
            idx = 0
            ccidx, syxidx = 0, 0

            while idx < integer do
                MediaItem = reaper.GetMediaItem(project, idx)
                idx = idx + 1
                take = reaper.GetTake(MediaItem, 0)
                if take ~= nil then
                    num = reaper.GetMediaItemInfo_Value(MediaItem,
                                                        'IP_ITEMNUMBER')
                    if (num == 0 and reaper.TakeIsMIDI(take)) then
                        -- if reaper.TakeIsMIDI(take)  then
                        retval, notecnt, ccevtcnt, textsyxevtcnt =
                            reaper.MIDI_CountEvts(take)
                        if ccevtcnt > 0 then
                            while ccidx < ccevtcnt do
                                retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 =
                                    reaper.MIDI_GetCC(take, ccidx)
                                if chanmsg == 176 and msg2 == 6 then
                                    reaper.MIDI_SetCC(take, ccidx, NULL, true,
                                                      NULL, NULL, NULL, NULL,
                                                      NULL, true)
                                end -- if cc6 end
                                if chanmsg == 176 and msg2 == 0 then
                                    reaper.MIDI_SetCC(take, ccidx, NULL, true,
                                                      NULL, NULL, NULL, NULL,
                                                      NULL, true)
                                end -- if cc0 end
                                if chanmsg == 176 and msg2 == 32 then
                                    reaper.MIDI_SetCC(take, ccidx, NULL, true,
                                                      NULL, NULL, NULL, NULL,
                                                      NULL, true)
                                end -- if cc32 end
                                if chanmsg == 176 then
                                    if msg2 >= 98 and msg2 <= 101 then
                                        reaper.MIDI_SetCC(take, ccidx, NULL,
                                                          true, NULL, NULL,
                                                          NULL, NULL, NULL, true)
                                    end
                                end -- if cc98-101 end
                                if chanmsg == 192 then
                                    reaper.MIDI_SetCC(take, ccidx, false, true,
                                                      ppqpos, chanmsg, chan,
                                                      msg2, msg3, true)
                                end -- if PC end
                                ccidx = ccidx + 1
                            end -- while end
                            ccidx = 0
                        end -- if ccevt end
                        if textsyxevtcnt > 0 then
                            while syxidx < textsyxevtcnt do
                                retval, selected, muted, ppqpos, txt_type, msg =
                                    reaper.MIDI_GetTextSysexEvt(take, syxidx,
                                                                false, false, 0,
                                                                0, '')
                                if txt_type == -1 then
                                    reaper.MIDI_SetTextSysexEvt(take, syxidx,
                                                                false, true,
                                                                NULL, NULL, '',
                                                                false)
                                end

                                syxidx = syxidx + 1
                            end -- while end
                            syxidx = 0
                        end -- if syx end
                        reaper.SetMediaItemTakeInfo_Value(take, 'I_CUSTOMCOLOR',
                                                          16777471)
                        reaper.MIDI_Sort(take)
                    end -- take midi end
                end -- take~=nil
            end -- while end
            reaper.UpdateArrange()
            reaper.TrackCtl_SetToolTip('模板已锁住！', 50, 0, true)
            flag = 1
        end

        if pos < itemend and flag == 1 then
            reaper.Main_OnCommand(40044, 0) -- playstop

            getitem()

            -- reaper.ShowConsoleMsg('unmute ')
            -- reaper.Main_OnCommand(40340, 0) --unsolo all track

            function takename()
                stringNeedBig = ''
                take = reaper.GetTake(MediaItem, 0)
                if reaper.TakeIsMIDI(take) then
                    track = reaper.GetMediaItem_Track(MediaItem)
                    buf = reaper.GetProjectName(project, '')
                    num = reaper.GetMediaItemInfo_Value(MediaItem, 'IP_ITEMNUMBER')
                    num = num + 1
                    n1, n2 = math.modf(num)
                    retval, stringNeedBig = reaper.GetSetMediaTrackInfo_String(track, 'P_NAME', '', false)
                    retval,itemstr=reaper.GetItemStateChunk(MediaItem,'',false)
                    CCINTERP=string.match(itemstr,'CCINTERP %d+')
                    reaper.GetSetMediaItemTakeInfo_String(take, 'P_NAME', buf .. ' - ' .. '[' .. stringNeedBig .. ']' .. ' #' .. n1..'|'..CCINTERP, true)
                end
            end
            -------------------------------------------------
            integer = reaper.CountMediaItems(project)
            idx = 0
            ccidx, syxidx = 0, 0
            while idx < integer do
                MediaItem = reaper.GetMediaItem(project, idx)
                idx = idx + 1
                take = reaper.GetTake(MediaItem, 0)
                if take ~= nil then
                    num = reaper.GetMediaItemInfo_Value(MediaItem,
                                                        'IP_ITEMNUMBER')
                    if (num == 0 and reaper.TakeIsMIDI(take)) then
                        retval, notecnt, ccevtcnt, textsyxevtcnt =
                            reaper.MIDI_CountEvts(take)
                        if ccevtcnt > 0 then
                            while ccidx < ccevtcnt do
                                retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 =
                                    reaper.MIDI_GetCC(take, ccidx)
                                if chanmsg == 176 and msg2 == 6 then
                                    reaper.MIDI_SetCC(take, ccidx, NULL, false,
                                                      NULL, NULL, NULL, NULL,
                                                      NULL, true)
                                end -- if cc6 end
                                if chanmsg == 176 and msg2 == 0 then
                                    reaper.MIDI_SetCC(take, ccidx, NULL, false,
                                                      NULL, NULL, NULL, NULL,
                                                      NULL, true)
                                end -- if cc0 end
                                if chanmsg == 176 and msg2 == 32 then
                                    reaper.MIDI_SetCC(take, ccidx, NULL, false,
                                                      NULL, NULL, NULL, NULL,
                                                      NULL, true)
                                end -- if cc32 end
                                if chanmsg == 176 then
                                    if msg2 >= 98 and msg2 <= 101 then
                                        reaper.MIDI_SetCC(take, ccidx, NULL,
                                                          false, NULL, NULL,
                                                          NULL, NULL, NULL, true)
                                    end
                                end -- if cc98-101 end
                                if chanmsg == 192 then
                                    reaper.MIDI_SetCC(take, ccidx, false, false,
                                                      ppqpos, chanmsg, chan,
                                                      msg2, msg3, true)
                                end -- if PC end
                                ccidx = ccidx + 1
                            end -- while end
                            ccidx = 0
                        end -- if ccevt end
                        if textsyxevtcnt > 0 then
                            while syxidx < textsyxevtcnt do
                                retval, selected, muted, ppqpos, txt_type, msg =
                                    reaper.MIDI_GetTextSysexEvt(take, syxidx,
                                                                false, false, 0,
                                                                0, '')
                                if txt_type == -1 then
                                    reaper.MIDI_SetTextSysexEvt(take, syxidx,
                                                                false, false,
                                                                NULL, NULL, '',
                                                                false)
                                end
                                syxidx = syxidx + 1
                            end -- while end
                            syxidx = 0
                        end -- if syx end
                        reaper.SetMediaItemTakeInfo_Value(take, 'I_CUSTOMCOLOR',
                                                          21036800)
                        reaper.MIDI_Sort(take)
                    end -- if takemidi end
                    takename()
                end -- take~=nil
            end -- while end
            reaper.UpdateArrange()
            reaper.TrackCtl_SetToolTip('模板已解锁！', 50, 0, true)
            flag = 0
            reaper.Main_OnCommand(40044, 0) -- playstop 

        end

        reaper.defer(automute)

    end

end -- function end

automute()

reaper.SetEditCurPos(editpos, false, false)

function exit()
    reaper.SetToggleCommandState(sectionID, ownCommandID, 0)
    reaper.RefreshToolbar2(sectionID, ownCommandID)
end
reaper.atexit(exit)

