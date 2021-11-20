--[[
 * ReaScript Name: Chord Tools
 * Version: 1.0.2
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
chord['m7-5']='3,6,10,0,0,0'
chord['sus2']='2,7,0,0,0,0'
chord['Dim7']='3,6,9,0,0,0'
chord['mM7']='3,7,11,0,0,0'
chord['m']='3,7,0,0,0,0'
chord['6']='4,7,9,0,0,0'
chord['9']='4,7,10,14,0,0'
chord['Maj9']='4,7,11,14,0,0'
chord['add2']='2,4,7,0,0,0'
chord['madd2']='2,3,7,0,0,0'
chord['7#9']='4,7,10,15,0,0'
chord['sus4']='5,7,0,0,0,0'
chord['m6']='3,7,9,0,0,0'
chord['m9']='3,7,10,14,0,0'
chord['7sus4']='5,7,10,0,0,0'
chord['7sus2']='2,7,10,0,0,0'
chord['j5']='4,6,0,0,0,0'
chord['M7#5']='4,8,11,0,0,0'
chord['dim']='3,6,0,0,0,0'
chord['7']='4,7,10,0,0,0'
chord['7-5']='4,6,10,0,0,0'
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


help='和弦输入必须是原位的完整和弦音，可以根据所选音符作为根音用脚本写入，也可以手动写入，根音不要低于Key48。目前只支持列表中的和弦类型。和弦之间最小间隔为八分音符。\n\n转位根音请写在Key48键号以下（C3 or C4）。\n\nChord Note To Lyrics 需要读取调号标记，第一个标记放在工程头部，格式为 Key=** ，必须写自然大调，中途变调的地方在小节头写入同样的格式。'

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
function inkeymark()
tb_mark={} 
tb_mark['a']='A' tb_mark['b']='B' tb_mark['c']='C' 
tb_mark['d']='D' tb_mark['e']='E' tb_mark['f']='F' tb_mark['g']='G' 
tb_mark['ab']='Ab' tb_mark['g#']='Ab' tb_mark['bb']='Bb' tb_mark['a#']='Bb'
tb_mark['db']='C#' tb_mark['c#']='C#' tb_mark['d#']='Eb' 
tb_mark['eb']='Eb' tb_mark['gb']='F#' tb_mark['f#']='F#'
pos=0
--pos=reaper.GetCursorPosition()
retval, name=reaper.GetUserInputs('请输入正确的调号！',1,'                                           Key= ','')
if retval==false then return end
name_low = string.lower(name)
if tb_mark[name_low]==nil then reaper.MB('调号错误请重新输入！','',0) return end
key=tb_mark[name_low]
reaper.AddProjectMarker2(0, false, pos, -1, 'Key='..key, -1, 33521664)
end

------------------------------------------------------------------------------
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
repeat 
m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
name_low = string.lower(name)
if key_list[name_low] ~= nil then 
marklist[tbi]=name_low 
marktick = reaper.MIDI_GetPPQPosFromProjTime(take, pos)
ticklist[tbi]=marktick
tbi=tbi+1 end

midx = midx + 1 
until m_retval == 0
if ticklist[1]==nil or pos~=0  then  
getMB=reaper.ShowMessageBox('没有找到 Key=* 标签或者首标签不在工程最前面！\n请创建Key=（大调）标记在工程头或者转调小节处！\n点 确定 创建Key标记在工程最前面！', '错误！',1)  
if getMB==1 then inkeymark() end
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
chordtype[4330]='m7b5' chordtype[34340]='M9' chordtype[3250]='7sus4' chordtype[3330]='dim7' 
chordtype[520]='sus2' chordtype[3220]='add2' chordtype[3520]='7sus2' chordtype[2440]='aug7'
chordtype[3330]='dim7' chordtype[4120]='madd2' chordtype[240]='-5'  chordtype[52340]='69'
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
    reaper.ShowMessageBox('和弦间隔小于 240 tick 在第 '..measures..' 小节，请修正以后重新运行脚本！', '出错啦!',0) 
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
  reaper.ShowMessageBox('转位音等于根音 在第 '..measures..' 小节，请删除转位音以后重新运行脚本！', '出错啦!',0) 
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
   reaper.ShowMessageBox('有无法识别的和弦排列在第 '..measures..' 小节，请修正以后重新运行脚本！', '出错啦!',0) 
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
reaper.TrackCtl_SetToolTip('         恭喜！\n和弦标记全部写入！', 500, 400, true)  end

end --while end
end --ticklist end

reaper.MIDI_Sort(take)
reaper.MIDIEditor_OnCommand(editor, 40370)
reaper.SN_FocusMIDIEditor()

end --chordtolyrics
---------------------------------------------------------------------------

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

local ctx = reaper.ImGui_CreateContext('Chord Tools')
x,y=reaper.GetMousePosition()
reaper.ImGui_SetNextWindowSize(ctx, 610, 215)
  reaper.ImGui_SetNextWindowPos(ctx, x, y)
flag=true
function loop()
  local visible, open = reaper.ImGui_Begin(ctx, 'Chord Tools', true)
  if visible then
    Maj=reaper.ImGui_Button(ctx,'Maj')     reaper.ImGui_SameLine(ctx)
    Min=reaper.ImGui_Button(ctx,'Min')      reaper.ImGui_SameLine(ctx)
    sus4=reaper.ImGui_Button(ctx,'sus4')        reaper.ImGui_SameLine(ctx)
     sus2=reaper.ImGui_Button(ctx,'sus2')       reaper.ImGui_SameLine(ctx)
    Dim=reaper.ImGui_Button(ctx,'Dim')    reaper.ImGui_SameLine(ctx)
    Aug=reaper.ImGui_Button(ctx,'Aug')       reaper.ImGui_SameLine(ctx)
    _6=reaper.ImGui_Button(ctx,'6')      reaper.ImGui_SameLine(ctx)
    m6=reaper.ImGui_Button(ctx,'m6')      reaper.ImGui_SameLine(ctx)
    _69=reaper.ImGui_Button(ctx,'69')      reaper.ImGui_SameLine(ctx)
    _6sus4=reaper.ImGui_Button(ctx,'6sus4')     reaper.ImGui_SameLine(ctx)
    m6add9=reaper.ImGui_Button(ctx,'m6add9')     reaper.ImGui_SameLine(ctx)
    add2=reaper.ImGui_Button(ctx,'add2')      reaper.ImGui_SameLine(ctx)
    madd2=reaper.ImGui_Button(ctx,'madd2')      reaper.ImGui_SameLine(ctx)
    j5=reaper.ImGui_Button(ctx,'-5')    
   m7=reaper.ImGui_Button(ctx,'m7')      reaper.ImGui_SameLine(ctx)
    _7=reaper.ImGui_Button(ctx,'7')      reaper.ImGui_SameLine(ctx)
    Maj7=reaper.ImGui_Button(ctx,'Maj7')          reaper.ImGui_SameLine(ctx)
     Dim7=reaper.ImGui_Button(ctx,'Dim7')      reaper.ImGui_SameLine(ctx)
     mM7=reaper.ImGui_Button(ctx,'mM7')      reaper.ImGui_SameLine(ctx)
     _7j5=reaper.ImGui_Button(ctx,'7-5')      reaper.ImGui_SameLine(ctx)
     _7s5=reaper.ImGui_Button(ctx,'7#5')     reaper.ImGui_SameLine(ctx)
     m7j5=reaper.ImGui_Button(ctx,'m7-5')      reaper.ImGui_SameLine(ctx)
    _7sus4=reaper.ImGui_Button(ctx,'7sus4')      reaper.ImGui_SameLine(ctx)
    _7sus2=reaper.ImGui_Button(ctx,'7sus2')      reaper.ImGui_SameLine(ctx)
     M7s5=reaper.ImGui_Button(ctx,'M7#5')      reaper.ImGui_SameLine(ctx)
    Aug7=reaper.ImGui_Button(ctx,'Aug7')       reaper.ImGui_SameLine(ctx)
    _7s9=reaper.ImGui_Button(ctx,'7#9')      reaper.ImGui_SameLine(ctx)
    _7b9=reaper.ImGui_Button(ctx,'7b9')     
    Maj7b5=reaper.ImGui_Button(ctx,'Maj7b5')     reaper.ImGui_SameLine(ctx)
    m7b9=reaper.ImGui_Button(ctx,'m7b9')    reaper.ImGui_SameLine(ctx)
    _7sus4b9=reaper.ImGui_Button(ctx,'7sus4b9')     reaper.ImGui_SameLine(ctx)
    _7s5s9=reaper.ImGui_Button(ctx,'7#5#9')     reaper.ImGui_SameLine(ctx)
    _7s5b9=reaper.ImGui_Button(ctx,'7#5b9')     reaper.ImGui_SameLine(ctx)
    _7s11=reaper.ImGui_Button(ctx,'7#11')     reaper.ImGui_SameLine(ctx)
    _7add11=reaper.ImGui_Button(ctx,'7add11')   reaper.ImGui_SameLine(ctx)
    _7add13=reaper.ImGui_Button(ctx,'7add13')     reaper.ImGui_SameLine(ctx)
    _7b5s9=reaper.ImGui_Button(ctx,'7b5#9')     reaper.ImGui_SameLine(ctx)
    _7b5b9=reaper.ImGui_Button(ctx,'7b5b9')     reaper.ImGui_SameLine(ctx)
    Maj7s11=reaper.ImGui_Button(ctx,'Maj7#11')     
    Maj7add13=reaper.ImGui_Button(ctx,'Maj7add13')     reaper.ImGui_SameLine(ctx)
    m7add11=reaper.ImGui_Button(ctx,'m7add11')     reaper.ImGui_SameLine(ctx)
    m7add13=reaper.ImGui_Button(ctx,'m7add13')     reaper.ImGui_SameLine(ctx)
     _9=reaper.ImGui_Button(ctx,'9')      reaper.ImGui_SameLine(ctx)
     m9=reaper.ImGui_Button(ctx,'m9')      reaper.ImGui_SameLine(ctx)
     Maj9=reaper.ImGui_Button(ctx,'Maj9')      reaper.ImGui_SameLine(ctx)
     _9s11=reaper.ImGui_Button(ctx,'9#11')     reaper.ImGui_SameLine(ctx)
     _9s5=reaper.ImGui_Button(ctx,'9#5')     reaper.ImGui_SameLine(ctx)
     _9b13=reaper.ImGui_Button(ctx,'9b13')     reaper.ImGui_SameLine(ctx)
     _9b5=reaper.ImGui_Button(ctx,'9b5')     reaper.ImGui_SameLine(ctx)
     _9sus4=reaper.ImGui_Button(ctx,'9sus4')     reaper.ImGui_SameLine(ctx)
     Maj9s11=reaper.ImGui_Button(ctx,'Maj9#11')     
     Maj9s5=reaper.ImGui_Button(ctx,'Maj9#5')     reaper.ImGui_SameLine(ctx)
     Maj9sus4=reaper.ImGui_Button(ctx,'Maj9sus4')     reaper.ImGui_SameLine(ctx)
     m9b5=reaper.ImGui_Button(ctx,'m9b5')     reaper.ImGui_SameLine(ctx)
     _11=reaper.ImGui_Button(ctx,'11')      reaper.ImGui_SameLine(ctx)
     Maj11=reaper.ImGui_Button(ctx,'Maj11')     reaper.ImGui_SameLine(ctx)
     m11=reaper.ImGui_Button(ctx,'m11')      reaper.ImGui_SameLine(ctx)
     _11b9=reaper.ImGui_Button(ctx,'11b9')     reaper.ImGui_SameLine(ctx)
     _13=reaper.ImGui_Button(ctx,'13')      reaper.ImGui_SameLine(ctx)
     Maj13=reaper.ImGui_Button(ctx,'Maj13')     reaper.ImGui_SameLine(ctx)
     m13=reaper.ImGui_Button(ctx,'m13')     reaper.ImGui_SameLine(ctx)
   _13s9=reaper.ImGui_Button(ctx,'13#9')     reaper.ImGui_SameLine(ctx)
   _13b5b9=reaper.ImGui_Button(ctx,'13b5b9')     reaper.ImGui_SameLine(ctx)
   _13b9=reaper.ImGui_Button(ctx,'13b9')     
   mMaj11=reaper.ImGui_Button(ctx,'mMaj11')     reaper.ImGui_SameLine(ctx)
   mMaj13=reaper.ImGui_Button(ctx,'mMaj13')     reaper.ImGui_SameLine(ctx)
   mMaj7add11=reaper.ImGui_Button(ctx,'mMaj7add11')     reaper.ImGui_SameLine(ctx)
   mMaj7add13=reaper.ImGui_Button(ctx,'mMaj7add13')     reaper.ImGui_SameLine(ctx)
   mMaj9=reaper.ImGui_Button(ctx,'mMaj9')
   
    chord_to_lyrics=reaper.ImGui_Button(ctx,'Chord Note To Lyrics')
    reaper.ImGui_SameLine(ctx)
     Lyrics_To_Chord_Track=reaper.ImGui_Button(ctx,'Lyrics To Chord Track')
     reaper.ImGui_SameLine(ctx)
     Lyrics_To_region=reaper.ImGui_Button(ctx,'Lyrics To region')
     _Help=reaper.ImGui_Button(ctx,'Help') 
     
    reaper.ImGui_End(ctx)
 end
 if Maj then leixing='Maj'  chordin() flag=false end
 if Min then leixing='m' chordin() flag=false end
 if m7 then leixing='m7' chordin() flag=false end
 if _7 then leixing='7' chordin() flag=false end
 if Maj7 then leixing='Maj7'  chordin() flag=false end
 if sus4 then leixing='sus4' chordin() flag=false end
 if sus2 then leixing='sus2' chordin() flag=false end
 if Dim then leixing='dim' chordin() flag=false end
 if Aug then leixing='aug' chordin() flag=false end
 if _9 then leixing='9' chordin() flag=false end
 if m9 then leixing='m9' chordin() flag=false end
 if Maj9 then leixing='Maj9' chordin() flag=false end
 if _7j5 then leixing='7-5' chordin() flag=false end
 if m7j5 then leixing='m7-5' chordin() flag=false end
 if j5 then leixing='j5' chordin() flag=false end
 if Dim7 then leixing='Dim7' chordin() flag=false end
 if mM7 then leixing='mM7' chordin() flag=false end
 if _7sus4 then leixing='7sus4' chordin() flag=false end
 if _7sus2 then leixing='7sus2' chordin() flag=false end
 if M7s5 then leixing='M7#5' chordin() flag=false end
 if Aug7 then leixing='Aug7' chordin() flag=false end
 if _6 then leixing='6' chordin() flag=false end
 if add2 then leixing='add2' chordin() flag=false end
 if madd2 then leixing='madd2' chordin() flag=false end
 if _7s9 then leixing='7#9' chordin() flag=false end
 if m6 then leixing='m6' chordin() flag=false end
 if _69 then leixing='69' chordin() flag=false end
 if _7b9 then leixing='7b9' chordin() flag=false end
 if _11 then leixing='11' chordin() flag=false end
 if m11 then leixing='m11' chordin() flag=false end
 if _13 then leixing='13' chordin() flag=false end
 if _7sus4b9  then leixing='7sus4b9' chordin() flag=false end
 if _11b9  then leixing='11b9' chordin() flag=false end
 if _13s9  then leixing='13#9' chordin() flag=false end
 if _13b5b9  then leixing='13b5b9' chordin() flag=false end
 if _13b9  then leixing='13b9' chordin() flag=false end
 if _6sus4  then leixing='6sus4' chordin() flag=false end
 if _7s11 then leixing='7#11' chordin() flag=false end
 if _7s5 then leixing='7#5' chordin() flag=false end
 if _7s5s9 then leixing='7#5#9' chordin() flag=false end
 if _7s5b9 then leixing='7#5b9' chordin() flag=false end
 if _7add11 then leixing='7add11' chordin() flag=false end
 if _7add13 then leixing='7add13' chordin() flag=false end
 if _7b5s9 then leixing='7b5#9' chordin() flag=false end
 if _7b5b9 then leixing='7b5b9' chordin() flag=false end
 if _9s11 then leixing='9#11' chordin() flag=false end
 if _9s5 then leixing='9#5' chordin() flag=false end
 if _9b13 then leixing='9b13' chordin() flag=false end
 if _9b5 then leixing='9b5' chordin() flag=false end
 if _9sus4 then leixing='9sus4' chordin() flag=false end
 if Maj11 then leixing='Maj11' chordin() flag=false end
 if Maj13 then leixing='Maj13' chordin() flag=false end
 if Maj7s11 then leixing='Maj7#11' chordin() flag=false end
 if Maj7add13 then leixing='Maj7add13' chordin() flag=false end
 if Maj7b5 then leixing='Maj7b5' chordin() flag=false end
 if Maj9 then leixing='Maj9' chordin() flag=false end
 if Maj9s11 then leixing='Maj9#11' chordin() flag=false end
 if Maj9s5 then leixing='Maj9#5' chordin() flag=false end
 if Maj9sus4 then leixing='Maj9sus4' chordin() flag=false end
 if m13 then leixing='m13' chordin() flag=false end
 if m6add9 then leixing='m6add9' chordin() flag=false end
 if m7add11 then leixing='m7add11' chordin() flag=false end
 if m7add13 then leixing='m7add13' chordin() flag=false end
 if m7b9 then leixing='m7b9' chordin() flag=false end
 if m9b5 then leixing='m9b5' chordin() flag=false end
 if mMaj11 then leixing='mMaj11' chordin() flag=false end
 if mMaj13 then leixing='mMaj13' chordin() flag=false end
 if mMaj7add11 then leixing='mMaj7add11' chordin() flag=false end
 if mMaj7add13 then leixing='mMaj7add13' chordin() flag=false end
 if mMaj9 then leixing='mMaj9' chordin() flag=false end
 
 if chord_to_lyrics then  chordtolyrics() flag=false end
 if Lyrics_To_Chord_Track then  LyricsToChordTrack() flag=false end
 if Lyrics_To_region then  LyricsToregion() flag=false end
 if _Help then  reaper.MB(help,'Help',0)  end
 retval = reaper.ImGui_IsKeyPressed(ctx, 27, nil)
 if retval then  flag=false end
  
  if open and flag then
    reaper.defer(loop)
  else
    reaper.ImGui_DestroyContext(ctx)
    reaper.SN_FocusMIDIEditor()
  end
end

reaper.defer(loop)
