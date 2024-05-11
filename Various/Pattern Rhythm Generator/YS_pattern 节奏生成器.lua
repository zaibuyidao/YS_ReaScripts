-- NoIndex: true
editor = reaper.MIDIEditor_GetActive()

pattern = {}
pattern[1] = {'0,240,100', '240,360,100', '360,480,100', '480,720,100', '720,840,100', '840,960,100', '960,1200,100', '1200,1320,100',
              '1320,1440,100', '1440,1680,100', '1680,1800,100', '1800,1920,100'}
pattern[2] = {'0,120,100', '120,240,100', '240,480,100', '480,600,100', '600,720,100', '720,960,100', '960,1080,100', '1080,1200,100',
              '1200,1440,100', '1440,1560,100', '1560,1680,100', '1680,1920,100'}
pattern[3] = {'0,120,100', '120,360,100', '360,480,100', '480,600,100', '600,840,100', '840,960,100', '960,1080,100', '1080,1320,100',
              '1320,1440,100', '1440,1560,100', '1560,1800,100', '1800,1920,100'}
pattern[4] = {'0,240,100', '240,480,77', '480,720,110', '720,840,76', '840,960,88', '960,1080,74', '1080,1200,93', '1200,1440,79', '1440,1680,110',
              '1680,1800,92', '1800,1920,79'}
pattern[5] = {'0,240,100', '240,480,77', '480,720,110', '720,840,83', '840,960,71', '960,1200,100', '1200,1440,74', '1440,1680,110', '1680,1800,84',
              '1800,1920,72'}
pattern[6] = {'0,120,100', '360,480,100', '720,840,100', '1080,1200,100', '1440,1560,100', '1680,1800,100'}
pattern[7] = {'240,480,100', '720,960,100', '1200,1440,100', '1680,1920,100'}
pattern[8] = {}

function getuserpattern()
    take = reaper.MIDIEditor_GetTake(editor)
    userpattern = ''
    pattern[8] = {}
    tempend = -1
    reaper.ClearConsole()
    noteidx = -1
    noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
    firstnote = 0
    while noteidx ~= -1 do
        retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
        StartOfMeasure = reaper.MIDI_GetPPQPos_StartOfMeasure(take, startppqpos)
        if firstnote == 0 then
            StartOfMeasure1 = StartOfMeasure
            firstnote = 1
        end
        NoteStOfMeas = startppqpos - StartOfMeasure
        NoteStOfMeas = string.format('%d', NoteStOfMeas)
        NoteEndOfMeas = endppqpos - StartOfMeasure
        NoteEndOfMeas = string.format('%d', NoteEndOfMeas)
        table.insert(pattern[8], NoteStOfMeas .. ',' .. NoteEndOfMeas .. ',' .. vel)
        userpattern = userpattern .. '\'' .. NoteStOfMeas .. ',' .. NoteEndOfMeas .. ',' .. vel .. '\','

        if startppqpos < tempend then
            x, y = reaper.GetMousePosition()
            pattern[8] = {}
            reaper.TrackCtl_SetToolTip('音符不能重叠，请修正！', x, y + 20, true)
            break
        end
        tempend = endppqpos
        StartOfMeasFromEnd = reaper.MIDI_GetPPQPos_StartOfMeasure(take, endppqpos - 1)
        if StartOfMeasFromEnd ~= StartOfMeasure1 then
            x, y = reaper.GetMousePosition()
            pattern[8] = {}
            reaper.TrackCtl_SetToolTip('所选音符范围超过一小节，请修正！', x, y + 20, true)
            break
        end
        noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
    end
    if userpattern == '' then
        x, y = reaper.GetMousePosition()
        reaper.TrackCtl_SetToolTip('当前激活片段没有音符被选中！', x, y + 20, true)
    else
        userpattern = string.sub(userpattern, 1, -2)
        -- reaper.ShowConsoleMsg(userpattern)
    end
end

function inputpattern(patterntype)
    takeindex = 0
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    while take ~= nil do
        reaper.MIDI_DisableSort(take)
        noteidx = -1
        noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
        while noteidx ~= -1 do
            retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
            EndOfMeasure = reaper.MIDI_GetPPQPos_EndOfMeasure(take, startppqpos + 5)
            if endppqpos > EndOfMeasure then
                reaper.MIDI_SetNote(take, noteidx, NULL, NULL, NULL, EndOfMeasure, NULL, NULL, NULL, false)
                reaper.MIDI_InsertNote(take, true, muted, EndOfMeasure, endppqpos, chan, pitch, vel, false)
            end
            noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
        end
        reaper.MIDI_Sort(take)

        reaper.MIDI_DisableSort(take)
        noteidx = -1
        noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
        while noteidx ~= -1 do
            flag = 0
            retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
            StartOfMeasure = reaper.MIDI_GetPPQPos_StartOfMeasure(take, startppqpos)
            noteStartOfMeasure = startppqpos - StartOfMeasure
            noteendOfMeasure = endppqpos - StartOfMeasure
            reaper.MIDI_DeleteNote(take, noteidx)
            noteidx = noteidx - 1
            for i, v in ipairs(pattern[patterntype]) do
                stpos, endpos, Mvel = string.match(v, '(%d+),(%d+),(%d+)')
                stpos = tonumber(stpos)
                endpos = tonumber(endpos)
                if noteStartOfMeasure <= stpos and noteendOfMeasure >= endpos then
                    flag = 1
                    reaper.MIDI_InsertNote(take, false, muted, StartOfMeasure + stpos, StartOfMeasure + endpos, chan, pitch, Mvel, false)
                end
            end
            if flag == 0 then
                reaper.MIDI_InsertNote(take, false, muted, startppqpos, endppqpos, chan, pitch, vel, false)
            end
            noteidx = reaper.MIDI_EnumSelNotes(take, noteidx)
        end
        reaper.MIDI_Sort(take)
        takeindex = takeindex + 1
        take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    end -- while take end
end

local ctx = reaper.ImGui_CreateContext('Pattern Generator')
windows_flag = reaper.ImGui_WindowFlags_TopMost()
windows_flag = windows_flag | reaper.ImGui_WindowFlags_AlwaysAutoResize()
local font = reaper.ImGui_CreateFont('sans-serif', 14)
reaper.ImGui_Attach(ctx, font)
is_new_value, filename, sectionID, cmdID, mode, resolution, val = reaper.get_action_context()
filename1 = string.gsub(filename, 'YS_pattern 节奏生成器.lua', 'pattern1.jpg')
filename1 = string.gsub(filename1, '\\', '\\\\')
img1 = reaper.ImGui_CreateImage(filename1)
filename2 = string.gsub(filename, 'YS_pattern 节奏生成器.lua', 'pattern2.jpg')
filename2 = string.gsub(filename2, '\\', '\\\\')
img2 = reaper.ImGui_CreateImage(filename2)
filename3 = string.gsub(filename, 'YS_pattern 节奏生成器.lua', 'pattern3.jpg')
filename3 = string.gsub(filename3, '\\', '\\\\')
img3 = reaper.ImGui_CreateImage(filename3)
filename4 = string.gsub(filename, 'YS_pattern 节奏生成器.lua', 'pattern_AGRhythm1.jpg')
filename4 = string.gsub(filename4, '\\', '\\\\')
img4 = reaper.ImGui_CreateImage(filename4)
filename5 = string.gsub(filename, 'YS_pattern 节奏生成器.lua', 'pattern_AGRhythm2.jpg')
filename5 = string.gsub(filename5, '\\', '\\\\')
img5 = reaper.ImGui_CreateImage(filename5)
filename6 = string.gsub(filename, 'YS_pattern 节奏生成器.lua', 'pattern4.jpg')
filename6 = string.gsub(filename6, '\\', '\\\\')
img6 = reaper.ImGui_CreateImage(filename6)
filename7 = string.gsub(filename, 'YS_pattern 节奏生成器.lua', 'pattern5.jpg')
filename7 = string.gsub(filename7, '\\', '\\\\')
img7 = reaper.ImGui_CreateImage(filename7)

function loop()
    reaper.ImGui_PushFont(ctx, font)
    local visible, open = reaper.ImGui_Begin(ctx, 'Pattern Generator', true, windows_flag)
    if visible then
        if reaper.ImGui_Button(ctx, 'Pattern 1') then
            inputpattern(1)
            open = false
        end
        reaper.ImGui_SameLine(ctx)
        reaper.ImGui_Image(ctx, img1, 200, 25, 0.0, 0.0, 1.0, 1.0, 0xFFFFFFFF, 0x00000000)

        if reaper.ImGui_Button(ctx, 'Pattern 2') then
            inputpattern(2)
            open = false
        end
        reaper.ImGui_SameLine(ctx)
        reaper.ImGui_Image(ctx, img2, 200, 25, 0.0, 0.0, 1.0, 1.0, 0xFFFFFFFF, 0x00000000)

        if reaper.ImGui_Button(ctx, 'Pattern 3') then
            inputpattern(3)
            open = false
        end
        reaper.ImGui_SameLine(ctx)
        reaper.ImGui_Image(ctx, img3, 200, 25, 0.0, 0.0, 1.0, 1.0, 0xFFFFFFFF, 0x00000000)

        if reaper.ImGui_Button(ctx, 'Pattern 4') then
            inputpattern(6)
            open = false
        end
        reaper.ImGui_SameLine(ctx)
        reaper.ImGui_Image(ctx, img6, 200, 25, 0.0, 0.0, 1.0, 1.0, 0xFFFFFFFF, 0x00000000)

        if reaper.ImGui_Button(ctx, 'Pattern 5') then
            inputpattern(7)
            open = false
        end
        reaper.ImGui_SameLine(ctx)
        reaper.ImGui_Image(ctx, img7, 130, 25, 0.0, 0.0, 1.0, 1.0, 0xFFFFFFFF, 0x00000000)

        if reaper.ImGui_Button(ctx, 'A.G Rhythm 1') then
            inputpattern(4)
            open = false
        end
        reaper.ImGui_SameLine(ctx)
        reaper.ImGui_Image(ctx, img4, 200, 25, 0.0, 0.0, 1.0, 1.0, 0xFFFFFFFF, 0x00000000)

        if reaper.ImGui_Button(ctx, 'A.G Rhythm 2') then
            inputpattern(5)
            open = false
        end
        reaper.ImGui_SameLine(ctx)
        reaper.ImGui_Image(ctx, img5, 200, 25, 0.0, 0.0, 1.0, 1.0, 0xFFFFFFFF, 0x00000000)

        if reaper.ImGui_Button(ctx, 'Get User Pattern ') then
            getuserpattern()
        end
        if #pattern[8] > 0 then
            reaper.ImGui_SameLine(ctx)
            if reaper.ImGui_Button(ctx, 'Set User Pattern') then
                inputpattern(8)
                open = false
            end
        end

        reaper.ImGui_End(ctx)
    end
    retval = reaper.ImGui_IsKeyPressed(ctx, reaper.ImGui_Key_Escape(), nil)
    if retval then
        open = false
    end

    editor = reaper.MIDIEditor_GetActive()
    if not editor then
        open = false
    end

    reaper.ImGui_PopFont(ctx)

    if open then
        reaper.defer(loop)
    else
        reaper.SN_FocusMIDIEditor()
    end
end

reaper.defer(loop)
