--[[
 * ReaScript Name: Chord Tools
 * Version: 1.0.5
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2021-11-3)
  + Initial release
--]]

chord={}
chord['Maj']='4,7,0,0,0,0'
chord['aug']='4,8,0,0,0,0'
chord['Maj7']='4,7,11,0,0,0'
chord['m7b5']='3,6,10,0,0,0'
chord['sus2']='2,7,0,0,0,0'
chord['dim7']='3,6,9,0,0,0'
chord['mM7']='3,7,11,0,0,0'
chord['m']='3,7,0,0,0,0'
chord['6']='4,7,9,0,0,0'
chord['9']='4,7,10,14,0,0'
chord['Maj9']='4,7,11,14,0,0'
chord['add9']='2,4,7,0,0,0'
chord['madd9']='2,3,7,0,0,0'
chord['7#9']='4,7,10,15,0,0'
chord['sus4']='5,7,0,0,0,0'
chord['m6']='3,7,9,0,0,0'
chord['m9']='3,7,10,14,0,0'
chord['7sus4']='5,7,10,0,0,0'
chord['Maj7sus4']='5,7,11,0,0,0'
chord['7sus2']='2,7,10,0,0,0'
chord['-5']='4,6,0,0,0,0'
chord['M7#5']='4,8,11,0,0,0'
chord['dim']='3,6,0,0,0,0'
chord['7']='4,7,10,0,0,0'
chord['7b5']='4,6,10,0,0,0'
chord['Aug7']='4,8,10,0,0,0'
chord['69']='4,7,9,14,0,0'
chord['7b9']='4,7,10,13,0,0'
chord['m7']='3,7,10,0,0,0'
chord['11']='4,7,10,14,17,0'
chord['m11']='3,7,10,14,17,0'
chord['13']='4,7,10,14,17,21'
------------------------------------
chord['7sus4b9']='5,7,10,13,0,0'
chord['11b9']='4,7,10,13,17,0'
chord['13#9']='4,7,10,15,17,21'
chord['13b5b9']='4,6,10,13,17,21'
chord['13b9']='4,7,10,13,17,21'
chord['6sus4']='5,7,9,0,0,0'
chord['7#11']='4,7,10,18,0,0'
chord['7#5']='4,8,10,0,0,0'
chord['7#5#9']='4,8,10,15,0,0'
chord['7#5b9']='4,8,10,13,0,0'
chord['7add11']='4,7,10,17,0,0'
chord['7add13']='4,7,10,21,0,0'
chord['7b5#9']='4,6,10,15,0,0'
chord['7b5b9']='4,6,10,13,0,0'
chord['9#11']='4,7,10,14,18,0'
chord['9#5']='4,8,10,14,0,0'
chord['9b13']='4,7,10,14,20,0'
chord['9b5']='4,6,10,14,0,0'
chord['9sus4']='5,7,10,14,0,0'
chord['Maj11']='4,7,11,14,17,0'
chord['Maj13']='4,7,11,14,17,21'
chord['Maj7#11']='4,7,11,18,0,0'
chord['Maj7add13']='4,7,11,21,0,0'
chord['Maj7b5']='4,6,11,0,0,0'
chord['Maj9#11']='4,8,11,14,18,0'
chord['Maj9#5']='4,8,11,14,0,0'
chord['Maj9sus4']='5,7,11,14,0,0'
chord['m13']='3,7,10,14,17,21'
chord['m6add9']='3,7,9,14,0,0'
chord['m7add11']='3,7,10,17,0,0'
chord['m7add13']='3,7,10,21,0,0'
chord['m7b9']='3,7,10,13,0,0'
chord['m9b5']='3,6,10,14,0,0'
chord['mMaj11']='3,7,11,14,17,0'
chord['mMaj13']='3,7,11,14,17,21'
chord['mMaj7add11']='3,7,11,17,0,0'
chord['mMaj7add13']='3,7,11,21,0,0'
chord['mMaj9']='3,7,11,14,0,0'


help='????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????Key48???????????????????????????????????????????????????????????????????????????????????????\n\n?????????????????????Key48???????????????C3 or C4??????\n\nChord Note To Lyrics ???????????????????????????????????????????????????????????????????????? Key=** ????????????????????????????????????????????????????????????????????????????????????\n\n???????????????????????????????????????????????????MIDI????????????????????????????????????????????????'

function chordin()
local editor=reaper.MIDIEditor_GetActive()
local take=reaper.MIDIEditor_GetTake(editor)
reaper.MIDI_DisableSort(take)
idx=-1
repeat
 integer = reaper.MIDI_EnumSelNotes(take, idx)
 if integer ~= -1 then
 tb_note={}
 retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
 if  pitch < 48 then pitch = (pitch % 12)+48
 reaper.MIDI_SetNote(take, integer, NULL, NULL, NULL, NULL, NULL, pitch, NULL, false) end
 if chord[leixing]~=nil then 
 note1,note2,note3,note4,note5,note6=string.match(chord[leixing],"(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)")
 if note1~='0' then table.insert(tb_note,tonumber(note1)) end
 if note2~='0' then table.insert(tb_note,tonumber(note2)) end
 if note3~='0' then table.insert(tb_note,tonumber(note3)) end
 if note4~='0' then table.insert(tb_note,tonumber(note4)) end
 if note5~='0' then table.insert(tb_note,tonumber(note5)) end
 if note6~='0' then table.insert(tb_note,tonumber(note6)) end
 for i,v in  ipairs(tb_note) do 
 reaper.MIDI_InsertNote(take, false, false, startppqpos, endppqpos, chan, pitch+v, vel, false)
  end
  end
  end
 idx=integer
 integer = reaper.MIDI_EnumSelNotes(take, idx)
 until integer==-1

reaper.MIDI_Sort(take)

end  --function end

--------------------------------------------------------------------------------------
function inkeymark0()
tb_mark={} 
tb_mark['a']='A' tb_mark['b']='B' tb_mark['c']='C' 
tb_mark['d']='D' tb_mark['e']='E' tb_mark['f']='F' tb_mark['g']='G' 
tb_mark['ab']='Ab' tb_mark['g#']='Ab' tb_mark['bb']='Bb' tb_mark['a#']='Bb'
tb_mark['db']='C#' tb_mark['c#']='C#' tb_mark['d#']='Eb' 
tb_mark['eb']='Eb' tb_mark['gb']='F#' tb_mark['f#']='F#'
pos=0
--pos=reaper.GetCursorPosition()
retval, name=reaper.GetUserInputs('???????????????????????????',1,'                                           Key= ','')
if retval==false then return end
name_low = string.lower(name)
if tb_mark[name_low]==nil then reaper.MB('??????????????????????????????','',0) return end
key=tb_mark[name_low]
reaper.AddProjectMarker2(0, false, pos, -1, 'Key='..key, -1, 33521664)
end

------------------------------------------------------------------------------
function inkeymark()
tb_mark={} 
tb_mark['a']='A' tb_mark['b']='B' tb_mark['c']='C' 
tb_mark['d']='D' tb_mark['e']='E' tb_mark['f']='F' tb_mark['g']='G' 
tb_mark['ab']='Ab' tb_mark['g#']='Ab' tb_mark['bb']='Bb' tb_mark['a#']='Bb'
tb_mark['db']='C#' tb_mark['c#']='C#' tb_mark['d#']='Eb' 
tb_mark['eb']='Eb' tb_mark['gb']='F#' tb_mark['f#']='F#'

pos=reaper.GetCursorPosition()
retval, name=reaper.GetUserInputs('???????????????????????????',1,'                                           Key= ','')
if retval==false then return end
name_low = string.lower(name)
if tb_mark[name_low]==nil then reaper.MB('??????????????????????????????','',0) return end
key=tb_mark[name_low]
reaper.AddProjectMarker2(0, false, pos, -1, 'Key='..key, -1, 33521664)
end
------------------------------------------------------------
function chordtolyrics()
local editor=reaper.MIDIEditor_GetActive()

local take=reaper.MIDIEditor_GetTake(editor)

key_list = {}
key_list['key=c']='Db,Eb,F#,Ab,Bb'
key_list['key=db']='Db,Eb,Gb,Ab,Bb'
key_list['key=d']='C#,Eb,F#,G#,Bb'
key_list['key=eb']='Db,Eb,Gb,Ab,Bb'
key_list['key=e']='C#,D#,F#,G#,A#'
key_list['key=f']='Db,Eb,Gb,Ab,Bb'
--key_list['key=gb']='Db,Eb,Gb,Ab,Bb'
key_list['key=g']='C#,Eb,F#,Ab,Bb'
key_list['key=ab']='Db,Eb,Gb,Ab,Bb'
key_list['key=a']='C#,D#,F#,G#,Bb'
key_list['key=bb']='Db,Eb,Gb,Ab,Bb'
key_list['key=b']='C#,D#,F#,G#,A#'
key_list['key=c#']='C#,D#,F#,G#,A#'
key_list['key=f#']='C#,D#,F#,G#,A#'


marklist={}
ticklist={}
midx,tbi=0,1
postb={}
repeat 
m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
name_low = string.lower(name)
if key_list[name_low] ~= nil then 
marklist[tbi]=name_low 
postb[tbi]=pos
marktick = reaper.MIDI_GetPPQPosFromProjTime(take, pos)
ticklist[tbi]=marktick
tbi=tbi+1 end

midx = midx + 1 
until m_retval == 0
if ticklist[1]==nil or postb[1]~=0  then  
getMB=reaper.ShowMessageBox('???????????? Key=* ?????????????????????????????????????????????\n?????????Key=??????????????????????????????????????????????????????\n??? ?????? ??????Key???????????????????????????', '?????????',1)  
if getMB==1 then inkeymark0() end
else

reaper.MIDI_DisableSort(take)

retval,notecnt,ccevtcnt, extsyxevtcnt = reaper.MIDI_CountEvts(take)

one = 0
while one < extsyxevtcnt do
reaper.MIDI_DeleteTextSysexEvt(take, 0)  one = one +1 end

noteidx,i,ii,chordnum= 0,2,1,0

notepitch = {}

tempst = -240

chordkey = ''

zhuanweikey = ''

chord = ''

chordtype={} chordtype[340]='' chordtype[430]='m' chordtype[250]='sus4' chordtype[330]='dim' 
chordtype[440]='aug' chordtype[2340]='6' chordtype[2430]='m6' chordtype[3340]='7' chordtype[3430]='m7' 
chordtype[4340]='M7' chordtype[43340]='9' chordtype[43430]='m9' chordtype[4240]='7b5' 
chordtype[4330]='m7b5' chordtype[34340]='M9' chordtype[3250]='7sus4' chordtype[4250]='Maj7sus4' 
chordtype[520]='sus2' chordtype[3220]='add9' chordtype[3520]='7sus2' chordtype[2440]='aug7'
chordtype[3330]='dim7' chordtype[4120]='madd9' chordtype[240]='-5'  chordtype[52340]='69'
chordtype[4430]='mM7'  chordtype[53340]='7#9'  chordtype[3440]='M7#5'  chordtype[33340]='7b9'
chordtype[343340]='11' chordtype[343430]='m11' chordtype[4343340]='13'  
-----------------------------------
chordtype[33250]='7sus4b9'
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
chordtype[34340]='Maj9'
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


while noteidx <= notecnt  do

retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)

  if startppqpos == tempst then notepitch[i] = pitch  notest = startppqpos i=i+1    
  else 
  jiange = startppqpos - tempst
   if jiange < 0 then jiange = jiange * (-1) end
   if jiange ~= 0 and jiange < 240 then 
    num=reaper.GetCursorPositionEx(0)
    num_new = reaper.MIDI_GetProjTimeFromPPQPos(take, startppqpos)
    move = num_new - num
    hahahaha, measures, cml, fullbeats, cdenom = reaper.TimeMap2_timeToBeats(0, num_new)
    measures =  measures + 1
    reaper.ShowMessageBox('?????????????????? 240 tick ?????? '..measures..' ?????????????????????????????????????????????', '?????????!',0) 
   reaper.MoveEditCursor(move, false) -- move cursor
   break end
   --------------------------------------check jiange
  if #notepitch > 1 then
  zhuanwei=-1
  table.sort (notepitch)
  if notepitch[1] < 48 then   zhuanwei=notepitch[1] zhuanwei=zhuanwei % 12 table.remove(notepitch,1) 
  if zhuanwei == 0 then zhuanweikey = '/C' end
  if zhuanwei == 1 then 
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B1,B2,B3,B4,B5=string.match(key_list[marklist[dingwei]],"(..),(..),(..),(..),(..)")
  zhuanweikey = '/'..B1 end
  if zhuanwei == 2 then zhuanweikey = '/D' end
  if zhuanwei == 3 then 
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B1,B2,B3,B4,B5=string.match(key_list[marklist[dingwei]],"(..),(..),(..),(..),(..)")
  zhuanweikey = '/'..B2 end
  if zhuanwei == 4 then zhuanweikey = '/E' end
  if zhuanwei == 5 then zhuanweikey = '/F' end
  if zhuanwei == 6 then 
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B1,B2,B3,B4,B5=string.match(key_list[marklist[dingwei]],"(..),(..),(..),(..),(..)")
  zhuanweikey = '/'..B3 end
  if zhuanwei == 7 then zhuanweikey = '/G' end
  if zhuanwei == 8 then 
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B1,B2,B3,B4,B5=string.match(key_list[marklist[dingwei]],"(..),(..),(..),(..),(..)")
  zhuanweikey = '/'..B4 end
  if zhuanwei == 9 then zhuanweikey = '/A' end
  if zhuanwei == 10 then 
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B1,B2,B3,B4,B5=string.match(key_list[marklist[dingwei]],"(..),(..),(..),(..),(..)")
  zhuanweikey = '/'..B5 end
  if zhuanwei == 11 then zhuanweikey = '/B' end
  end
  
  low = notepitch[1]  if low ~= nil  then   low = low % 12 end
  if low==zhuanwei then  
  num=reaper.GetCursorPositionEx(0)
  num_new = reaper.MIDI_GetProjTimeFromPPQPos(take, tempst)
  move = num_new - num
  hahahaha, measures, cml, fullbeats, cdenom = reaper.TimeMap2_timeToBeats(0, num_new)
  measures =  measures + 1
  reaper.ShowMessageBox('????????????????????? ?????? '..measures..' ??????????????????????????????????????????????????????', '?????????!',0) 
   reaper.MoveEditCursor(move, false)  break end
  if low == 0 then chordkey = 'C' end
  if low == 1 then   
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B1,B2,B3,B4,B5=string.match(key_list[marklist[dingwei]],"(..),(..),(..),(..),(..)")
  chordkey = B1 end
  if low == 2 then chordkey = 'D' end
  if low == 3 then 
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B1,B2,B3,B4,B5=string.match(key_list[marklist[dingwei]],"(..),(..),(..),(..),(..)")
  chordkey = B2 end
  if low == 4 then chordkey = 'E' end
  if low == 5 then chordkey = 'F' end
  if low == 6 then 
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B1,B2,B3,B4,B5=string.match(key_list[marklist[dingwei]],"(..),(..),(..),(..),(..)")
  chordkey = B3 end
  if low == 7 then chordkey = 'G' end
  if low == 8 then 
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B1,B2,B3,B4,B5=string.match(key_list[marklist[dingwei]],"(..),(..),(..),(..),(..)")
  chordkey = B4 end
  if low == 9 then chordkey = 'A' end
  if low == 10 then 
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B1,B2,B3,B4,B5=string.match(key_list[marklist[dingwei]],"(..),(..),(..),(..),(..)")
  chordkey = B5 end
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
   reaper.ShowMessageBox('???????????????????????????????????? '..measures..' ?????????????????????????????????????????????', '?????????!',0) 
  reaper.MoveEditCursor(move, false) -- move cursor
  break
  end
  
  if notest ~= nil then
   reaper.MIDI_InsertTextSysexEvt(take, false, false, notest, 5, chordkey..chord..zhuanweikey)
  --reaper.MIDI_InsertTextSysexEvt(take, false, false, notest, 5, chordnum)
   end --insert end
  end -- #notepitch > 1

  zhuanweikey=''
  chordnum = 0
  notepitch = {}
  notepitch[1] = pitch
  tempst = startppqpos
  i = 2
 end
 
noteidx = noteidx + 1

if  noteidx > notecnt then 
reaper.TrackCtl_SetToolTip('         ?????????\n???????????????????????????', 500, 400, true)  end

end --while end
end --ticklist end

reaper.MIDI_Sort(take)
reaper.MIDIEditor_OnCommand(editor, 40370)
reaper.SN_FocusMIDIEditor()

end --chordtolyrics
---------------------------------------------------------------------------
function chordtolyrics_series()

local editor=reaper.MIDIEditor_GetActive()

local take=reaper.MIDIEditor_GetTake(editor)

key_list = {}
key_list['key=c']='???,#???,???,b???,???,???,#???,???,b???,???,b???,???'
key_list['key=db']='???,???,#???,???,b???,???,???,#???,???,b???,???,b???'
key_list['key=c#']='???,???,#???,???,b???,???,???,#???,???,b???,???,b???'
key_list['key=d']='b???,???,???,#???,???,b???,???,???,#???,???,b???,???'
key_list['key=eb']='???,b???,???,???,#???,???,b???,???,???,#???,???,b???'
key_list['key=e']='b???,???,b???,???,???,#???,???,b???,???,???,#???,???'
key_list['key=f']='???,b???,???,b???,???,???,#???,???,b???,???,???,#???'
key_list['key=f#']='#???,???,b???,???,b???,???,???,#???,???,b???,???,???'
--key_list['key=gb']='#???,???,b???,???,b???,???,???,#???,???,b???,???,???'
key_list['key=g']='???,#???,???,b???,???,b???,???,???,#???,???,b???,???'
key_list['key=ab']='???,???,#???,???,b???,???,b???,???,???,#???,???,b???'
key_list['key=a']='b???,???,???,#???,???,b???,???,b???,???,???,#???,???'
key_list['key=bb']='???,b???,???,???,#???,???,b???,???,b???,???,???,#???'
key_list['key=b']='#???,???,b???,???,???,#???,???,b???,???,b???,???,???'

marklist={}
ticklist={}
midx,tbi=0,1   postb={}
repeat 
m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
name_low = string.lower(name)
if key_list[name_low] ~= nil then 
marklist[tbi]=name_low 
postb[tbi]=pos
marktick = reaper.MIDI_GetPPQPosFromProjTime(take, pos)
ticklist[tbi]=marktick
tbi=tbi+1 end

midx = midx + 1 
until m_retval == 0
if ticklist[1]==nil or postb[1]~=0  then  
getMB=reaper.ShowMessageBox('???????????? Key=* ?????????????????????????????????????????????\n?????????Key=??????????????????????????????????????????????????????\n??? ?????? ??????Key???????????????????????????', '?????????',1)  
if getMB==1 then inkeymark0() end
else

reaper.MIDI_DisableSort(take)

retval,notecnt,ccevtcnt, extsyxevtcnt = reaper.MIDI_CountEvts(take)

one = 0
while one < extsyxevtcnt do
reaper.MIDI_DeleteTextSysexEvt(take, 0)  one = one +1 end

noteidx,i,ii,chordnum= 0,2,1,0

notepitch = {}

tempst = -240

chordkey = ''

zhuanweikey = ''

chord = ''

chordtype={} chordtype[340]='' chordtype[430]='m' chordtype[250]='sus4' chordtype[330]='dim' 
chordtype[440]='aug' chordtype[2340]='6' chordtype[2430]='m6' chordtype[3340]='7' chordtype[3430]='m7' 
chordtype[4340]='M7' chordtype[43340]='9' chordtype[43430]='m9' chordtype[4240]='7b5' 
chordtype[4330]='m7b5' chordtype[34340]='M9' chordtype[3250]='7sus4' chordtype[4250]='Maj7sus4' 
chordtype[520]='sus2' chordtype[3220]='add9' chordtype[3520]='7sus2' chordtype[2440]='aug7'
chordtype[3330]='dim7' chordtype[4120]='madd9' chordtype[240]='-5'  chordtype[52340]='69'
chordtype[4430]='mM7'  chordtype[53340]='7#9'  chordtype[3440]='M7#5'  chordtype[33340]='7b9'
chordtype[343340]='11' chordtype[343430]='m11' chordtype[4343340]='13'  
-----------------------------------
chordtype[33250]='7sus4b9'
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
chordtype[34340]='Maj9'
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


while noteidx <= notecnt  do

retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)

  if startppqpos == tempst then notepitch[i] = pitch  notest = startppqpos i=i+1    
  else 
  jiange = startppqpos - tempst
   if jiange < 0 then jiange = jiange * (-1) end
   if jiange ~= 0 and jiange < 240 then 
    num=reaper.GetCursorPositionEx(0)
    num_new = reaper.MIDI_GetProjTimeFromPPQPos(take, startppqpos)
    move = num_new - num
    hahahaha, measures, cml, fullbeats, cdenom = reaper.TimeMap2_timeToBeats(0, num_new)
    measures =  measures + 1
    reaper.ShowMessageBox('?????????????????? 240 tick ?????? '..measures..' ?????????????????????????????????????????????', '?????????!',0) 
   reaper.MoveEditCursor(move, false) -- move cursor
   break end
   --------------------------------------check jiange
  if #notepitch > 1 then
  zhuanwei=-1
  table.sort (notepitch)
  if notepitch[1] < 48 then   zhuanwei=notepitch[1] zhuanwei=zhuanwei % 12 table.remove(notepitch,1) 
  if zhuanwei == 0 then   
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  zhuanweikey = '/'..B0 end
  if zhuanwei == 1 then   
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  zhuanweikey = '/'..B1 end
  if zhuanwei == 2 then   
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  zhuanweikey = '/'..B2 end
  if zhuanwei == 3 then   
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  zhuanweikey = '/'..B3 end
  if zhuanwei == 4 then   
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  zhuanweikey = '/'..B4 end
  if zhuanwei == 5 then   
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  zhuanweikey = '/'..B5 end
  if zhuanwei == 6 then   
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  zhuanweikey = '/'..B6 end
  if zhuanwei == 7 then   
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  zhuanweikey = '/'..B7 end
  if zhuanwei == 8 then   
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  zhuanweikey = '/'..B8 end
  if zhuanwei == 9 then   
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  zhuanweikey = '/'..B9 end
  if zhuanwei == 10 then   
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  zhuanweikey = '/'..B10 end
  if zhuanwei == 11 then   
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  zhuanweikey = '/'..B11 end
  end
  
  low = notepitch[1]  if low ~= nil  then   low = low % 12 end
  if low==zhuanwei then  
  num=reaper.GetCursorPositionEx(0)
  num_new = reaper.MIDI_GetProjTimeFromPPQPos(take, tempst)
  move = num_new - num
  hahahaha, measures, cml, fullbeats, cdenom = reaper.TimeMap2_timeToBeats(0, num_new)
  measures =  measures + 1
  reaper.ShowMessageBox('????????????????????? ?????? '..measures..' ??????????????????????????????????????????????????????', '?????????!',0) 
   reaper.MoveEditCursor(move, false)  break end
  if low == 0 then   
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  chordkey = B0 end
  if low == 1 then   
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  chordkey = B1 end
  if low == 2 then   
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  chordkey = B2 end
  if low == 3 then 
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  chordkey = B3 end
  if low == 4 then   
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  chordkey = B4 end
  if low == 5 then   
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  chordkey = B5 end
  if low == 6 then 
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  chordkey = B6 end
  if low == 7 then   
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  chordkey = B7 end
  if low == 8 then 
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)") 
  chordkey = B8 end
  if low == 9 then   
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  chordkey = B9 end
  if low == 10 then 
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  chordkey = B10 end
  if low == 11 then   
  for i, v in ipairs(ticklist) do  if notest >= v then  dingwei=i end  end 
  B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11=string.match(key_list[marklist[dingwei]],"(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
  chordkey = B11 end
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
   reaper.ShowMessageBox('???????????????????????????????????? '..measures..' ?????????????????????????????????????????????', '?????????!',0) 
  reaper.MoveEditCursor(move, false) -- move cursor
  break
  end
  
  if notest ~= nil then
   reaper.MIDI_InsertTextSysexEvt(take, false, false, notest, 5, chordkey..chord..zhuanweikey)
  --reaper.MIDI_InsertTextSysexEvt(take, false, false, notest, 5, chordnum)
   end --insert end
  end -- #notepitch > 1

  zhuanweikey=''
  chordnum = 0
  notepitch = {}
  notepitch[1] = pitch
  tempst = startppqpos
  i = 2
 end
 
noteidx = noteidx + 1

if  noteidx > notecnt then 
reaper.TrackCtl_SetToolTip('         ?????????\n???????????????????????????', 500, 400, true)  end

end --while end
end --ticklist end

reaper.MIDI_Sort(take)
reaper.MIDIEditor_OnCommand(editor, 40370)
reaper.SN_FocusMIDIEditor()

end --chordtolyrics_series
-----------------------------------------------------------------
function LyricsToNote()
chord={}
chord['']='4,7,0,0,0,0'  chord['Maj']='4,7,0,0,0,0'
chord['aug']='4,8,0,0,0,0'
chord['Maj7']='4,7,11,0,0,0'  chord['M7']='4,7,11,0,0,0'
chord['m7b5']='3,6,10,0,0,0'  chord['m7-5']='3,6,10,0,0,0'
chord['sus2']='2,7,0,0,0,0'
chord['dim7']='3,6,9,0,0,0'
chord['mM7']='3,7,11,0,0,0'
chord['m']='3,7,0,0,0,0'  chord['min']='3,7,0,0,0,0'
chord['6']='4,7,9,0,0,0'
chord['9']='4,7,10,14,0,0'
chord['Maj9']='4,7,11,14,0,0'  chord['M9']='4,7,11,14,0,0'
chord['add9']='2,4,7,0,0,0'
chord['madd9']='2,3,7,0,0,0'
chord['7#9']='4,7,10,15,0,0'
chord['sus4']='5,7,0,0,0,0'
chord['m6']='3,7,9,0,0,0'
chord['m9']='3,7,10,14,0,0'
chord['7sus4']='5,7,10,0,0,0'
chord['Maj7sus4']='5,7,11,0,0,0'
chord['7sus2']='2,7,10,0,0,0'
chord['-5']='4,6,0,0,0,0'
chord['M7#5']='4,8,11,0,0,0'
chord['dim']='3,6,0,0,0,0'
chord['7']='4,7,10,0,0,0' 
chord['7b5']='4,6,10,0,0,0'   chord['7-5']='4,6,10,0,0,0'
chord['Aug7']='4,8,10,0,0,0'
chord['69']='4,7,9,14,0,0'
chord['7b9']='4,7,10,13,0,0'
chord['m7']='3,7,10,0,0,0'
chord['11']='4,7,10,14,17,0'
chord['m11']='3,7,10,14,17,0'
chord['13']='4,7,10,14,17,21'
------------------------------------
chord['7sus4b9']='5,7,10,13,0,0'
chord['11b9']='4,7,10,13,17,0'
chord['13#9']='4,7,10,15,17,21'
chord['13b5b9']='4,6,10,13,17,21'
chord['13b9']='4,7,10,13,17,21'
chord['6sus4']='5,7,9,0,0,0'
chord['7#11']='4,7,10,18,0,0'
chord['7#5']='4,8,10,0,0,0'
chord['7#5#9']='4,8,10,15,0,0'
chord['7#5b9']='4,8,10,13,0,0'
chord['7add11']='4,7,10,17,0,0'
chord['7add13']='4,7,10,21,0,0'
chord['7b5#9']='4,6,10,15,0,0'
chord['7b5b9']='4,6,10,13,0,0'
chord['9#11']='4,7,10,14,18,0'
chord['9#5']='4,8,10,14,0,0'
chord['9b13']='4,7,10,14,20,0'
chord['9b5']='4,6,10,14,0,0'
chord['9sus4']='5,7,10,14,0,0'
chord['Maj11']='4,7,11,14,17,0'  chord['M11']='4,7,11,14,17,0'
chord['Maj13']='4,7,11,14,17,21'  chord['M13']='4,7,11,14,17,21'
chord['Maj7#11']='4,7,11,18,0,0'
chord['Maj7add13']='4,7,11,21,0,0'
chord['Maj7b5']='4,6,11,0,0,0'
chord['Maj9#11']='4,8,11,14,18,0'
chord['Maj9#5']='4,8,11,14,0,0'
chord['Maj9sus4']='5,7,11,14,0,0'
chord['m13']='3,7,10,14,17,21'
chord['m6add9']='3,7,9,14,0,0'
chord['m7add11']='3,7,10,17,0,0'
chord['m7add13']='3,7,10,21,0,0'
chord['m7b9']='3,7,10,13,0,0'
chord['m9b5']='3,6,10,14,0,0'
chord['mMaj11']='3,7,11,14,17,0'
chord['mMaj13']='3,7,11,14,17,21'
chord['mMaj7add11']='3,7,11,17,0,0'
chord['mMaj7add13']='3,7,11,21,0,0'
chord['mMaj9']='3,7,11,14,0,0'
local editor=reaper.MIDIEditor_GetActive()
local take=reaper.MIDIEditor_GetTake(editor)
roottb={} 
roottb['C']=60
roottb['C#']=61
roottb['Db']=61
roottb['D']=62
roottb['D#']=63
roottb['Eb']=63
roottb['E']=64
roottb['F']=53
roottb['F#']=54
roottb['Gb']=54
roottb['G']=55
roottb['G#']=56
roottb['Ab']=56
roottb['A']=57
roottb['A#']=58
roottb['Bb']=58
roottb['B']=59

zhuanweitb={}
zhuanweitb['C']=36
zhuanweitb['C#']=37
zhuanweitb['Db']=37
zhuanweitb['D']=38
zhuanweitb['D#']=39
zhuanweitb['Eb']=39
zhuanweitb['E']=40
zhuanweitb['F']=41
zhuanweitb['F#']=42
zhuanweitb['Gb']=42
zhuanweitb['G']=43
zhuanweitb['G#']=44
zhuanweitb['Ab']=44
zhuanweitb['A']=45
zhuanweitb['A#']=46
zhuanweitb['Bb']=46
zhuanweitb['B']=47

message=''
reaper.MIDIEditor_OnCommand(editor,40003) --select all note
reaper.MIDIEditor_OnCommand(editor,40002) --delete note
reaper.MIDI_DisableSort(take)
idx=0
retval, selected,muted, ppqpos, txt_type, chord_txt = reaper.MIDI_GetTextSysexEvt(take, idx, true, false, 0, 5, '')
repeat
  tb_note={}
  if retval and  txt_type==5 then
  chord_txt=string.gsub(chord_txt,'%s','') 
  zhuanwei_sub=string.match(chord_txt,'%/%S+')
  if zhuanwei_sub~=nil then  
  zhuanwei=string.gsub(zhuanwei_sub,'%/','') 
  chord_new=string.gsub(chord_txt,zhuanwei_sub,'') 
  if zhuanweitb[zhuanwei]~=nil then
  reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos+240, 0, zhuanweitb[zhuanwei], 100, false)
  else
  ProjTime = reaper.MIDI_GetProjTimeFromPPQPos(take, ppqpos)
  hahahaha, measures, cml, fullbeats, cdenom = reaper.TimeMap2_timeToBeats(0, ProjTime)
  measures =  measures + 1
  message=message..'?????????????????????????????? '..chord_txt..' ?????? '..measures..' ?????????\n'  
  end
  else
  chord_new=chord_txt
  end
  root1=string.sub(chord_new,1,1)
  root2=string.sub(chord_new,2,2)
  if root2=='b'or root2=='#' then
  root=root1..root2
  chord_type=string.sub(chord_new,3)
  else
  root=root1
  chord_type=string.sub(chord_new,2)
  end
  if roottb[root]~=nil and chord[chord_type]~=nil then
  reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos+240, 0, roottb[root], 100, false)
  
  note1,note2,note3,note4,note5,note6=string.match(chord[chord_type],"(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)")
 if note1~='0' then table.insert(tb_note,tonumber(note1)) end
 if note2~='0' then table.insert(tb_note,tonumber(note2)) end
 if note3~='0' then table.insert(tb_note,tonumber(note3)) end
 if note4~='0' then table.insert(tb_note,tonumber(note4)) end
 if note5~='0' then table.insert(tb_note,tonumber(note5)) end
 if note6~='0' then table.insert(tb_note,tonumber(note6)) end
 for i,v in  ipairs(tb_note) do 
 reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos+240, 0, roottb[root]+v, 100, false)
  end -- for end
  else 
  ProjTime = reaper.MIDI_GetProjTimeFromPPQPos(take, ppqpos)
  hahahaha, measures, cml, fullbeats, cdenom = reaper.TimeMap2_timeToBeats(0, ProjTime)
  measures =  measures + 1
  
  message=message..'?????????????????????????????? '..chord_txt..' ?????? '..measures..' ?????????\n'
  end 
  end

 idx=idx+1
 
retval, selected,muted, ppqpos, txt_type, chord_txt = reaper.MIDI_GetTextSysexEvt(take, idx, true, false, 0, 5, '')
 
 until retval==false
 
reaper.MIDI_Sort(take)
reaper.TrackCtl_SetToolTip('          ?????????\n??????????????????????????????', 500, 400, true)
if message~='' then reaper.MB(message,'?????????',0) end

end  --LyricsToNote
-----------------------------------------------------------

function LyricsToChordTrack()
reaper.Undo_BeginBlock()
editor=reaper.MIDIEditor_GetActive()
take=reaper.MIDIEditor_GetTake(editor)
tb_pos={} tb_len={} tbchord={}

retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
if textsyxevtcnt==0 then  return end
idx=0 tempend=0
repeat 
retval, selected, muted, ppqpos_p, t_type, msg = reaper.MIDI_GetTextSysexEvt(take, idx, NULL, NULL, -1, 5,'')
idx=idx+1
until t_type==5 or idx>=textsyxevtcnt-1 -- first 
pos_p=reaper.MIDI_GetProjTimeFromPPQPos(take, ppqpos_p)
table.insert(tb_pos,pos_p)  table.insert(tbchord,msg) 
while  idx < textsyxevtcnt do
retval, selected, muted, ppqpos, t_type, msg = reaper.MIDI_GetTextSysexEvt(take, idx, NULL, NULL, -1, 5,'')
   if t_type==5 then 
   pos=reaper.MIDI_GetProjTimeFromPPQPos(take, ppqpos)
    table.insert(tb_pos,pos)  table.insert(tbchord,msg)  table.insert(tb_len,(pos-pos_p)) 
    pos_p=pos
   end
idx=idx+1
end
endofmeasure=reaper.MIDI_GetPPQPos_EndOfMeasure(take,ppqpos+1)
endpos=reaper.MIDI_GetProjTimeFromPPQPos(take, endofmeasure)
endchordlen=endpos-pos
table.insert(tb_len,endchordlen) 

reaper.PreventUIRefresh(1)

track_old=reaper.GetMediaItemTake_Track(take)
TRnumber = reaper.GetMediaTrackInfo_Value(track_old, 'IP_TRACKNUMBER' )
reaper.InsertTrackAtIndex(TRnumber, false )
track=reaper.GetTrack(0,TRnumber)
retval, trackname = reaper.GetSetMediaTrackInfo_String(track_old, 'P_NAME', '', false )
retval, trackname = reaper.GetSetMediaTrackInfo_String(track, 'P_NAME', trackname..'_Preview', true )
boolean = reaper.SetMediaTrackInfo_Value(track, 'I_HEIGHTOVERRIDE', 100 ) 
reaper.SetOnlyTrackSelected(track)

i=1 
while i<=#tb_pos do
item=reaper.AddMediaItemToTrack(track)
retval,state=reaper.GetItemStateChunk(item,'',false)
state=string.gsub(state,'POSITION 0','POSITION '..tb_pos[i])
state=string.gsub(state,'LENGTH 0','LENGTH '..tb_len[i])
state=string.gsub(state,'LOOP 1','LOOP 0 \n<NOTES\n|'..tbchord[i]..'\n>\n'..'IMGRESOURCEFLAGS 3')
--reaper.ShowConsoleMsg(state)
reaper.SetItemStateChunk(item,state,false)
i=i+1
end

reaper.PreventUIRefresh(-1)

retval, isFloatingDocker = reaper.DockIsChildOfDock(editor)
reaper.MIDIEditor_OnCommand(editor, 40794)
reaper.Main_OnCommand(40421,0)
reaper.Main_OnCommand(40705,0)

reaper.Undo_EndBlock('',0)
  
end --LyricsToChordTrack
--------------------------------------------------------

function LyricsToregion()
reaper.Undo_BeginBlock()
editor=reaper.MIDIEditor_GetActive()
take=reaper.MIDIEditor_GetTake(editor)
tb_pos={} tb_end={} tbchord={}

retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
if textsyxevtcnt==0 then  return end
idx=0 tempend=0
repeat 
retval, selected, muted, ppqpos_p, t_type, msg = reaper.MIDI_GetTextSysexEvt(take, idx, NULL, NULL, -1, 5,'')
idx=idx+1
until t_type==5 or idx>=textsyxevtcnt-1 -- first 
pos_p=reaper.MIDI_GetProjTimeFromPPQPos(take, ppqpos_p)
table.insert(tb_pos,pos_p)  table.insert(tbchord,msg) 
while  idx < textsyxevtcnt do
retval, selected, muted, ppqpos, t_type, msg = reaper.MIDI_GetTextSysexEvt(take, idx, NULL, NULL, -1, 5,'')
   if t_type==5 then 
   pos=reaper.MIDI_GetProjTimeFromPPQPos(take, ppqpos)
    table.insert(tb_pos,pos)  table.insert(tbchord,msg)  table.insert(tb_end,pos) 
    pos_p=pos
   end
idx=idx+1
end
endofmeasure=reaper.MIDI_GetPPQPos_EndOfMeasure(take,ppqpos+1)
endpos=reaper.MIDI_GetProjTimeFromPPQPos(take, endofmeasure)
table.insert(tb_end,endpos) 

reaper.Main_OnCommand(reaper.NamedCommandLookup('_SWSMARKERLIST10'),0)
reaper.PreventUIRefresh(1)

i=1 
while i<=#tb_pos do
reaper.AddProjectMarker(0, true,tb_pos[i],tb_end[i],tbchord[i],-1)
i=i+1
end

reaper.PreventUIRefresh(-1)

reaper.Undo_EndBlock('',0)
end -- Lyrics To region
-----------------------------------------------------------
function Audition()
reaper.Main_OnCommand(reaper.NamedCommandLookup('_BR_SAVE_SOLO_MUTE_ALL_TRACKS_SLOT_1'),0)
reaper.Main_OnCommand(40340,0) --unsolo all track
local editor=reaper.MIDIEditor_GetActive()
local take=reaper.MIDIEditor_GetTake(editor)

 integer = reaper.MIDI_EnumSelNotes(take, -1)
 if integer ~= -1 then
 retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
 if  pitch < 48 then pitch = (pitch % 12)+48
 reaper.MIDI_SetNote(take, integer, NULL, NULL, NULL, NULL, NULL, pitch, NULL, false) end
 
  reaper.StuffMIDIMessage(0, 144,pitch,vel)
 
 if chord[leixing]~=nil then 
 note1,note2,note3,note4,note5,note6=string.match(chord[leixing],"(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)")
 if note1~='0' then  
 local yanchi=os.clock()
 while os.clock() - yanchi < 0.08 do end
 reaper.StuffMIDIMessage(0, 144,pitch+note1,vel)
 end
 if note2~='0' then  
 local yanchi=os.clock()
 while os.clock() - yanchi < 0.08 do end
 reaper.StuffMIDIMessage(0, 144,pitch+note2,vel)
 end
 if note3~='0' then  
 local yanchi=os.clock()
 while os.clock() - yanchi < 0.08 do end
 reaper.StuffMIDIMessage(0, 144,pitch+note3,vel)
 end
 if note4~='0' then  
 local yanchi=os.clock()
 while os.clock() - yanchi < 0.08 do end
 reaper.StuffMIDIMessage(0, 144,pitch+note4,vel)
 end
 if note5~='0' then  
 local yanchi=os.clock()
 while os.clock() - yanchi < 0.08 do end
 reaper.StuffMIDIMessage(0, 144,pitch+note5,vel)
 end
 if note6~='0' then 
 local yanchi=os.clock()
 while os.clock() - yanchi < 0.08 do end
 reaper.StuffMIDIMessage(0, 144,pitch+note6,vel)
 end
 local yanchi=os.clock()
 while os.clock() - yanchi < 0.4 do end
 reaper.StuffMIDIMessage(0, 176,120,0)
--reaper.MIDIEditor_OnCommand(editor,40435)
reaper.Main_OnCommand(reaper.NamedCommandLookup('_BR_RESTORE_SOLO_MUTE_ALL_TRACKS_SLOT_1'), 0)
 end
 end
end  --function end
----------------------------------------------------
function recst()
editor=reaper.MIDIEditor_GetActive()
take=reaper.MIDIEditor_GetTake(editor)
TK=reaper.GetMediaItemTake_Track(take)

reaper.Main_OnCommand(40491,0) --all rec off
 retval = reaper.SetMediaTrackInfo_Value(TK, 'I_RECARM', 1)
 retval, str = reaper.GetTrackStateChunk(TK, '', false)
 oldrec=string.match(str,'REC%s%d+%s%d+%s%d+%s%d+%s%d+%s%d+%s%d+')
 if oldrec~='REC 1 5088 1 0 0 0 0' then
  str=string.gsub(str,oldrec,'REC 1 5088 1 0 0 0 0')
  ok=reaper.SetTrackStateChunk(TK, str, false)
  reaper.TrackCtl_SetToolTip('              ?????????\n??????????????????????????????????????????MIDI?????????????????????', 500, 400, true)
 end
end --recst end
recst()


local ctx = reaper.ImGui_CreateContext('Chord Tools')
x,y=reaper.GetMousePosition()
reaper.ImGui_SetNextWindowSize(ctx, 410, 325)
  reaper.ImGui_SetNextWindowPos(ctx, x, y)
flag=true
function loop()
  local visible, open = reaper.ImGui_Begin(ctx, 'Chord Tools ~ Right mouse button audition', true)
  if visible then

  if reaper.ImGui_Button(ctx, "Maj") then  leixing='Maj'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='Maj'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "Min") then  leixing='m'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='m'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "sus4") then  leixing='sus4'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='sus4'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "sus2") then  leixing='sus2'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='sus2'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "dim") then  leixing='dim'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='dim'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "Aug") then  leixing='aug'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='aug'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "6") then  leixing='6'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='6'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "m6") then  leixing='m6'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='m6'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "69") then  leixing='69'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='69'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "6sus4") then  leixing='6sus4'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='6sus4'  Audition()  end  
  if reaper.ImGui_Button(ctx, "m6add9") then  leixing='m6add9'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='m6add9'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "add9") then  leixing='add9'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='add9'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "madd9") then  leixing='madd9'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='madd9'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "-5") then  leixing='-5'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='-5'  Audition()  end    reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "m7") then  leixing='m7'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='m7'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "7") then  leixing='7'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='7'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "Maj7") then  leixing='Maj7'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='Maj7'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "dim7") then  leixing='dim7'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='dim7'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "mM7") then  leixing='mM7'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='mM7'  Audition()  end   
  if reaper.ImGui_Button(ctx, "7b5") then  leixing='7b5'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='7b5'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "7#5") then  leixing='7#5'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='7#5'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "m7b5") then  leixing='m7b5'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='m7b5'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "7sus4") then  leixing='7sus4'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='7sus4'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "Maj7sus4") then  leixing='Maj7sus4'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='Maj7sus4'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "7sus2") then  leixing='7sus2'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='7sus2'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "M7#5") then  leixing='M7#5'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='M7#5'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "Aug7") then  leixing='Aug7'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='Aug7'  Audition()  end   
  if reaper.ImGui_Button(ctx, "7#9") then  leixing='7#9'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='7#9'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "7b9") then  leixing='7b9'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='7b9'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "Maj7b5") then  leixing='Maj7b5'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='Maj7b5'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "m7b9") then  leixing='m7b9'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='m7b9'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "7sus4b9") then  leixing='7sus4b9'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='7sus4b9'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "7#5#9") then  leixing='7#5#9'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='7#5#9'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "7#5b9") then  leixing='7#5b9'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='7#5b9'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "7#11") then  leixing='7#11'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='7#11'  Audition()  end   
  if reaper.ImGui_Button(ctx, "7add11") then  leixing='7add11'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='7add11'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "7add13") then  leixing='7add13'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='7add13'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "7b5#9") then  leixing='7b5#9'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='M7#5'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "7b5b9") then  leixing='7b5b9'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='7b5b9'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "Maj7#11") then  leixing='Maj7#11'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='Maj7#11'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "Maj7add13") then  leixing='Maj7add13'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='Maj7add13'  Audition()  end   
  if reaper.ImGui_Button(ctx, "m7add11") then  leixing='m7add11'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='m7add11'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "m7add13") then  leixing='m7add13'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='m7add13'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "9") then  leixing='9'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='9'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "m9") then  leixing='m9'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='m9'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "Maj9") then  leixing='Maj9'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='Maj9'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "9#11") then  leixing='9#11'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='9#11'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "9#5") then  leixing='9#5'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='9#5'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "9b13") then  leixing='9b13'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='9b13'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "9b5") then  leixing='9b5'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='9b5'  Audition()  end  
  if reaper.ImGui_Button(ctx, "9sus4") then  leixing='9sus4'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='9sus4'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "Maj9#11") then  leixing='Maj9#11'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='Maj9#11'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "Maj9#5") then  leixing='Maj9#5'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='Maj9#5'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "Maj9sus4") then  leixing='Maj9sus4'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='Maj9sus4'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "m9b5") then  leixing='m9b5'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='m9b5'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "11") then  leixing='11'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='11'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "Maj11") then  leixing='Maj11'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='Maj11'  Audition()  end   
  if reaper.ImGui_Button(ctx, "m11") then  leixing='m11'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='m11'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "11b9") then  leixing='11b9'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='11b9'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "13") then  leixing='13'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='13'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "Maj13") then  leixing='Maj13'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='Maj13'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "m13") then  leixing='m13'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='m13'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "13#9") then  leixing='13#9'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='13#9'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "13b9") then  leixing='13b9'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='13b9'  Audition()  end    reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "13b5b9") then  leixing='13b5b9'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='13b5b9'  Audition()  end   
  if reaper.ImGui_Button(ctx, "mMaj11") then  leixing='mMaj11'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='mMaj11'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "mMaj13") then  leixing='mMaj13'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='mMaj13'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "mMaj7add11") then  leixing='mMaj7add11'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='mMaj7add11'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "mMaj7add13") then  leixing='mMaj7add13'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='mMaj7add13'  Audition()  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "mMaj9") then  leixing='mMaj9'  chordin()  flag=false  end  
  if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='mMaj9'  Audition()  end   
  reaper.ImGui_Text(ctx, '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
  if reaper.ImGui_Button(ctx, "Chord Note To Lyrics") then  chordtolyrics() flag=false  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "Chord Note Series To Lyrics") then  chordtolyrics_series() flag=false  end   
  if reaper.ImGui_Button(ctx, "Lyrics To Track") then  LyricsToChordTrack() flag=false  end   reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "Lyrics To region") then  LyricsToregion() flag=false  end    reaper.ImGui_SameLine(ctx)
  if reaper.ImGui_Button(ctx, "Lyrics To Note") then    LyricsToNote() flag=false   end 
  if reaper.ImGui_Button(ctx, "Help") then  reaper.MB(help,'Help',0)  end
  
  retval = reaper.ImGui_IsKeyPressed(ctx, 27, nil)
  if retval then  flag=false end

     reaper.ImGui_End(ctx)
 end

 if open and flag then
    reaper.defer(loop)
  else
    reaper.ImGui_DestroyContext(ctx)
    reaper.SN_FocusMIDIEditor()
  end
end

reaper.defer(loop)


