-- @description random note pitch
-- @version 1.0
-- @author YS
-- @changelog New Script
-- @provides [main=midi_editor] .

local ctx = reaper.ImGui_CreateContext('random note pitch')

v1 = reaper.GetExtState('random note pitch', 'v1')
v2 = reaper.GetExtState('random note pitch', 'v2')
if v1 == '' then v1 = -5 end
if v2 == '' then v2 = 5 end

local function random_note_pitch()

    editor = reaper.MIDIEditor_GetActive()

    takeindex = 0
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    while take ~= nil do

        reaper.MIDI_DisableSort(take)

        idx = -1
        integer = reaper.MIDI_EnumSelNotes(take, idx)
        while integer ~= -1 do
            retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
            random_key = pitch + math.random(v1, v2)
            reaper.MIDI_SetNote(take, integer, NULL, NULL, NULL, NULL, NULL, random_key, NULL, false)
            idx = integer
            integer = reaper.MIDI_EnumSelNotes(take, idx)
        end -- while end
        reaper.MIDI_Sort(take)

        takeindex = takeindex + 1
        take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    end -- while take end

    reaper.SN_FocusMIDIEditor()
end

font = reaper.ImGui_CreateFont('微软雅黑')
reaper.ImGui_Attach(ctx, font)

local function loop()
    reaper.ImGui_PushFont(ctx, font, 12)
    local visible, open = reaper.ImGui_Begin(ctx, 'random note pitch', true, reaper.ImGui_WindowFlags_AlwaysAutoResize())
    if visible then
        local changed

        ret, v1, v2 = reaper.ImGui_InputInt2(ctx, 'Random Range', v1, v2)
        if v1 > 0 then
            v1 = 0
        end
        if v2 < 1 then
            v2 = 1
        end
        reaper.ImGui_Spacing(ctx)

        enter = reaper.ImGui_IsKeyPressed(ctx, reaper.ImGui_Key_Enter(), nil) or reaper.ImGui_IsKeyPressed(ctx, reaper.ImGui_Key_KeypadEnter(), nil)

        if reaper.ImGui_Button(ctx, '  OK  ') or enter then
            open = false
            random_note_pitch()
        end
        reaper.ImGui_SameLine(ctx)
        esc = reaper.ImGui_Key_Escape()
        if reaper.ImGui_Button(ctx, 'Cancel') or reaper.ImGui_IsKeyPressed(ctx, esc, nil) then
            open = false
            reaper.SN_FocusMIDIEditor()
        end

        reaper.ImGui_End(ctx)
    end
    reaper.ImGui_PopFont(ctx)

    if open then
        reaper.defer(loop)
    else
        reaper.SetExtState('random note pitch', 'v1', v1, true)
        reaper.SetExtState('random note pitch', 'v2', v2, true)
    end
end

reaper.defer(loop)

