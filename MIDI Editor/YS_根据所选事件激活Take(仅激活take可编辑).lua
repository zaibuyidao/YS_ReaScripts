--[[
 * ReaScript Name: 根据所选事件激活Take(仅激活take可编辑)
 * Version: 1.0
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2022-1-3)
  + Initial release
--]]

reaper.Undo_BeginBlock()
reaper.PreventUIRefresh(1)
editor=reaper.MIDIEditor_GetActive()
oldtake=reaper.MIDIEditor_GetTake(editor)
olditem=reaper.GetMediaItemTake_Item(oldtake)
takeindex = 0
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take~=nil do
if reaper.MIDI_EnumSelEvts(take, -1)~=-1 then
edittake=take
editTK=reaper.GetMediaItemTake_Track(take)
edititem=reaper.GetMediaItemTake_Item(take)
end
takeindex=takeindex+1
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
end -- while take end
 if edititem==nil then return end
 if olditem==edititem then
  reaper.MIDIEditor_OnCommand(editor,40794)
  end
 reaper.SelectAllMediaItems(0, false)
 reaper.SetMediaItemSelected(edititem, true)
 reaper.Main_OnCommand(40153,0)
  retval, trackname = reaper.GetSetMediaTrackInfo_String(editTK, 'P_NAME', '', false)
 reaper.PreventUIRefresh(-1)
 reaper.Undo_EndBlock('', 0)

  


