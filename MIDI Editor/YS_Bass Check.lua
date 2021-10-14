--[[
 * ReaScript Name: Bass Check
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
retval,notecnt,ccevtcnt, extsyxevtcnt = reaper.MIDI_CountEvts(take)

i,idx=2,0
biaoji = 0
txt = ''
tbtick={}  tbtick[0]=0 tbtick[60]=32 tbtick[80]=' tick 有三连音请处理！' tbtick[120]=0 tbtick[160]=' tick 有三连音请处理！' tbtick[180]=32 tbtick[240]=0
tbtick[300]=32 tbtick[320]=' tick 有三连音请处理！' tbtick[360]=0 tbtick[400]=' tick 有三连音请处理！'  tbtick[420]=32

while (idx <= notecnt) do
retval,selected, muted,startppqpos,endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, idx)

tick_m = startppqpos-reaper.MIDI_GetPPQPos_StartOfMeasure(take, startppqpos)
tick = tick_m % 480
tick = math.modf( tick / 1 ) 
beat = math.modf( tick_m / 480 ) 
beat = beat + 1
   num_new = reaper.MIDI_GetProjTimeFromPPQPos(take, startppqpos)
   hahahaha, measures, cml, fullbeats, cdenom = reaper.TimeMap2_timeToBeats(0, num_new)
   measures =  measures + 1
   --------------------------------
   if  retval ~= false then 
      reaper.MIDI_SetNote(take, idx, NULL, NULL, NULL, NULL, NULL, NULL, 100, true)
      end
   if pitch < 28 and retval ~= false then 
   reaper.MIDI_SetNote(take, idx, true, false, NULL, NULL, NULL, pitch + 12, NULL, true)
   txt = txt .. '提醒 ：第 '..measures..' 小节第 '..beat..' 拍第 '..tick..' tick 音符已经升高一个8度！ \n'
   biaoji = 2
   end
   ------------------------------------
if tbtick [tick] == nil then
   txt = txt .. '错误 ：第 '..measures..' 小节第 '..beat..' 拍第 '..tick..' tick 音符位置不规范！ \n'
   biaoji = 1
   else
   if tbtick [tick] == ' tick 有三连音请处理！' then
   txt = txt .. '警告：第 '..measures..' 小节第 '..beat..' 拍第 '..tick..tbtick [tick]..'\n'
   reaper.MIDI_InsertTextSysexEvt(take, false, false, startppqpos, 6, '3')
   biaoji = 1
   end
   if tbtick [tick] == 32 then
   txt = txt .. '注意：第 '..measures..' 小节第 '..beat..' 拍第 '..tick.. ' tick 有32分音符。 \n'
   biaoji = 2
   end
   end
 idx = idx + 1
end
if biaoji == 0 then
txt = '所有音符位置已规范，请量化并导出MIDI！'
end
if biaoji == 2 then
txt = txt .. '所有音符位置已规范，请量化并导出MIDI！'
end

reaper.ClearConsole()
reaper.ShowConsoleMsg(txt)
reaper.MIDI_Sort(take)
--reaper.SN_FocusMIDIEditor()
