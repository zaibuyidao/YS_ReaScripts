--[[
 * ReaScript Name: 鼓组 NRPN 检测
 * Version: 1.0
 * Author: YS
 * Repository URI: https://github.com/zaibuyidao/YS_ReaScripts
 * provides: [main=main,midi_editor] .
--]]

--[[
 * Changelog:
 * v1.0 (2023-4-7)
  + Initial release
--]]

local editor = reaper.MIDIEditor_GetActive()
take = reaper.MIDIEditor_GetTake(editor)

track = reaper.GetMediaItemTake_Track(take)
item_cout = reaper.GetTrackNumMediaItems(track)
item_idx = 0
local yingao = {}
yingaonew = {}
txt_out = ''
i = 1

while item_idx < item_cout do
    item = reaper.GetTrackMediaItem(track, item_idx)
    take_note = reaper.GetMediaItemTake(item, 0)

    reaper.MIDI_DisableSort(take_note)

    retval, notecnt, ccevtcnt, extsyxevtcnt = reaper.MIDI_CountEvts(take_note)

    if notecnt > 0 then

        noteidx = 0

        while noteidx < notecnt do

            retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take_note, noteidx)

            yingao[i] = pitch

            noteidx = noteidx + 1
            i = i + 1

        end -- while end

    end -- if notecnt>0
    reaper.MIDI_Sort(take_note)
    item_idx = item_idx + 1
end

if #yingao == 0 then
    reaper.MB('当前轨没有音符！', '错误！', 0)
    reaper.SN_FocusMIDIEditor()
    return
end

table.sort(yingao)

i, ii, iii = 1, 2, 1
tempyingao = -1
while i <= #yingao do
    if yingao[i] ~= tempyingao then
        yingaonew[iii] = yingao[i]
        tempyingao = yingao[i]
        iii = iii + 1
    end -- if end
    i = i + 1
end -- while end

--------------------------------------------------------------
tb_level = {}
tb_pan = {}
tb_reverb = {}

reaper.MIDI_DisableSort(take)
retval, notecnt, ccevtcnt, extsyxevtcnt = reaper.MIDI_CountEvts(take)
ccidx = 0
while ccidx <= ccevtcnt do
    retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
    if chanmsg == 176 then
        if msg2 == 99 and msg3 == 26 then
            NRPN = 'level'
        end
        if msg2 == 99 and msg3 == 28 then
            NRPN = 'pan'
        end
        if msg2 == 99 and msg3 == 29 then
            NRPN = 'reverb'
        end
        if msg2 == 98 then
            ccidx2 = ccidx
            repeat
                ccidx2 = ccidx2 + 1
                retval, selected, muted, ppqpos, chanmsg, chan, msg4, msg5 = reaper.MIDI_GetCC(take, ccidx2)
                if msg4 == 6 then
                    if NRPN == 'level' then
                        tb_level[msg3] = msg5
                    end
                    if NRPN == 'pan' then
                        tb_pan[msg3] = msg5
                    end
                    if NRPN == 'reverb' then
                        tb_reverb[msg3] = msg5
                    end
                end
            until msg4 == 98 or retval == false
        end
    end
    ccidx = ccidx + 1
end
reaper.MIDI_Sort(take)

effective_pitch = {}
for i, v in ipairs(yingaonew) do
    effective_pitch[v] = v
end

for i, v in ipairs(yingaonew) do
    if tb_level[v] == nil then
        txt_out = txt_out .. '有遗漏的 level 设置，键号为：' .. v .. '\n'
    end
    if tb_pan[v] == nil then
        txt_out = txt_out .. '有遗漏的 Pan 设置，键号为：' .. v .. '\n'
    end
    if tb_reverb[v] == nil then
        txt_out = txt_out .. '有遗漏的 reverb 设置，键号为：' .. v .. '\n'
    end
end

for i, v in pairs(tb_level) do
    if effective_pitch[i] == nil then
        txt_out = txt_out .. '有多余的 level 设置，CC98=' .. i .. '，CC6='..v..'\n'
    end
end

for i, v in pairs(tb_pan) do
    if effective_pitch[i] == nil then
        txt_out = txt_out .. '有多余的 pan 设置，CC98=' .. i .. '，CC6='..v..'\n'
    end
end

for i, v in pairs(tb_reverb) do
    if effective_pitch[i] == nil then
        txt_out = txt_out .. '有多余的 reverb 设置，CC98=' .. i .. '，CC6='..v..'\n'
    end
end

reaper.ClearConsole()
if txt_out ~= '' then
    reaper.ShowConsoleMsg(txt_out)
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
else
reaper.MB('NRPN 格式正确！','提示',0)
end
