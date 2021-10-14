--[[
 * ReaScript Name: SYS Vol 0
 * Version: 1.0
 * Author: YS
 * provides: [main=main] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

vol0=string.char(0x7F,0x7F,0x04,0x01,0x00,0x00)
pos=reaper.GetCursorPosition()
item=reaper.GetSelectedMediaItem(0, 0) if item==nil then return end
take=reaper.GetMediaItemTake(item,0)
ppq=reaper.MIDI_GetPPQPosFromProjTime(take,pos)
retval, notecnt,ccevtcnt,textsyxevtcnt = reaper.MIDI_CountEvts(take)
evt_idx=textsyxevtcnt-1
retval, selected, muted,ppqpos, txt_type, msg = reaper.MIDI_GetTextSysexEvt(take, evt_idx, false, false, -1, -1, '')
if msg==vol0 then  
reaper.MIDI_SetTextSysexEvt(take,evt_idx,false,false,ppq-2,txt_type,'',false)
end


