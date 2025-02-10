--[[
 * ReaScript Name: select Note V2
 * Version: 1.0
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2025-2-10)
  + Initial release
--]]

integer = reaper.CountTempoTimeSigMarkers(0)
TimeSig = {}
markeridx = 0
presigtime = nil
while markeridx < integer do
    _, timepos, _, _, _, timesig_num, timesig_denom, _ = reaper.GetTempoTimeSigMarker(0, markeridx)
    if timesig_denom ~= -1 then
        if presigtime then
            table.insert(TimeSig, {
                denom = pre_denom,
                st_time = presigtime,
                end_time = timepos
            })
        end
        presigtime = timepos
        pre_denom = timesig_denom
    end
    markeridx = markeridx + 1
end
table.insert(TimeSig, {
    denom = pre_denom,
    st_time = presigtime,
    end_time = reaper.GetProjectLength(0)
})

-- By Ys
reaper.PreventUIRefresh(1)

local editor = reaper.MIDIEditor_GetActive()
take = reaper.MIDIEditor_GetTake(editor)
QN1 = reaper.MIDI_GetPPQPosFromProjQN(take, 0)
QN2 = reaper.MIDI_GetPPQPosFromProjQN(take, 1)
TIMEBASE = QN2 - QN1
Tick_Max = TIMEBASE - 1
Tick_Max = string.format('%d', Tick_Max)

retval, shuzhi = reaper.GetUserInputs('Select Note', 8,
    'Tick Min,Tick Max,Beat Min 起始拍,Beat Max 结束拍,Duration Min 最小长度,Duration Max 最大长度,Vel Min 最小力度,Vel Max 最大力度',
    '0,' .. Tick_Max .. ',1,16,0,57600,0,127')
if retval then
    Tmin_sub, Tmax_sub, Bmin_sub, Bmax_sub, Dmin_sub, Dmax_sub, Vmin_sub, Vmax_sub = string.match(shuzhi,
        "(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)")
    Tmin = tonumber(Tmin_sub)
    Tmax = tonumber(Tmax_sub)
    Bmin = tonumber(Bmin_sub)
    Bmax = tonumber(Bmax_sub)
    Dmin = tonumber(Dmin_sub)
    Dmax = tonumber(Dmax_sub)
    Vmin = tonumber(Vmin_sub)
    Vmax = tonumber(Vmax_sub)
    Bmin = Bmin - 1
    Bmax = Bmax

    reaper.Undo_BeginBlock()
    takeindex = 0
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    while take ~= nil do

        idx = -1
        selidx = {}

        reaper.MIDI_DisableSort(take)

        repeat

            integer = reaper.MIDI_EnumSelNotes(take, idx)

            if integer == -1 then
                break
            end

            retval, sel, mute, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)

            tick_m = startppqpos - reaper.MIDI_GetPPQPos_StartOfMeasure(take, startppqpos) + 0.5

            dur = endppqpos - startppqpos

            ProjTime = reaper.MIDI_GetProjTimeFromPPQPos(take, startppqpos)

            for i, v in ipairs(TimeSig) do
                if ProjTime >= v.st_time and ProjTime < v.end_time then
                    beat_tick = TIMEBASE * 4 / v.denom
                end
            end

            tick = math.modf((tick_m % beat_tick) / 1)

            if (tick_m >= Bmin * beat_tick and tick_m < Bmax * beat_tick) and (tick >= Tmin and tick <= Tmax) and (dur >= Dmin and dur <= Dmax) and
                (vel <= Vmax and vel >= Vmin) then
                table.insert(selidx, integer)
            end

            idx = integer

        until (integer == -1)

        reaper.MIDI_SelectAll(take, false)

        for i, v in ipairs(selidx) do
            reaper.MIDI_SetNote(take, v, true, NULL, NULL, NULL, NULL, NULL, NULL, false)
        end

        reaper.MIDI_Sort(take)

        takeindex = takeindex + 1
        take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)

    end -- while take end

    take = reaper.MIDIEditor_GetTake(editor)
    reaper.MarkTrackItemsDirty(reaper.GetMediaItemTake_Track(take), reaper.GetMediaItemTake_Item(take))
    reaper.Undo_EndBlock('选择音符过滤', -1)

end -- getinput

reaper.PreventUIRefresh(-1)
reaper.SN_FocusMIDIEditor()

