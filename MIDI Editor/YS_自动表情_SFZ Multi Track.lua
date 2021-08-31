--[[
 * ReaScript Name: 自动表情_SFZ Multi Track
 * Version: 1.0
 * Author: YS
 * provides: [main=midi_editor] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

retval, retvals_csv = reaper.GetUserInputs('自动表情 SFZ', 2, 'CC Min Val,CC Max Val', '70,127')
if  retval==false then reaper.SN_FocusMIDIEditor() return end
min,max=string.match(retvals_csv,"(%d+),(%d+)")
min=tonumber(min) max=tonumber(max) 
contselitem= reaper.CountSelectedMediaItems(0)
selitem = 0
while selitem < contselitem do
MediaItem = reaper.GetSelectedMediaItem(0, selitem)
selitem = selitem + 1
take = reaper.GetTake(MediaItem, 0)
if reaper.TakeIsMIDI(take) then
reaper.MIDI_DisableSort(take)
-------------
noteidx=-1
retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
ccevtcnt=ccevtcnt-1
selidx=reaper.MIDI_EnumSelNotes(take,noteidx)
    while selidx~=-1 do
          retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take,  selidx)
          notelen= endppqpos - startppqpos

          if notelen >= 240 then 
          reaper.MIDI_InsertCC(take, false, false, startppqpos, 176, 0, 11, max)
          ccevtcnt=ccevtcnt+1
          reaper.MIDI_SetCCShape(take, ccevtcnt, 2, 1, false)
          reaper.MIDI_InsertCC(take, false, false, startppqpos+(notelen*0.18), 176, 0, 11, min)
          ccevtcnt=ccevtcnt+1
          reaper.MIDI_SetCCShape(take, ccevtcnt, 5, 0.3, false)
          reaper.MIDI_InsertCC(take, false, false, startppqpos+(notelen*0.9), 176, 0, 11, max)
          ccevtcnt=ccevtcnt+1
          end
         noteidx=selidx
          selidx=reaper.MIDI_EnumSelNotes(take,noteidx)
    end -- while end
reaper.MIDI_Sort(take)
end  --take midi
end -- while item end
reaper.SN_FocusMIDIEditor()
