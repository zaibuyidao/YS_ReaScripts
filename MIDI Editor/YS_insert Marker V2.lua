--[[
 * ReaScript Name: insert Marker V2
 * Version: 1.0
 * Author: YS
 * provides: [main=main,midi_editor] .
--]]

--[[
 * Changelog:
 * v1.0 (2022-9-19)
  + Initial release
--]]

colnum = 0
text = ''
function insertMarker(name)
    local UNDO_STATE_MISCCFG = 8
    local pos = reaper.GetCursorPosition()
    reaper.Undo_BeginBlock()
    reaper.AddProjectMarker2(0, false, pos, -1, name, -1, colnum)
    reaper.Undo_EndBlock(('Insert marker: %s'):format(name), UNDO_STATE_MISCCFG)
end

function insertKeymark()
    tb_mark = {}
    tb_mark['a'] = 'A'
    tb_mark['b'] = 'B'
    tb_mark['c'] = 'C'
    tb_mark['d'] = 'D'
    tb_mark['e'] = 'E'
    tb_mark['f'] = 'F'
    tb_mark['g'] = 'G'
    tb_mark['ab'] = 'Ab'
    tb_mark['g#'] = 'Ab'
    tb_mark['bb'] = 'Bb'
    tb_mark['a#'] = 'Bb'
    tb_mark['db'] = 'C#'
    tb_mark['c#'] = 'C#'
    tb_mark['d#'] = 'Eb'
    tb_mark['eb'] = 'Eb'
    tb_mark['gb'] = 'F#'
    tb_mark['f#'] = 'F#'
    
    tb_mark['am'] = 'Am'
    tb_mark['bm'] = 'Bm'
    tb_mark['cm'] = 'Cm'
    tb_mark['dm'] = 'Dm'
    tb_mark['em'] = 'Em'
    tb_mark['fm'] = 'Fm'
    tb_mark['gm'] = 'Gm'
    tb_mark['abm'] = 'Abm'
    tb_mark['g#m'] = 'Abm'
    tb_mark['bbm'] = 'Bbm'
    tb_mark['a#m'] = 'Bbm'
    tb_mark['dbm'] = 'C#m'
    tb_mark['c#m'] = 'C#m'
    tb_mark['d#m'] = 'Ebm'
    tb_mark['ebm'] = 'Ebm'
    tb_mark['gbm'] = 'F#m'
    tb_mark['f#m'] = 'F#m'

    retval, getname = reaper.GetUserInputs('请输入正确的调号！', 1, '                                           Key= ', '')
    if retval == false then return end
    name_low = string.lower(getname)
    if tb_mark[name_low] == nil then
        reaper.MB('调号错误请重新输入！', '', 0)
        return
    end
    key = tb_mark[name_low]
    colnum = 33521664
    insertMarker('Key=' .. key)
end -- function end

function autovox()
    From, Thru = reaper.GetSet_LoopTimeRange(false, true, 0, 0, true)
    if From == 0 and Thru == 0 then
        reaper.TrackCtl_SetToolTip( '没有设定时间范围！请设置好时间范围！', 50, 0, true)
        editor = reaper.MIDIEditor_GetActive()
        if editor then reaper.SN_FocusMIDIEditor() end
        return
    end
    reaper.Undo_BeginBlock()
    colnum = reaper.ColorToNative(255, 255, 128) | 0x1000000
    reaper.AddProjectMarker2(0, false, From, -1, 'Vox in', -1, colnum)
    reaper.AddProjectMarker2(0, false, Thru, -1, 'Vox out', -1, colnum)
    reaper.Undo_EndBlock('', 8)

end -- function end

function markauto()
    txt = ''
    marklose = ''
    reaper.ClearConsole()

    tb_mark = {}
    tb_mark[''] = ''
    tb_mark['intro'] = 'Intro'
    tb_mark['bridge'] = 'Bridge'
    tb_mark['end'] = 'Ending'
    tb_mark['outro'] = 'Ending'
    tb_mark['birdge'] = 'Bridge'
    tb_mark['in'] = 'Intro'
    tb_mark['br'] = 'Bridge'
    tb_mark['out'] = 'Ending'
    tb_mark['ending'] = 'Ending'
    tb_mark['fo'] = 'FO'
    tb_mark['f0'] = 'FO'
    tb_mark['fade out'] = 'FO'
    tb_mark['solo'] = 'Solo'
    tb_mark['vox in'] = 'Vox in'
    tb_mark['vox out'] = 'Vox out'
    tb_mark['a'] = 'A'
    tb_mark['b'] = 'B'
    tb_mark['c'] = 'C'
    tb_mark['d'] = 'D'
    tb_mark['e'] = 'E'
    tb_mark['f'] = 'F'
    tb_mark['g'] = 'G'
    tb_mark['h'] = 'H'
    tb_mark['i'] = 'I'
    tb_mark['j'] = 'J'
    tb_mark['k'] = 'K'
    tb_mark['key=a'] = 'Key=A'
    tb_mark['key=b'] = 'Key=B'
    tb_mark['key=c'] = 'Key=C'
    tb_mark['key=d'] = 'Key=D'
    tb_mark['key=e'] = 'Key=E'
    tb_mark['key=f'] = 'Key=F'
    tb_mark['key=g'] = 'Key=G'
    tb_mark['key=ab'] = 'Key=Ab'
    tb_mark['key=g#'] = 'Key=Ab'
    tb_mark['key=bb'] = 'Key=Bb'
    tb_mark['key=a#'] = 'Key=Bb'
    tb_mark['key=db'] = 'Key=C#'
    tb_mark['key=c#'] = 'Key=C#'
    tb_mark['key=d#'] = 'Key=Eb'
    tb_mark['key=eb'] = 'Key=Eb'
    tb_mark['key=gb'] = 'Key=F#'
    tb_mark['key=f#'] = 'Key=F#'

    tb_mark['key=am'] = 'Key=Am'
    tb_mark['key=bm'] = 'Key=Bm'
    tb_mark['key=cm'] = 'Key=Cm'
    tb_mark['key=dm'] = 'Key=Dm'
    tb_mark['key=em'] = 'Key=Em'
    tb_mark['key=fm'] = 'Key=Fm'
    tb_mark['key=gm'] = 'Key=Gm'
    tb_mark['key=abm'] = 'Key=Abm'
    tb_mark['key=g#m'] = 'Key=Abm'
    tb_mark['key=bbm'] = 'Key=Bbm'
    tb_mark['key=a#m'] = 'Key=Bbm'
    tb_mark['key=dbm'] = 'Key=C#m'
    tb_mark['key=c#m'] = 'Key=C#m'
    tb_mark['key=d#m'] = 'Key=Ebm'
    tb_mark['key=ebm'] = 'Key=Ebm'
    tb_mark['key=gbm'] = 'Key=F#m'
    tb_mark['key=f#m'] = 'Key=F#m'

    reaper.Undo_BeginBlock()

    midx = 0
    retval, num_markers, num_regions = reaper.CountProjectMarkers(0)
    num_maker2 = num_markers + num_regions
    poslist = {}
    while midx < num_maker2 do
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)

        name_low = string.lower(name)
        if (name == '' or name_low == 'start') and (midx ~= num_maker2 - 1) then
            reaper.DeleteProjectMarkerByIndex(0, midx)
            midx = midx - 1
            num_maker2 = num_maker2 - 1
        else
            name_low = string.lower(name)
            if name_low ~= 'f0' then
                name_low = string.gsub(name_low, '%d+', '')
            end

            if name_low == 'intro' or name_low == 'in' then
                intro_mark = true
            end
            if name_low == 'bridge' or name_low == 'birdge' or name_low == 'br' then
                bridge_mark = true
            end
            if name_low == 'end' or name_low == 'ending' or name_low == 'out' or
                name_low == 'outro' then end_mark = true end

            if tb_mark[name_low] ~= nil then
                reaper.SetProjectMarker(markrgnindexnumber, false, pos, 0, tb_mark[name_low])

                poslist[midx] = tb_mark[name_low]
            else
                buf = reaper.format_timestr_pos(pos, '', 2)
                txt = txt .. '错误：有无法识别的标签 "' .. name .. '" 在 ' .. buf .. ' ！ \n'
            end
        end
        midx = midx + 1
    end -- while end
    m_retval, isrgn, pos, rgnend, name_end, markrgnindexnumber = reaper.EnumProjectMarkers2(0, midx)

    -----------------------------------
    midx = 0
    jishu = 0
    repeat
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
        if name == 'A' then
            if jishu ~= 0 then name = name .. jishu end
            reaper.SetProjectMarker(markrgnindexnumber, false, pos, 0, name)
            jishu = jishu + 1
        end
        midx = midx + 1
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
    until m_retval == 0
    -----------------------------------
    midx = 0
    jishu = 0
    repeat
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
        if name == 'B' then
            if jishu ~= 0 then name = name .. jishu end
            reaper.SetProjectMarker(markrgnindexnumber, false, pos, 0, name)
            jishu = jishu + 1
        end
        midx = midx + 1
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
    until m_retval == 0
    -----------------------------------
    midx = 0
    jishu = 0
    repeat
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
        if name == 'C' then
            if jishu ~= 0 then name = name .. jishu end
            reaper.SetProjectMarker(markrgnindexnumber, false, pos, 0, name)
            jishu = jishu + 1
        end
        midx = midx + 1
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
    until m_retval == 0
    -----------------------------------
    midx = 0
    jishu = 0
    repeat
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
        if name == 'D' then
            if jishu ~= 0 then name = name .. jishu end
            reaper.SetProjectMarker(markrgnindexnumber, false, pos, 0, name)
            jishu = jishu + 1
        end
        midx = midx + 1
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
    until m_retval == 0
    -----------------------------------
    midx = 0
    jishu = 0
    repeat
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
        if name == 'E' then
            if jishu ~= 0 then name = name .. jishu end
            reaper.SetProjectMarker(markrgnindexnumber, false, pos, 0, name)
            jishu = jishu + 1
        end
        midx = midx + 1
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
    until m_retval == 0
    -----------------------------------
    midx = 0
    jishu = 0
    repeat
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
        if name == 'F' then
            if jishu ~= 0 then name = name .. jishu end
            reaper.SetProjectMarker(markrgnindexnumber, false, pos, 0, name)
            jishu = jishu + 1
        end
        midx = midx + 1
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
    until m_retval == 0
    -----------------------------------
    midx = 0
    jishu = 0
    repeat
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
        if name == 'G' then
            if jishu ~= 0 then name = name .. jishu end
            reaper.SetProjectMarker(markrgnindexnumber, false, pos, 0, name)
            jishu = jishu + 1
        end
        midx = midx + 1
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
    until m_retval == 0
    -----------------------------------
    midx = 0
    jishu = 0
    repeat
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
        if name == 'H' then
            if jishu ~= 0 then name = name .. jishu end
            reaper.SetProjectMarker(markrgnindexnumber, false, pos, 0, name)
            jishu = jishu + 1
        end
        midx = midx + 1
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
    until m_retval == 0
    -----------------------------------
    midx = 0
    jishu = 0
    repeat
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
        if name == 'I' then
            if jishu ~= 0 then name = name .. jishu end
            reaper.SetProjectMarker(markrgnindexnumber, false, pos, 0, name)
            jishu = jishu + 1
        end
        midx = midx + 1
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
    until m_retval == 0
    -----------------------------------
    midx = 0
    jishu = 0
    repeat
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
        if name == 'J' then
            if jishu ~= 0 then name = name .. jishu end
            reaper.SetProjectMarker(markrgnindexnumber, false, pos, 0, name)
            jishu = jishu + 1
        end
        midx = midx + 1
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
    until m_retval == 0
    -----------------------------------
    midx = 0
    jishu = 0
    repeat
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
        if name == 'K' then
            if jishu ~= 0 then name = name .. jishu end
            reaper.SetProjectMarker(markrgnindexnumber, false, pos, 0, name)
            jishu = jishu + 1
        end
        midx = midx + 1
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
    until m_retval == 0
    -----------------------------------
    reaper.Undo_EndBlock('auto marker', 8)

    if intro_mark == nil then
        marklose = marklose .. '提醒：没有找到 Intro 标记！\n'
    end
    if bridge_mark == nil then
        marklose = marklose .. '提醒：没有找到 Bridge 标记！\n'
    end
    if end_mark == nil then
        marklose = marklose .. '提醒：没有找到 Ending 标记！\n'
    end
    reaper.ShowConsoleMsg(marklose)

    if txt == '' then
        txt = '所有标记格式已规范处理！ '
        reaper.TrackCtl_SetToolTip(txt, 50, 0, true)
    else
        reaper.ShowConsoleMsg(txt)
    end

end -- function end

local ctx = reaper.ImGui_CreateContext('instmark')
local size = reaper.GetAppVersion():match('OSX') and 12 or 14
local font = reaper.ImGui_CreateFont('sans-serif', size)
reaper.ImGui_AttachFont(ctx, font)

x, y = reaper.GetMousePosition()
x, y = reaper.ImGui_PointConvertNative(ctx, x, y)
reaper.ImGui_SetNextWindowSize(ctx, 270, 130)
reaper.ImGui_SetNextWindowPos(ctx, x, y)
flag = true

function loop()
    reaper.ImGui_PushFont(ctx, font)

    local visible, open = reaper.ImGui_Begin(ctx, 'Insert Marker', true)
    if visible then
        if reaper.ImGui_Button(ctx, 'Intro') then
            insertMarker('Intro')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Bridge') then
            insertMarker('Bridge')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Ending') then
            insertMarker('Ending')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'FO') then
            insertMarker('FO')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Normalize') then
            markauto()
            flag = false
        end

        if reaper.ImGui_Button(ctx, 'Vox in') then
            colnum = reaper.ColorToNative(255, 255, 128) | 0x1000000
            insertMarker('Vox in')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Vox Out') then
            colnum = reaper.ColorToNative(255, 255, 128) | 0x1000000
            insertMarker('Vox Out')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Auto Vox') then
            autovox()
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Solo') then
            insertMarker('Solo')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Key=') then
            insertKeymark()
            flag = false
        end

        if reaper.ImGui_Button(ctx, 'A') then
            insertMarker('A')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'B') then
            insertMarker('B')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'C') then
            insertMarker('C')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'D') then
            insertMarker('D')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'E') then
            insertMarker('E')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'F') then
            insertMarker('F')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'G') then
            insertMarker('G')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'H') then
            insertMarker('H')
            flag = false
        end

        rv, text = reaper.ImGui_InputText(ctx, 'Enter', text)
        reaper.ImGui_SameLine(ctx)
        retval_enter = reaper.ImGui_IsKeyPressed(ctx, 13, nil)
        if reaper.ImGui_Button(ctx, 'OK') or retval_enter then
            insertMarker(text)
            flag = false
        end

        retval = reaper.ImGui_IsKeyPressed(ctx, 27, nil)
        if retval then flag = false end
        reaper.ImGui_End(ctx)
    end
    reaper.ImGui_PopFont(ctx)

    if open and flag then
        reaper.defer(loop)
    else
        editor = reaper.MIDIEditor_GetActive()
        if editor then
            reaper.MIDIEditor_OnCommand(editor, 40186)
            reaper.MIDIEditor_OnCommand(editor, 40185)
            reaper.SN_FocusMIDIEditor()
        end
        reaper.ImGui_DestroyContext(ctx)
    end
end
reaper.defer(loop)

