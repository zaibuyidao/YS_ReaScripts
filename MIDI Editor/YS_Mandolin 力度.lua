--[[
 * ReaScript Name: Mandolin 力度
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

local retval, shuzhi = reaper.GetUserInputs('Mandolin Vel', 2, '最大音符长度,力度增减值,', '80,-10')

if retval == false then return reaper.SN_FocusMIDIEditor() end

Mdur_sub, val_sub = string.match(shuzhi, "(%d+),(-?%d+)")
local Mdur = tonumber(Mdur_sub)
local zengjian = tonumber(val_sub)
tb = {}

takeindex = 0
take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take ~= nil do

    reaper.MIDI_DisableSort(take)

    idx, a = -1, 0

    integer = reaper.MIDI_EnumSelNotes(take, idx)

    while integer ~= -1 do

        integer = reaper.MIDI_EnumSelNotes(take, idx)

        retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel =
            reaper.MIDI_GetNote(take, integer)
        QN = reaper.MIDI_GetProjQNFromPPQPos(take, startppqpos)
        QN = math.modf(QN / 1)
        table.insert(tb, QN)

        dur = endppqpos - startppqpos

        b = a % 2
        new_vel = vel + zengjian
        if new_vel > 127 then new_vel = 127 end
        if new_vel < 1 then new_vel = 1 end

        if b == 1 and dur <= Mdur then

            reaper.MIDI_SetNote(take, integer, true, false, startppqpos,
                                endppqpos, chan, pitch, new_vel, true)

        end -- if end

        a = a + 1
        idx = integer
        integer = reaper.MIDI_EnumSelNotes(take, idx)

    end -- while end

    reaper.MIDI_Sort(take)

    takeindex = takeindex + 1
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
end -- while take end

reaper.SN_FocusMIDIEditor()
