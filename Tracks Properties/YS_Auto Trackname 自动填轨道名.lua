--[[
 * ReaScript Name: YS_Auto Trackname 自动填轨道名
 * Version: 1.0
 * Author: YS
 * provides: [main=main] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-10-14)
  + Initial release
--]]

GM_map={}
GM_map[0]='A.PIANO'
GM_map[1]="A.PIANO"
GM_map[2]="E.PIANO"
GM_map[3]="HONKY-TONK PIANO"
GM_map[4]="E.PIANO 1"
GM_map[5]="E.PIANO 2"
GM_map[6]="HARPSICHORD"
GM_map[7]="CLAVINET"
GM_map[8]="CELESTA"
GM_map[9]="GLOCKENSPIEL"
GM_map[10]="MUSIC BOX"
GM_map[11]="VIBRAPHONE"
GM_map[12]="MARIMBA"
GM_map[13]="XYLOPHONE"
GM_map[14]="TUBULAR BELLS"
GM_map[15]="DULCIMER"
GM_map[16]="ORGAN"
GM_map[17]="ORGAN"
GM_map[18]="ORGAN"
GM_map[19]="CHURCH ORGAN"
GM_map[20]="ORGAN"
GM_map[21]="ACCORDION"
GM_map[22]="HARMONICA"
GM_map[23]="TANGO ACCORDION"
GM_map[24]="NYLON GUITAR"
GM_map[25]="A.G"
GM_map[26]="JAZZ GUITAR"
GM_map[27]="E.G"
GM_map[28]="M.G"
GM_map[29]="O.G"
GM_map[30]="D.G"
GM_map[31]="GT HARMONICS"
GM_map[32]="A.BASS"
GM_map[33]="FINGER BASS"
GM_map[34]="PICK BASS"
GM_map[35]="FRETLESS BASS"
GM_map[36]="SLAP BASS 1"
GM_map[37]="SLAP BASS 2"
GM_map[38]="SYNTH BASS 1"
GM_map[39]="SYNTH BASS 2"
GM_map[40]="VIOLIN"
GM_map[41]="VIOLA"
GM_map[42]="CELLO"
GM_map[43]="CONTRABASS"
GM_map[44]="TREMOLO STRINGS"
GM_map[45]="PIZZICATO"
GM_map[46]="HARP"
GM_map[47]="TIMPANI"
GM_map[48]="STRINGS"
GM_map[49]="STRINGS"
GM_map[50]="SY STRINGS 1"
GM_map[51]="SY STRINGS 2"
GM_map[52]="CHOIR A"
GM_map[53]="CHOIR O"
GM_map[54]="CHOIR U"
GM_map[55]="HIT"
GM_map[56]="TRUMPET"
GM_map[57]="TROMBONE"
GM_map[58]="TUBA"
GM_map[59]="MUTED TRUMPET"
GM_map[60]="FRENCH HORN"
GM_map[61]="BRASS"
GM_map[62]="SY BRASS 1"
GM_map[63]="SY BRASS 2"
GM_map[64]="S.SAX"
GM_map[65]="A.SAX"
GM_map[66]="T.SAX"
GM_map[67]="B.SAX"
GM_map[68]="OBOE"
GM_map[69]="ENGLISH HORN"
GM_map[70]="BASSOON"
GM_map[71]="CLARINET"
GM_map[72]="PICCOLO"
GM_map[73]="FLUTE"
GM_map[74]="RECORDER"
GM_map[75]="PAN FLUTE"
GM_map[76]="BLOWN BOTTLE"
GM_map[77]="SHAKUHACHI"
GM_map[78]="WHISTLE"
GM_map[79]="OCARINA"
GM_map[80]="SQUARE"
GM_map[81]="SAW"
GM_map[82]="LEAD CALLIOPE"
GM_map[83]="LEAD CHIFF"
GM_map[84]="LEAD"
GM_map[85]="LEAD VOICE"
GM_map[86]="LEAD FIFTHS"
GM_map[87]="BASS&LEAD"
GM_map[88]="PAD NEW AGE"
GM_map[89]="PAD"
GM_map[90]="POLYSYNTH"
GM_map[91]="PAD CHOIR"
GM_map[92]="PAD BOWED"
GM_map[93]="PAD METALLIC"
GM_map[94]="PAD HALO"
GM_map[95]="PAD SWEEP"
GM_map[96]="RAIN"
GM_map[97]="SOUNDTRACK"
GM_map[98]="BELL"
GM_map[99]="ATMOSPHERE"
GM_map[100]="BRIGHTNESS"
GM_map[101]="GOBLINS"
GM_map[102]="ECHOES"
GM_map[103]="SCI-FI"
GM_map[104]="SITAR"
GM_map[105]="BANJO"
GM_map[106]="SHAMISEN"
GM_map[107]="KOTO"
GM_map[108]="KALIMBA"
GM_map[109]="BAGPIPE"
GM_map[110]="FIDDLE"
GM_map[111]="SHANAI"
GM_map[112]="TINKLE BELL"
GM_map[113]="AGOGO"
GM_map[114]="STEEL DRUMS"
GM_map[115]="WOODBLOCK"
GM_map[116]="TAIKO DRUM"
GM_map[117]="TOM"
GM_map[118]="SYNTH DRUM"
GM_map[119]="REVERSE CYMBAL"
GM_map[120]="GUITAR NOISE"
GM_map[121]="BREATH NOISE"
GM_map[122]="S.E SEASHORE"
GM_map[123]="S.E BIRD TWEET"
GM_map[124]="S.E TELEPHONE"
GM_map[125]="S.E HELICOPTER"
GM_map[126]="S.E APPLAUSE"
GM_map[127]="S.E GUNSHOT"


selitem = reaper.CountSelectedMediaItems(0)
idx = 0
while idx < selitem do
MediaItem = reaper.GetSelectedMediaItem(0, idx)
take = reaper.GetMediaItemTake(MediaItem, 0)
MediaTrack = reaper.GetMediaItemTrack(MediaItem)
retval, trackname = reaper.GetTrackName(MediaTrack)
if reaper.TakeIsMIDI(take) then
   reaper.MIDI_DisableSort(take)
   ccidx=0
  repeat
       retval,selected,muted,ppqpos, chanmsg, chan, num, val = reaper.MIDI_GetCC(take, ccidx)
     if chanmsg==192  then
     if chan==9 then trackname=trackname..'DRUMS'
     else
     trackname=trackname..GM_map[num]
     end
    end
   ccidx = ccidx + 1
    retval,selected,muted,ppqpos, chanmsg, chan, num, val = reaper.MIDI_GetCC(take, ccidx)
   until retval == false
   ---PC
    ccidx=0
   repeat
        retval,selected,muted,ppqpos, chanmsg, chan, num, val = reaper.MIDI_GetCC(take, ccidx)
   if chanmsg==176 and num==10  then
   if val > 90 then  trackname=trackname..' R' end
   if val < 35 then  trackname=trackname..' L' end
         end
     ccidx = ccidx + 1
     retval,selected,muted,ppqpos, chanmsg, chan, num, val = reaper.MIDI_GetCC(take, ccidx)
    until retval == false
---- PAN
retval, stringNeedBig = reaper.GetSetMediaTrackInfo_String(MediaTrack, 'P_NAME', trackname, true)

idx = idx+1
end
end
