-- @description 插入一组 NRPN
-- @version 1.0
-- @author YS
-- @changelog New Script
-- @provides [main=midi_editor] .

local editor = reaper.MIDIEditor_GetActive()
local take = reaper.MIDIEditor_GetTake(editor)
local retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
Pitch = -1
for ccidx = 0, ccevtcnt - 1 do
    local retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
    if chanmsg == 176 and msg2 == 99 and msg3 == 24 then
        Pitch = ppqpos
    end
    if chanmsg == 176 and msg2 == 99 and msg3 == 26 then
        Level = ppqpos
    end
    if chanmsg == 176 and msg2 == 99 and msg3 == 28 then
        Pan = ppqpos
    end
    if chanmsg == 176 and msg2 == 99 and msg3 == 29 then
        Reverb = ppqpos
    end
end
if Level == nil or Pan == nil or Reverb == nil then
    reaper.MB('模版数据不规范！', '错误', 0)
    reaper.SN_FocusMIDIEditor()
    return
end
for ccidx = 0, ccevtcnt - 1 do
    local retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
    --[[if chanmsg == 176  then
        if ppqpos > Pitch and (Level - ppqpos) >= 30 then
            Pitchinsert = ppqpos + 10
        end
        if (Level - ppqpos) > 0 and (Level - ppqpos) < 30 then
            reaper.MB('Pitch 没有足够的间隔插入', '错误', 0)
            return
        end
    end 
    if Pitchinsert == nil then Pitchinsert = Pitch + 10 end  --]]

    if chanmsg == 176 then
        if ppqpos > Level and (Pan - ppqpos) >= 30 then
            Levelinsert = ppqpos + 10
        end
        if (Pan - ppqpos) > 0 and (Pan - ppqpos) < 30 then
            reaper.MB('Level 没有足够的间隔插入！', '错误', 0)
            reaper.SN_FocusMIDIEditor()
            return
        end
    end
    if Levelinsert == nil then
        Levelinsert = Level + 10
    end

    if chanmsg == 176 then
        if ppqpos > Pan and (Reverb - ppqpos) >= 30 then
            Paninsert = ppqpos + 10
        end
        if (Reverb - ppqpos) > 0 and (Reverb - ppqpos) < 30 then
            reaper.MB('Pan 没有足够的间隔插入！', '错误', 0)
            reaper.SN_FocusMIDIEditor()
            return
        end
    end
    if Paninsert == nil then
        Paninsert = Pan + 10
    end

    if chanmsg == 176 then
        if ppqpos > Reverb then
            Reverbinsert = ppqpos + 10
        end
    end
    if Reverbinsert == nil then
        Reverbinsert = Reverb + 10
    end
end

ret, csv = reaper.GetUserInputs('插入一组NRPN', 4, '键号 :,Level :,Pan :,Reverb :', '-1,100,64,40')
if not ret then
    reaper.SN_FocusMIDIEditor()
    return
end
key, input_level, input_pan, input_reverb = string.match(csv, '(-?%d+),(%d+),(%d+),(%d+)')
if key == nil or input_level == nil or input_pan == nil or input_reverb == nil then
    reaper.MB('输入非法\n' .. csv, '错误', 0)
    reaper.SN_FocusMIDIEditor()
    return
end
key = tonumber(key)
if key < 0 or key > 127 then
    reaper.TrackCtl_SetToolTip('输入非法 Note Pitch = ' .. key, 0, 0, true)
    reaper.SN_FocusMIDIEditor()
    return
end
reaper.Undo_BeginBlock()
reaper.MIDI_SelectAll(take, false)
input_level = tonumber(input_level)
input_pan = tonumber(input_pan)
input_reverb = tonumber(input_reverb)
reaper.MIDI_InsertCC(take, true, false, Levelinsert, 176, 0, 98, key)
reaper.MIDI_InsertCC(take, true, false, Levelinsert + 10, 176, 0, 6, input_level)
reaper.MIDI_InsertCC(take, true, false, Paninsert, 176, 0, 98, key)
reaper.MIDI_InsertCC(take, true, false, Paninsert + 10, 176, 0, 6, input_pan)
reaper.MIDI_InsertCC(take, true, false, Reverbinsert, 176, 0, 98, key)
reaper.MIDI_InsertCC(take, true, false, Reverbinsert + 10, 176, 0, 6, input_reverb)

reaper.MarkTrackItemsDirty(reaper.GetMediaItemTake_Track(take), reaper.GetMediaItemTake_Item(take))
reaper.SN_FocusMIDIEditor()
reaper.Undo_EndBlock('插入一组NRPN, Note Pitch：' .. key, -1)

