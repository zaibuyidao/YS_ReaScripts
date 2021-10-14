--[[
 * ReaScript Name: 处理插入音色在音符中
 * Version: 1.0.1
 * Author: YS
 * Repository URI: https://github.com/zaibuyidao/YS_ReaScripts
--]]

--[[
 * Changelog:
 * v1.0 (2021-10-14)
  + Initial release
--]]

integer = reaper.CountMediaItems(0) 
 idx = 0
while idx < integer do
 MediaItem = reaper.GetMediaItem(0, idx)
 idx=idx+1
 take = reaper.GetTake(MediaItem, 0)
  if reaper.TakeIsMIDI(take) then
   reaper.MIDI_DisableSort(take)
   ccidx,noteidx=0,0  tb_pc={}
   retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
   while ccidx<ccevtcnt do
   retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
   if chanmsg==192 then table.insert(tb_pc,ppqpos) end
   ccidx=ccidx+1
   end
   
   while noteidx<notecnt do
   retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
   for i, v in ipairs(tb_pc) do
    if startppqpos<v and endppqpos>v then 
    reaper.MIDI_SetNote(take,noteidx,NULL,NULL,NULL,v,NULL,NULL,NULL,false)
    end
   end 
   noteidx=noteidx+1
   end
   
  reaper.MIDI_Sort(take)
  end --take midi
  end --while end
  
function PCinnote()
  if reaper.TakeIsMIDI(take) then
   reaper.MIDI_DisableSort(take)
   ccidx,noteidx=0,0  tb_pc={}
   retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
   while ccidx<ccevtcnt do
   retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
   if chanmsg==192 then table.insert(tb_pc,ppqpos) end
   ccidx=ccidx+1
   end
   
   while noteidx<notecnt do
   retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
   for i, v in ipairs(tb_pc) do
    if startppqpos<v and endppqpos>v then 
    reaper.MIDI_SetNote(take,noteidx,NULL,NULL,NULL,v,NULL,NULL,NULL,false)
    end
   end 
   noteidx=noteidx+1
   end
   reaper.MIDI_Sort(take)
   end
end
