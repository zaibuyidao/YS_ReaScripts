--[[
 * ReaScript Name: 延音踏板CC64转音长
 * Version: 1.0
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2022-1-15)
  + Initial release
--]]

function endtime()
n_idx = reaper.MIDI_EnumSelNotes(take,-1)  
tbnote={}
repeat 
   retval, sel, mute, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, n_idx)
   if startppqpos < dur then
  if tbnote[pitch]~=nil  then 
  retval, sel, mute, startppqpos_old, endppqpos_old, chan, pitch, vel = reaper.MIDI_GetNote(take, tbnote[pitch])
  if sel then
  reaper.MIDI_SetNote(take, tbnote[pitch], false, false, NULL, startppqpos, NULL, NULL, NULL, false)
  end
  end
 tbnote[pitch]=n_idx
 end
n_idx = n_idx+1
retval, sel, mute, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, n_idx)
until startppqpos>=dur or retval==false
key=0
 while key < 128 do
    if tbnote[key]~=nil  then
    retval, sel, mute, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, tbnote[key])
    if sel then
    reaper.MIDI_SetNote(take, tbnote[key], false, false, NULL, dur, NULL, NULL, NULL, false)
    end  end
    key = key + 1
end 
end --function end

reaper.Undo_BeginBlock()
editor=reaper.MIDIEditor_GetActive()
take=reaper.MIDIEditor_GetTake(editor)
reaper.MIDI_DisableSort(take)
note_tb={}
noteidx=1
retval, selected, muted,startppqpos,endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx-1)
  while  retval do
  note_tb[noteidx]=endppqpos
  noteidx=noteidx+1
  retval, selected, muted,startppqpos,endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx-1)
  end
  reaper.MIDIEditor_OnCommand(editor,40214) --unselect all
  
  ccidx=0
  retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
  while  retval do
    if chanmsg==176 and msg2==64 then
    reaper.MIDI_SetCC(take,ccidx,true,NULL,NULL,NULL,NULL,NULL,NULL,false)
    end
    ccidx=ccidx+1
    retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
  end
  
  selccidx=-1
    integer=reaper.MIDI_EnumSelCC(take,  selccidx)
     while integer~=-1 do
    retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, integer)
       if msg3 <= 64 then
         dur=ppqpos
         if selccidx~=-1 then
         retval, selected, muted, ppqposbf, chanmsgbf, chanbf, msg2bf, msg3bf = reaper.MIDI_GetCC(take, selccidx)
            if msg3bf>64 then 
              for i, v in ipairs(note_tb) do
                  if v>ppqposbf and v<ppqpos then 
                  reaper.MIDI_SetNote(take, i-1, true, NULL, NULL, NULL, NULL, NULL, NULL, false)
                  end
              end 
            end
          end
          endtime()
       end
       
    selccidx=integer
    integer=reaper.MIDI_EnumSelCC(take,  selccidx)
    end
reaper.MIDI_Sort(take)

reaper.MIDIEditor_OnCommand(editor,40057) --mute cc64
reaper.MIDIEditor_OnCommand(editor,40214) --unselect all

reaper.Undo_EndBlock('',0)


