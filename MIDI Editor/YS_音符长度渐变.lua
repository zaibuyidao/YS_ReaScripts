--[[
 * ReaScript Name: 音符长度渐变
 * Version: 1.0.2
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2022-1-15)
  + Initial release
--]]

editor=reaper.MIDIEditor_GetActive()
take=reaper.MIDIEditor_GetTake(editor)
notetb={}
idx=-1
integer=reaper.MIDI_EnumSelNotes(take,idx)
if integer~=-1 then
retval,selected, muted,ppqstart,endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
end

while integer~=-1 do
retval,selected, muted,startppqpos,ppqend, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
notedd=ppqend-startppqpos weizhi=startppqpos-ppqstart
table.insert(notetb,integer..','..notedd..','..ppqend..','..weizhi)
idx=integer
integer=reaper.MIDI_EnumSelNotes(take,idx)
end

function notedur()
for i, v in ipairs(notetb) do
    noteidx,notedd,noteend,noteweizhi=string.match(v,'(%d+),(%d+..),(%d+..),(%d+..)')
    if durbili2>0 then 
    noteddnew=notedd-((durbili2*noteweizhi)/100)
    else
    durbilinew=durbili2*-1
    noteweizhi=weizhi-noteweizhi
    noteddnew=notedd-((durbilinew*noteweizhi)/100)
    end
    noteend=noteend+(noteddnew-notedd)
    reaper.MIDI_SetNote(take, noteidx, true, false, NULL,noteend, NULL, NULL,NULL, true)
end 

end --function end

local ctx = reaper.ImGui_CreateContext('Note length gradient')
  local size = reaper.GetAppVersion():match('OSX') and 12 or 14
  local font = reaper.ImGui_CreateFont('sans-serif', size)
  reaper.ImGui_AttachFont(ctx, font)
  
x,y=reaper.GetMousePosition()
x, y = reaper.ImGui_PointConvertNative(ctx, x, y)
reaper.ImGui_SetNextWindowSize(ctx, 410, 55)
  reaper.ImGui_SetNextWindowPos(ctx, x, y)
flag=true Sliderflag=0
function loop()
   reaper.ImGui_PushFont(ctx, font)
  local visible, open = reaper.ImGui_Begin(ctx, 'Note length gradient', true)
  if visible then
    retval, durbili= reaper.ImGui_SliderInt(ctx, 'Gradient direction', durbili, -10, 10, nil,nil)
    durbili2=durbili*-1
   retval_esc = reaper.ImGui_IsKeyPressed(ctx, 27, nil)
   retval_enter = reaper.ImGui_IsKeyPressed(ctx, 13, nil)
    if retval_esc or retval_enter then  flag=false end
    reaper.ImGui_End(ctx)
  end
  reaper.ImGui_PopFont(ctx)
  
  if Sliderflag~=durbili then  notedur() Sliderflag=durbili end
  if open and flag then
    reaper.defer(loop)
  else
    reaper.ImGui_DestroyContext(ctx)
    reaper.SN_FocusMIDIEditor()
  end
end

reaper.defer(loop)
