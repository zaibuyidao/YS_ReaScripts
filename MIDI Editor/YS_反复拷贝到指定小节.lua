--[[
 * ReaScript Name: 反复拷贝到指定小节
 * Version: 1.0
 * Author: YS
 * Repository URI: https://github.com/zaibuyidao/YS_ReaScripts
--]]

--[[
 * Changelog:
 * v1.0 (2021-10-14)
  + Initial release
--]]

local editor=reaper.MIDIEditor_GetActive()

local take=reaper.MIDIEditor_GetTake(editor)

reaper.Undo_BeginBlock()

reaper.PreventUIRefresh(1)

retval,xiaojieshu= reaper.GetUserInputs('反复拷贝到指定小节',1,'输入要复制到的小节数：','0') 

xiaojieshusub=tonumber (xiaojieshu)


reaper.MIDIEditor_OnCommand(editor, 40010) --copy

   num=reaper.GetCursorPositionEx(0)
   --hahahaha, measures, cml, fullbeats, cdenom = reaper.TimeMap2_timeToBeats(0, num)
   buf = reaper.format_timestr_pos(num, '', 2)
   a=string.match(buf,"%d+")
   measures=tonumber(a)

while  measures <= xiaojieshusub do 

reaper.MIDIEditor_OnCommand(editor, 40429)

   num=reaper.GetCursorPositionEx(0)
  -- hahahaha, measures, cml, fullbeats, cdenom = reaper.TimeMap2_timeToBeats(0, num)
   buf = reaper.format_timestr_pos(num, '', 2)
   a=string.match(buf,"%d+")
   measures=tonumber(a)
   end
reaper.Undo_EndBlock('', 0)

reaper.PreventUIRefresh(-1)

reaper.SN_FocusMIDIEditor()
