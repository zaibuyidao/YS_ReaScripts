--[[
 * ReaScript Name: sysex 系统码编辑
 * Version: 1.0.1
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2024-4-1)
  + Initial release
--]]

local editor = reaper.MIDIEditor_GetActive()

local take = reaper.MIDIEditor_GetTake(editor)

idx = reaper.MIDI_EnumSelTextSysexEvts(take, -1)

newmsg = ''

if idx ~= -1 then
    retval, selected, muted, ppqpos, sys_type, msg = reaper.MIDI_GetTextSysexEvt(take, idx, true, false, 0, -1, '')
    if sys_type == -1 then
        bytes = {msg:byte(1, -1)}
        input = tostring(bytes[#bytes - 1])
        ret, csv = reaper.GetUserInputs('系统码编辑', 1, '输入新的数值: 0-127', input)
        if not ret then
            return
        end
        newVal = tonumber(csv)
        if newVal then
            if newVal < 0 then
                newVal = 0
            end
            if newVal > 127 then
                newVal = 127
            end
            bytes[#bytes - 1] = newVal
            chazhi = newVal - tonumber(input)
            new_sys = (bytes[#bytes]) - chazhi
            if new_sys < 0 then
                new_sys = new_sys + 128
            end
            if new_sys > 127 then
                new_sys = new_sys - 128
            end
            bytes[#bytes] = new_sys
            newmsg = string.char(table.unpack(bytes))
            reaper.MIDI_SetTextSysexEvt(take, idx, NULL, NULL, NULL, -1, newmsg, false)
        else
            reaper.MB('输入非法 ！', '错误 ！', 0)
        end
    else
        reaper.TrackCtl_SetToolTip('请仅选择一条系统码！', 50, 0, true)
    end
    else
    reaper.TrackCtl_SetToolTip('没有系统码被选中！', 50, 0, true)
end

reaper.SN_FocusMIDIEditor()

