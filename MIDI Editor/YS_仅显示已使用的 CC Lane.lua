--[[
 * ReaScript Name: 仅显示已使用的 CC Lane
 * Version: 1.0
 * Author: YS
 * provides: [main=midi_editor] .
--]]

--[[
 * Changelog:
 * v1.0 (2022-12-6)
  + Initial release
--]]

function showAllCCLane()
    editor = reaper.MIDIEditor_GetActive()
    reaper.MIDIEditor_OnCommand(editor, reaper.NamedCommandLookup('_BR_ME_SHOW_USED_CC_14_BIT'))
    take = reaper.MIDIEditor_GetTake(editor)
    track = reaper.GetMediaItemTake_Track(take)
    retval, str = reaper.GetTrackStateChunk(track, '', false)
    str = string.gsub(str, 'VELLANE 129 (%d+) (%d+)', '')
    str = string.gsub(str, 'VELLANE 134 (%d+) (%d+)', '')
    reaper.SetTrackStateChunk(track, str, false)
end

showAllCCLane()

