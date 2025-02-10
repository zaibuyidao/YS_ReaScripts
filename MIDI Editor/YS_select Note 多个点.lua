--[[
 * ReaScript Name: select Note 多个点
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

retval, shuzhi = reaper.GetUserInputs('选择音符多个点', 4, 'Tick1,Tick2,Tick3,Tick4', '-1,-1,-1,-1')
if retval then
    Tick1, Tick2, Tick3, Tick4 = string.match(shuzhi, "(-?%d+),(-?%d+),(-?%d+),(-?%d+)")
    Tick1 = tonumber(Tick1)
    if not Tick1 then
        Tick1 = -1
    end
    Tick2 = tonumber(Tick2)
    if not Tick2 then
        Tick2 = -1
    end
    Tick3 = tonumber(Tick3)
    if not Tick3 then
        Tick3 = -1
    end
    Tick4 = tonumber(Tick4)
    if not Tick4 then
        Tick4 = -1
    end

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
            
            ProjTime = reaper.MIDI_GetProjTimeFromPPQPos(take, startppqpos)
            
            for i, v in ipairs(TimeSig) do
                if ProjTime >= v.st_time and ProjTime < v.end_time then
                    beat_tick = TIMEBASE * 4 / v.denom
                end
            end

            tick = math.modf((tick_m % beat_tick) / 1)

            if tick == Tick1 or tick == Tick2 or tick == Tick3 or tick == Tick4 then
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
    reaper.Undo_EndBlock('选择音符多个点', -1)

end -- getinput

reaper.PreventUIRefresh(-1)
reaper.SN_FocusMIDIEditor()

