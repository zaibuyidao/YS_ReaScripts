--[[
 * ReaScript Name: insert Bank to PC
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

retval, bank = reaper.GetUserInputs('insert Bank to PC', 1, 'Bank = ', '3')
if retval==false then return end
bank=tonumber (bank)
MSB = math.modf( bank / 128 ) 
LSB = bank % 128

editor=reaper.MIDIEditor_GetActive()
take=reaper.MIDIEditor_GetTake(editor)
idx=-1
repeat
ccidx=reaper.MIDI_EnumSelCC(take,idx)
retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
if chanmsg==192 then 
reaper.MIDI_InsertCC(take, false, false, ppqpos, 176, chan, 0, MSB)
reaper.MIDI_InsertCC(take, false, false, ppqpos, 176, chan, 32, LSB)
end
idx=ccidx
ccidx=reaper.MIDI_EnumSelCC(take,idx)
until  ccidx==-1

reaper.SN_FocusMIDIEditor()
