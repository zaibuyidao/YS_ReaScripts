--[[
 * ReaScript Name: 非静音1408以内弯音扩展到8192
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

txt=''

reaper.MIDI_DisableSort(take)

ccidx = -1

idx = reaper.MIDI_EnumSelCC(take, ccidx)

while idx ~= -1 do

retval, selected, muted, ppqpos,chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, idx)

if chanmsg == 224 and muted ~= true then 

wheel = msg3*128 + msg2 - 8192

pos=reaper.MIDI_GetProjTimeFromPPQPos(take, ppqpos)

buf = reaper.format_timestr_pos(pos, '', 2)

if wheel < -1408 or wheel > 1408 then 
txt=txt..buf..'有超过 1408 的弯音被选中。' reaper.MB(txt, '错误！', 0) 
reaper.SN_FocusMIDIEditor() return end
end

ccidx = idx

idx = reaper.MIDI_EnumSelCC(take, ccidx)

end

ccidx = -1

idx = reaper.MIDI_EnumSelCC(take, ccidx)

while idx ~= -1 do

retval, selected, muted, ppqpos,chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, idx)

if chanmsg == 224 and muted ~= true then 

wheel = msg3*128 + msg2 - 8192

wheel_sub = wheel * 5.997 + 8192

if (wheel_sub > 16383) then wheel_sub = 16383 end
if (wheel_sub < 0) then wheel_sub = 0 end

 msg3In = math.modf( wheel_sub / 128 )
 msg2In = math.fmod( wheel_sub, 128 ) 
 msg2In =string.match(msg2In,"%d+")  
 
 reaper.MIDI_SetCC(take, idx, NULL, NULL, NULL, NULL, NULL, msg2In, msg3In, true)

end

ccidx = idx

idx = reaper.MIDI_EnumSelCC(take, ccidx)

end

reaper.MIDI_Sort(take) 

