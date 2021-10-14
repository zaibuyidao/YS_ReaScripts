--[[
 * ReaScript Name: Note Vel to Envelope 音符力度转音频包络
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

MediaTrack=reaper.GetMediaItemTake_Track(take)

envelope = reaper.GetTrackEnvelope(MediaTrack, 0)

if envelope==nil then reaper.MB('轨道包络没有打开！','错误！', 0)  return end

idx=0 vel_sub=0
repeat
 retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, idx)
 if vel > vel_sub then vel_sub=vel end
 idx=idx + 1
 retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, idx)
 until retval==false

idx=0
repeat
 retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, idx)
 vel_chazhi=vel_sub - vel
 vel_chazhi=vel_chazhi*0.008
 time=reaper.MIDI_GetProjTimeFromPPQPos(take, startppqpos)
 retval, tm, value, shape, tension, selected = reaper.GetEnvelopePoint(envelope, 0)

 reaper.InsertEnvelopePoint(envelope, time, value-vel_chazhi, 5, 1, false,false)

 idx=idx + 1
 retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, idx)
 until retval==false
reaper.Envelope_SortPoints(envelope)
