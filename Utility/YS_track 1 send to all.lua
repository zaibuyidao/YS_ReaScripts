--[[
 * ReaScript Name: track 1 send to all
 * Version: 1.0
 * Author: YS
 * Repository URI: https://github.com/zaibuyidao/YS_ReaScripts
 * provides: [main=main] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-10-14)
  + Initial release
--]]
 
reaper.PreventUIRefresh(1)
track1 = reaper.GetTrack(0, 0)
integer = reaper.CountTracks(0)
 i=1 
 while i < integer do
track_all = reaper.GetTrack(0, i)
reaper.CreateTrackSend(track1, track_all)
i = i + 1
end
sendnum =reaper.GetTrackNumSends(track1, 0)
ii=0
 while ii < sendnum do
  reaper.SetTrackSendInfo_Value(track1, 0, ii, 'B_MUTE', 1)
  ii = ii + 1
  end
reaper.PreventUIRefresh(-1)