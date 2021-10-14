--[[
 * ReaScript Name: CC to Envelope  控制器转音频包络
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

retval,shuru= reaper.GetUserInputs('CC to Envelope 控制器转音频包络',1,"控制器类型 = (0,119)",'11')  
 
CC_num=tonumber(shuru) 

idx=0 val_sub=0
repeat
 retval, selected, muted, ppqpos, chanmsg, chan, msg2, val = reaper.MIDI_GetCC(take,idx)
 if chanmsg==176 and msg2==CC_num then
 if val > val_sub then val_sub=val end
 end
 idx=idx + 1
 retval, selected, muted, ppqpos, chanmsg, chan, msg2, val = reaper.MIDI_GetCC(take,idx)
 until retval==false

idx=0
repeat
 retval, selected, muted, ppqpos, chanmsg, chan, msg2, val = reaper.MIDI_GetCC(take,idx)
 if chanmsg==176 and msg2==CC_num then
 retval, shape, beztension = reaper.MIDI_GetCCShape(take, idx)
 val_chazhi=val_sub - val
 val_chazhi=val_chazhi*0.0082
 if shape < 2 then if shape==0 then shape=1 else shape=0 end end
 time=reaper.MIDI_GetProjTimeFromPPQPos(take, ppqpos)
 retval, tm, value, _, _, selected = reaper.GetEnvelopePoint(envelope, 0)

 reaper.InsertEnvelopePoint(envelope, time, value-val_chazhi, shape, beztension, false,false)
end

 idx=idx + 1
 retval, selected, muted, ppqpos, chanmsg, chan, msg2, val = reaper.MIDI_GetCC(take,idx)
 until retval==false
reaper.Envelope_SortPoints(envelope)

reaper.MIDIEditor_OnCommand(editor, 40794)
