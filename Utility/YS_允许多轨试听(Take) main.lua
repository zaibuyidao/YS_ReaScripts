--[[
 * ReaScript Name: 允许多轨试听(Take) main
 * Version: 1.0
 * Author: YS
 * provides: [main=main] .
--]]

--[[
 * Changelog:
 * v1.0 (2024-9-8)
  + Initial release
--]]

local start_time = reaper.time_precise()
local key_state = reaper.JS_VKeys_GetState(start_time - 2)
local is_playing = false

-- 检测被按下的按键
local function detect_key_press()
    for key_code = 1, 255 do
        if key_state:byte(key_code) ~= 0 then -- 检测按键是否被按下
            reaper.JS_VKeys_Intercept(key_code, 1) -- 拦截按键，防止其他操作被干扰
            return key_code
        end
    end
    return nil -- 未检测到按键
end

local key = detect_key_press()
if not key then
    return
end -- 如果没有检测到按键，结束脚本

-- 检查按键是否被持续按住
local function is_key_held()
    key_state = reaper.JS_VKeys_GetState(start_time - 2)
    return key_state:byte(key) == 1
end

-- 恢复初始状态
local function release()
    unsolo_all_items()
    reaper.JS_VKeys_Intercept(key, -1) -- 取消按键拦截
end

-- 取消所有轨道独奏并记忆
function unsolo_all_tracks()
    solotrack = {}
    solotrack2 = {}
    for i = 0, reaper.CountTracks(0) - 1 do
        track = reaper.GetTrack(0, i)
        getsolo = reaper.GetMediaTrackInfo_Value(track, "I_SOLO")
        if getsolo ~= 0 then
            table.insert(solotrack, track)
            table.insert(solotrack2, getsolo)
        end
    end
    reaper.SoloAllTracks(0)
end

-- 独奏选中的项目
function solo_selected_items()
    reaper.PreventUIRefresh(1)
    num_items = reaper.CountMediaItems(0)

    unsolo_all_tracks() -- 取消所有轨道的独奏状态

    for i = 0, num_items - 1 do
        item = reaper.GetMediaItem(0, i)
        if not reaper.IsMediaItemSelected(item) then
            reaper.SetMediaItemInfo_Value(item, 'B_MUTE', 1)
        end
    end
    reaper.PreventUIRefresh(-1)
end

-- 取消所有项目的独奏
function unsolo_all_items()
    reaper.PreventUIRefresh(1)
    if CountSelectedMediaItems ~= 0 then
        for i, v in ipairs(solotrack) do
            reaper.SetMediaTrackInfo_Value(v, "I_SOLO", solotrack2[i])
        end
    end

    num_items = reaper.CountMediaItems(0)

    for i = 0, num_items - 1 do
        item = reaper.GetMediaItem(0, i)
        if not reaper.IsMediaItemSelected(item) then
            reaper.SetMediaItemInfo_Value(item, 'B_MUTE', 0)
        end
    end
    reaper.PreventUIRefresh(-1)
    reaper.UpdateArrange()
end

CountSelectedMediaItems = reaper.CountSelectedMediaItems(0)

if CountSelectedMediaItems ~= 0 then
    solo_selected_items()
end

function main()
    if is_key_held() then
        if CountSelectedMediaItems == 0 then
            reaper.Main_OnCommand(reaper.NamedCommandLookup('_BR_CONT_PLAY_MOUSE_SOLO_TRACK'), 0)
        else
            reaper.Main_OnCommand(reaper.NamedCommandLookup('_BR_CONT_PLAY_MOUSE'), 0)
            -- reaper.ShowConsoleMsg('solo') 
        end
        reaper.defer(main)
    end
end

reaper.defer(main)
reaper.atexit(release)
