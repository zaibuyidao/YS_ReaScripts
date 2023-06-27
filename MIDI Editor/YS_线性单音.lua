--[[
 * ReaScript Name: 线性单音
 * Version: 1.0
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2023-6-27)
  + Initial release
--]]

local editor = reaper.MIDIEditor_GetActive()

local take = reaper.MIDIEditor_GetTake(editor)

notepitch = {}
tempst = -1
tempidx = -1
temppitch = -1
noteidx = {}
notenumber = 0
dubnote = 1
maxdub = 0
deletenote = 0

reaper.MIDI_DisableSort(take)
idx = -1
idx = reaper.MIDI_EnumSelNotes(take, idx)
while idx ~= -1 do
    retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, idx)
    if notepitch[pitch] == nil then
        notepitch[pitch] = pitch
    end
    if startppqpos == tempst then
        dubnote = dubnote + 1
    else
        dubnote = 1
        tempst = startppqpos
    end
    if maxdub < dubnote then
        maxdub = dubnote
    end
    idx = reaper.MIDI_EnumSelNotes(take, idx)
    notenumber = notenumber + 1
end
reaper.MIDI_Sort(take)
if maxdub > 2 then
    reaper.MB('重叠的音符数量大于 2', '错误', 0)
    reaper.SN_FocusMIDIEditor()
    return
end
if maxdub == 1 then
    reaper.MB('选中的音符是单音演奏，不需要处理。', '错误', 0)
    reaper.SN_FocusMIDIEditor()
    return
end
if notenumber < 5 then
    reaper.MB('选中的音符数量太少！', '提醒', 0)
    reaper.SN_FocusMIDIEditor()
    return
end
notekeylist = '当前音高:'
for i, v in pairs(notepitch) do
    notekeylist = notekeylist .. v .. ' '
end
ret, csv = reaper.GetUserInputs('输入要删除的音高,可输入多个', 1, notekeylist, '0')
if ret == false then
    reaper.SN_FocusMIDIEditor()
    return
end
notekey_tb = {}
for word in string.gmatch(csv, "%d+") do
    word = tonumber(word)
    notekey_tb[word] = word
end
for i, v in pairs(notekey_tb) do
    if notepitch[v] == nil then
        reaper.MB('输入音高不在所选音符范围', '错误', 0)
        reaper.SN_FocusMIDIEditor()
        return
    end
end

tempst = -1
reaper.MIDI_DisableSort(take)
idx = -1
idx = reaper.MIDI_EnumSelNotes(take, idx)
while idx ~= -1 do
    retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, idx)
    if startppqpos == tempst then
        if notekey_tb[pitch]  then
            table.insert(noteidx, idx)
        end
        if notekey_tb[temppitch]  then
            table.insert(noteidx, tempidx)
        end
    end
    tempst = startppqpos
    tempidx = idx
    temppitch = pitch
    idx = reaper.MIDI_EnumSelNotes(take, idx)
end

reaper.MIDI_SelectAll(take, false)

deletenote = #noteidx
for i, v in ipairs(noteidx) do
    reaper.MIDI_SetNote(take, v, true, NULL, NULL, NULL, NULL, NULL, NULL, false)
end

reaper.MIDI_Sort(take)

reaper.MIDIEditor_OnCommand(editor, 40667)

reaper.MB('有 ' .. deletenote .. ' 个音符被删除!', '提醒', 0)

reaper.SN_FocusMIDIEditor()
