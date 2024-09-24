--[[
 * ReaScript Name: slide in
 * Version: 1.0.4
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

c = 1
txt = ''

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

retval, mode = reaper.GetProjExtState(0, 'slide in', 'mode')
if mode == '' then
    mode = '0'
end

retval, shuru = reaper.GetUserInputs('Slide In Wheel', 2, "PitchRange = (-12,12),品格:0  击勾弦:1  平滑:2", '0,' .. mode)
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
b = juli / wanyin_num
reaper.MIDI_DisableSort(take)
if (Thru ~= 0) then
    if (wanyin_num > 0) -- zhengshu
    then
        pitch = 683 * wanyin_num

        if (pitch > 8191) then
            pitch = 8191
        end
        if (pitch < -8192) then
            pitch = -8191
        end

        local beishu = math.modf(pitch / 128)
        local yushu = math.fmod(pitch, 128)
        if (beishu < 0) then
            beishu = beishu - 1
        end

        reaper.MIDI_InsertCC(take, false, false, From_tick, 224, 0, yushu, 64 + beishu)
        if jigou == '2' then

            retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
            reaper.MIDI_SetCCShape(take, ccevtcnt - 1, 5, 0.25, false)
        end

        if jigou == '0' then
            TempTick = -10
            while (c <= wanyin_num) do
                pitch = 683 * (wanyin_num - c)

                if (pitch > 8191) then
                    pitch = 8191
                end
                if (pitch < -8192) then
                    pitch = -8191
                end

                local beishu = math.modf(pitch / 128)
                local yushu = math.fmod(pitch, 128)
                if (beishu < 0) then
                    beishu = beishu - 1
                end
                
                if jiange > 3 then
                    subjiange = jiange * 2
                    subjuli = juli / 0.74
                else
                    subjiange = jiange + (c * 0.85)
                    subjuli = juli
                end
                InsertTick = From_tick + subjuli * c / (subjiange - (c * 0.65))
                
                -- InsertTick = From_tick + juli * ((c + c) / (jiange + c))
                if InsertTick - TempTick < 9 then
                    txt = txt .. '弯音 ' .. pitch .. ' 距离低于 10 tick!\n'
                end
                TempTick = InsertTick
                reaper.MIDI_InsertCC(take, false, false, InsertTick, 224, 0, yushu, 64 + beishu)
                c = c + 1
            end -- while end

        else
            reaper.MIDI_InsertCC(take, false, false, Thru_tick, 224, 0, 0, 64)
        end -- if jigou end
    end
end -- thru  zhengshu

if (Thru ~= 0) then
    if (wanyin_num < 0) then
        pitch = 683 * wanyin_num

        if (pitch > 8191) then
            pitch = 8191
        end
        if (pitch < -8192) then
            pitch = -8191
        end

        local beishu = math.modf(pitch / 128)
        local yushu = math.fmod(pitch, 128)
        if (beishu < 0) then
            beishu = beishu - 1
        end

        reaper.MIDI_InsertCC(take, false, false, From_tick, 224, 0, yushu, 64 + beishu)
        if jigou == '2' then

            retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
            reaper.MIDI_SetCCShape(take, ccevtcnt - 1, 5, 0.25, false)
        end

        if jigou == '0' then
            TempTick = -10
            while (c <= wanyin_num * -1) do
                pitch = 683 * (wanyin_num + c)

                if (pitch > 8191) then
                    pitch = 8191
                end
                if (pitch < -8192) then
                    pitch = -8191
                end

                local beishu = math.modf(pitch / 128)
                local yushu = math.fmod(pitch, 128)
                if (beishu < 0) then
                    beishu = beishu - 1
                end
                InsertTick = From_tick + juli * ((c + c) / (jiange + c))
                if InsertTick - TempTick < 9 then
                    txt = txt .. '弯音 ' .. pitch .. ' 距离低于 10 tick!\n'
                end
                TempTick = InsertTick
                reaper.MIDI_InsertCC(take, false, false, InsertTick, 224, 0, yushu, 64 + beishu)
                c = c + 1
            end -- while end
        else
            reaper.MIDI_InsertCC(take, false, false, Thru_tick, 224, 0, 0, 64)
        end -- if jigou end
    end
end -- thru fushu
reaper.MIDI_Sort(take)
reaper.SetProjExtState(0, 'slide in', 'mode', jigou)

if txt ~= '' then
    reaper.MB(txt, '警告!', 0)
end

reaper.SN_FocusMIDIEditor()

reaper.MIDIEditor_OnCommand(editor, 40366)

