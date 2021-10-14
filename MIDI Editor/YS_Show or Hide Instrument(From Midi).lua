--[[
 * ReaScript Name: Show or Hide Instrument(From Midi)
 * Version: 1.0
 * Author: YS
 * Repository URI: https://github.com/zaibuyidao/YS_ReaScripts
 * provides: [main=midi_editor] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-10-14)
  + Initial release
--]]

local editor=reaper.MIDIEditor_GetActive()

local take=reaper.MIDIEditor_GetTake(editor)

_DBG=false
function DBG(str)
  if _DBG then reaper.ShowConsoleMsg(str.."\n") end
end

-- a list of MIDI plugin manufacturers or just plugins that
-- report as VSTi but aren't instruments. Add your own here.
local blacklist = {
    "Insert Piz Here", "RapidComposer", "graywolf2004", "Kirnu"
 }


local function isFXonBlacklist(name)
  for i = 1, #blacklist do
    if name:match(blacklist[i]) then return true end
  end
  return false
end


local function getInstrumentIdx(track)
  -- iterate through FX, checking if instruments are
  -- actual instruments and not on blacklist
  local num_fx = reaper.TrackFX_GetCount(track)
  local idx = -1
  for i = num_fx,1,-1 do 
    local ok, name = reaper.TrackFX_GetFXName(track, i-1,"")
    if name:match("VSTi") == "VSTi" and not isFXonBlacklist(name) then idx = i-1 break end
  end
  
  return idx
end


local function showHideFX(track,fx_idx)
  -- showflag=0 for hidechain, =1 for show chain(index valid), =2 for hide floating window(index valid), 
  -- =3 for show floating window (index valid)
  local flag=reaper.TrackFX_GetFloatingWindow(track, fx_idx)==nil and 3 or 2
  reaper.TrackFX_Show(track,fx_idx,flag)
end


local function checkReceives(track)
  local num_receives=reaper.GetTrackNumSends(track,-1)
  if num_receives > 0 then
    local ot=reaper.BR_GetMediaTrackSendInfo_Track(track, -1 , 0, 0)
    showHideFX(ot,getInstrumentIdx(ot))
    return true
  end
  return false            
end


function openInstrument()
  --[[local sts=reaper.CountSelectedTracks(0)
  if sts==1 then
    local tr=reaper.GetSelectedTrack(0,0)--]]
    tr=reaper.GetMediaItemTake_Track(take)
    if tr~=nil then      
      local fx=getInstrumentIdx(tr)
      if fx>-1 then
        showHideFX(tr,fx)
        return
      else
        if reaper.GetTrackNumSends(tr,0)>0 then
          local ok, str=reaper.GetTrackSendName(tr, 0, "")
          -- 0s = idx, idx, tracktype
          local st=reaper.BR_GetMediaTrackSendInfo_Track(tr,0 , 0, 1)
          local bus=reaper.BR_GetSetTrackSendInfo(tr, 0, 0, "I_MIDI_DSTBUS", false, 0)
          if bus==-1 then --check if it's an output track
            checkReceives(tr)
          end
          local fx=getInstrumentIdx(st)
          showHideFX(st,fx)
          return
        else
          checkReceives(tr)
        end
      end
    end
  end


openInstrument()
