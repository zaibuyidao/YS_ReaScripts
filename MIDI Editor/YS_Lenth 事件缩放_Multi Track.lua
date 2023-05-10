--[[
 * ReaScript Name: Lenth 事件缩放_Multi Track
 * Version: 1.1.1
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

local editor = reaper.MIDIEditor_GetActive()

local take = reaper.MIDIEditor_GetTake(editor)

string = reaper.GetExtState('old lenth', '1')

retval, shuzhi = reaper.GetUserInputs('Lengh 长度 Multi Track', 1, '设定长度比例 % (允许小数点)：', string)

if retval then
    val = tonumber(shuzhi)

    reaper.SetExtState('old lenth', '1', shuzhi, true)

    left = math.huge
else
    reaper.SN_FocusMIDIEditor()
    return
end

------------

takeindex = 0
take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take ~= nil do

    reaper.MIDI_DisableSort(take)
    i = -1
    integer = reaper.MIDI_EnumSelEvts(take, i)
    if integer ~= -1 then
        repeat
            integer = reaper.MIDI_EnumSelEvts(take, i)
            retval, selected, muted, ppqpos, msg = reaper.MIDI_GetEvt(take, integer, true, false, -1, '')
            ppq_0 = reaper.MIDI_GetPPQPosFromProjTime(take, 0)
            ppq_0 = math.floor(ppq_0 + 0.5)
            ppqpos = ppqpos - ppq_0  
            if ppqpos < left then
                left = ppqpos
            end
            i = integer
            integer = reaper.MIDI_EnumSelEvts(take, i)
        until (integer == -1)
    end

    reaper.MIDI_Sort(take)

    takeindex = takeindex + 1
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
end -- while take end

takeindex = 0
take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
while take ~= nil do

    reaper.MIDI_DisableSort(take)

    evtidx = -1
    integer = reaper.MIDI_EnumSelEvts(take, evtidx)
    if integer ~= -1 then

        repeat
            retval, selected, muted, ppqpos2, msg = reaper.MIDI_GetEvt(take, integer, true, false, -1, '')
            ppq_0 = reaper.MIDI_GetPPQPosFromProjTime(take, 0)
            ppq_0 = math.floor(ppq_0 + 0.5)
            ppqpos2 = ppqpos2 - ppq_0
            juli = ppqpos2 - left
            newjuli = juli * (val / 100)
            New_ppqpos = left + newjuli + ppq_0    
            
            reaper.MIDI_SetEvt(take, integer, true, false, New_ppqpos, msg, false)
            evtidx = integer
            integer = reaper.MIDI_EnumSelEvts(take, evtidx)
        until (integer == -1)
    end -- if end

    reaper.MIDI_Sort(take)

    takeindex = takeindex + 1
    take = reaper.MIDIEditor_EnumTakes(editor, takeindex, true)
end -- while take end

reaper.SN_FocusMIDIEditor()

