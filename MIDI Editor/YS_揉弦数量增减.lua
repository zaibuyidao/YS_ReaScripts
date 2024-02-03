--[[
 * ReaScript Name: 揉弦数量增减
 * Version: 1.0.1
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2024-1-21)
  + Initial release
--]]

editor = reaper.MIDIEditor_GetActive()
take = reaper.MIDIEditor_GetTake(editor)

function vibadd()
    ccidx = -1
    cctb = {}
    rouxian = {}
    flag = true
    reaper.MIDI_DisableSort(take)
    ccidx = reaper.MIDI_EnumSelCC(take, ccidx)
    if ccidx == -1 then
        x, y = reaper.GetMousePosition()
        reaper.TrackCtl_SetToolTip('没有弯音被选中', x, y + 20, true)
        return
    end
    while ccidx ~= -1 do
        retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
        if chanmsg == 224 then
            if flag then
                firstcc = ppqpos
                flag = false
            end
            ret, shape, bez = reaper.MIDI_GetCCShape(take, ccidx)
            distance = ppqpos - firstcc
            table.insert(cctb, msg2 .. ',' .. msg3 .. ',' .. distance .. ',' .. ccidx .. ',' .. shape .. ',' .. bez)
        end
        ccidx = reaper.MIDI_EnumSelCC(take, ccidx)
    end
    tblen = #cctb
    if tblen <= 2 then
        return
    end
    Total_length = ppqpos - firstcc
    endccval, endcctick, ccidx, shape, bez = string.match(cctb[tblen], '(%d+,%d+),(%d+%.%d+),(%d+),(%d+),(%d+%.%d+)')
    table.insert(rouxian, endccval .. ',' .. endcctick .. ',' .. shape .. ',' .. bez)
    repeat
        tblen = tblen - 1
        ccval, cctick, ccidx, shape, bez = string.match(cctb[tblen], '(%d+,%d+),(%d+%.%d+),(%d+),(%d+),(%d+%.%d+)')
        table.insert(rouxian, ccval .. ',' .. cctick .. ',' .. shape .. ',' .. bez)
    until ccval == endccval or tblen == 1
    if tblen > 1 then
        ccval, cctick, ccidx = string.match(cctb[tblen - 1], '(%d+,%d+),(%d+%.%d+),(%d+)')
    end
    jiange = tonumber(endcctick) - tonumber(cctick)
    bili = distance / (distance + jiange)
    for i, v in ipairs(cctb) do
        ccval, newcctick, ccidx = string.match(v, '(%d+,%d+),(%d+%.%d+),(%d+)')
        newcctick = firstcc + tonumber(newcctick) * bili
        ccidx = tonumber(ccidx)
        reaper.MIDI_SetCC(take, ccidx, NULL, NULL, newcctick, NULL, NULL, NULL, NULL, false)
    end
    retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
    for i, v in ipairs(rouxian) do
        inmsg2, inmsg3, cctick, shape, bez = string.match(v, '(%d+),(%d+),(%d+%.%d+),(%d+),(%d+%.%d+)')
        cctick = firstcc + ((tonumber(cctick) + jiange) * bili)
        inmsg2 = tonumber(inmsg2)
        inmsg3 = tonumber(inmsg3)
        shape = tonumber(shape)
        bez = tonumber(bez)
        reaper.MIDI_InsertCC(take, true, false, cctick, 224, chan, inmsg2, inmsg3)
        reaper.MIDI_SetCCShape(take, ccevtcnt, shape, bez, false)
        ccevtcnt = ccevtcnt + 1
    end
    reaper.MIDI_Sort(take)
end

function vibminus()
    ccidx = -1
    cctb = {}
    rouxian = {}
    flag = true
    reaper.MIDI_DisableSort(take)
    ccidx = reaper.MIDI_EnumSelCC(take, ccidx)
    if ccidx == -1 then
        x, y = reaper.GetMousePosition()
        reaper.TrackCtl_SetToolTip('没有弯音被选中', x, y + 20, true)
        return
    end
    while ccidx ~= -1 do
        retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
        if chanmsg == 224 then
            if flag then
                firstcc = ppqpos
                flag = false
            end
            ret, shape, bez = reaper.MIDI_GetCCShape(take, ccidx)
            distance = ppqpos - firstcc
            table.insert(cctb, msg2 .. ',' .. msg3 .. ',' .. distance .. ',' .. ccidx .. ',' .. shape .. ',' .. bez)
        end
        ccidx = reaper.MIDI_EnumSelCC(take, ccidx)
    end
    tblen = #cctb
    if tblen <= 1 then
        return
    end
    Total_length = ppqpos - firstcc
    endccval, endcctick, ccidx, shape, bez = string.match(cctb[tblen], '(%d+,%d+),(%d+%.%d+),(%d+),(%d+),(%d+%.%d+)')
    table.insert(rouxian, cctb[tblen])
    repeat
        tblen = tblen - 1
        ccval, cctick, ccidx, shape, bez = string.match(cctb[tblen], '(%d+,%d+),(%d+%.%d+),(%d+),(%d+),(%d+%.%d+)')
        table.insert(rouxian, cctb[tblen])
    until ccval == endccval or tblen == 1
    if tblen ~= 1 then
        ccval, cctick, ccidx = string.match(cctb[tblen - 1], '(%d+,%d+),(%d+%.%d+),(%d+)')
        jiange = tonumber(endcctick) - tonumber(cctick)
        bili = distance / (distance - jiange)
        for i, v in ipairs(rouxian) do
            ccval, cctick, ccidx, shape, bez = string.match(v, '(%d+,%d+),(%d+%.%d+),(%d+),(%d+),(%d+%.%d+)')
            reaper.MIDI_DeleteCC(take, ccidx)
            table.remove(cctb)
        end
        tbidx = #cctb
        while tbidx > 0 do
            ccval, newcctick, ccidx = string.match(cctb[tbidx], '(%d+,%d+),(%d+%.%d+),(%d+)')
            ccidx = tonumber(ccidx)
            newcctick = firstcc + (tonumber(newcctick) * bili)
            newcctick = math.modf(newcctick)
            reaper.MIDI_SetCC(take, ccidx, NULL, NULL, newcctick, NULL, NULL, NULL, NULL, false)
            tbidx = tbidx - 1
        end
        ccval, cctick, lastccidx = string.match(cctb[#cctb], '(%d+,%d+),(%d+%.%d+),(%d+)')
        lastccidx = tonumber(lastccidx)
        reaper.MIDI_SetCCShape(take, lastccidx, 0, 0, false)
    else
        x, y = reaper.GetMousePosition()
        reaper.TrackCtl_SetToolTip('没有多个揉弦', x, y + 20, true)
    end
    reaper.MIDI_Sort(take)
end

local ctx = reaper.ImGui_CreateContext('vibratonum')
local size = reaper.GetAppVersion():match('OSX') and 12 or 14
local font = reaper.ImGui_CreateFont('sans-serif', 15)
reaper.ImGui_Attach(ctx, font)

windows_flag = reaper.ImGui_WindowFlags_TopMost()
windows_flag = windows_flag | reaper.ImGui_WindowFlags_AlwaysAutoResize()
closeflag = true
function loop()
    reaper.ImGui_PushFont(ctx, font)
    local visible, open = reaper.ImGui_Begin(ctx, 'vibrato num edit', true, windows_flag)
    if visible then

        if reaper.ImGui_Button(ctx, '+ Add quantity') then
            vibadd()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, '- Reduce quantity') then
            vibminus()
        end

        retval = reaper.ImGui_IsKeyPressed(ctx, 27, nil)
        if retval then
            closeflag = false
        end

        editor = reaper.MIDIEditor_GetActive()
        if not editor then
            closeflag = false
        end

        reaper.ImGui_End(ctx)
    end
    reaper.ImGui_PopFont(ctx)

    if open and closeflag then
        reaper.defer(loop)
    else
        reaper.SN_FocusMIDIEditor()
    end
end

reaper.defer(loop)