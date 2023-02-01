--[[
 * ReaScript Name: slide Right 10 tick_Multi Track
 * Version: 1.1.1
 * Author: YS
 * provides: [main=midi_editor] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

local editor = reaper.MIDIEditor_GetActive()

edit_count = 0
function OverNoteFix2()
    note_tb = {}
    ret, trackname = reaper.GetTrackName(reaper.GetMediaItemTake_Track(take))
    retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
    noteidx = 0
    while noteidx < notecnt do
        retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
        if note_tb[pitch] ~= nil then
            tempidx, temp_endpos = string.match(note_tb[pitch], '(%d+),(%d+%.0)')
            tempidx = tonumber(tempidx)
            temp_endpos = tonumber(temp_endpos)
            if startppqpos < temp_endpos then
                reaper.TrackCtl_SetToolTip('发现重叠音符正在处理！',50,0,true)
                reaper.MIDI_SetNote(take, tempidx, NULL, NULL, NULL, startppqpos, NULL, NULL, NULL, true) -- MIDI sort
                edit_count = edit_count + 1
                retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
            end
        end
        note_tb[pitch] = noteidx .. ',' .. endppqpos
        noteidx = noteidx + 1
    end

end -- function end

takeindex = 0
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take~=nil do

selidx = reaper.MIDI_EnumSelEvts(take , -1)
if selidx ~= -1 then
reaper.Undo_BeginBlock()
reaper.MIDI_DisableSort(take)

got_all_ok, midi_string = reaper.MIDI_GetAllEvts(take, "")
if not got_all_ok then reaper.ShowMessageBox("加载MIDI时出错", "错误", 0) return end
midi_len = midi_string:len() -- 或 midi_len = #midi_string
string_pos = 1 -- 解析事件时在 midi_string 中的位置
table_events = {} -- 初始化表
while string_pos < midi_len - 12 do -- 解析 midi_string 中的所有事件，最后12个字节除外，这将提供REAPER的All-notes-off end-of-take消息
offset, flags, msg, string_pos = string.unpack("i4Bs4", midi_string, string_pos) -- 在 stringPos 上解压 MIDI 字符串
-- local MIDIlen = midi_string:len()
-- local channel = msg:byte(1)&0x0F
-- local pitch   = msg:byte(2) -- 音高
-- local velocity= msg:byte(3) -- 力度
new_offset = 10
if flags&1 == 1 then
    
    table.insert(table_events, string.pack("i4Bs4", offset+new_offset, flags, msg)) -- 移动音符 10 tick
    table.insert(table_events, string.pack("i4Bs4", -new_offset, 0, "")) -- 在 Note on Event 之后放置一个空事件，以保持距离
    else
    table.insert(table_events, string.pack("i4Bs4", offset, flags, msg))
end
end
reaper.MIDI_SetAllEvts(take, table.concat(table_events) .. midi_string:sub(-12))

reaper.MIDIEditor_OnCommand(editor , 40659) -- fix overnote
selidx = reaper.MIDI_EnumSelNotes(take , -1)
  selnoteidx = reaper.MIDI_EnumSelNotes(take , -1)
  if selnoteidx ~= -1 then
   OverNoteFix2()
   end
 
reaper.MIDI_Sort(take)
end

takeindex=takeindex+1
take=reaper.MIDIEditor_EnumTakes(editor, takeindex, true)

end -- while take end

reaper.Undo_EndBlock('Slide Right 10 tick',-1)


reaper.SN_FocusMIDIEditor()





