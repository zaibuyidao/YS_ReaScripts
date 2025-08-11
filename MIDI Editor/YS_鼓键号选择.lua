--[[
 * ReaScript Name: 鼓键号选择
 * Version: 1.0.2
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2022-12-6)
  + Initial release
--]]

function selectdrumnote(combination)

    key = {}
    key[0] = "KICK"
    key[1] = "KICK"
    key[2] = "KICK"
    key[3] = "KICK"
    key[4] = "KICK"
    key[5] = "KICK"
    key[6] = "KICK"
    key[7] = "KICK"
    key[8] = "KICK"
    key[9] = "KICK"
    key[10] = "KICK"
    key[11] = "KICK"
    key[12] = "KICK"
    key[13] = "KICK"
    key[14] = "KICK"
    key[15] = "KICK"
    key[16] = "KICK"
    key[17] = "VOX"
    key[18] = "VOX"
    key[19] = "VOX"
    key[20] = "20"
    key[21] = "21"
    key[22] = "MC-500 BEEP"
    key[23] = "MC-500 BEEP"
    key[24] = "SD"
    key[25] = "SD"
    key[26] = "FINGER SNAP"
    key[27] = "HIGH Q"
    key[28] = "SLAP"
    key[29] = "SCRATCH"
    key[30] = "SCRATCH"
    key[31] = "STICK"
    key[32] = "CLICK"
    key[33] = "METRONOME"
    key[34] = "METRONOME"
    key[35] = "KICK"
    key[36] = "KICK"
    key[37] = "SN"
    key[38] = "SN"
    key[39] = "CLAP"
    key[40] = "SN"
    key[41] = "TOM"
    key[42] = "HI HAT"
    key[43] = "TOM"
    key[44] = "HI HAT"
    key[45] = "TOM"
    key[46] = "HI HAT"
    key[47] = "TOM"
    key[48] = "TOM"
    key[49] = "CYM"
    key[50] = "TOM"
    key[51] = "RIDE"
    key[52] = "CYM"
    key[53] = "RIDE"
    key[54] = "TAMB"
    key[55] = "CYM"
    key[56] = "COWBELL"
    key[57] = "CYM"
    key[58] = "VIBRASLAP"
    key[59] = "RIDE"
    key[60] = "BONGO"
    key[61] = "BONGO"
    key[62] = "CONGA"
    key[63] = "CONGA"
    key[64] = "CONGA"
    key[65] = "TIMBALE"
    key[66] = "TIMBALE"
    key[67] = "AGOGO"
    key[68] = "AGOGO"
    key[69] = "CABASA"
    key[70] = "MARACA"
    key[71] = "WHISTLE"
    key[72] = "WHISTLE"
    key[73] = "GUIRO"
    key[74] = "GUIRO"
    key[75] = "CLAVES"
    key[76] = "WOODBLOCK"
    key[77] = "WOODBLOCK"
    key[78] = "CUICA"
    key[79] = "CUICA"
    key[80] = "TRIANGLE"
    key[81] = "TRIANGLE"
    key[82] = "SHAKER"
    key[83] = "JUNGLE BELL"
    key[84] = "BELL TREE"
    key[85] = "CASTANETS"
    key[86] = "SURDO"
    key[87] = "SURDO"
    key[88] = "APPLAUS"
    key[89] = "89"
    key[90] = "90"
    key[91] = "91"
    key[92] = "92"
    key[93] = "93"
    key[94] = "94"
    key[95] = "95"
    key[96] = "96"
    key[97] = "SN"
    key[98] = "SN"
    key[99] = "SN"
    key[100] = "SN"
    key[101] = "SN"
    key[102] = "SN"
    key[103] = "SN"
    key[104] = "SN"
    key[105] = "SN"
    key[106] = "SN"
    key[107] = "SN"
    key[108] = "SN"
    key[109] = "SN"
    key[110] = "SN"
    key[111] = "SN"
    key[112] = "SN"
    key[113] = "SN"
    key[114] = "SN"
    key[115] = "SN"
    key[116] = "SN"
    key[117] = "SN"
    key[118] = "SN"
    key[119] = "SN"
    key[120] = "SN"
    key[121] = "SN"
    key[122] = "SN"
    key[123] = "SN"
    key[124] = "SN"
    key[125] = "SN"
    key[126] = "SN"
    key[127] = "SN"

    nonote=0

    editor = reaper.MIDIEditor_GetActive()

    reaper.MIDIEditor_OnCommand(editor, 40214)

    takeindex = 0
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
    while take ~= nil do

        reaper.MIDI_DisableSort(take)

        noteidx = 0

        retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)

        while noteidx < notecnt do

            retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)

            if key[pitch] == combination then

                reaper.MIDI_SetNote(take, noteidx, true, NULL, NULL, NULL, NULL, NULL, NULL, false)
                
               nonote=1

            end

            noteidx = noteidx + 1

        end -- while end

        reaper.MIDI_Sort(take)

        takeindex = takeindex + 1

        take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)

    end -- while take end
    
    x,y = reaper.GetMousePosition()

    if nonote==0 then reaper.TrackCtl_SetToolTip('没有对应的音符！',x,y-20,true) end

    reaper.SN_FocusMIDIEditor()

end -- funtion end

local ctx = reaper.ImGui_CreateContext('Select Drums')
local size = reaper.GetAppVersion():match('OSX') and 12 or 14
local font = reaper.ImGui_CreateFont('微软雅黑')
reaper.ImGui_Attach(ctx, font)

x, y = reaper.GetMousePosition()
x, y = reaper.ImGui_PointConvertNative(ctx, x, y)
reaper.ImGui_SetNextWindowSize(ctx, 340, 210)
reaper.ImGui_SetNextWindowPos(ctx, x, y)
windowflag = reaper.ImGui_WindowFlags_TopMost()
windowflag = windowflag | reaper.ImGui_WindowFlags_AlwaysAutoResize()
flag = true
function loop()
    reaper.ImGui_PushFont(ctx, font, 12)
    local visible, open = reaper.ImGui_Begin(ctx, 'Select Drums Notes (GM)', true, windowflag)
    if visible then
        
        reaper.ImGui_PushStyleColor(ctx, reaper.ImGui_Col_Button(),        0x8080807F)
        reaper.ImGui_PushStyleColor(ctx, reaper.ImGui_Col_ButtonHovered(), 0x808080FF)
        reaper.ImGui_PushStyleColor(ctx, reaper.ImGui_Col_ButtonActive(),  0xD2691ECF)
        
        if reaper.ImGui_Button(ctx, ' KICK ') then
            selectdrumnote('KICK')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, ' SN ') then
            selectdrumnote('SN')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, ' HI HAT ') then
            selectdrumnote('HI HAT')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, ' TOM ') then
            selectdrumnote('TOM')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, ' CYM ') then
            selectdrumnote('CYM')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, ' RIDE ') then
            selectdrumnote('RIDE')
            flag = false
        end
        
        reaper.ImGui_PopStyleColor(ctx,3)
        
        if reaper.ImGui_Button(ctx, ' Vox ') then
            selectdrumnote('VOX')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'MC-500 Beep') then
            selectdrumnote('MC-500 BEEP')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'SD ') then
            selectdrumnote('SD')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Finger Snap ') then
            selectdrumnote('FINGER SNAP')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'High Q') then
            selectdrumnote('HIGH Q')
            flag = false
        end
        
        if reaper.ImGui_Button(ctx, 'Slap') then
            selectdrumnote('SLAP')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Scratch') then
            selectdrumnote('SCRATCH')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Stick') then
            selectdrumnote('STICK')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Click') then
            selectdrumnote('CLICK')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Metronome') then
            selectdrumnote('METRONOME')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Clap') then
            selectdrumnote('CLAP')
            flag = false
        end
        
        if reaper.ImGui_Button(ctx, 'Tambourine') then
            selectdrumnote('TAMB')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'CowBell') then
            selectdrumnote('COWBELL')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'VibraSlap') then
            selectdrumnote('VIBRASLAP')
            flag = false
        end    
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Bongo') then
            selectdrumnote('BONGO')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Conga') then
            selectdrumnote('CONGA')
            flag = false
        end
        
        if reaper.ImGui_Button(ctx, 'Timbale') then
            selectdrumnote('TIMBALE')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Agogo') then
            selectdrumnote('AGOGO')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Cabasa') then
            selectdrumnote('CABASA')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Maraca') then
            selectdrumnote('MARACA')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Whistle') then
            selectdrumnote('WHISTLE')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Guiro') then
            selectdrumnote('GUIRO')
            flag = false
        end
       
        if reaper.ImGui_Button(ctx, 'Claves') then
            selectdrumnote('CLAVES')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'WoodBlock') then
            selectdrumnote('WOODBLOCK')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Cuica') then
            selectdrumnote('CUICA')
            flag = false
        end
      reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Triangle') then
            selectdrumnote('TRIANGLE')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Shaker') then
            selectdrumnote('SHAKER')
            flag = false
        end
        
        if reaper.ImGui_Button(ctx, 'JungleBell') then
            selectdrumnote('JUNGLE BELL')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'BellTree') then
            selectdrumnote('BELL TREE')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Castanets') then
            selectdrumnote('CASTANETS')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Surdo') then
            selectdrumnote('SURDO')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Applaus') then
            selectdrumnote('APPLAUS')
            flag = false
        end
        
        retval = reaper.ImGui_IsKeyPressed(ctx, reaper.ImGui_Key_Escape(), nil)
        if retval then flag = false end
        
        editor = reaper.MIDIEditor_GetActive()
        if not editor then flag = false end
           
        reaper.ImGui_End(ctx)
    end
    reaper.ImGui_PopFont(ctx)

    if open and flag then
        reaper.defer(loop)
    else
        reaper.SN_FocusMIDIEditor()
    end
end

reaper.defer(loop)

