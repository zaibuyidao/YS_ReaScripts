--[[
 * ReaScript Name: Tempo list 速度列表
 * Version: 1.1.1
 * Author: YS
 * provides: [main=main] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

function tempo_list()
    txt_title = "Measurepos       " .. 'Tempo         ' .. 'Beat'
    txt = ''
    i = 0
    itemidx = 0
    tempo_tb = {}
    repeat
        item = reaper.GetMediaItem(0, itemidx)
        if not item then
            return
        end
        take = reaper.GetTake(item, 0)
        itemidx = itemidx + 1
    until reaper.TakeIsMIDI(take)
    repeat
        retval, timepos, measurepos, beatpos, bpm, timesig_num, timesig_denom, lineartempo = reaper.GetTempoTimeSigMarker(0, i)
        -- bpm = (math.floor(bpm * 1000 + 0.5)) / 1000
        table.insert(tempo_tb, bpm)
        bpm = string.format('%07.3f', bpm)
        -- bpm = string.format('%07s', bpm)
        beatpos = math.floor(beatpos) + 1
        measurepos = measurepos + 1
        tick = reaper.MIDI_GetPPQPosFromProjTime(take, timepos)
        StartOfMeasure = reaper.MIDI_GetPPQPos_StartOfMeasure(take, tick)
        tick_2 = (tick - StartOfMeasure) % 480
        tick_2 = math.floor(tick_2 + 0.5)
        tick_2 = tostring(tick_2)
        measurepos = tostring(measurepos)
        if #tick_2 == 1 then
            tick_2 = '00' .. tick_2
        end
        if #tick_2 == 2 then
            tick_2 = '0' .. tick_2
        end
        measurepos = string.format('%03d', measurepos)
        if timesig_num == -1 then
            beat = ''
        else
            beat = timesig_num .. '/' .. timesig_denom
        end

        if bpm ~= 0 then
            txt = txt .. measurepos .. ':' .. beatpos .. ':' .. tick_2 .. '           ' .. bpm .. '        ' .. beat .. '\n'
        end
        i = i + 1
        retval, timepos, measurepos, beatpos, bpm, timesig_num, timesig_denom, lineartempo = reaper.GetTempoTimeSigMarker(0, i)
    until retval == false
    tempo_array = reaper.new_array(tempo_tb)
end -- function end

tempo_list()
tempchangecount = 0
local ctx_tempo = reaper.ImGui_CreateContext('Tempo List')
local size = reaper.GetAppVersion():match('OSX') and 12 or 14
local font = reaper.ImGui_CreateFont('sans-serif', 15)
reaper.ImGui_Attach(ctx_tempo, font)

reaper.ImGui_SetNextWindowSize(ctx_tempo, 240, 400)

function loop()
    reaper.ImGui_PushFont(ctx_tempo, font)
    StateChangeCount = reaper.GetProjectStateChangeCount(0)
    if StateChangeCount ~= tempchangecount then
        tempo_list()
        tempchangecount = StateChangeCount
    end
    local visible, open = reaper.ImGui_Begin(ctx_tempo, 'Tempo List', true)
    if visible then
        if tempo_array then
            reaper.ImGui_PlotHistogram(ctx_tempo, '', tempo_array, NULL, NULL, 0, NULL, 220, 100)
        end
        reaper.ImGui_TextColored(ctx_tempo, 0xFA8072FF, txt_title)
        reaper.ImGui_Text(ctx_tempo, txt)
        reaper.ImGui_End(ctx_tempo)
    end
    reaper.ImGui_PopFont(ctx_tempo)

    if open then
        reaper.defer(loop)
    end
end

reaper.defer(loop)

_, _, sectionID, ownCommandID, _, _, _ = reaper.get_action_context()
reaper.SetToggleCommandState(sectionID, ownCommandID, 1)
reaper.RefreshToolbar2(sectionID, ownCommandID)

function exit()
    reaper.SetToggleCommandState(sectionID, ownCommandID, 0)
    reaper.RefreshToolbar2(sectionID, ownCommandID)
end
reaper.atexit(exit)

