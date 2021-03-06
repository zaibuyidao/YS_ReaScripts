--[[
 * ReaScript Name: Chord Show(原位和弦识别)
 * Version: 1.1.1
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2021-10-14)
  + Initial release
--]]

local editor=reaper.MIDIEditor_GetActive()

local take=reaper.MIDIEditor_GetTake(editor)

chordsend=''

reaper.MIDI_DisableSort(take)

noteidx,i,ii,chordnum= 0,2,1,0

notepitch = {}

tempst = -1

chordkey = ''

zhuanweikey = ''

chord = ''

chordtype={} chordtype[340]='' chordtype[430]='m' chordtype[250]='sus4' chordtype[330]='dim' 
chordtype[440]='aug' chordtype[2340]='6' chordtype[2430]='m6' chordtype[3340]='7' chordtype[3430]='m7' 
chordtype[4340]='M7' chordtype[43340]='9' chordtype[43430]='m9' chordtype[4240]='7b5' 
chordtype[4330]='m7b5' chordtype[34340]='Maj9' chordtype[3250]='7sus4' chordtype[3330]='dim7' 
chordtype[520]='sus2' chordtype[3220]='add9' chordtype[3520]='7sus2' chordtype[2440]='aug7'
chordtype[3330]='dim7' chordtype[4120]='madd9' chordtype[240]='-5'  chordtype[52340]='69'
chordtype[4430]='mM7'  chordtype[53340]='7#9'  chordtype[3440]='M7#5'  chordtype[33340]='7b9' chordtype[33250]='7sus4b9'
chordtype[433340]='11b9'
chordtype[4253340]='13#9'
chordtype[4434240]='13b5b9'
chordtype[4433340]='13b9'
chordtype[2250]='6sus4'
chordtype[83340]='7#11'
chordtype[2440]='7#5'
chordtype[52440]='7#5#9'
chordtype[32440]='7#5b9'
chordtype[73340]='7add11'
chordtype[113340]='7add13'
chordtype[54240]='7b5#9'
chordtype[34240]='7b5b9'
chordtype[443340]='9#11'
chordtype[42440]='9#5'
chordtype[643340]='9b13'
chordtype[44240]='9b5'
chordtype[43250]='9sus4'
chordtype[334340]='Maj11'
chordtype[4334340]='Maj13'
chordtype[74340]='Maj7#11'
chordtype[104340]='Maj7add13'
chordtype[5240]='Maj7b5'
chordtype[433440]='Maj9#11'
chordtype[33440]='Maj9#5'
chordtype[34250]='Maj9sus4'
chordtype[4343430]='m13'
chordtype[52430]='m6add9'
chordtype[73430]='m7add11'
chordtype[113430]='m7add13'
chordtype[33430]='m7b9'
chordtype[44330]='m9b5'
chordtype[334430]='mMaj11'
chordtype[4334430]='mMaj13'
chordtype[64430]='mMaj7add11'
chordtype[104430]='mMaj7add13'
chordtype[34430]='mMaj9'

idx=-1
noteidx=reaper.MIDI_EnumSelNotes(take,idx) 
if noteidx==-1 then return end
repeat 
noteidx=reaper.MIDI_EnumSelNotes(take,idx)

retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
 
  if startppqpos == tempst then notepitch[i] = pitch  notest = startppqpos i=i+1    
  else 
  if #notepitch > 1 then
  table.sort (notepitch)
  --[[if notepitch[1] < 48 then   zhuanwei=notepitch[1] zhuanwei=zhuanwei % 12 table.remove(notepitch,1) 
  if zhuanwei == 0 then zhuanweikey = '/C' end
  if zhuanwei == 1 then zhuanweikey = '/C#' end
  if zhuanwei == 2 then zhuanweikey = '/D' end
  if zhuanwei == 3 then zhuanweikey = '/Eb' end
  if zhuanwei == 4 then zhuanweikey = '/E' end
  if zhuanwei == 5 then zhuanweikey = '/F' end
  if zhuanwei == 6 then zhuanweikey = '/F#' end
  if zhuanwei == 7 then zhuanweikey = '/G' end
  if zhuanwei == 8 then zhuanweikey = '/Ab' end
  if zhuanwei == 9 then zhuanweikey = '/A' end
  if zhuanwei == 10 then zhuanweikey = '/Bb' end
  if zhuanwei == 11 then zhuanweikey = '/B' end
  end--]]
  
  low = notepitch[1]  if low ~= nil  then   low = low % 12 end
  if low == 0 then chordkey = 'C' end
  if low == 1 then chordkey = 'C#' end
  if low == 2 then chordkey = 'D' end
  if low == 3 then chordkey = 'Eb' end
  if low == 4 then chordkey = 'E' end
  if low == 5 then chordkey = 'F' end
  if low == 6 then chordkey = 'F#' end
  if low == 7 then chordkey = 'G' end
  if low == 8 then chordkey = 'Ab' end
  if low == 9 then chordkey = 'A' end
  if low == 10 then chordkey = 'Bb' end
  if low == 11 then chordkey = 'B' end
-- quedinggenyin
  while ii ~= #notepitch  do
  chordnum = chordnum + ( notepitch[ii+1] - notepitch[ii] ) * (10 ^ ii)
  ii = ii + 1   end -- while end   
  ii = 1
  chord = chordtype[chordnum]
  
 if chord == nil then 
   num=reaper.GetCursorPositionEx(0)
   num_new = reaper.MIDI_GetProjTimeFromPPQPos(take, tempst)
   move = num_new - num
   hahahaha, measures, cml, fullbeats, cdenom = reaper.TimeMap2_timeToBeats(0, num_new)
   measures =  measures + 1
   reaper.ShowMessageBox('有无法识别的和弦排列在第 '..measures..' 小节！', '出错啦!',0) 
  --reaper.MoveEditCursor(move, false) -- move cursor
  reaper.SN_FocusMIDIEditor() return
  end 

  if notest ~= nil then
  chordsend=chordsend..chordkey..chord..zhuanweikey..'\n'
 end --insert end
  end -- #notepitch > 1
  
  noteidx=reaper.MIDI_EnumSelNotes(take,idx)
  if noteidx==-1 then flag=true end

  zhuanweikey=''
  chordnum = 0
  notepitch = {}
  notepitch[1] = pitch
  tempst = startppqpos
  i = 2
 end
 idx=noteidx
until  flag

reaper.MIDI_Sort(take)
if chordsend~='' then reaper.MB(chordsend,'Chord Check',0) end
reaper.SN_FocusMIDIEditor()

