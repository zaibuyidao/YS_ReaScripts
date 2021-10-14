--[[
 * ReaScript Name: 全选当前激活片段所有事件
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

reaper.MIDIEditor_OnCommand(editor,40214)

reaper.MIDI_SelectAll(take, true)
