--[[
 * ReaScript Name: 多音字拼音批量替换
 * Version: 1.0
 * Author: YS
 * Repository URI: https://github.com/zaibuyidao/YS_ReaScripts
--]]

--[[
 * Changelog:
 * v1.0 (2021-10-14)
  + Initial release
--]]

local editor=reaper.MIDIEditor_GetActive()

local take=reaper.MIDIEditor_GetTake(editor)
reaper.MIDI_DisableSort(take)

retval, notecnt,ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
idx=reaper.MIDI_EnumSelTextSysexEvts(take, -1)
retval, selected, muted, ppqpos, t_type, msg = reaper.MIDI_GetTextSysexEvt(take, idx, true, false, 0, 5, '')
if t_type==5 then  
msg_type=string.gsub(msg,',',' ')
retval,txt= reaper.GetUserInputs('多音字拼音批量替换工具',1,msg_type..' 替换为：','')
if retval==false then reaper.SN_FocusMIDIEditor() return end
while idx < textsyxevtcnt do
retval, selected, muted, ppqpos, t_type, msg_new = reaper.MIDI_GetTextSysexEvt(take, idx, true, false, 0, 5, '')
if t_type==5 and msg_new==msg then  
reaper.MIDI_SetTextSysexEvt(take, idx, true, NULL, NULL, 5, txt, false)
end
idx=idx+1
end
end
reaper.MIDI_Sort(take)
reaper.SN_FocusMIDIEditor()

