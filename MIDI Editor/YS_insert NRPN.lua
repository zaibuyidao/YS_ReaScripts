local num=reaper.GetCursorPositionEx(0)

local editor=reaper.MIDIEditor_GetActive()

local take=reaper.MIDIEditor_GetTake(editor)

local startpos=reaper.MIDI_GetPPQPosFromProjTime(take, num)

retval, shuzhi= reaper.GetUserInputs('drum setup',10,
 'NOTE Key CC98=,CC VAL CC6=,NOTE Key CC98=,CC VAL CC6=,NOTE Key CC98=,CC VAL CC6=,NOTE Key CC98=,CC VAL CC6=,NOTE Key CC98=,CC VAL CC6=', 
 '128,128,128,128,128,128,128,128,128,128')
 a,b,c,d,e,f,g,h,i,j=string.match(shuzhi,"(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)")
 k=tonumber (a)
 l=tonumber (b)
 m=tonumber (c)
 n=tonumber (d)
 o=tonumber (e)
 p=tonumber (f)
 q=tonumber (g)
 r=tonumber (h)
 s=tonumber (i)
 t=tonumber (j)

if ( k < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+10 , 176, 0, 98, k)
end
if ( l < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+20 , 176, 0, 6, l)
end
if ( m < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+30 , 176, 0, 98, m)
end
if ( n < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+40 , 176, 0, 6, n)
end
if ( o < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+50 , 176, 0, 98, o)
end
if ( p < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+60 , 176, 0, 6, p)
end
if ( q < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+70 , 176, 0, 98, q)
end
if ( r < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+80 , 176, 0, 6, r)
end
if ( s < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+90 , 176, 0, 98, s)
end
if ( t < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+100 , 176, 0, 6, t)
end

reaper.MIDI_Sort(take)
reaper.SN_FocusMIDIEditor()



