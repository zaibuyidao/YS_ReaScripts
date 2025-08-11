--[[
 * ReaScript Name: insert Marker V2
 * Version: 1.0.5
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
    if retval == false then
        return
    end
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
        reaper.TrackCtl_SetToolTip('没有设定时间范围！请设置好时间范围！', 50, 0, true)
        editor = reaper.MIDIEditor_GetActive()
        if editor then
            reaper.SN_FocusMIDIEditor()
        end
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
    tb_mark['bri'] = 'Bridge'
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
            name = name:gsub("^%s+", ""):gsub("%s+$", "") --清除开头和末尾的空格
            name = name:gsub(" +", " ", 2) --中间多个空格改为一个
            name_low = string.lower(name)
            if name_low ~= 'f0' then
                name_low = string.gsub(name_low, '%d+', '')
            end

            if name_low == 'intro' or name_low == 'in' then
                intro_mark = true
            end
            if name_low == 'bridge' or name_low == 'birdge' or name_low == 'br' or name_low == 'bri' then
                bridge_mark = true
            end
            if name_low == 'end' or name_low == 'ending' or name_low == 'out' or name_low == 'outro' then
                end_mark = true
            end

            if tb_mark[name_low] ~= nil then
                reaper.SetProjectMarker(markrgnindexnumber, false, pos, 0, tb_mark[name_low])

                poslist[midx] = tb_mark[name_low]
            else
                reaper.SetProjectMarker(markrgnindexnumber, false, pos, 0, name)
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
            if jishu ~= 0 then
                name = name .. jishu
            end
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
            if jishu ~= 0 then
                name = name .. jishu
            end
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
            if jishu ~= 0 then
                name = name .. jishu
            end
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
            if jishu ~= 0 then
                name = name .. jishu
            end
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
            if jishu ~= 0 then
                name = name .. jishu
            end
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
            if jishu ~= 0 then
                name = name .. jishu
            end
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
            if jishu ~= 0 then
                name = name .. jishu
            end
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
            if jishu ~= 0 then
                name = name .. jishu
            end
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
            if jishu ~= 0 then
                name = name .. jishu
            end
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
            if jishu ~= 0 then
                name = name .. jishu
            end
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
            if jishu ~= 0 then
                name = name .. jishu
            end
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
    txt = txt .. marklose

    if txt == '' then
        txt = '所有标记格式已规范处理！ '
        reaper.TrackCtl_SetToolTip(txt, 50, 0, true)
    else
        reaper.ShowConsoleMsg(txt)
        function SetReaScriptConsole_FontStyle(style)
            -- parameter style must be between 1 and 19

            local translation = reaper.JS_Localize("ReaScript console output", "DLG_437")

            local reascript_console_hwnd = reaper.JS_Window_Find(translation, true)
            if reascript_console_hwnd == nil then
                return false
            end
            local styles = {32, 33, 36, 31, 214, 37, 218, 1606, 4373, 3297, 220, 3492, 3733, 3594, 35, 1890, 2878, 3265, 4392}
            local Textfield = reaper.JS_Window_FindChildByID(reascript_console_hwnd, 1177)
            reaper.JS_WindowMessage_Send(Textfield, "WM_SETFONT", styles[style], 0, 1, 0)
        end
        SetReaScriptConsole_FontStyle(2)
    end

end -- function end

function sort_mark()

    midx = 0
    jishu = 0
    repeat
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
        name = string.gsub(name, '%d+', '')
        if name == 'A' then
            if jishu ~= 0 then
                name = name .. jishu
            end
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
        name = string.gsub(name, '%d+', '')
        if name == 'B' then
            if jishu ~= 0 then
                name = name .. jishu
            end
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
        name = string.gsub(name, '%d+', '')
        if name == 'C' then
            if jishu ~= 0 then
                name = name .. jishu
            end
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
        name = string.gsub(name, '%d+', '')
        if name == 'D' then
            if jishu ~= 0 then
                name = name .. jishu
            end
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
        name = string.gsub(name, '%d+', '')
        if name == 'E' then
            if jishu ~= 0 then
                name = name .. jishu
            end
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
        name = string.gsub(name, '%d+', '')
        if name == 'F' then
            if jishu ~= 0 then
                name = name .. jishu
            end
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
        name = string.gsub(name, '%d+', '')
        if name == 'G' then
            if jishu ~= 0 then
                name = name .. jishu
            end
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
        name = string.gsub(name, '%d+', '')
        if name == 'H' then
            if jishu ~= 0 then
                name = name .. jishu
            end
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
        name = string.gsub(name, '%d+', '')
        if name == 'I' then
            if jishu ~= 0 then
                name = name .. jishu
            end
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
        name = string.gsub(name, '%d+', '')
        if name == 'J' then
            if jishu ~= 0 then
                name = name .. jishu
            end
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
        name = string.gsub(name, '%d+', '')
        if name == 'K' then
            if jishu ~= 0 then
                name = name .. jishu
            end
            reaper.SetProjectMarker(markrgnindexnumber, false, pos, 0, name)
            jishu = jishu + 1
        end
        midx = midx + 1
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
    until m_retval == 0
end -- function end

local ctx = reaper.ImGui_CreateContext('instmark')
local size = reaper.GetAppVersion():match('OSX') and 12 or 14
local font = reaper.ImGui_CreateFont('微软雅黑')
reaper.ImGui_Attach(ctx, font)

x, y = reaper.GetMousePosition()
x, y = reaper.ImGui_PointConvertNative(ctx, x, y)
reaper.ImGui_SetNextWindowSize(ctx, 270, 130)
reaper.ImGui_SetNextWindowPos(ctx, x, y)
windowflag = reaper.ImGui_WindowFlags_AlwaysAutoResize()
flag = true

function loop()
    reaper.ImGui_PushFont(ctx, font, 12)

    local visible, open = reaper.ImGui_Begin(ctx, 'Marker 工具', true, windowflag)
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
        reaper.ImGui_PushStyleColor(ctx, reaper.ImGui_Col_Button(), 0x6969697F)
        reaper.ImGui_PushStyleColor(ctx, reaper.ImGui_Col_ButtonHovered(), 0x696969FF)
        reaper.ImGui_PushStyleColor(ctx, reaper.ImGui_Col_ButtonActive(), 0x6969698F)
        if reaper.ImGui_Button(ctx, '规格化') then
            markauto()
            flag = false
        end
        if reaper.ImGui_IsItemHovered(ctx) then
            reaper.ImGui_SetTooltip(ctx, '标记格式规范化')
        end
        reaper.ImGui_Spacing(ctx)
        reaper.ImGui_PopStyleColor(ctx, 3)
        reaper.ImGui_PushStyleColor(ctx, reaper.ImGui_Col_Button(), 0xFFD7007F)
        reaper.ImGui_PushStyleColor(ctx, reaper.ImGui_Col_ButtonHovered(), 0xFFD700AF)
        reaper.ImGui_PushStyleColor(ctx, reaper.ImGui_Col_ButtonActive(), 0xFFD7008F)
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

        if reaper.ImGui_Button(ctx, 'Range Vox') then
            autovox()
            flag = false
        end
        if reaper.ImGui_IsItemHovered(ctx) then
            reaper.ImGui_SetTooltip(ctx, '选择Vox的范围')
        end
        reaper.ImGui_PopStyleColor(ctx, 3)

        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Solo') then
            insertMarker('Solo')
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        reaper.ImGui_PushStyleColor(ctx, reaper.ImGui_Col_Button(), 0x1E90FFAF)
        reaper.ImGui_PushStyleColor(ctx, reaper.ImGui_Col_ButtonHovered(), 0x1E90FFFF)
        reaper.ImGui_PushStyleColor(ctx, reaper.ImGui_Col_ButtonActive(), 0x1E90FFCF)
        if reaper.ImGui_Button(ctx, 'Key') then
            insertKeymark()
            flag = false
        end
        reaper.ImGui_PopStyleColor(ctx, 3)
        
        reaper.ImGui_Spacing(ctx)

        if reaper.ImGui_Button(ctx, 'A') then
            insertMarker('A')
            sort_mark()
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'B') then
            insertMarker('B')
            sort_mark()
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'C') then
            insertMarker('C')
            sort_mark()
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'D') then
            insertMarker('D')
            sort_mark()
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'E') then
            insertMarker('E')
            sort_mark()
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'F') then
            insertMarker('F')
            sort_mark()
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'G') then
            insertMarker('G')
            sort_mark()
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'H') then
            insertMarker('H')
            sort_mark()
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'I') then
            insertMarker('I')
            sort_mark()
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'J') then
            insertMarker('J')
            sort_mark()
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'K') then
            insertMarker('K')
            sort_mark()
            flag = false
        end

        reaper.ImGui_SetNextItemWidth(ctx, 200)
        rv, text = reaper.ImGui_InputText(ctx, ' ', text)
        reaper.ImGui_SameLine(ctx)
        reaper.ImGui_Key_Enter()
        retval_enter = reaper.ImGui_IsKeyPressed(ctx, reaper.ImGui_Key_Enter(), nil)
        Pad_enter = reaper.ImGui_IsKeyPressed(ctx, reaper.ImGui_Key_KeypadEnter(), nil)
        ok_key = reaper.ImGui_Button(ctx, 'Enter')

        if retval_enter or Pad_enter or ok_key then
            insertMarker(text)
            flag = false
        end

        retval = reaper.ImGui_IsKeyPressed(ctx, reaper.ImGui_Key_Escape(), nil)
        if retval then
            flag = false
        end
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
     end
end
reaper.defer(loop)

