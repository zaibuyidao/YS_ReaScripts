--[[
 * ReaScript Name: 音符碎拨(mandolin，guitar..)
 * Version: 1.0
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2024-2-18)
  + Initial release
--]]

local editor = reaper.MIDIEditor_GetActive()

retval, userinput = reaper.GetUserInputs('音符碎拨技巧', 1, 'Split Ms (毫秒建议值 80-100)', '90')
if retval == false then
    reaper.SN_FocusMIDIEditor()
    return
end
note_ms = tonumber(userinput / 1000)
ms_buchang = {0.012, 0.009, 0.006, 0.003}

takeindex = 0
take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take ~= nil do

    reaper.MIDI_DisableSort(take)

    local idx = -1

    repeat

        integer = reaper.MIDI_EnumSelNotes(take, idx)

        bili = 0.85
        chazhi = 1 - bili

        retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)

        startppqpos_ms = reaper.MIDI_GetProjTimeFromPPQPos(take, startppqpos)

        endppqpos_ms = reaper.MIDI_GetProjTimeFromPPQPos(take, endppqpos)

        dur_ms = endppqpos_ms - startppqpos_ms

        vel2 = vel

        if dur_ms > note_ms + ms_buchang[1] then

            if dur_ms > note_ms * 4 then
                vel1 = math.floor(vel * bili)
            else
                vel1 = vel
            end
            noteend = reaper.MIDI_GetPPQPosFromProjTime(take, startppqpos_ms + note_ms + ms_buchang[1])

            reaper.MIDI_SetNote(take, integer, NULL, NULL, NULL, noteend-1, NULL, NULL, vel1, false)

            notestart_ms = startppqpos_ms + note_ms + ms_buchang[1]

            i = 2
            while notestart_ms < endppqpos_ms-0.003 do
                if ms_buchang[i] then
                    buchang2 = ms_buchang[i]
                else
                    buchang2 = 0
                end

                lastend_ms = notestart_ms + note_ms + buchang2
                if lastend_ms > endppqpos_ms then
                 if lastend_ms - endppqpos_ms > note_ms / 2 then
                        lastend = reaper.MIDI_GetPPQPosFromProjTime(take, endppqpos_ms)
                        retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
                        reaper.MIDI_SetNote(take, notecnt - 1, NULL, NULL, NULL, lastend, NULL, NULL, NULL, false)
                    else
                        lastend_ms = endppqpos_ms
                        lastend = reaper.MIDI_GetPPQPosFromProjTime(take, lastend_ms)
                    end
                else
                    lastend = reaper.MIDI_GetPPQPosFromProjTime(take, lastend_ms)
                end -- fangzhi yichu

                if dur_ms > note_ms * 4 then
                    bili = bili + chazhi / (1.97 ^ (i - 1))
                    vel2 = math.floor(vel * bili)
                end

                notestart = reaper.MIDI_GetPPQPosFromProjTime(take, notestart_ms)

                reaper.MIDI_InsertNote(take, false, muted, notestart, lastend-1, chan, pitch, vel2, false)
                i = i + 1

                notestart_ms = lastend_ms

            end -- while end
            bili = 0.8
            if dur_ms > note_ms * 12 then
                retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
                reaper.MIDI_SetNote(take, notecnt - 1, NULL, NULL, NULL, NULL, NULL, NULL, math.floor(vel * 0.85), false)
                reaper.MIDI_SetNote(take, notecnt - 2, NULL, NULL, NULL, NULL, NULL, NULL, math.floor(vel * 0.89), false)
                reaper.MIDI_SetNote(take, notecnt - 3, NULL, NULL, NULL, NULL, NULL, NULL, math.floor(vel * 0.92), false)
                reaper.MIDI_SetNote(take, notecnt - 4, NULL, NULL, NULL, NULL, NULL, NULL, math.floor(vel * 0.95), false)
                reaper.MIDI_SetNote(take, notecnt - 5, NULL, NULL, NULL, NULL, NULL, NULL, math.floor(vel * 0.97), false)
                reaper.MIDI_SetNote(take, notecnt - 6, NULL, NULL, NULL, NULL, NULL, NULL, math.floor(vel * 0.98), false)
            end
        end

        idx = integer

    until integer == -1

    reaper.MIDI_Sort(take)

    takeindex = takeindex + 1
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)

end -- while take end

x, y = reaper.GetMousePosition()
reaper.TrackCtl_SetToolTip('请手动处理乐句的起伏！', x, y - 30, true)

reaper.SN_FocusMIDIEditor()

