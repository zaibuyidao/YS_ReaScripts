--[[
 * ReaScript Name: Lenth 事件缩放
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

string = reaper.GetExtState('old lenth', '1')

retval, shuzhi = reaper.GetUserInputs('Lengh 长度', 1, '设定长度比例%：', string)

if retval then
val=tonumber (shuzhi)

 reaper.SetExtState('old lenth', '1', shuzhi, true)

evtidx = -1

integer = reaper.MIDI_EnumSelEvts(take, evtidx)

retval, selected, muted, ppqpos, msg = reaper.MIDI_GetEvt(take, integer, true, false, -1, '')
       evtidx = integer
       integer = reaper.MIDI_EnumSelEvts(take, evtidx)
       
      if  integer ~= -1 then
       repeat
       retval, selected, muted, ppqpos2, msg = reaper.MIDI_GetEvt(take, integer, true, false, -1, '')
       juli = ppqpos2 - ppqpos
       newjuli =  juli * (val /100) 
       reaper.MIDI_SetEvt(take, integer, true, false, ppqpos+newjuli, msg, true)
       evtidx = integer
       integer = reaper.MIDI_EnumSelEvts(take, evtidx)
       until ( integer == -1 )
      end  -- if end
       
reaper.MIDI_Sort(take)

end
reaper.SN_FocusMIDIEditor()




