--[[
 * ReaScript Name: A.G 吉他和弦建立 V2
 * Version: 1.0.3
 * Author: YS
 * provides: [main=midi_editor] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

leixing_tb={}
leixing_tb['m']=0 leixing_tb['m7']=0 leixing_tb['7']=0 leixing_tb['7M']=0 leixing_tb['sus4']=0 
leixing_tb['sus2']=0 leixing_tb['dim']=0 leixing_tb['aug']=0 

key={}
key[0]='C' key[1]='Db' key[2]='D' key[3]='Eb' key[4]='E' key[5]='F' key[6]='Gb' key[7]='G'
key[8]='Ab' key[9]='A' key[10]='Bb' key[11]='B'
chord = {}
-- Maj
chord['C']='0,48,52,55,60,64'  chord['Db']='0,49,56,61,65,68'  chord['D']='0,0,50,57,62,66'
chord['Eb']='0,51,58,63,67,70' chord['E']='40,47,52,56,59,64' chord['F']='41,48,53,57,60,65'
chord['Gb']='42,49,54,58,61,66' chord['G']='43,50,55,59,62,67' chord['Ab']='44,51,56,60,63,68'
chord['A']='0,45,52,57,61,64' chord['Bb']='0,46,53,58,62,65' chord['B']='0,47,54,59,63,66' 
-- min
chord['Cm']='0,48,55,60,63,67'  chord['Dbm']='0,49,56,61,64,68'  chord['Dm']='0,0,50,57,62,65'
chord['Ebm']='0,51,58,63,66,70' chord['Em']='40,47,52,55,59,64' chord['Fm']='41,48,53,56,60,65'
chord['Gbm']='42,49,54,57,61,66' chord['Gm']='43,50,55,58,62,67' chord['Abm']='44,51,56,59,63,68'
chord['Am']='0,45,52,57,60,64' chord['Bbm']='0,46,53,58,61,65' chord['Bm']='0,47,54,59,62,66' 
-- sus4
chord['Csus4']='0,48,55,60,65,67'  chord['Dbsus4']='0,49,56,61,66,68'  chord['Dsus4']='0,50,57,62,67,69'
chord['Ebsus4']='0,51,58,63,68,70' chord['Esus4']='40,47,52,57,59,64' chord['Fsus4']='41,48,53,58,60,65'
chord['Gbsus4']='42,49,54,59,61,66' chord['Gsus4']='43,50,55,60,62,67' chord['Absus4']='44,51,56,61,63,68'
chord['Asus4']='0,45,52,57,62,64' chord['Bbsus4']='0,46,53,58,63,65' chord['Bsus4']='0,47,54,59,64,66' 
-- m7
chord['Cm7']='0,48,55,58,63,67'  chord['Dbm7']='0,49,52,56,59,64'  chord['Dm7']='0,0,50,57,60,65'
chord['Ebm7']='0,0,51,58,61,66' chord['Em7']='40,47,50,55,59,64' chord['Fm7']='41,48,51,56,60,65'
chord['Gbm7']='42,49,52,57,61,66' chord['Gm7']='43,50,53,58,62,67' chord['Abm7']='44,51,54,59,63,68'
chord['Am7']='0,45,52,55,60,64' chord['Bbm7']='0,46,53,56,61,65' chord['Bm7']='0,47,54,57,62,66' 
-- 7
chord['C7']='0,48,55,58,64,67'  chord['Db7']='0,49,56,59,65,68'  chord['D7']='0,0,50,57,60,66'
chord['Eb7']='0,0,51,58,61,67' chord['E7']='40,47,50,56,59,64' chord['F7']='41,48,51,57,60,65'
chord['Gb7']='42,49,52,58,61,66' chord['G7']='43,50,53,59,62,67' chord['Ab7']='44,51,54,60,63,68'
chord['A7']='0,45,52,55,61,64' chord['Bb7']='0,46,53,56,62,65' chord['B7']='0,47,54,57,63,66' 
-- 7M
chord['C7M']='0,48,52,55,59,64'  chord['Db7M']='0,49,53,56,60,65'  chord['D7M']='0,0,50,57,61,66'
chord['Eb7M']='0,0,51,58,62,67' chord['E7M']='40,47,51,56,59,64' chord['F7M']='0,0,53,57,60,64'
chord['Gb7M']='0,0,54,58,61,65' chord['G7M']='43,47,50,55,59,66' chord['Ab7M']='0,0,56,60,63,67'
chord['A7M']='0,45,52,56,61,64' chord['Bb7M']='0,46,53,57,62,65' chord['B7M']='0,47,54,58,63,66' 
-- sus2
chord['Csus2']='0,48,55,60,62,67'  chord['Dbsus2']='0,49,56,61,63,68'  chord['Dsus2']='0,0,50,57,62,64'
chord['Ebsus2']='0,0,51,58,63,65' chord['Esus2']='40,47,52,59,64,66' chord['Fsus2']='0,0,53,60,65,67'
chord['Gbsus2']='0,0,54,61,66,68' chord['Gsus2']='0,0,55,62,67,69' chord['Absus2']='0,0,56,63,68,70'
chord['Asus2']='0,45,52,57,59,64' chord['Bbsus2']='0,46,53,58,60,65' chord['Bsus2']='0,47,54,59,61,66' 
-- dim
chord['Cdim']='0,48,51,57,60,66'  chord['Dbdim']='0,49,52,58,61,67'  chord['Ddim']='0,0,50,56,59,65'
chord['Ebdim']='0,0,51,57,60,66' chord['Edim']='40,46,52,55,61,64' chord['Fdim']='0,0,53,59,62,68'
chord['Gbdim']='0,0,54,60,63,69' chord['Gdim']='0,0,55,61,64,70' chord['Abdim']='44,47,50,56,59,65'
chord['Adim']='0,45,51,57,60,66' chord['Bbdim']='0,46,52,55,61,64' chord['Bdim']='0,47,50,56,59,65'
-- aug
chord['Caug']='0,48,52,56,60,64'  chord['Dbaug']='0,49,53,57,61,65'  chord['Daug']='0,0,50,58,62,66'
chord['Ebaug']='0,0,51,55,59,67' chord['Eaug']='40,48,52,56,60,64' chord['Faug']='0,0,53,57,61,65'
chord['Gbaug']='0,0,54,58,62,66' chord['Gaug']='43,47,51,55,59,67' chord['Abaug']='0,44,48,52,56,60'
chord['Aaug']='0,45,53,57,61,65' chord['Bbaug']='0,46,50,58,62,66' chord['Baug']='0,47,51,55,59,67'
-- 9
chord['C9']='0,48,50,55,64,70'  chord['Db9']='0,49,53,59,63,68'  chord['D9']='0,50,54,57,60,64'
chord['Eb9']='0,51,55,58,61,65' chord['E9']='40,47,50,56,59,66' chord['F9']='41,45,51,55,60,67'
chord['Gb9']='42,49,52,58,61,68' chord['G9']='43,45,50,55,59,65' chord['Ab9']='44,51,54,60,63,70'
chord['A9']='0,45,55,59,61,64' chord['Bb9']='46,53,56,62,65,72' chord['B9']='47,49,54,59,63,69'
-- m9
chord['Cm9']='0,48,50,55,63,70'  chord['Dbm9']='0,0,49,52,59,63'  chord['Dm9']='0,50,57,60,64,65'
chord['Ebm9']='0,51,54,61,65,70' chord['Em9']='40,47,50,55,59,66' chord['Fm9']='41,48,51,56,60,67'
chord['Gbm9']='42,45,52,56,61,64' chord['Gm9']='43,50,53,58,62,69' chord['Abm9']='44,51,54,59,63,70'
chord['Am9']='0,45,55,59,60,64' chord['Bbm9']='46,53,56,61,65,72' chord['Bm9']='47,54,57,62,66,73'
-- Maj9
chord['CMaj9']='0,48,50,55,59,64'  chord['DbMaj9']='0,49,51,56,60,65'  chord['DMaj9']='0,50,57,61,64,66'
chord['EbMaj9']='0,51,53,58,62,67' chord['EMaj9']='40,51,54,59,63,68' chord['FMaj9']='41,45,52,55,60,64'
chord['GbMaj9']='0,54,56,61,65,70' chord['GMaj9']='43,45,50,55,59,66' chord['AbMaj9']='0,56,58,63,67,72'
chord['AMaj9']='0,45,52,59,61,68' chord['BbMaj9']='0,46,50,57,60,65' chord['BMaj9']='47,49,54,59,63,70'
-- 7-5
chord['C7-5']='0,48,54,58,60,64'  chord['Db7-5']='0,49,53,55,59,65'  chord['D7-5']='0,0,50,56,60,66'
chord['Eb7-5']='0,0,51,57,61,67' chord['E7-5']='40,46,50,56,62,64' chord['F7-5']='0,41,47,51,57,59'
chord['Gb7-5']='0,0,54,58,60,64' chord['G7-5']='0,0,55,61,65,71' chord['Ab7-5']='0,0,56,62,66,72'
chord['A7-5']='0,45,51,55,61,67' chord['Bb7-5']='0,46,50,56,62,64' chord['B7-5']='0,47,51,57,59,65'
-- m7-5
chord['Cm7-5']='0,48,51,58,60,66'  chord['Dbm7-5']='0,49,52,55,59,64'  chord['Dm7-5']='0,0,50,56,60,65'
chord['Ebm7-5']='0,0,51,57,61,66' chord['Em7-5']='40,46,50,55,62,64' chord['Fm7-5']='41,47,51,56,63,65'
chord['Gbm7-5']='42,48,52,57,64,66' chord['Gm7-5']='43,49,53,58,65,67' chord['Abm7-5']='44,50,54,59,66,68'
chord['Am7-5']='0,45,51,55,60,67' chord['Bbm7-5']='0,46,52,56,61,64' chord['Bm7-5']='0,47,50,57,59,65'


function chordin()

local editor=reaper.MIDIEditor_GetActive()

local take=reaper.MIDIEditor_GetTake(editor)

reaper.MIDI_DisableSort(take)

idx=-1
repeat
 integer = reaper.MIDI_EnumSelNotes(take, idx)
 if integer ~= -1 then
 retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
 reaper.MIDI_DeleteNote(take, integer)
 pitch_key=(pitch-capo) % 12
 pitch_key = key[pitch_key]..leixing
 notetb=chord[pitch_key]
 n1,n2,n3,n4,n5,n6=string.match(notetb,"(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)")
if n1~='0' then  reaper.MIDI_InsertNote(take, false, false, startppqpos, endppqpos, chan, n1+capo, vel, false) end
if n2~='0' then  reaper.MIDI_InsertNote(take, false, false, startppqpos, endppqpos, chan, n2+capo, vel, false) end
if n3~='0' then  reaper.MIDI_InsertNote(take, false, false, startppqpos, endppqpos, chan, n3+capo, vel, false) end
if n4~='0' then  reaper.MIDI_InsertNote(take, false, false, startppqpos, endppqpos, chan, n4+capo, vel, false) end
if n5~='0' then  reaper.MIDI_InsertNote(take, false, false, startppqpos, endppqpos, chan, n5+capo, vel, false) end
if n6~='0' then  reaper.MIDI_InsertNote(take, false, false, startppqpos, endppqpos, chan, n6+capo, vel, false) end

  end
 integer = reaper.MIDI_EnumSelNotes(take, idx)
 until integer==-1

reaper.MIDI_Sort(take)

reaper.SN_FocusMIDIEditor()

end -- function 

capo = reaper.GetExtState('A.G CHORD', 'capo')
if capo=='' then capo=0 else capo=tonumber(capo) end

------------------------------------------------------
function Audition()
reaper.Main_OnCommand(reaper.NamedCommandLookup('_BR_SAVE_SOLO_MUTE_ALL_TRACKS_SLOT_1'),0)
reaper.Main_OnCommand(40340,0) --unsolo all track
local editor=reaper.MIDIEditor_GetActive()
local take=reaper.MIDIEditor_GetTake(editor)
integer = reaper.MIDI_EnumSelNotes(take, -1)
 if integer ~= -1 then
 retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
 pitch_key=(pitch-capo) % 12
 pitch_key = key[pitch_key]..leixing
 notetb=chord[pitch_key]
 n1,n2,n3,n4,n5,n6=string.match(notetb,"(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)")

 if n1~='0' then  
 local yanchi=os.clock()
 while os.clock() - yanchi < 0.08 do end
 reaper.StuffMIDIMessage(0, 144,n1+capo,vel)
 end
 if n2~='0' then  
 local yanchi=os.clock()
 while os.clock() - yanchi < 0.08 do end
 reaper.StuffMIDIMessage(0, 144,n2+capo,vel)
 end
 if n3~='0' then  
 local yanchi=os.clock()
 while os.clock() - yanchi < 0.08 do end
 reaper.StuffMIDIMessage(0, 144,n3+capo,vel)
 end
 if n4~='0' then  
 local yanchi=os.clock()
 while os.clock() - yanchi < 0.08 do end
 reaper.StuffMIDIMessage(0, 144,n4+capo,vel)
 end
 if n5~='0' then  
 local yanchi=os.clock()
 while os.clock() - yanchi < 0.08 do end
 reaper.StuffMIDIMessage(0, 144,n5+capo,vel)
 end
 if n6~='0' then 
 local yanchi=os.clock()
 while os.clock() - yanchi < 0.08 do end
 reaper.StuffMIDIMessage(0, 144,n6+capo,vel)
 end
 local yanchi=os.clock()
 while os.clock() - yanchi < 0.3 do end
 --reaper.MIDIEditor_OnCommand(editor,40435)
 reaper.StuffMIDIMessage(0, 176,120,0)

 end -- integer ~= -1
reaper.Main_OnCommand(reaper.NamedCommandLookup('_BR_RESTORE_SOLO_MUTE_ALL_TRACKS_SLOT_1'), 0)

end  --function end
-------------------------------------------------
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
  reaper.TrackCtl_SetToolTip('              提示！\n当前轨道录音监听已打开，全部MIDI输入全部通道！', 500, 400, true)
 end
end --recst end
recst()
----------------------------------------------------------------

local ctx = reaper.ImGui_CreateContext('A.G CHORD')
x,y=reaper.GetMousePosition()
reaper.ImGui_SetNextWindowSize(ctx, 270, 100)
  reaper.ImGui_SetNextWindowPos(ctx, x, y)
flag=true
function loop()
  local visible, open = reaper.ImGui_Begin(ctx, 'A.Guitar Chord ~ Right audition', true)
  if visible then

 if reaper.ImGui_Button(ctx,'Maj') then leixing=''  chordin()  flag=false end  
 if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing=''  Audition()  end reaper.ImGui_SameLine(ctx)
 if reaper.ImGui_Button(ctx,'Min') then leixing='m' chordin() flag=false end   
 if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='m'  Audition()  end reaper.ImGui_SameLine(ctx)
 if reaper.ImGui_Button(ctx,'m7') then leixing='m7' chordin() flag=false end
 if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='m7'  Audition()  end reaper.ImGui_SameLine(ctx)
 if reaper.ImGui_Button(ctx,'7') then leixing='7' chordin() flag=false end
 if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='7'  Audition()  end reaper.ImGui_SameLine(ctx)
 if reaper.ImGui_Button(ctx,'Maj7') then leixing='7M'  chordin() flag=false end
 if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='7M'  Audition()  end reaper.ImGui_SameLine(ctx)
 if reaper.ImGui_Button(ctx,'sus4') then leixing='sus4' chordin() flag=false end
 if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='sus4'  Audition()  end reaper.ImGui_SameLine(ctx)
 if reaper.ImGui_Button(ctx,'sus2') then leixing='sus2' chordin() flag=false end
 if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='sus2'  Audition()  end 
 if reaper.ImGui_Button(ctx,'Dim') then leixing='dim' chordin() flag=false end
 if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='dim'  Audition()  end reaper.ImGui_SameLine(ctx)
 if reaper.ImGui_Button(ctx,'Aug') then leixing='aug' chordin() flag=false end
 if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='aug'  Audition()  end reaper.ImGui_SameLine(ctx)
 if reaper.ImGui_Button(ctx,'9') then leixing='9' chordin() flag=false end
 if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='9'  Audition()  end reaper.ImGui_SameLine(ctx)
 if reaper.ImGui_Button(ctx,'m9') then leixing='m9' chordin() flag=false end
 if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='m9'  Audition()  end reaper.ImGui_SameLine(ctx)
 if reaper.ImGui_Button(ctx,'Maj9') then leixing='Maj9' chordin() flag=false end
 if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='Maj9'  Audition()  end reaper.ImGui_SameLine(ctx)
 if reaper.ImGui_Button(ctx,'7-5') then leixing='7-5' chordin() flag=false end
 if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='7-5'  Audition()  end reaper.ImGui_SameLine(ctx)
 if reaper.ImGui_Button(ctx,'m7-5') then leixing='m7-5' chordin() flag=false end
 if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then  leixing='m7-5'  Audition()  end 
 
    retval, capo= reaper.ImGui_SliderInt(ctx, 'capo', capo, -2, 11, nil,nil)
    retval = reaper.ImGui_IsKeyPressed(ctx, 27, nil)
    if retval then  flag=false end
    reaper.ImGui_End(ctx)
 end

  if open and flag then
    reaper.defer(loop)
  else
    reaper.SetExtState('A.G CHORD', 'capo', capo, true)
    reaper.ImGui_DestroyContext(ctx)
    reaper.SN_FocusMIDIEditor()
  end
end

reaper.defer(loop)


