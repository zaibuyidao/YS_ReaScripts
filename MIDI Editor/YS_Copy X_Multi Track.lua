--[[
 * ReaScript Name: Copy X_Multi Track
 * Version: 1.1
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
local num=reaper.GetCursorPositionEx(0)
left=math.huge
right = -1

takeindex = 0
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take~=nil do

idx=-1
    
reaper.MIDI_DisableSort(take)
integer = reaper.MIDI_EnumSelEvts(take, idx)

while integer ~= -1 do

integer = reaper.MIDI_EnumSelEvts(take, idx)

retval, selected, muted, ppqpos, msg = reaper.MIDI_GetEvt(take, integer, true, false, -1, '')

if ppqpos <  left then left = ppqpos end
if ppqpos >  right then right = ppqpos end

idx=integer

integer = reaper.MIDI_EnumSelEvts(take, idx)

end -- while end

reaper.MIDI_Sort(take)

takeindex=takeindex+1
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
end -- while take end
-------------------------------------

takeindex = 0
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take~=nil do

pos=reaper.MIDI_GetPPQPosFromProjTime(take, num)
MediaItem= reaper.GetMediaItemTake_Item(take)
itemposition=reaper.GetMediaItemInfo_Value(MediaItem, 'D_POSITION')
itemlenth=reaper.GetMediaItemInfo_Value(MediaItem, 'D_LENGTH')
itemend = itemposition + itemlenth

idx=-1
    
reaper.MIDI_DisableSort(take)
integer = reaper.MIDI_EnumSelCC(take, idx)
retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
ccevtcnt = ccevtcnt - 1

while integer ~= -1 do

integer = reaper.MIDI_EnumSelCC(take, idx)

retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, integer)
retval, shape, beztension = reaper.MIDI_GetCCShape(take, integer)

newpos=reaper.MIDI_GetProjTimeFromPPQPos(take, ppqpos-left+pos)
if itemend < newpos then 
reaper.SetMediaItemLength(MediaItem, newpos-itemposition, true)
end
reaper.MIDI_InsertCC(take, false, false, ppqpos-left+pos, chanmsg, chan, msg2, msg3)
ccevtcnt= ccevtcnt + 1
reaper.MIDI_SetCCShape(take, ccevtcnt, shape, beztension, false)
idx=integer

integer = reaper.MIDI_EnumSelCC(take, idx)

end -- while end

reaper.MIDI_Sort(take)

--------------------------------------------------
idx=-1
    
reaper.MIDI_DisableSort(take)
integer = reaper.MIDI_EnumSelNotes(take, idx)

while integer ~= -1 do

integer = reaper.MIDI_EnumSelNotes(take, idx)

retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
newpos=reaper.MIDI_GetProjTimeFromPPQPos(take, endppqpos-left+pos)
if itemend < newpos then 
reaper.SetMediaItemLength(MediaItem, newpos-itemposition, true)
end

reaper.MIDI_InsertNote(take, false, false, startppqpos-left+pos, endppqpos-left+pos, chan, pitch, vel, false)

idx=integer

integer = reaper.MIDI_EnumSelNotes(take, idx)

end -- while end

reaper.MIDI_Sort(take)
--------------------------------------------
idx=-1
    
reaper.MIDI_DisableSort(take)
integer = reaper.MIDI_EnumSelTextSysexEvts(take, idx)

while integer ~= -1 do

integer = reaper.MIDI_EnumSelTextSysexEvts(take, idx)

retval, selected, muted, ppqpos, type_num, msg = reaper.MIDI_GetTextSysexEvt(take, integer, true, false, -1, -1, '')

newpos=reaper.MIDI_GetProjTimeFromPPQPos(take, ppqpos-left+pos)
if itemend < newpos then 
reaper.SetMediaItemLength(MediaItem, newpos-itemposition, true)
end
reaper.MIDI_InsertTextSysexEvt(take, false, false, ppqpos-left+pos, type_num, msg)

idx=integer

integer = reaper.MIDI_EnumSelTextSysexEvts(take, idx)

end -- while end

reaper.MIDI_Sort(take)

takeindex=takeindex+1
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
end -- while take end

--reaper.UpdateArrange()


