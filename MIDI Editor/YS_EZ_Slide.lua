--[[
 * ReaScript Name: EZ_Slide
 * Version: 1.0
 * Author: YS
 * Repository URI: https://github.com/zaibuyidao/YS_ReaScripts
 * provides: [main=midi_editor] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-10-14)
  + Initial release
--]]

local editor=reaper.MIDIEditor_GetActive()

local take=reaper.MIDIEditor_GetTake(editor)

reaper.MIDI_DisableSort(take)

integer = reaper.MIDI_EnumSelNotes(take, -1)
if integer == -1 then reaper.ShowMessageBox('没有音符被选中！', '错误！', 0) reaper.SN_FocusMIDIEditor() return end

retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)

reaper.MIDI_SetNote(take, integer, NULL, NULL, NULL, endppqpos-1, NULL, NULL, NULL, false)

ccidx=reaper.MIDI_EnumSelCC(take, -1)

if ccidx ~= -1 then

retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)

if chanmsg == 224 then

reaper.MIDI_SetCC(take, ccidx, NULL, true, NULL, NULL, NULL, NULL, NULL, false)

 wheel1 = msg2+msg3*128-8192
 chufa = ppqpos
 
end end

repeat

 ccidx_new=reaper.MIDI_EnumSelCC(take, ccidx)
 
 
 retval, selected, muted, ppqpos_new, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx_new)
 
 if chanmsg == 224 then
 
 reaper.MIDI_SetCC(take, ccidx_new, NULL, true, NULL, NULL, NULL, NULL, NULL, false)
 
  wheel2= msg2+msg3*128-8192
  
  if wheel1 > -800 and wheel1 < -500 
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch-1, 70, false)
  end
  if wheel1 > -1500 and wheel1 < -1200 
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch-2, 70, false)
  end
  if wheel1 > -2200 and wheel1 < -1800
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch-3, 70, false)
  end
  if wheel1 > -2900 and wheel1 < -2500
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch-4, 70, false)
  end
  if wheel1 > -3600 and wheel1 < -3200
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch-5, 70, false)
  end
  if wheel1 > -4200 and wheel1 < -3800
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch-6, 70, false)
  end
  if wheel1 > -4900 and wheel1 < -4500
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch-7, 70, false)
  end
  if wheel1 > -5600 and wheel1 < -5200
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch-8, 70, false)
  end
  if wheel1 > -6300 and wheel1 < -5900
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch-9, 70, false)
  end
  if wheel1 > -7000 and wheel1 < -6600
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch-10, 70, false)
  end
  if wheel1 > -7700 and wheel1 < -7300
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch-11, 70, false)
  end
  if wheel1 > -8193 and wheel1 < -8000
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch-12, 70, false)
  end
  ----- ++++
  if wheel1 < 800 and wheel1 > 500 
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch+1, 70, false)
  end
  if wheel1 < 1500 and wheel1 > 1200 
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch+2, 70, false)
  end
  if wheel1 < 2200 and wheel1 > 1800
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch+3, 70, false)
  end
  if wheel1 < 2900 and wheel1 > 2500
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch+4, 70, false)
  end
  if wheel1 < 3600 and wheel1 > 3200
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch+5, 70, false)
  end
  if wheel1 < 4200 and wheel1 > 3800
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch+6, 70, false)
  end
  if wheel1 < 4900 and wheel1 > 4500
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch+7, 70, false)
  end
  if wheel1 < 5600 and wheel1 > 5200
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch+8, 70, false)
  end
  if wheel1 < 6300 and wheel1 > 5900
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch+9, 70, false)
  end
  if wheel1 < 7000 and wheel1 > 6600
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch+10, 70, false)
  end
  if wheel1 < 7700 and wheel1 > 7300
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch+11, 70, false)
  end
  if wheel1 < 8193 and wheel1 > 8000
  then reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos_new+10, chan, pitch+12, 70, false)
  end 

  ppqpos=ppqpos_new  
  chufa_end = ppqpos_new  
  wheel1=wheel2
  
 end 
if  ccidx_new == -1 then 
 retval, notecnt,ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
 retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, notecnt-1)
 reaper.MIDI_SetNote(take, notecnt-1, NULL, NULL, NULL, endppqpos-15, NULL, NULL, NULL, false)
end 

 ccidx = ccidx_new
 
 until ccidx_new == -1
 
 if chufa and chufa_end then
 
 reaper.MIDI_InsertNote(take, false, false, chufa-10, chufa_end-10 , chan, 30, 20, false)
 
 end
 
 reaper.MIDI_Sort(take)
 





