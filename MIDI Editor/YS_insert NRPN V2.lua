--[[
 * ReaScript Name: insert NRPN V2
 * Version: 1.0
 * Author: YS
 * Repository URI: https://github.com/zaibuyidao/YS_ReaScripts
 * provides: [main=midi_editor,midi_eventlisteditor] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-10-14)
  + Initial release
--]]

local num=reaper.GetCursorPositionEx(0)

local editor=reaper.MIDIEditor_GetActive()

reaper.MIDIEditor_OnCommand(editor, 40833)

local take=reaper.MIDIEditor_GetTake(editor)

retval,notecnt,ccevtcnt, extsyxevtcnt = reaper.MIDI_CountEvts(take)

yingao={}
yingaonew={}

i,noteidx,ii,iii=1,0,2,1

while noteidx <= notecnt  do

retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)

yingao[i]=pitch

noteidx= noteidx + 1
i = i+1

end  --while end

reaper.MIDIEditor_OnCommand(editor, 40834)
local take=reaper.MIDIEditor_GetTake(editor)
local startpos=reaper.MIDI_GetPPQPosFromProjTime(take, num)

table.remove (yingao)
table.sort (yingao)

i=1
tempyingao = -1
while i <= #yingao do
if yingao[i] ~= tempyingao then
yingaonew[iii]=yingao[i]  tempyingao = yingao[i] iii=iii+1
 end --if end
i=i+1 end  --while end
if #yingaonew > 16 then shengyu=#yingaonew-16 integer = reaper.MB('键号数量超出16，请留出空间并手动添加剩余的'..shengyu..'个键号！', '', 0) end

jianhao = ''
jianhao = '      CC98 ='..yingaonew[1]..'      CC6 ='
while (ii <= #yingaonew and ii < 17)  do  jianhao= jianhao..','..'      CC98 ='..yingaonew[ii]..'      CC6 ='
ii =ii+1 
end
-- 
ccidx = reaper.MIDI_EnumSelCC(take, -1)
retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
nrpn ={}
nrpn[24]='Note Pitch 音符 音高' nrpn[26]='Note Level 音符 电平' nrpn[28]='Note Pan 音符 声像'  nrpn[29]='Note Revb 音符 混响'
nrpn[30]='Note Chors 音符 合唱' nrpn[31]='Note Delay 音符 延迟' 

input='128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128'
chushi="(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)"
if nrpn[msg3] ~= nil  then 
retval, shuzhi= reaper.GetUserInputs(nrpn[msg3],16,jianhao, input )
 a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p=string.match(shuzhi,chushi)
 q=tonumber (a)
 r=tonumber (b)
 s=tonumber (c)
 t=tonumber (d)
 u=tonumber (e)
 v=tonumber (f)
 w=tonumber (g)
 x=tonumber (h)
 y=tonumber (i)
 z=tonumber (j)
 aa=tonumber (k)
 ab=tonumber (l)
 ac=tonumber (m)
 ad=tonumber (n)
 ae=tonumber (o)
 af=tonumber (p)

if ( yingaonew[1]~=nil and q < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+10 , 176, 0, 98, yingaonew[1])
reaper.MIDI_InsertCC(take, false, false, startpos+20 , 176, 0, 6, q)
end
if ( yingaonew[2]~=nil and r < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+30 , 176, 0, 98, yingaonew[2])
reaper.MIDI_InsertCC(take, false, false, startpos+40 , 176, 0, 6, r)
end
if ( yingaonew[3]~=nil and s < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+50 , 176, 0, 98, yingaonew[3])
reaper.MIDI_InsertCC(take, false, false, startpos+60 , 176, 0, 6, s)
end
if ( yingaonew[4]~=nil and t < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+70 , 176, 0, 98, yingaonew[4])
reaper.MIDI_InsertCC(take, false, false, startpos+80 , 176, 0, 6, t)
end
if ( yingaonew[5]~=nil and u < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+90 , 176, 0, 98, yingaonew[5])
reaper.MIDI_InsertCC(take, false, false, startpos+100 , 176, 0, 6, u)
end
if ( yingaonew[6]~=nil and v < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+110 , 176, 0, 98, yingaonew[6])
reaper.MIDI_InsertCC(take, false, false, startpos+120 , 176, 0, 6, v)
end
if ( yingaonew[7]~=nil and w < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+130 , 176, 0, 98, yingaonew[7])
reaper.MIDI_InsertCC(take, false, false, startpos+140 , 176, 0, 6, w)
end
if ( yingaonew[8]~=nil and x < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+150 , 176, 0, 98, yingaonew[8])
reaper.MIDI_InsertCC(take, false, false, startpos+160 , 176, 0, 6, x)
end
if ( yingaonew[9]~=nil and y < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+170 , 176, 0, 98, yingaonew[9])
reaper.MIDI_InsertCC(take, false, false, startpos+180 , 176, 0, 6, y)
end
if ( yingaonew[10]~=nil and z < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+190 , 176, 0, 98, yingaonew[10])
reaper.MIDI_InsertCC(take, false, false, startpos+200 , 176, 0, 6, z)
end
if ( yingaonew[11]~=nil and aa < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+210 , 176, 0, 98, yingaonew[11])
reaper.MIDI_InsertCC(take, false, false, startpos+220 , 176, 0, 6, aa)
end
if ( yingaonew[12]~=nil and ab < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+230 , 176, 0, 98, yingaonew[12])
reaper.MIDI_InsertCC(take, false, false, startpos+240 , 176, 0, 6, ab)
end
if ( yingaonew[13]~=nil and ac < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+250 , 176, 0, 98, yingaonew[13])
reaper.MIDI_InsertCC(take, false, false, startpos+260 , 176, 0, 6, ac)
end
if ( yingaonew[14]~=nil and ad < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+270 , 176, 0, 98, yingaonew[14])
reaper.MIDI_InsertCC(take, false, false, startpos+280 , 176, 0, 6, ad)
end
if ( yingaonew[15]~=nil and ae < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+290 , 176, 0, 98, yingaonew[15])
reaper.MIDI_InsertCC(take, false, false, startpos+300 , 176, 0, 6, ae)
end
if ( yingaonew[16]~=nil and af < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+310 , 176, 0, 98, yingaonew[16])
reaper.MIDI_InsertCC(take, false, false, startpos+320 , 176, 0, 6, af)
end
 end -- nrpn if
reaper.MIDI_Sort(take)
reaper.SN_FocusMIDIEditor()



