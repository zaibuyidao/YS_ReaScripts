--[[
 * ReaScript Name: 扫弦Tick重建
 * Version: 1.0.1
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

retval, shuzhi = reaper.GetUserInputs('扫弦 Tick 重建', 2, '输入新的 Tick 间隔,输入原 Tick 间隔最大值', '2,10')
new_sub, old_sub = string.match(shuzhi, "(%d+),(%d+)")
new = tonumber(new_sub)
old = tonumber(old_sub)

if retval then
    reaper.Undo_BeginBlock()

    takeindex = 0
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    while take ~= nil do

        reaper.MIDI_DisableSort(take)

        first = 0
        tempst, i, idx = -1, 1, -1
        integer = reaper.MIDI_EnumSelNotes(take, idx)

        while (integer ~= -1) do

            integer = reaper.MIDI_EnumSelNotes(take, idx)

            retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
            juli = startppqpos - tempst
            if juli <= old and juli > 0 then
                if endppqpos < first + (i * new) then
                    endppqpos = first + (i * new) + 1
                end
                reaper.MIDI_SetNote(take, integer, true, false, first + (i * new), endppqpos, NULL, NULL, NULL, false)
                i = i + 1
            else
                first = startppqpos
                i = 1
            end -- if end
            tempst = startppqpos

            idx = integer
        end -- while end
        
        OverNoteFix2()
        reaper.MIDI_Sort(take)
        
        takeindex = takeindex + 1
        take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    end -- while take end
end

reaper.Undo_EndBlock('tick重建',-1)

reaper.SN_FocusMIDIEditor()
