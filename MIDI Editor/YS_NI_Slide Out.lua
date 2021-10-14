--[[
 * ReaScript Name: NI_Slide Out
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

ccidx=reaper.MIDI_EnumSelCC(take, -1)
retval, selected, muted, ppqpos_st, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
if chanmsg == 224 then 
reaper.MIDI_SetCC(take, ccidx, NULL, true, NULL, NULL, NULL, NULL, NULL, false)
 wheel_1 = msg2+msg3*128-8192
 end
ccidx=reaper.MIDI_EnumSelCC(take, ccidx)
retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
if chanmsg == 224 then 
reaper.MIDI_SetCC(take, ccidx, NULL, true, NULL, NULL, NULL, NULL, NULL, false)
 wheel_2 = msg2+msg3*128-8192
 end
if (wheel_2-wheel_1) > 0 then note_key=44 else note_key=45 end

repeat 
 wheel_temp=wheel_3
 ppqpos_temp=ppqpos_end
 ccidx=reaper.MIDI_EnumSelCC(take, ccidx)
 retval, selected, muted, ppqpos_end, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
 if chanmsg == 224 then 
 reaper.MIDI_SetCC(take, ccidx, NULL, true, NULL, NULL, NULL, NULL, NULL, false)
  wheel_3 = msg2+msg3*128-8192
  end
  until wheel_3 == 0 or ccidx == -1
  if ppqpos_temp ~= nil then
time_st= reaper.MIDI_GetProjTimeFromPPQPos(take, ppqpos_st)
time_end= reaper.MIDI_GetProjTimeFromPPQPos(take, ppqpos_temp)  
juli = time_end - time_st   
if wheel_temp < 0 then wheel_temp=wheel_temp*-1 end
panduan= wheel_temp / juli
if panduan < 12500 then note_vel=10 else note_vel=120 end

 reaper.MIDI_InsertNote(take, false, false, ppqpos_st, ppqpos_temp, chan, note_key, note_vel, false)
 
end
 reaper.MIDI_Sort(take)
 
 
 





