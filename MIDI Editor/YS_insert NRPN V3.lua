--[[
 * ReaScript Name: insert NRPN V3
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

num=reaper.GetCursorPositionEx(0)

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

jianhao = ''
jianhao = '      CC98 ='..yingaonew[1]..'      CC6 ='
jianhao2 = ''
while (ii <= #yingaonew and ii < 17)  do  jianhao= jianhao..','..'      CC98 ='..yingaonew[ii]..'      CC6 ='
ii =ii+1 
end
if #yingaonew>16 then
jianhao2 = '      CC98 ='..yingaonew[ii]..'      CC6 ='
ii = ii+1
while (ii <= #yingaonew and ii < 33)  do  jianhao2= jianhao2..','..'      CC98 ='..yingaonew[ii]..'      CC6 ='
ii =ii+1 
end
end

-- 
ccidx = reaper.MIDI_EnumSelCC(take, -1)
if ccidx==-1 then reaper.MB('请把光标放在 CC99 上！','光标位置错误！',0) reaper.SN_FocusMIDIEditor() return end
retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
retval2, selected2, muted2, ppqpos2, chanmsg2, chan2, msg22, msg32 = reaper.MIDI_GetCC(take, ccidx+1)
if retval2 then
nextcc=ppqpos2-ppqpos
if nextcc <= #yingaonew*2*10+10 then 
kongjian=#yingaonew*2*10-nextcc+20
kongjian=string.format('%d',kongjian)
reaper.MB('NRPN 插入空间不足！需要增加 '..kongjian..' tick' ,'错误！',0) reaper.SN_FocusMIDIEditor() return end end
------------------------------------------------------
endppq=startpos+(#yingaonew*20)
endpos= reaper.MIDI_GetProjTimeFromPPQPos(take, endppq)
item=reaper.GetMediaItemTake_Item(take)
itempos = reaper.GetMediaItemInfo_Value(item, 'D_POSITION')
itemlength = reaper.GetMediaItemInfo_Value(item, 'D_LENGTH')
itemend=itempos+itemlength
timepos=reaper.format_timestr_pos(endpos,'',2)
if endpos>itemend then reaper.MB('数据将超出对象长度，请输入完以后拖长对象至: '..timepos,'警告！',0) reaper.SN_FocusMIDIEditor() end
----------------------------------------------------------
nrpn ={}
nrpn[24]='Note Pitch 音符 音高' nrpn[26]='Note Level 音符 电平' nrpn[28]='Note Pan 音符 声像'  nrpn[29]='Note Revb 音符 混响'
nrpn[30]='Note Chors 音符 合唱' nrpn[31]='Note Delay 音符 延迟' 

input='128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128'
input2='128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128'
chushi="(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)"
chushi2="(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)"
if nrpn[msg3] ~= nil  then 
retval, shuzhi= reaper.GetUserInputs(nrpn[msg3],16,jianhao, input )
if retval==false then reaper.SN_FocusMIDIEditor() return end
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
reaper.MIDI_InsertCC(take, false, false, startpos+10 , 176, chan, 98, yingaonew[1])
reaper.MIDI_InsertCC(take, false, false, startpos+20 , 176, chan, 6, q)
end
if ( yingaonew[2]~=nil and r < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+30 , 176, chan, 98, yingaonew[2])
reaper.MIDI_InsertCC(take, false, false, startpos+40 , 176, chan, 6, r)
end
if ( yingaonew[3]~=nil and s < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+50 , 176, chan, 98, yingaonew[3])
reaper.MIDI_InsertCC(take, false, false, startpos+60 , 176, chan, 6, s)
end
if ( yingaonew[4]~=nil and t < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+70 , 176, chan, 98, yingaonew[4])
reaper.MIDI_InsertCC(take, false, false, startpos+80 , 176, chan, 6, t)
end
if ( yingaonew[5]~=nil and u < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+90 , 176, chan, 98, yingaonew[5])
reaper.MIDI_InsertCC(take, false, false, startpos+100 , 176, chan, 6, u)
end
if ( yingaonew[6]~=nil and v < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+110 , 176, chan, 98, yingaonew[6])
reaper.MIDI_InsertCC(take, false, false, startpos+120 , 176, chan, 6, v)
end
if ( yingaonew[7]~=nil and w < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+130 , 176, chan, 98, yingaonew[7])
reaper.MIDI_InsertCC(take, false, false, startpos+140 , 176, chan, 6, w)
end
if ( yingaonew[8]~=nil and x < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+150 , 176, chan, 98, yingaonew[8])
reaper.MIDI_InsertCC(take, false, false, startpos+160 , 176, chan, 6, x)
end
if ( yingaonew[9]~=nil and y < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+170 , 176, chan, 98, yingaonew[9])
reaper.MIDI_InsertCC(take, false, false, startpos+180 , 176, chan, 6, y)
end
if ( yingaonew[10]~=nil and z < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+190 , 176, chan, 98, yingaonew[10])
reaper.MIDI_InsertCC(take, false, false, startpos+200 , 176, chan, 6, z)
end
if ( yingaonew[11]~=nil and aa < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+210 , 176, chan, 98, yingaonew[11])
reaper.MIDI_InsertCC(take, false, false, startpos+220 , 176, chan, 6, aa)
end
if ( yingaonew[12]~=nil and ab < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+230 , 176, chan, 98, yingaonew[12])
reaper.MIDI_InsertCC(take, false, false, startpos+240 , 176, chan, 6, ab)
end
if ( yingaonew[13]~=nil and ac < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+250 , 176, chan, 98, yingaonew[13])
reaper.MIDI_InsertCC(take, false, false, startpos+260 , 176, chan, 6, ac)
end
if ( yingaonew[14]~=nil and ad < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+270 , 176, chan, 98, yingaonew[14])
reaper.MIDI_InsertCC(take, false, false, startpos+280 , 176, chan, 6, ad)
end
if ( yingaonew[15]~=nil and ae < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+290 , 176, chan, 98, yingaonew[15])
reaper.MIDI_InsertCC(take, false, false, startpos+300 , 176, chan, 6, ae)
end
if ( yingaonew[16]~=nil and af < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+310 , 176, chan, 98, yingaonew[16])
reaper.MIDI_InsertCC(take, false, false, startpos+320 , 176, chan, 6, af)
end

 if #yingaonew > 16 then 
 retval2, shuzhi2= reaper.GetUserInputs(nrpn[msg3]..' 2',16,jianhao2, input2 )
 if retval2==false then reaper.SN_FocusMIDIEditor() return end
 
 a2,b2,c2,d2,e2,f2,g2,h2,i2,j2,k2,l2,m2,n2,o2,p2=string.match(shuzhi2,chushi2)
 q2=tonumber (a2)
 r2=tonumber (b2)
 s2=tonumber (c2)
 t2=tonumber (d2)
 u2=tonumber (e2)
 v2=tonumber (f2)
 w2=tonumber (g2)
 x2=tonumber (h2)
 y2=tonumber (i2)
 z2=tonumber (j2)
 aa2=tonumber (k2)
 ab2=tonumber (l2)
 ac2=tonumber (m2)
 ad2=tonumber (n2)
 ae2=tonumber (o2)
 af2=tonumber (p2)
if ( yingaonew[17]~=nil and q2 < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+330 , 176, chan, 98, yingaonew[17])
reaper.MIDI_InsertCC(take, false, false, startpos+340 , 176, chan, 6, q2)
end
if ( yingaonew[18]~=nil and r2 < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+350 , 176, chan, 98, yingaonew[18])
reaper.MIDI_InsertCC(take, false, false, startpos+360 , 176, chan, 6, r2)
end
if ( yingaonew[19]~=nil and s2 < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+370 , 176, chan, 98, yingaonew[19])
reaper.MIDI_InsertCC(take, false, false, startpos+380 , 176, chan, 6, s2)
end
if ( yingaonew[20]~=nil and t2 < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+390 , 176, chan, 98, yingaonew[20])
reaper.MIDI_InsertCC(take, false, false, startpos+400 , 176, chan, 6, t2)
end
if ( yingaonew[21]~=nil and u2 < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+410 , 176, chan, 98, yingaonew[21])
reaper.MIDI_InsertCC(take, false, false, startpos+420 , 176, chan, 6, u2)
end
if ( yingaonew[22]~=nil and v2 < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+430 , 176, chan, 98, yingaonew[22])
reaper.MIDI_InsertCC(take, false, false, startpos+440 , 176, chan, 6, v2)
end
if ( yingaonew[23]~=nil and w2 < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+450 , 176, chan, 98, yingaonew[23])
reaper.MIDI_InsertCC(take, false, false, startpos+460 , 176, chan, 6, w2)
end
if ( yingaonew[24]~=nil and x2 < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+470 , 176, chan, 98, yingaonew[24])
reaper.MIDI_InsertCC(take, false, false, startpos+480 , 176, chan, 6, x2)
end
if ( yingaonew[25]~=nil and y2 < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+490 , 176, chan, 98, yingaonew[25])
reaper.MIDI_InsertCC(take, false, false, startpos+500 , 176, chan, 6, y2)
end
if ( yingaonew[26]~=nil and z < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+510 , 176, chan, 98, yingaonew[26])
reaper.MIDI_InsertCC(take, false, false, startpos+520 , 176, chan, 6, z)
end
if ( yingaonew[27]~=nil and aa2 < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+530 , 176, chan, 98, yingaonew[27])
reaper.MIDI_InsertCC(take, false, false, startpos+540 , 176, chan, 6, aa2)
end
if ( yingaonew[28]~=nil and ab2 < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+550 , 176, chan, 98, yingaonew[28])
reaper.MIDI_InsertCC(take, false, false, startpos+560 , 176, chan, 6, ab2)
end
if ( yingaonew[29]~=nil and ac2 < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+570 , 176, chan, 98, yingaonew[29])
reaper.MIDI_InsertCC(take, false, false, startpos+580 , 176, chan, 6, ac2)
end
if ( yingaonew[30]~=nil and ad2 < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+590 , 176, chan, 98, yingaonew[30])
reaper.MIDI_InsertCC(take, false, false, startpos+600 , 176, chan, 6, ad2)
end
if ( yingaonew[31]~=nil and ae2 < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+610 , 176, chan, 98, yingaonew[31])
reaper.MIDI_InsertCC(take, false, false, startpos+620 , 176, chan, 6, ae2)
end
if ( yingaonew[32]~=nil and af2 < 128 ) then
reaper.MIDI_InsertCC(take, false, false, startpos+630 , 176, chan, 98, yingaonew[32])
reaper.MIDI_InsertCC(take, false, false, startpos+640 , 176, chan, 6, af2)
end
end
 end -- nrpn if
reaper.MIDI_Sort(take)
reaper.SN_FocusMIDIEditor()



