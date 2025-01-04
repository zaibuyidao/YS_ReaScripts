--[[
 * ReaScript Name: drums 分轨
 * Version: 1.0.2
 * Author: YS
 * Repository URI: https://github.com/zaibuyidao/YS_ReaScripts
 * provides: [main=midi_editor] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-10-14)
  + Initial release
--]]

reaper.PreventUIRefresh(1)
editor = reaper.MIDIEditor_GetActive()

take = reaper.MIDIEditor_GetTake(editor)
SelEvtsidx = reaper.MIDI_EnumSelEvts(take, -1)
if SelEvtsidx == -1 then
    Track = reaper.GetMediaItemTake_Track(take)
    ret, TrackName = reaper.GetTrackName(Track)
    reaper.MB('当前激活轨 ' .. TrackName .. ' 没有数据被选中!', '错误', 0)
    reaper.SN_FocusMIDIEditor()
    return
end
reaper.Undo_BeginBlock()
item = reaper.GetMediaItemTake_Item(take)
st = reaper.GetMediaItemInfo_Value(item, 'D_POSITION')
lenth = reaper.GetMediaItemInfo_Value(item, 'D_LENGTH')

triangle = reaper.GetToggleCommandStateEx(32060, 40448)

reaper.MIDIEditor_OnCommand(editor, 40440) -- move F7
reaper.MIDIEditor_OnCommand(editor, 40012) -- cut

reaper.Main_OnCommand(40769, 0) -- no select all
reaper.SetMediaItemSelected(item, true)
reaper.Main_OnCommand(reaper.NamedCommandLookup("_SWS_SELTRKWITEM"), 0) -- select track
reaper.Main_OnCommand(40062, 0) -- copy track
reaper.Main_OnCommand(reaper.NamedCommandLookup("_SWS_DELALLITEMS"), 0) -- delete all item
track2 = reaper.GetSelectedTrack(0, 0)
reaper.CreateNewMIDIItemInProj(track2, st, st + lenth, false)
reaper.MIDIEditor_OnCommand(editor, 40835) -- next track midi
reaper.MIDIEditor_OnCommand(editor, 40011) -- paste

if triangle == 1 then
    reaper.MIDIEditor_OnCommand(editor, 40448) -- drum mode
else
    reaper.MIDIEditor_OnCommand(editor, 40449) -- normal mode
end

reaper.CreateNewMIDIItemInProj(track2, 0, 0.00001, false)
reaper.MIDIEditor_OnCommand(editor, 40834) -- previos item
take = reaper.MIDIEditor_GetTake(editor)
reaper.MIDI_InsertEvt(take, false, false, 0, string.char(0xFF, 0x21, 0x01, 0x00))

reaper.Main_OnCommand(reaper.NamedCommandLookup("_RSef1aec96f066dc8e49b748c76d569a141369e1fb"), 0) -- rename
--reaper.Main_OnCommand(reaper.NamedCommandLookup("_XENAKIOS_RENAMETRAXDLG"), 0) -- rename
reaper.MIDIEditor_OnCommand(editor, 40836) -- up track midi 
-- reaper.Main_OnCommand(40418, 0) -- up track
reaper.PreventUIRefresh(-1)
reaper.SN_FocusMIDIEditor()
reaper.Undo_EndBlock('手动分轨', -1)
