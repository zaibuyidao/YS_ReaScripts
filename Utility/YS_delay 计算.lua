--[[
 * ReaScript Name: delay 计算
 * Version: 1.0.1
 * Author: YS
 * provides: [main=main,midi_editor] .
--]]

--[[
 * Changelog:
 * v1.0 (2024-5-15)
  + Initial release
--]]

delaytime = {0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2, 2.2, 2.4, 2.6, 2.8, 3, 3.2, 3.4, 3.6,
             3.8, 4, 4.2, 4.4, 4.6, 4.8, 5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 22, 24, 26, 28, 30, 32,
             34, 36, 38, 40, 42, 44, 46, 48, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 220, 240,
             260, 280, 300, 320, 340, 360, 380, 400, 420, 440, 460, 480, 500, 550, 600, 650, 700, 750, 800, 850, 900, 950, 1000}
LRpercentage = {4, 8, 13, 17, 21, 25, 29, 33, 38, 42, 46, 50, 54, 58, 63, 67, 71, 75, 79, 83, 88, 92, 96, 100, 104, 108, 113, 117, 121, 125, 129, 133,
                138, 142, 146, 150, 154, 158, 163, 167, 171, 175, 179, 183, 188, 192, 196, 200, 204, 208, 213, 217, 221, 225, 229, 233, 238, 242, 246,
                250, 254, 258, 263, 267, 271, 275, 279, 283, 288, 292, 296, 300, 304, 308, 313, 317, 321, 325, 329, 333, 338, 342, 346, 350, 354, 358,
                363, 367, 371, 375, 379, 383, 388, 392, 396, 400, 404, 408, 413, 417, 421, 425, 429, 433, 438, 442, 446, 450, 454, 458, 463, 467, 471,
                475, 479, 483, 488, 492, 496, 500}
txtout = ''
retval, getstr = reaper.GetUserInputs('Delay Time 计算器', 4,
    'Tempo 歌曲速度,比例 (1.0 ^ 0.5 ^ 0.75),左百分比(1-500),右百分比(1-500)', '120,1.0,0,0')
if retval then
    tempo, proportion, timeL, timeR = string.match(getstr, "(.+),(.+),(.+),(.+)")
    tempo = tonumber(tempo)
    proportion = tonumber(proportion)
    timeL = tonumber(timeL)
    timeR = tonumber(timeR)
    if tempo == nil or proportion == nil or timeL == nil or timeR == nil then
        reaper.MB('输入无效数值', '错误！', 0)
        return
    end
    delay = 60000 / tempo * proportion
    delay = string.format("%6.3f", delay)
    flag = 1000
    flagL = 500
    flagR = 500
    for i, v in ipairs(delaytime) do
        duibi = delay - v
        if duibi < 0 then
            duibi = duibi * -1
        end
        if duibi < flag then
            flag = duibi
            tuijian = i
        end
    end
    if tuijian == nil then
        tuijian = '无效值'
    end
    txtout = 'Delay Time Center : ' .. delay .. 'ms 系统码设定值 : ' .. tuijian .. '\n'
    if timeL ~= 0 then
        for i, v in ipairs(LRpercentage) do
            duibi = timeL - v
            if duibi < 0 then
                duibi = duibi * -1
            end
            if duibi < flagL then
                flagL = duibi
                tuijian2 = i
            end
        end
        if tuijian2 == nil or timeL > 500 then
            tuijian2 = '无效值'
        end
        txtout = txtout .. '左百分比 Time Ratio Left : %' .. timeL .. ' 系统码设定值 : ' .. tuijian2 .. '\n'
    end
    if timeR ~= 0 then
        for i, v in ipairs(LRpercentage) do
            duibi = timeR - v
            if duibi < 0 then
                duibi = duibi * -1
            end
            if duibi < flagR then
                flagR = duibi
                tuijian3 = i
            end
        end
        if tuijian3 == nil or timeR > 500 then
            tuijian3 = '无效值'
        end
        txtout = txtout .. '右百分比 Time Ratio Right : %' .. timeR .. ' 系统码设定值 : ' .. tuijian3
    end
    -- reaper.MB('Delay Time = ' .. delay .. ' millisecond', 'Delay Time Calculation', 0)
end

if txtout ~= '' then
    reaper.ClearConsole()
    reaper.ShowConsoleMsg(txtout)
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
reaper.SN_FocusMIDIEditor()
