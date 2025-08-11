--[[
 * ReaScript Name: strum-it_Up_Multi Track
 * Version: 1.1.2
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

local editor = reaper.MIDIEditor_GetActive()

retval, shuzhi = reaper.GetUserInputs('Strum it Up', 1, 'Strum Tick ', '3')
num_sub = string.match(shuzhi, "(%d+)")
num = tonumber(num_sub)
if retval and num then
    reaper.Undo_BeginBlock()
    takeindex = 0
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    while take ~= nil do
        notes = {}
        reaper.MIDI_DisableSort(take)
        idx = -1
        idx = reaper.MIDI_EnumSelNotes(take, idx)
        while idx ~= -1 do
            retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, idx)
            if notes[startppqpos] == nil then
                notes[startppqpos] = {}
                table.insert(notes[startppqpos], {
                    idx = idx,
                    notest = startppqpos,
                    noteend = endppqpos,
                    key = pitch
                })
            else
                table.insert(notes[startppqpos], {
                    idx = idx,
                    notest = startppqpos,
                    noteend = endppqpos,
                    key = pitch
                })
            end
            idx = reaper.MIDI_EnumSelNotes(take, idx)
        end
        for i, v in pairs(notes) do
            if #v > 1 then
                table.sort(v, function(a, b)
                    return a.key > b.key
                end)
                for ii, vv in ipairs(v) do
                    newst = vv.notest + ((ii - 1) * num)
                    if vv.noteend - newst < 10 then
                        newend = newst + 10
                    else
                        newend = vv.noteend
                    end
                    reaper.MIDI_SetNote(take, vv.idx, NULL, NULL, newst, newend, NULL, NULL, NULL, false)
                end
            end
        end

        reaper.MIDI_Sort(take)
        reaper.MarkTrackItemsDirty(reaper.GetMediaItemTake_Track(take), reaper.GetMediaItemTake_Item(take))
        takeindex = takeindex + 1
        take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)

    end -- while take end

end -- not 0 end

reaper.Undo_EndBlock('Strum-it Up', -1)

reaper.SN_FocusMIDIEditor()
