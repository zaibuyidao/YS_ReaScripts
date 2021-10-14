--[[
 * ReaScript Name: drums 难度评价
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

retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)

retval, selected, muted, startppqpos, endppqpos, chan,pitch, vel = reaper.MIDI_GetNote(take, 0)  --first note

retval2, selected2, muted2, startppqpos2, endppqpos2, chan2,pitch2, vel2 = reaper.MIDI_GetNote(take, notecnt-1)  --end note

firsttime = reaper.MIDI_GetProjTimeFromPPQPos(take, startppqpos)
endtime = reaper.MIDI_GetProjTimeFromPPQPos(take, startppqpos2)
range = endtime-firsttime
density = notecnt / range 
density=string.format("%6.3f", density) --  Note density
-------------------------------------------------------------
st_temp,idx,fast,sub,midubi_sub=-1,0,0,1,1

while idx < notecnt do
retval, selected, muted, startppqpos, endppqpos, chan,pitch, vel = reaper.MIDI_GetNote(take, idx)
notetime = reaper.MIDI_GetProjTimeFromPPQPos(take, startppqpos)
midu=notetime - st_temp
if midu > 0 and  midu < 0.375
then midubi=0.375-midu
midubi_sub=midubi_sub+(midubi^midubi)
fast=fast+(midubi/midubi_sub)
end
  st_temp=notetime
  idx=idx+1
end
fast=fast*2
fast=string.format("%6.3f", fast)

num=reaper.GetCursorPositionEx(0) 

difficulty=density+fast
if difficulty<5.5 then jibie='难度级别为: 简单 (仅供参考)' end
if difficulty>=5.5 and difficulty<9 then jibie='难度级别为: 中等 (仅供参考)' end
if difficulty>=9 then jibie='难度级别为: 较难 (仅供参考)' end

difficulty=string.format("%6.3f", difficulty) 

msg='难度得分为：'..difficulty..'\n'..'其中音符密度为：'..density..'\n'..'快速音符为：'..fast

reaper.MIDI_Sort(take)

reaper.ShowMessageBox(msg, jibie, 0)   

reaper.SN_FocusMIDIEditor()
