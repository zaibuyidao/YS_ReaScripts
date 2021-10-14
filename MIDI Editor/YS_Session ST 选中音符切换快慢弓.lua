--[[
 * ReaScript Name: Session ST 选中音符切换快慢弓
 * Version: 1.0
 * Author: YS
 * Repository URI: https://github.com/zaibuyidao/YS_ReaScripts
 * provides: [main=main,midi_editor] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-10-14)
  + Initial release
--]]

contselitem= reaper.CountSelectedMediaItems(0)
selitem = 0
while selitem < contselitem do
MediaItem = reaper.GetSelectedMediaItem(0, selitem)
selitem = selitem + 1
take = reaper.GetTake(MediaItem, 0)

reaper.MIDI_DisableSort(take)

idxnote=-1
jihao=-1
repeat
idx=reaper.MIDI_EnumSelNotes(take, idxnote)
if idx~=-1 then
retval, selected, muted, startppqpos, endppqpos, chan,pitch, vel = reaper.MIDI_GetNote(take, idx)
sttime = reaper.MIDI_GetProjTimeFromPPQPos(take, startppqpos)
endtime = reaper.MIDI_GetProjTimeFromPPQPos(take, endppqpos)
drtime=endtime - sttime
if drtime < 0.65 and jihao~=0
then reaper.MIDI_InsertNote(take, false, false, startppqpos-10, startppqpos+50, chan, 4,30, false)
jihao=0
end
if drtime >= 0.65 and jihao~=1
then reaper.MIDI_InsertNote(take, false, false, startppqpos-10, startppqpos+50, chan, 0,30, false)
 jihao=1
end
end --if -1 end
idxnote=idx
  idx=reaper.MIDI_EnumSelNotes(take, idxnote)
until idx==-1
reaper.MIDI_Sort(take)

end -- while item end
