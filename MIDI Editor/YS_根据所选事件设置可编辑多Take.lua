--[[
 * ReaScript Name: 根据所选事件设置可编辑多Take
 * Version: 1.0
 * Author: YS
 * provides: [main=midi_editor] .
--]]

--[[
 * Changelog:
 * v1.0 (2022-1-15)
  + Initial release
--]]

reaper.Undo_BeginBlock()
reaper.PreventUIRefresh(1)
editor=reaper.MIDIEditor_GetActive()
oldtake=reaper.MIDIEditor_GetTake(editor)
olditem=reaper.GetMediaItemTake_Item(oldtake)
takeindex = 0 item_tb={}
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take~=nil do
if reaper.MIDI_EnumSelEvts(take, -1)~=-1 then
edittake=take
edititem=reaper.GetMediaItemTake_Item(take)
table.insert(item_tb,edititem)
end
takeindex=takeindex+1
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
end -- while take end
 if #item_tb==0 then return end
 
 reaper.SelectAllMediaItems(0, false)
 for i, v in ipairs(item_tb) do
     reaper.SetMediaItemSelected(v, true)
 end      
 
 firstselitem=reaper.GetSelectedMediaItem(0,0)
 
 if olditem==firstselitem then
  reaper.MIDIEditor_OnCommand(editor,40794)
  end 
 
 reaper.Main_OnCommand(40153,0)

 reaper.PreventUIRefresh(-1)
 reaper.Undo_EndBlock('', 0)

  


