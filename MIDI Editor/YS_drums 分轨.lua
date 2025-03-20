--[[
 * ReaScript Name: drums 分轨
 * Version: 1.0.3
 * Author: YS
 * provides: [main=midi_editor] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-10-14)
  + Initial release
--]]

editor = reaper.MIDIEditor_GetActive()
take = reaper.MIDIEditor_GetTake(editor)

function getnotename()
    local pitchnum = 0
    local temppitch = -1
    local noteidx = -1
    noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
    while noteidx ~= -1 do
        retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
        if pitch ~= temppitch then
            pitchnum = pitchnum + 1
        end
        if pitchnum > 1 then
            return
        end
        temppitch = pitch
        noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
    end
    if pitchnum == 1 then
        track = reaper.GetMediaItemTake_Track(take)
        MIDINoteName = reaper.GetTrackMIDINoteNameEx(0, track, pitch, -1)
        if MIDINoteName and MIDINoteName ~= '' then
            MIDINoteName = string.upper(MIDINoteName)
        end
    end
end
getnotename()

reaper.PreventUIRefresh(1)

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

reaper.CreateNewMIDIItemInProj(track2, 0, 0.001, false)
reaper.MIDIEditor_OnCommand(editor, 40834) -- previos item
take = reaper.MIDIEditor_GetTake(editor)
reaper.MIDI_InsertEvt(take, false, false, 0, string.char(0xFF, 0x21, 0x01, 0x00))

function getsettrackinfo()
    MediaTrack = reaper.GetSelectedTrack(0, 0)
    retval, tk_name = reaper.GetSetMediaTrackInfo_String(MediaTrack, 'P_NAME', '', false)
    tk_name = string.gsub(tk_name, '\'', '\a')
    num = reaper.GetMediaTrackInfo_Value(MediaTrack, 'I_MIDIHWOUT')
    if num == -1 then
        port = 0
        chan = 0
    else
        port = math.modf(num / 32) + 1
        chan = math.fmod(num, 32)
        chan = string.match(chan, '%d+')
    end
    if MIDINoteName then
        tk_name = tk_name .. ' ' .. MIDINoteName
    end
    msg = tk_name .. ',' .. port .. ',' .. chan
    bl, input = reaper.GetUserInputs('修改轨道信息', 3,
        'Track Name 轨道名称:,Track Midi Port 端口:,Track Midi Channel 通道 :,extrawidth=200', msg)
    if bl == false then
        reaper.SN_FocusMIDIEditor()
        return
    end
    idx = string.find(input, ',', 1)
    name_in = string.sub(input, 0, idx - 1)
    name_in = string.gsub(name_in, '\a', '\'')
    reaper.GetSetMediaTrackInfo_String(MediaTrack, 'P_NAME', name_in, true)
    input2 = string.sub(input, idx + 1)
    port_new, chan_new = string.match(input2, '(%d+),(%d+)')
    port_new = tonumber(port_new) - 1
    if port_new > 15 then
        port_new = 15
    end
    chan_new = tonumber(chan_new)
    if chan_new > 16 then
        chan_new = 16
    end
    num_new = port_new * 32 + chan_new
    reaper.SetMediaTrackInfo_Value(MediaTrack, 'I_MIDIHWOUT', num_new)
end
getsettrackinfo()

reaper.MIDIEditor_OnCommand(editor, 40836) -- up track midi 
-- reaper.Main_OnCommand(40418, 0) -- up track
reaper.PreventUIRefresh(-1)
reaper.SN_FocusMIDIEditor()
reaper.Undo_EndBlock('手动分轨', -1)
