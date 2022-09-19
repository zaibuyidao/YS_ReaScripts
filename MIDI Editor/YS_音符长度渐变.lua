--[[
 * ReaScript Name: 音符长度渐变
 * Version: 1.0.1
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2022-1-15)
  + Initial release
--]]

c = 0

local editor = reaper.MIDIEditor_GetActive()

local take = reaper.MIDIEditor_GetTake(editor)

From, Thru = reaper.GetSet_LoopTimeRange(false, true, 0, 0, true)

if From == 0 and Thru == 0 then
    reaper.MB('请设置好时间范围！', '没有设定时间范围！', 0)
    reaper.SN_FocusMIDIEditor()
    return
end

local From_tick = reaper.MIDI_GetPPQPosFromProjTime(take, From)
local Thru_tick = reaper.MIDI_GetPPQPosFromProjTime(take, Thru)

retval, shuru = reaper.GetUserInputs('Slide Out Wheel 滑弦出', 2, "PitchRange = (-12,12),品格:0  击勾弦:1  平滑:2", '0,0')
if retval == false then
    reaper.SN_FocusMIDIEditor()
    return
end
wanyin_num, jigou = string.match(shuru, "(.+),(.+)")
id1, id2 = string.find(wanyin_num, "(-?%d+)")
if id1 ~= nil and id2 ~= nil then
    wanyin_num = string.sub(wanyin_num, id1, id2)
    wanyin_num = tonumber(wanyin_num)
else
    return
end

if wanyin_num < 0 then
    jiange = wanyin_num * -1
else
    jiange = wanyin_num
end

juli = Thru_tick - From_tick

reaper.MIDI_DisableSort(take)

if (Thru ~= 0) then
    if (wanyin_num > 0) -- zhengshu
    then
        pitch = 683 * wanyin_num

        if (pitch > 8191) then pitch = 8191 end

        local beishu = math.modf(pitch / 128)
        local yushu = math.fmod(pitch, 128)

        if jigou == '2' then
            reaper.MIDI_InsertCC(take, false, false, From_tick, 224, 0, 0, 64)
            retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
            reaper.MIDI_SetCCShape(take, ccevtcnt - 1, 5, 0.25, false)
            reaper.MIDI_InsertCC(take, false, false, Thru_tick - 20, 224, 0, yushu, 64 + beishu)
            reaper.MIDI_InsertCC(take, false, false, Thru_tick, 224, 0, 0, 64)
        end

        if jigou == '1' then
            reaper.MIDI_InsertCC(take, false, false, From_tick, 224, 0, 0, 64)
            reaper.MIDI_InsertCC(take, false, false, From_tick + (juli / 2), 224, 0, yushu, 64 + beishu)
            reaper.MIDI_InsertCC(take, false, false, Thru_tick, 224, 0, 0, 64)
        end

        if jigou == '0' then
            while (c <= wanyin_num) do
                pitch = 683 * c

                if (pitch > 8191) then pitch = 8191 end

                local beishu = math.modf(pitch / 128)
                local yushu = math.fmod(pitch, 128)

                reaper.MIDI_InsertCC(take, false, false, From_tick + juli * ((c + c) / (jiange + c + 1)), 224, 0, yushu, 64 + beishu)
                c = c + 1
            end
            reaper.MIDI_InsertCC(take, false, false, Thru_tick, 224, 0, 0, 64)
        end
    end
end -- thru zhengshu
if (Thru ~= 0) then
    if (wanyin_num < 0) then
        pitch = 683 * wanyin_num

        if (pitch > 8191) then pitch = 8191 end
        if (pitch < -8192) then pitch = -8191 end

        local beishu = math.modf(pitch / 128)
        local yushu = math.fmod(pitch, 128)
        if (beishu < 0) then beishu = beishu - 1 end
        wanyin_num = wanyin_num * -1

        if jigou == '2' then
            reaper.MIDI_InsertCC(take, false, false, From_tick, 224, 0, 0, 64)
            retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
            reaper.MIDI_SetCCShape(take, ccevtcnt - 1, 5, 0.25, false)
            reaper.MIDI_InsertCC(take, false, false, Thru_tick - 20, 224, 0, yushu, 64 + beishu)
            reaper.MIDI_InsertCC(take, false, false, Thru_tick, 224, 0, 0, 64)
        end

        if jigou == '1' then
            reaper.MIDI_InsertCC(take, false, false, From_tick, 224, 0, 0, 64)
            reaper.MIDI_InsertCC(take, false, false, From_tick + (juli / 2), 224, 0, yushu, 64 + beishu)
            reaper.MIDI_InsertCC(take, false, false, Thru_tick, 224, 0, 0, 64)
        end

        if jigou == '0' then
            while (c <= wanyin_num) do
                pitch = 683 * c * -1

                if (pitch > 8191) then pitch = 8191 end
                if (pitch < -8192) then pitch = -8191 end

                local beishu = math.modf(pitch / 128)
                local yushu = math.fmod(pitch, 128)
                if (beishu < 0) then beishu = beishu - 1 end
                reaper.MIDI_InsertCC(take, false, false, From_tick + juli * ((c + c) / (jiange + c + 1)), 224, 0, yushu, 64 + beishu)
                c = c + 1
            end
            reaper.MIDI_InsertCC(take, false, false, Thru_tick, 224, 0, 0, 64)
        end
    end
end -- thru fushu

reaper.MIDI_Sort(take)

reaper.SN_FocusMIDIEditor()

reaper.MIDIEditor_OnCommand(editor, 40366)

