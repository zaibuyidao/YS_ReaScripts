--[[
 * ReaScript Name: 选择音色信息后面相应数据分轨
 * Version: 1.0
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2022-1-15)
  + Initial release
--]]

editor=reaper.MIDIEditor_GetActive()
take=reaper.MIDIEditor_GetTake(editor)
reaper.MIDI_DisableSort(take)
flag=1
 retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
 evtcnt=notecnt*2+ccevtcnt+textsyxevtcnt
 evtidx=reaper.MIDI_EnumSelEvts(take, -1)

 retval, selected,muted, ppqpos, msg = reaper.MIDI_GetEvt(take, evtidx)
 kind=string.byte(msg,1) CCnum=string.byte(msg,2)
 if (kind>=176 and kind<=191) and CCnum==0 then lsb=string.byte(msg,3) 
 retval, selected,muted, ppqpos, msg = reaper.MIDI_GetEvt(take, evtidx+1) 
 kind=string.byte(msg,1) CCnum=string.byte(msg,2)
 if (kind>=176 and kind<=191) and CCnum==32 then msb=string.byte(msg,3) 
 retval, selected,muted, ppqpos, msg = reaper.MIDI_GetEvt(take, evtidx+2)
 kind=string.byte(msg,1) CCnum=string.byte(msg,2)
 if (kind>=192 and kind<=207)  then pc=string.byte(msg,2) 
 ins_1=lsb..','..msb..','..pc
 
 end end 
 else 
 reaper.MB('请选择音色信息！','错误！',0) reaper.SN_FocusMIDIEditor() return
 end
 while evtidx < evtcnt do
  retval, selected,muted, ppqpos, msg = reaper.MIDI_GetEvt(take, evtidx)
 kind=string.byte(msg,1) CCnum=string.byte(msg,2)
 if (kind>=176 and kind<=191) and CCnum==0 then lsb=string.byte(msg,3) 
 retval, selected,muted, ppqpos, msg = reaper.MIDI_GetEvt(take, evtidx+1) 
 kind=string.byte(msg,1) CCnum=string.byte(msg,2)
 if (kind>=176 and kind<=191) and CCnum==32 then msb=string.byte(msg,3) 
 retval, selected,muted, ppqpos, msg = reaper.MIDI_GetEvt(take, evtidx+2)
 kind=string.byte(msg,1) CCnum=string.byte(msg,2)
 if (kind>=192 and kind<=207)  then pc=string.byte(msg,2) 
 ins=lsb..','..msb..','..pc
 end end end
 if ins==ins_1 then flag=1 else flag=0 end
 if flag==1 then
 reaper.MIDI_SetEvt(take, evtidx, true, NULL, NULL, '', false)
 else
 reaper.MIDI_SetEvt(take, evtidx, false, NULL, NULL, '', false)
 end
   evtidx=evtidx+1
   end
reaper.MIDI_Sort(take)
--select evt
ret=reaper.MB('点 Yes 分轨，点 No 仅选中。','确认！',4)
if ret~=6 then reaper.SN_FocusMIDIEditor() return end

reaper.Undo_BeginBlock()
reaper.PreventUIRefresh(1)

item = reaper.GetMediaItemTake_Item(take)
track = reaper.GetMediaItemTrack(item)
st = reaper.GetMediaItemInfo_Value(item, 'D_POSITION')
lenth = reaper.GetMediaItemInfo_Value(item, 'D_LENGTH')

reaper.MIDIEditor_OnCommand(editor , 40440) -- move F7
reaper.MIDIEditor_OnCommand(editor , 40012) -- cut

reaper.Main_OnCommand(40769, 0) -- no select all
reaper.SetMediaItemSelected(item, true)
reaper.Main_OnCommand(reaper.NamedCommandLookup("_SWS_SELTRKWITEM"), 0) --select track
reaper.Main_OnCommand(40062, 0)  --copy track
reaper.Main_OnCommand(reaper.NamedCommandLookup("_SWS_DELALLITEMS"), 0) -- delete all item
track2 = reaper.GetSelectedTrack(0, 0)
reaper.CreateNewMIDIItemInProj(track2, st, st+lenth, false)
reaper.MIDIEditor_OnCommand(editor , 40835)  -- next track midi
reaper.MIDIEditor_OnCommand(editor , 40011) -- paste

reaper.CreateNewMIDIItemInProj(track2, 0, 0.00001, false)
reaper.MIDIEditor_OnCommand(editor , 40834) -- previos item
take=reaper.MIDIEditor_GetTake(editor)
reaper.MIDI_InsertEvt(take,false,false,0,string.char(0xFF,0x21,0x01,0x00))

reaper.Main_OnCommand(reaper.NamedCommandLookup("_XENAKIOS_RENAMETRAXDLG"), 0) -- rename
reaper.MIDIEditor_OnCommand(editor , 40836)  -- up track midi

reaper.PreventUIRefresh(-1)
reaper.Undo_EndBlock('descchange', 0)


