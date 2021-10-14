--[[
 * ReaScript Name: 切换音符行隐藏状态
 * Version: 1.0
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

local take=reaper.MIDIEditor_GetTake(editor)
name_id= reaper.NamedCommandLookup('_RS7d3c_2649e8023b477ff29db58385b58a086acf8cab97')

integer = reaper.GetToggleCommandStateEx(32060, 40453)

if integer==0 then 
reaper.MIDIEditor_OnCommand(editor,40453)
reaper.SetToggleCommandState(32060,name_id,1)
else
reaper.MIDIEditor_OnCommand(editor,40452)
reaper.SetToggleCommandState(32060,name_id,-1)
end
reaper.RefreshToolbar2(32060, name_id)

