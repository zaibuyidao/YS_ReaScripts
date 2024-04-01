--[[
 * ReaScript Name: 实音变滑弦
 * Version: 1.0
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2024-4-1)
  + Initial release
--]]

local editor = reaper.MIDIEditor_GetActive()

local take = reaper.MIDIEditor_GetTake(editor)

tbon = {}
tboff = {}
tbpitch = {}
tbchan = {}
tbvel = {}
i = 1
prevpitch = 0
oldtick = -10

integer = reaper.MIDI_EnumSelNotes(take, -1)
if integer == -1 then
    return
end
repeat
    integer = reaper.MIDI_EnumSelNotes(take, -1)
    retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
    tbon[i] = startppqpos
    tboff[i] = endppqpos
    tbpitch[i] = pitch
    tbchan[i] = chan
    tbvel[i] = vel
    i = i + 1
    boolean = reaper.MIDI_DeleteNote(take, integer)
until (integer == -1)
i = i - 2 -- buchang
pos = reaper.MIDI_GetProjTimeFromPPQPos(take, tbon[1]) + 0.090
posppq = reaper.MIDI_GetPPQPosFromProjTime(take, pos)
Adaptation = posppq - tbon[1]
--
newon = tbon[1]
newoff = tboff[i]
newpitch = tbpitch[1]
newchan = tbchan[1]
newvel = tbvel[1]
reaper.MIDI_InsertNote(take, false, false, newon, newoff - 1, newchan, newpitch, newvel, true)
-- insert Note
tbpn = {}
ii = 2
while (ii <= i) do
    tbpn[ii] = tbpitch[ii] - tbpitch[1]
    ii = ii + 1
end
-- get pitch num
iii = 1
fuiii = -1
for ii = 2, i do
    wheeltick = 0
    iiii = 0
    if tbpn[ii] > prevpitch then
        repeat
            chazhi = tbpn[ii] - prevpitch

            pitch = 683 * iii

            if (pitch > 8191) then
                pitch = 8191
            end
            if (pitch < -8192) then
                pitch = -8191
            end

            local beishu = math.modf(pitch / 128)
            local yushu = math.fmod(pitch, 128)
            if (beishu < 0) then
                beishu = beishu - 1
            end
            wheeltick = tbon[ii] + Adaptation * (iiii + iiii) / (chazhi + iiii)
            if wheeltick - oldtick < 10 then
                wheeltick = oldtick + 10
            end
            reaper.MIDI_InsertCC(take, false, false, wheeltick, 224, 0, yushu, 64 + beishu)
            iii = iii + 1
            fuiii = iii - 1
            iiii = iiii + 1
            oldtick = wheeltick

        until iii > tbpn[ii]
    else
        repeat
            chazhi = prevpitch - tbpn[ii]

            pitch = 683 * fuiii

            if (pitch > 8191) then
                pitch = 8191
            end
            if (pitch < -8192) then
                pitch = -8191
            end

            local beishu = math.modf(pitch / 128)
            local yushu = math.fmod(pitch, 128)
            if (beishu < 0) then
                beishu = beishu - 1
            end
            wheeltick = tbon[ii] + Adaptation * (iiii + iiii) / (chazhi + iiii)
            if wheeltick - oldtick < 10 then
                wheeltick = oldtick + 10
            end
            reaper.MIDI_InsertCC(take, false, false, wheeltick, 224, 0, yushu, 64 + beishu)
            fuiii = fuiii - 1
            iii = fuiii + 1
            iiii = iiii + 1
            oldtick = wheeltick
        until fuiii < tbpn[ii]
    end
    iiii = 0
    prevpitch = tbpn[ii]
end
-- insert Pitch
if (tbpitch[1] ~= tbpitch[i]) then
    reaper.MIDI_InsertCC(take, false, false, tboff[i], 224, 0, 0, 64)
end
-- end Pitch
if i > 25 then
    reaper.MB('有大量音符被转为弯音 !', '提醒', 0)
end
reaper.MIDIEditor_OnCommand(editor, 40366)
