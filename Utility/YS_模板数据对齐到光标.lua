--[[
 * ReaScript Name: 模板数据对齐到光标
 * Version: 1.0
 * Author: YS
 * provides: [main=main] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

pos=reaper.GetCursorPosition()
txt=''
contselitem= reaper.CountSelectedMediaItems(0)
selitem = 0
while selitem < contselitem do
MediaItem = reaper.GetSelectedMediaItem(0, selitem)
itempos=reaper.GetMediaItemInfo_Value(MediaItem, 'D_POSITION')
itemlen=reaper.GetMediaItemInfo_Value(MediaItem, 'D_LENGTH')
itemendpos=itempos+itemlen
selitem = selitem + 1
take = reaper.GetTake(MediaItem, 0)
reaper.MIDI_DisableSort(take)
ppq=reaper.MIDI_GetPPQPosFromProjTime(take,pos)
itemendppq=reaper.MIDI_GetPPQPosFromProjTime(take,itemendpos)
retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
ccidx,textidx=0,0
retval, selected, muted, ppqpos1, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, 0)
juli=ppq-ppqpos1
while ccidx<ccevtcnt do
retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
reaper.MIDI_SetCC(take,ccidx, NULL, NULL, ppqpos+juli, NULL, NULL, NULL, NULL, false)
ccidx=ccidx+1 
end
while textidx<textsyxevtcnt  do
retval, selected, muted, ppqpos, type_num, msg = reaper.MIDI_GetTextSysexEvt(take, textidx, selected, muted,ppqpos, type_num, '')
if #msg~=0 then
reaper.MIDI_SetTextSysexEvt(take, textidx, NULL, NULL, ppqpos+juli, NULL, '', false)
end
textidx=textidx+1 
end
if ppqpos+juli>itemendppq then 
MediaTrack=reaper.GetMediaItemTrack(MediaItem)
retval, stringNeedBig = reaper.GetSetMediaTrackInfo_String(MediaTrack, 'P_NAME', '', false)
txt=txt..stringNeedBig..' 有数据超出对象范围，请完成后修剪MIDI对象！'..' \n' end
reaper.MIDI_Sort(take)
end -- while item end
reaper.ClearConsole()
reaper.ShowConsoleMsg(txt)
