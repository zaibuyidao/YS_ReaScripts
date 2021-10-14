--[[
 * ReaScript Name: 小七和弦
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

idx=-1

repeat

 integer = reaper.MIDI_EnumSelNotes(take, idx)
 if integer ~= -1 then
 retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
 pitch2=pitch+3  pitch3=pitch+7  pitch4=pitch+10
 
 reaper.MIDI_InsertNote(take, false, false, startppqpos, endppqpos, chan, pitch2, vel, true)
 reaper.MIDI_InsertNote(take, false, false, startppqpos, endppqpos, chan, pitch3, vel, true)
 reaper.MIDI_InsertNote(take, false, false, startppqpos, endppqpos, chan, pitch4, vel, true)
  end
 idx=integer
 until integer==-1

reaper.MIDI_Sort(take)
reaper.StuffMIDIMessage(16, 144,pitch,100)
local yanchi=os.clock()
while os.clock() - yanchi < 0.08 do end

reaper.StuffMIDIMessage(16, 144,pitch2,100)
local yanchi=os.clock()
while os.clock() - yanchi < 0.08 do end

reaper.StuffMIDIMessage(16, 144,pitch3,100)
local yanchi=os.clock()
while os.clock() - yanchi < 0.08 do end

local yanchi=os.clock()
reaper.StuffMIDIMessage(16, 144,pitch4,100)
while os.clock() - yanchi < 0.2 do end

reaper.StuffMIDIMessage(16, 128,pitch,0)
reaper.StuffMIDIMessage(16, 128,pitch2,0)
reaper.StuffMIDIMessage(16, 128,pitch3,0)
reaper.StuffMIDIMessage(16, 128,pitch4,0)
