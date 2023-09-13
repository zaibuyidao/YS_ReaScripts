-- NoIndex: true
chord = {}
chord[''] = '4,7,0,0,0,0'
chord['M'] = '4,7,0,0,0,0'
chord['aug'] = '4,8,0,0,0,0'
chord['M7'] = '4,7,11,0,0,0'
chord['m7b5'] = '3,6,10,0,0,0'
chord['sus2'] = '2,7,0,0,0,0'
chord['dim7'] = '3,6,9,0,0,0'
chord['mM7'] = '3,7,11,0,0,0'
chord['m'] = '3,7,0,0,0,0'
chord['6'] = '4,7,9,0,0,0'
chord['9'] = '4,7,10,14,0,0'
chord['M9'] = '4,7,11,14,0,0'
chord['add9'] = '2,4,7,0,0,0'
chord['madd9'] = '2,3,7,0,0,0'
chord['7#9'] = '4,7,10,15,0,0'
chord['sus4'] = '5,7,0,0,0,0'
chord['m6'] = '3,7,9,0,0,0'
chord['m9'] = '3,7,10,14,0,0'
chord['7sus4'] = '5,7,10,0,0,0'
chord['M7sus4'] = '5,7,11,0,0,0'
chord['7sus2'] = '2,7,10,0,0,0'
chord['-5'] = '4,6,0,0,0,0'
chord['M7#5'] = '4,8,11,0,0,0'
chord['dim'] = '3,6,0,0,0,0'
chord['7'] = '4,7,10,0,0,0'
chord['7b5'] = '4,6,10,0,0,0'
chord['Aug7'] = '4,8,10,0,0,0'
chord['69'] = '4,7,9,14,0,0'
chord['7b9'] = '4,7,10,13,0,0'
chord['m7'] = '3,7,10,0,0,0'
chord['11'] = '4,7,10,14,17,0'
chord['m11'] = '3,7,10,14,17,0'
chord['13'] = '4,7,10,14,17,21'
chord['7sus4b9'] = '5,7,10,13,0,0'
chord['11b9'] = '4,7,10,13,17,0'
chord['13#9'] = '4,7,10,15,17,21'
chord['13b5b9'] = '4,6,10,13,17,21'
chord['13b9'] = '4,7,10,13,17,21'
chord['6sus4'] = '5,7,9,0,0,0'
chord['7#11'] = '4,7,10,18,0,0'
chord['7#5'] = '4,8,10,0,0,0'
chord['7#5#9'] = '4,8,10,15,0,0'
chord['7#5b9'] = '4,8,10,13,0,0'
chord['7add11'] = '4,7,10,17,0,0'
chord['7add13'] = '4,7,10,21,0,0'
chord['7b5#9'] = '4,6,10,15,0,0'
chord['7b5b9'] = '4,6,10,13,0,0'
chord['9#11'] = '4,7,10,14,18,0'
chord['9#5'] = '4,8,10,14,0,0'
chord['9b13'] = '4,7,10,14,20,0'
chord['9b5'] = '4,6,10,14,0,0'
chord['9sus4'] = '5,7,10,14,0,0'
chord['M11'] = '4,7,11,14,17,0'
chord['M13'] = '4,7,11,14,17,21'
chord['M7#11'] = '4,7,11,18,0,0'
chord['M7add13'] = '4,7,11,21,0,0'
chord['M7b5'] = '4,6,11,0,0,0'
chord['M9#11'] = '4,8,11,14,18,0'
chord['M9#5'] = '4,8,11,14,0,0'
chord['M9sus4'] = '5,7,11,14,0,0'
chord['m13'] = '3,7,10,14,17,21'
chord['m6add9'] = '3,7,9,14,0,0'
chord['m7add11'] = '3,7,10,17,0,0'
chord['m7add13'] = '3,7,10,21,0,0'
chord['m7b9'] = '3,7,10,13,0,0'
chord['m9b5'] = '3,6,10,14,0,0'
chord['mM11'] = '3,7,11,14,17,0'
chord['mM13'] = '3,7,11,14,17,21'
chord['mM7add11'] = '3,7,11,17,0,0'
chord['mM7add13'] = '3,7,11,21,0,0'
chord['mM9'] = '3,7,11,14,0,0'
chord['sus4add9'] = '2,5,7,0,0,0'

help =
    [[和弦输入必须是原位的完整和弦音，可以根据所选音符作为根音用脚本写入，也可以手动写入，根音不要低于Key48。目前只支持列表中的和弦类型。和弦之间最小间隔为八分音符。
转位根音请写在Key48键号以下（C3 or C4）。
Chord Note To Lyrics 需要读取调号标记，第一个标记放在工程头部，格式为 Key=** ，必须写自然大调，中途变调的地方在小节头写入同样的格式。
鼠标右键为试听和弦，轨道录音监听，MIDI输入所有通道会自动识别并设置好。]]

chordtype = {}
chordtype[340] = ''
chordtype[430] = 'm'
chordtype[250] = 'sus4'
chordtype[330] = 'dim'
chordtype[440] = 'aug'
chordtype[2340] = '6'
chordtype[2430] = 'm6'
chordtype[3340] = '7'
chordtype[3430] = 'm7'
chordtype[4340] = 'M7'
chordtype[43340] = '9'
chordtype[43430] = 'm9'
chordtype[4240] = '7b5'
chordtype[4330] = 'm7b5'
chordtype[34340] = 'M9'
chordtype[3250] = '7sus4'
chordtype[4250] = 'M7sus4'
chordtype[520] = 'sus2'
chordtype[3220] = 'add9'
chordtype[3520] = '7sus2'
chordtype[2440] = 'aug7'
chordtype[3330] = 'dim7'
chordtype[4120] = 'madd9'
chordtype[240] = '-5'
chordtype[52340] = '69'
chordtype[4430] = 'mM7'
chordtype[53340] = '7#9'
chordtype[3440] = 'M7#5'
chordtype[33340] = '7b9'
chordtype[343340] = '11'
chordtype[343430] = 'm11'
chordtype[4343340] = '13'
chordtype[33250] = '7sus4b9'
chordtype[433340] = '11b9'
chordtype[4253340] = '13#9'
chordtype[4434240] = '13b5b9'
chordtype[4433340] = '13b9'
chordtype[2250] = '6sus4'
chordtype[83340] = '7#11'
chordtype[2440] = '7#5'
chordtype[52440] = '7#5#9'
chordtype[32440] = '7#5b9'
chordtype[73340] = '7add11'
chordtype[113340] = '7add13'
chordtype[54240] = '7b5#9'
chordtype[34240] = '7b5b9'
chordtype[443340] = '9#11'
chordtype[42440] = '9#5'
chordtype[643340] = '9b13'
chordtype[44240] = '9b5'
chordtype[43250] = '9sus4'
chordtype[334340] = 'M11'
chordtype[4334340] = 'M13'
chordtype[74340] = 'M7#11'
chordtype[104340] = 'M7add13'
chordtype[5240] = 'M7b5'
chordtype[34340] = 'M9'
chordtype[433440] = 'M9#11'
chordtype[33440] = 'M9#5'
chordtype[34250] = 'M9sus4'
chordtype[4343430] = 'm13'
chordtype[52430] = 'm6add9'
chordtype[73430] = 'm7add11'
chordtype[113430] = 'm7add13'
chordtype[33430] = 'm7b9'
chordtype[44330] = 'm9b5'
chordtype[334430] = 'mM11'
chordtype[4334430] = 'mM13'
chordtype[64430] = 'mM7add11'
chordtype[104430] = 'mM7add13'
chordtype[34430] = 'mM9'
chordtype[2320] = 'sus4add9'

piano_list = {}
piano_list['CM'] = '48,60,64,67,0,0,0'
piano_list['Caug'] = '48,60,64,68,0,0,0'
piano_list['Csus2'] = '48,60,62,67,0,0,0'
piano_list['Cm'] = '48,60,63,67,0,0,0'
piano_list['C6'] = '48,60,64,67,69,0,0'
piano_list['Csus4'] = '48,60,65,67,0,0,0'
piano_list['Cm6'] = '48,60,63,67,69,0,0'
piano_list['C-5'] = '48,60,64,66,0,0,0'
piano_list['Cdim'] = '48,60,63,66,0,0,0'
piano_list['CM7'] = '48,59,64,67,0,0,0'
piano_list['Cm7b5'] = '48,58,63,66,0,0,0'
piano_list['Cdim7'] = '48,60,63,66,69,0,0'
piano_list['CmM7'] = '48,59,63,67,0,0,0'
piano_list['C9'] = '48,58,62,64,67,0,0'
piano_list['CM9'] = '48,59,62,64,67,0,0'
piano_list['Cadd9'] = '48,60,62,64,67,0,0'
piano_list['Cmadd9'] = '48,60,62,63,67,0,0'
piano_list['C7#9'] = '48,58,63,64,67,0,0'
piano_list['Cm9'] = '48,58,62,63,67,0,0'
piano_list['C7sus4'] = '48,58,60,65,67,0,0'
piano_list['CM7sus4'] = '48,59,65,67,0,0,0'
piano_list['C7sus2'] = '48,58,62,67,0,0,0'
piano_list['CM7#5'] = '48,59,64,68,0,0,0'
piano_list['C7'] = '48,58,64,67,0,0,0'
piano_list['C7b5'] = '48,58,64,66,0,0,0'
piano_list['CAug7'] = '48,58,64,68,0,0,0'
piano_list['C69'] = '48,62,64,67,69,0,0'
piano_list['C7b9'] = '48,58,61,64,67,0,0'
piano_list['Cm7'] = '48,58,63,67,0,0,0'
piano_list['C11'] = '48,52,55,58,62,65,0'
piano_list['Cm11'] = '48,51,55,58,62,65,0'
piano_list['C13'] = '48,52,55,58,62,65,69'
piano_list['C7sus4b9'] = '48,58,61,65,67,0,0'
piano_list['C11b9'] = '48,52,55,58,61,65,0'
piano_list['C13#9'] = '48,52,55,58,63,65,69'
piano_list['C13b5b9'] = '48,52,54,58,61,65,69'
piano_list['C13b9'] = '48,52,55,58,61,65,69'
piano_list['C6sus4'] = '48,60,65,67,69,0,0'
piano_list['C7#11'] = '48,58,64,66,67,0,0'
piano_list['C7#5'] = '48,58,64,68,0,0,0'
piano_list['C7#5#9'] = '48,58,63,64,68,0,0'
piano_list['C7#5b9'] = '48,58,61,64,68,0,0'
piano_list['C7add11'] = '48,58,64,65,67,0,0'
piano_list['C7add13'] = '48,58,64,67,69,0,0'
piano_list['C7b5#9'] = '48,58,63,64,66,0,0'
piano_list['C7b5b9'] = '48,58,61,64,66,0,0'
piano_list['C9#11'] = '48,52,55,58,62,66,0'
piano_list['C9#5'] = '48,58,62,64,68,0,0'
piano_list['C9b13'] = '48,52,55,58,62,68,0'
piano_list['C9b5'] = '48,58,62,64,66,0,0'
piano_list['C9sus4'] = '48,58,62,65,67,0,0'
piano_list['CM11'] = '48,52,55,59,62,65,0'
piano_list['CM13'] = '48,52,55,59,62,65,69'
piano_list['CM7#11'] = '48,59,64,66,67,0,0'
piano_list['CM7add13'] = '48,59,64,67,69,0,0'
piano_list['CM7b5'] = '48,59,64,66,0,0,0'
piano_list['CM9#11'] = '48,52,56,59,62,66,0'
piano_list['CM9#5'] = '48,59,62,64,68,0,0'
piano_list['CM9sus4'] = '48,59,62,65,67,0,0'
piano_list['Cm13'] = '48,51,55,58,62,65,69'
piano_list['Cm6add9'] = '48,62,63,67,69,0,0'
piano_list['Cm7add11'] = '48,58,63,65,67,0,0'
piano_list['Cm7add13'] = '48,58,63,67,69,0,0'
piano_list['Cm7b9'] = '48,58,61,63,67,0,0'
piano_list['Cm9b5'] = '48,58,62,63,66,0,0'
piano_list['CmM11'] = '48,51,55,59,62,65,0'
piano_list['CmM13'] = '48,51,55,59,62,65,69'
piano_list['CmM7add11'] = '48,59,63,65,67,0,0'
piano_list['CmM7add13'] = '48,59,63,67,69,0,0'
piano_list['CmM9'] = '48,59,62,63,67,0,0'
piano_list['Csus4add9'] = '48,60,62,65,67,0,0'
piano_list['C#M'] = '49,61,65,68,0,0,0'
piano_list['C#aug'] = '49,61,65,69,0,0,0'
piano_list['C#sus2'] = '49,61,63,68,0,0,0'
piano_list['C#m'] = '49,61,64,68,0,0,0'
piano_list['C#6'] = '49,58,61,65,68,0,0'
piano_list['C#sus4'] = '49,61,66,68,0,0,0'
piano_list['C#m6'] = '49,58,61,64,68,0,0'
piano_list['C#-5'] = '49,61,65,67,0,0,0'
piano_list['C#dim'] = '49,61,64,67,0,0,0'
piano_list['C#M7'] = '49,60,65,68,0,0,0'
piano_list['C#m7b5'] = '49,59,64,67,0,0,0'
piano_list['C#dim7'] = '49,58,61,64,67,0,0'
piano_list['C#mM7'] = '49,60,64,68,0,0,0'
piano_list['C#9'] = '49,59,63,65,68,0,0'
piano_list['C#M9'] = '49,60,63,65,68,0,0'
piano_list['C#add9'] = '49,61,63,65,68,0,0'
piano_list['C#madd9'] = '49,61,63,64,68,0,0'
piano_list['C#7#9'] = '49,59,64,65,68,0,0'
piano_list['C#m9'] = '49,59,63,64,68,0,0'
piano_list['C#7sus4'] = '49,59,66,68,0,0,0'
piano_list['C#M7sus4'] = '49,60,66,68,0,0,0'
piano_list['C#7sus2'] = '49,59,63,68,0,0,0'
piano_list['C#M7#5'] = '49,60,65,69,0,0,0'
piano_list['C#7'] = '49,59,65,68,0,0,0'
piano_list['C#7b5'] = '49,59,65,67,0,0,0'
piano_list['C#Aug7'] = '49,59,65,69,0,0,0'
piano_list['C#69'] = '49,58,63,65,68,0,0'
piano_list['C#7b9'] = '49,59,62,65,68,0,0'
piano_list['C#m7'] = '49,59,64,68,0,0,0'
piano_list['C#11'] = '49,53,56,59,63,66,0'
piano_list['C#m11'] = '49,52,56,59,63,66,0'
piano_list['C#13'] = '49,53,56,59,63,66,70'
piano_list['C#7sus4b9'] = '49,59,62,66,68,0,0'
piano_list['C#11b9'] = '49,53,56,59,62,66,0'
piano_list['C#13#9'] = '49,53,56,59,64,66,70'
piano_list['C#13b5b9'] = '49,53,55,59,62,66,70'
piano_list['C#13b9'] = '49,53,56,59,62,66,70'
piano_list['C#6sus4'] = '49,58,61,66,68,0,0'
piano_list['C#7#11'] = '49,59,65,67,68,0,0'
piano_list['C#7#5'] = '49,59,65,69,0,0,0'
piano_list['C#7#5#9'] = '49,59,64,65,69,0,0'
piano_list['C#7#5b9'] = '49,59,62,65,69,0,0'
piano_list['C#7add11'] = '49,59,65,66,68,0,0'
piano_list['C#7add13'] = '49,58,59,65,68,0,0'
piano_list['C#7b5#9'] = '49,59,64,65,67,0,0'
piano_list['C#7b5b9'] = '49,59,62,65,67,0,0'
piano_list['C#9#11'] = '49,53,56,59,63,67,0'
piano_list['C#9#5'] = '49,59,63,65,69,0,0'
piano_list['C#9b13'] = '49,53,56,59,63,69,0'
piano_list['C#9b5'] = '49,59,63,65,67,0,0'
piano_list['C#9sus4'] = '49,59,63,66,68,0,0'
piano_list['C#M11'] = '49,53,56,60,63,66,0'
piano_list['C#M13'] = '49,53,56,60,63,66,70'
piano_list['C#M7#11'] = '49,60,65,67,68,0,0'
piano_list['C#M7add13'] = '49,58,60,65,68,0,0'
piano_list['C#M7b5'] = '49,60,65,67,0,0,0'
piano_list['C#M9#11'] = '49,53,57,60,63,67,0'
piano_list['C#M9#5'] = '49,60,63,65,69,0,0'
piano_list['C#M9sus4'] = '49,60,63,66,68,0,0'
piano_list['C#m13'] = '49,52,56,59,63,66,70'
piano_list['C#m6add9'] = '49,58,63,64,68,0,0'
piano_list['C#m7add11'] = '49,59,64,66,68,0,0'
piano_list['C#m7add13'] = '49,58,59,64,68,0,0'
piano_list['C#m7b9'] = '49,59,62,64,68,0,0'
piano_list['C#m9b5'] = '49,59,63,64,67,0,0'
piano_list['C#mM11'] = '49,52,56,60,63,66,0'
piano_list['C#mM13'] = '49,52,56,60,63,66,70'
piano_list['C#mM7add11'] = '49,60,64,66,68,0,0'
piano_list['C#mM7add13'] = '49,58,60,64,68,0,0'
piano_list['C#mM9'] = '49,60,63,64,68,0,0'
piano_list['C#sus4add9'] = '49,63,66,68,0,0,0'
piano_list['DM'] = '50,62,66,69,0,0,0'
piano_list['Daug'] = '50,58,62,66,0,0,0'
piano_list['Dsus2'] = '50,62,64,69,0,0,0'
piano_list['Dm'] = '50,62,65,69,0,0,0'
piano_list['D6'] = '50,59,62,66,69,0,0'
piano_list['Dsus4'] = '50,62,67,69,0,0,0'
piano_list['Dm6'] = '50,59,62,65,69,0,0'
piano_list['D-5'] = '50,62,66,68,0,0,0'
piano_list['Ddim'] = '50,62,65,68,0,0,0'
piano_list['DM7'] = '50,61,66,69,0,0,0'
piano_list['Dm7b5'] = '50,60,65,68,0,0,0'
piano_list['Ddim7'] = '50,59,62,65,68,0,0'
piano_list['DmM7'] = '50,61,65,69,0,0,0'
piano_list['D9'] = '50,60,64,66,69,0,0'
piano_list['DM9'] = '50,61,64,66,69,0,0'
piano_list['Dadd9'] = '50,62,64,66,69,0,0'
piano_list['Dmadd9'] = '50,62,64,65,69,0,0'
piano_list['D7#9'] = '50,60,65,66,69,0,0'
piano_list['Dm9'] = '50,60,64,65,69,0,0'
piano_list['D7sus4'] = '50,60,62,67,69,0,0'
piano_list['DM7sus4'] = '50,61,67,69,0,0,0'
piano_list['D7sus2'] = '50,60,64,69,0,0,0'
piano_list['DM7#5'] = '50,58,61,66,0,0,0'
piano_list['D7'] = '50,60,66,69,0,0,0'
piano_list['D7b5'] = '50,60,66,68,0,0,0'
piano_list['DAug7'] = '50,58,60,66,0,0,0'
piano_list['D69'] = '50,59,64,66,69,0,0'
piano_list['D7b9'] = '50,60,63,66,69,0,0'
piano_list['Dm7'] = '50,60,65,69,0,0,0'
piano_list['D11'] = '50,54,57,60,64,67,0'
piano_list['Dm11'] = '50,53,57,60,64,67,0'
piano_list['D13'] = '50,54,57,60,64,67,71'
piano_list['D7sus4b9'] = '50,60,63,67,69,0,0'
piano_list['D11b9'] = '50,54,57,60,63,67,0'
piano_list['D13#9'] = '50,54,57,60,65,67,71'
piano_list['D13b5b9'] = '50,54,56,60,63,67,71'
piano_list['D13b9'] = '50,54,57,60,63,67,71'
piano_list['D6sus4'] = '50,59,62,67,69,0,0'
piano_list['D7#11'] = '50,60,66,68,69,0,0'
piano_list['D7#5'] = '50,58,60,66,0,0,0'
piano_list['D7#5#9'] = '50,58,60,65,66,0,0'
piano_list['D7#5b9'] = '50,58,60,63,66,0,0'
piano_list['D7add11'] = '50,60,66,67,69,0,0'
piano_list['D7add13'] = '50,59,60,66,69,0,0'
piano_list['D7b5#9'] = '50,60,65,66,68,0,0'
piano_list['D7b5b9'] = '50,60,63,66,68,0,0'
piano_list['D9#11'] = '50,54,57,60,64,68,0'
piano_list['D9#5'] = '50,58,60,64,66,0,0'
piano_list['D9b13'] = '50,54,57,60,64,70,0'
piano_list['D9b5'] = '50,60,64,66,68,0,0'
piano_list['D9sus4'] = '50,60,64,67,69,0,0'
piano_list['DM11'] = '50,54,57,61,64,67,0'
piano_list['DM13'] = '50,54,57,61,64,67,71'
piano_list['DM7#11'] = '50,61,66,68,69,0,0'
piano_list['DM7add13'] = '50,59,61,66,69,0,0'
piano_list['DM7b5'] = '50,61,66,68,0,0,0'
piano_list['DM9#11'] = '50,54,58,61,64,68,0'
piano_list['DM9#5'] = '50,58,61,64,66,0,0'
piano_list['DM9sus4'] = '50,61,64,67,69,0,0'
piano_list['Dm13'] = '50,53,57,60,64,67,71'
piano_list['Dm6add9'] = '50,59,64,65,69,0,0'
piano_list['Dm7add11'] = '50,60,65,67,69,0,0'
piano_list['Dm7add13'] = '50,59,60,65,69,0,0'
piano_list['Dm7b9'] = '50,60,63,65,69,0,0'
piano_list['Dm9b5'] = '50,60,64,65,68,0,0'
piano_list['DmM11'] = '50,53,57,61,64,67,0'
piano_list['DmM13'] = '50,53,57,61,64,67,71'
piano_list['DmM7add11'] = '50,61,65,67,69,0,0'
piano_list['DmM7add13'] = '50,59,61,65,69,0,0'
piano_list['DmM9'] = '50,61,64,65,69,0,0'
piano_list['Dsus4add9'] = '50,62,64,67,69,0,0'
piano_list['EbM'] = '39,58,63,67,0,0,0'
piano_list['Ebaug'] = '39,59,63,67,0,0,0'
piano_list['Ebsus2'] = '39,58,63,65,0,0,0'
piano_list['Ebm'] = '39,58,63,66,0,0,0'
piano_list['Eb6'] = '39,58,60,63,67,0,0'
piano_list['Ebsus4'] = '39,58,63,68,0,0,0'
piano_list['Ebm6'] = '39,58,60,63,66,0,0'
piano_list['Eb-5'] = '39,63,67,69,0,0,0'
piano_list['Ebdim'] = '39,63,66,69,0,0,0'
piano_list['EbM7'] = '39,58,62,67,0,0,0'
piano_list['Ebm7b5'] = '39,61,66,69,0,0,0'
piano_list['Ebdim7'] = '39,60,66,69,0,0,0'
piano_list['EbmM7'] = '39,58,62,66,0,0,0'
piano_list['Eb9'] = '39,58,61,65,67,0,0'
piano_list['EbM9'] = '39,58,62,65,67,0,0'
piano_list['Ebadd9'] = '39,58,63,65,67,0,0'
piano_list['Ebmadd9'] = '39,58,63,65,66,0,0'
piano_list['Eb7#9'] = '39,58,61,66,67,0,0'
piano_list['Ebm9'] = '39,58,61,65,66,0,0'
piano_list['Eb7sus4'] = '39,58,61,68,0,0,0'
piano_list['EbM7sus4'] = '39,58,62,68,0,0,0'
piano_list['Eb7sus2'] = '39,58,61,65,0,0,0'
piano_list['EbM7#5'] = '39,59,62,67,0,0,0'
piano_list['Eb7'] = '39,58,61,67,0,0,0'
piano_list['Eb7b5'] = '39,61,67,69,0,0,0'
piano_list['EbAug7'] = '39,59,61,67,0,0,0'
piano_list['Eb69'] = '39,58,60,65,67,0,0'
piano_list['Eb7b9'] = '39,58,61,64,67,0,0'
piano_list['Ebm7'] = '39,58,61,66,0,0,0'
piano_list['Eb11'] = '51,55,58,61,65,68,0'
piano_list['Ebm11'] = '51,54,58,61,65,68,0'
piano_list['Eb13'] = '51,55,58,61,65,68,72'
piano_list['Eb7sus4b9'] = '39,58,61,64,68,0,0'
piano_list['Eb11b9'] = '51,55,58,61,64,68,0'
piano_list['Eb13#9'] = '51,55,58,61,66,68,72'
piano_list['Eb13b5b9'] = '51,55,57,61,64,68,72'
piano_list['Eb13b9'] = '51,55,58,61,64,68,72'
piano_list['Eb6sus4'] = '39,58,60,63,68,0,0'
piano_list['Eb7#11'] = '39,58,61,67,69,0,0'
piano_list['Eb7#5'] = '39,59,61,67,0,0,0'
piano_list['Eb7#5#9'] = '39,59,61,66,67,0,0'
piano_list['Eb7#5b9'] = '39,59,61,64,67,0,0'
piano_list['Eb7add11'] = '39,58,61,67,68,0,0'
piano_list['Eb7add13'] = '39,58,60,61,67,0,0'
piano_list['Eb7b5#9'] = '39,61,66,67,69,0,0'
piano_list['Eb7b5b9'] = '39,61,64,67,69,0,0'
piano_list['Eb9#11'] = '51,55,58,61,65,69,0'
piano_list['Eb9#5'] = '39,59,61,65,67,0,0'
piano_list['Eb9b13'] = '51,55,58,61,65,71,0'
piano_list['Eb9b5'] = '39,61,65,67,69,0,0'
piano_list['Eb9sus4'] = '39,58,61,65,68,0,0'
piano_list['EbM11'] = '51,55,58,62,65,68,0'
piano_list['EbM13'] = '51,55,58,62,65,68,72'
piano_list['EbM7#11'] = '39,58,62,67,69,0,0'
piano_list['EbM7add13'] = '39,58,60,62,67,0,0'
piano_list['EbM7b5'] = '39,62,67,69,0,0,0'
piano_list['EbM9#11'] = '51,55,59,62,65,69,0'
piano_list['EbM9#5'] = '39,59,62,65,67,0,0'
piano_list['EbM9sus4'] = '39,58,62,65,68,0,0'
piano_list['Ebm13'] = '51,54,58,61,65,68,72'
piano_list['Ebm6add9'] = '39,58,60,65,66,0,0'
piano_list['Ebm7add11'] = '39,58,61,66,68,0,0'
piano_list['Ebm7add13'] = '39,58,60,61,66,0,0'
piano_list['Ebm7b9'] = '39,58,61,64,66,0,0'
piano_list['Ebm9b5'] = '39,61,65,66,69,0,0'
piano_list['EbmM11'] = '51,54,58,62,65,68,0'
piano_list['EbmM13'] = '51,54,58,62,65,68,72'
piano_list['EbmM7add11'] = '39,58,62,66,68,0,0'
piano_list['EbmM7add13'] = '39,58,60,62,66,0,0'
piano_list['EbmM9'] = '39,58,62,65,66,0,0'
piano_list['Ebsus4add9'] = '39,58,65,68,0,0,0'
piano_list['EM'] = '40,59,64,68,0,0,0'
piano_list['Eaug'] = '40,60,64,68,0,0,0'
piano_list['Esus2'] = '40,59,64,66,0,0,0'
piano_list['Em'] = '40,59,64,67,0,0,0'
piano_list['E6'] = '40,59,61,64,68,0,0'
piano_list['Esus4'] = '40,59,64,69,0,0,0'
piano_list['Em6'] = '40,59,61,64,67,0,0'
piano_list['E-5'] = '40,58,64,68,0,0,0'
piano_list['Edim'] = '40,58,64,67,0,0,0'
piano_list['EM7'] = '40,59,63,68,0,0,0'
piano_list['Em7b5'] = '40,58,62,67,0,0,0'
piano_list['Edim7'] = '40,58,61,64,67,0,0'
piano_list['EmM7'] = '40,59,63,67,0,0,0'
piano_list['E9'] = '40,59,62,66,68,0,0'
piano_list['EM9'] = '40,59,63,66,68,0,0'
piano_list['Eadd9'] = '40,59,64,66,68,0,0'
piano_list['Emadd9'] = '40,59,64,66,67,0,0'
piano_list['E7#9'] = '40,59,62,67,68,0,0'
piano_list['Em9'] = '40,59,62,66,67,0,0'
piano_list['E7sus4'] = '40,59,62,64,69,0,0'
piano_list['EM7sus4'] = '40,59,63,69,0,0,0'
piano_list['E7sus2'] = '40,59,62,66,0,0,0'
piano_list['EM7#5'] = '40,60,63,68,0,0,0'
piano_list['E7'] = '40,59,62,68,0,0,0'
piano_list['E7b5'] = '40,58,62,68,0,0,0'
piano_list['EAug7'] = '40,60,62,68,0,0,0'
piano_list['E69'] = '40,59,61,66,68,0,0'
piano_list['E7b9'] = '40,59,62,65,68,0,0'
piano_list['Em7'] = '40,59,62,67,0,0,0'
piano_list['E11'] = '52,56,59,62,66,69,0'
piano_list['Em11'] = '52,55,59,62,66,69,0'
piano_list['E13'] = '52,56,59,62,66,69,73'
piano_list['E7sus4b9'] = '40,59,62,65,69,0,0'
piano_list['E11b9'] = '52,56,59,62,65,69,0'
piano_list['E13#9'] = '52,56,59,62,67,69,73'
piano_list['E13b5b9'] = '52,56,58,62,65,69,73'
piano_list['E13b9'] = '52,56,59,62,65,69,73'
piano_list['E6sus4'] = '40,59,61,64,69,0,0'
piano_list['E7#11'] = '40,58,59,62,68,0,0'
piano_list['E7#5'] = '40,60,62,68,0,0,0'
piano_list['E7#5#9'] = '40,60,62,67,68,0,0'
piano_list['E7#5b9'] = '40,60,62,65,68,0,0'
piano_list['E7add11'] = '40,59,62,68,69,0,0'
piano_list['E7add13'] = '40,59,61,62,68,0,0'
piano_list['E7b5#9'] = '40,58,62,67,68,0,0'
piano_list['E7b5b9'] = '40,58,62,65,68,0,0'
piano_list['E9#11'] = '52,56,59,62,66,70,0'
piano_list['E9#5'] = '40,60,62,66,68,0,0'
piano_list['E9b13'] = '52,56,59,62,66,72,0'
piano_list['E9b5'] = '40,58,62,66,68,0,0'
piano_list['E9sus4'] = '40,59,62,66,69,0,0'
piano_list['EM11'] = '52,56,59,63,66,69,0'
piano_list['EM13'] = '52,56,59,63,66,69,73'
piano_list['EM7#11'] = '40,58,59,63,68,0,0'
piano_list['EM7add13'] = '40,59,61,63,68,0,0'
piano_list['EM7b5'] = '40,58,63,68,0,0,0'
piano_list['EM9#11'] = '52,56,60,63,66,70,0'
piano_list['EM9#5'] = '40,60,63,66,68,0,0'
piano_list['EM9sus4'] = '40,59,63,66,69,0,0'
piano_list['Em13'] = '52,55,59,62,66,69,73'
piano_list['Em6add9'] = '40,59,61,66,67,0,0'
piano_list['Em7add11'] = '40,59,62,67,69,0,0'
piano_list['Em7add13'] = '40,59,61,62,67,0,0'
piano_list['Em7b9'] = '40,59,62,65,67,0,0'
piano_list['Em9b5'] = '40,58,62,66,67,0,0'
piano_list['EmM11'] = '52,55,59,63,66,69,0'
piano_list['EmM13'] = '52,55,59,63,66,69,73'
piano_list['EmM7add11'] = '40,59,63,67,69,0,0'
piano_list['EmM7add13'] = '40,59,61,63,67,0,0'
piano_list['EmM9'] = '40,59,63,66,67,0,0'
piano_list['Esus4add9'] = '40,59,64,66,69,0,0'
piano_list['FM'] = '41,60,65,69,0,0,0'
piano_list['Faug'] = '41,61,65,69,0,0,0'
piano_list['Fsus2'] = '41,60,65,67,0,0,0'
piano_list['Fm'] = '41,60,65,68,0,0,0'
piano_list['F6'] = '41,60,62,65,69,0,0'
piano_list['Fsus4'] = '41,58,60,65,0,0,0'
piano_list['Fm6'] = '41,60,62,65,68,0,0'
piano_list['F-5'] = '41,59,65,69,0,0,0'
piano_list['Fdim'] = '41,59,65,68,0,0,0'
piano_list['FM7'] = '41,60,64,69,0,0,0'
piano_list['Fm7b5'] = '41,59,63,68,0,0,0'
piano_list['Fdim7'] = '41,59,62,65,68,0,0'
piano_list['FmM7'] = '41,60,64,68,0,0,0'
piano_list['F9'] = '41,60,63,67,69,0,0'
piano_list['FM9'] = '41,60,64,67,69,0,0'
piano_list['Fadd9'] = '41,60,65,67,69,0,0'
piano_list['Fmadd9'] = '41,60,65,67,68,0,0'
piano_list['F7#9'] = '41,60,63,68,69,0,0'
piano_list['Fm9'] = '41,60,63,67,68,0,0'
piano_list['F7sus4'] = '41,58,60,63,0,0,0'
piano_list['FM7sus4'] = '41,58,60,64,0,0,0'
piano_list['F7sus2'] = '41,60,63,67,0,0,0'
piano_list['FM7#5'] = '41,61,64,69,0,0,0'
piano_list['F7'] = '41,60,63,69,0,0,0'
piano_list['F7b5'] = '41,59,63,69,0,0,0'
piano_list['FAug7'] = '41,61,63,69,0,0,0'
piano_list['F69'] = '41,60,62,67,69,0,0'
piano_list['F7b9'] = '41,60,63,66,69,0,0'
piano_list['Fm7'] = '41,60,63,68,0,0,0'
piano_list['F11'] = '53,57,60,63,67,70,0'
piano_list['Fm11'] = '53,56,60,63,67,70,0'
piano_list['F13'] = '53,57,60,63,67,70,74'
piano_list['F7sus4b9'] = '41,58,60,63,66,0,0'
piano_list['F11b9'] = '53,57,60,63,66,70,0'
piano_list['F13#9'] = '53,57,60,63,68,70,74'
piano_list['F13b5b9'] = '53,57,59,63,66,70,74'
piano_list['F13b9'] = '53,57,60,63,66,70,74'
piano_list['F6sus4'] = '41,58,60,62,65,0,0'
piano_list['F7#11'] = '41,59,60,63,69,0,0'
piano_list['F7#5'] = '41,61,63,69,0,0,0'
piano_list['F7#5#9'] = '41,61,63,68,69,0,0'
piano_list['F7#5b9'] = '41,61,63,66,69,0,0'
piano_list['F7add11'] = '41,58,60,63,69,0,0'
piano_list['F7add13'] = '41,60,62,63,69,0,0'
piano_list['F7b5#9'] = '41,59,63,68,69,0,0'
piano_list['F7b5b9'] = '41,59,63,66,69,0,0'
piano_list['F9#11'] = '53,57,60,63,67,71,0'
piano_list['F9#5'] = '41,61,63,67,69,0,0'
piano_list['F9b13'] = '53,57,60,63,67,73,0'
piano_list['F9b5'] = '41,59,63,67,69,0,0'
piano_list['F9sus4'] = '41,58,60,63,67,0,0'
piano_list['FM11'] = '53,57,60,64,67,70,0'
piano_list['FM13'] = '53,57,60,64,67,70,74'
piano_list['FM7#11'] = '41,59,60,64,69,0,0'
piano_list['FM7add13'] = '41,60,62,64,69,0,0'
piano_list['FM7b5'] = '41,59,64,69,0,0,0'
piano_list['FM9#11'] = '53,57,61,64,67,71,0'
piano_list['FM9#5'] = '41,61,64,67,69,0,0'
piano_list['FM9sus4'] = '41,58,60,64,67,0,0'
piano_list['Fm13'] = '53,56,60,63,67,70,74'
piano_list['Fm6add9'] = '41,60,62,67,68,0,0'
piano_list['Fm7add11'] = '41,58,60,63,68,0,0'
piano_list['Fm7add13'] = '41,60,62,63,68,0,0'
piano_list['Fm7b9'] = '41,60,63,66,68,0,0'
piano_list['Fm9b5'] = '41,59,63,67,68,0,0'
piano_list['FmM11'] = '53,56,60,64,67,70,0'
piano_list['FmM13'] = '53,56,60,64,67,70,74'
piano_list['FmM7add11'] = '41,58,60,64,68,0,0'
piano_list['FmM7add13'] = '41,60,62,64,68,0,0'
piano_list['FmM9'] = '41,60,64,67,68,0,0'
piano_list['Fsus4add9'] = '41,58,60,65,67,0,0'
piano_list['F#M'] = '42,58,61,66,0,0,0'
piano_list['F#aug'] = '42,58,62,66,0,0,0'
piano_list['F#sus2'] = '42,61,66,68,0,0,0'
piano_list['F#m'] = '42,61,66,69,0,0,0'
piano_list['F#6'] = '42,58,61,63,66,0,0'
piano_list['F#sus4'] = '42,59,61,66,0,0,0'
piano_list['F#m6'] = '42,61,63,66,69,0,0'
piano_list['F#-5'] = '42,58,60,66,0,0,0'
piano_list['F#dim'] = '42,60,66,69,0,0,0'
piano_list['F#M7'] = '42,58,61,65,0,0,0'
piano_list['F#m7b5'] = '42,60,64,69,0,0,0'
piano_list['F#dim7'] = '42,60,63,66,69,0,0'
piano_list['F#mM7'] = '42,61,65,69,0,0,0'
piano_list['F#9'] = '42,58,61,64,68,0,0'
piano_list['F#M9'] = '42,58,61,65,68,0,0'
piano_list['F#add9'] = '42,58,61,66,68,0,0'
piano_list['F#madd9'] = '42,61,66,68,69,0,0'
piano_list['F#7#9'] = '42,58,61,64,69,0,0'
piano_list['F#m9'] = '42,61,64,68,69,0,0'
piano_list['F#7sus4'] = '42,59,61,64,66,0,0'
piano_list['F#M7sus4'] = '42,59,61,65,0,0,0'
piano_list['F#7sus2'] = '42,61,64,68,0,0,0'
piano_list['F#M7#5'] = '42,58,62,65,0,0,0'
piano_list['F#7'] = '42,58,61,64,0,0,0'
piano_list['F#7b5'] = '42,58,60,64,0,0,0'
piano_list['F#Aug7'] = '42,58,62,64,0,0,0'
piano_list['F#69'] = '42,58,61,63,68,0,0'
piano_list['F#7b9'] = '42,58,61,64,67,0,0'
piano_list['F#m7'] = '42,57,61,64,0,0,0'
piano_list['F#11'] = '54,58,61,64,68,71,0'
piano_list['F#m11'] = '54,57,61,64,68,71,0'
piano_list['F#13'] = '54,58,61,64,68,71,75'
piano_list['F#7sus4b9'] = '42,59,61,64,67,0,0'
piano_list['F#11b9'] = '54,58,61,64,67,71,0'
piano_list['F#13#9'] = '54,58,61,64,69,71,75'
piano_list['F#13b5b9'] = '54,58,60,64,67,71,75'
piano_list['F#13b9'] = '54,58,61,64,67,71,75'
piano_list['F#6sus4'] = '42,59,61,63,0,0,0'
piano_list['F#7#11'] = '42,58,60,61,64,0,0'
piano_list['F#7#5'] = '42,58,62,64,0,0,0'
piano_list['F#7#5#9'] = '42,58,62,64,69,0,0'
piano_list['F#7#5b9'] = '42,58,62,64,67,0,0'
piano_list['F#7add11'] = '42,58,59,61,64,0,0'
piano_list['F#7add13'] = '42,58,61,63,64,0,0'
piano_list['F#7b5#9'] = '42,58,60,64,69,0,0'
piano_list['F#7b5b9'] = '42,58,60,64,67,0,0'
piano_list['F#9#11'] = '54,58,61,64,68,72,0'
piano_list['F#9#5'] = '42,58,62,64,68,0,0'
piano_list['F#9b13'] = '54,58,61,64,68,74,0'
piano_list['F#9b5'] = '42,58,60,64,68,0,0'
piano_list['F#9sus4'] = '42,59,61,64,68,0,0'
piano_list['F#M11'] = '54,58,61,65,68,71,0'
piano_list['F#M13'] = '54,58,61,65,68,71,75'
piano_list['F#M7#11'] = '42,58,60,61,65,0,0'
piano_list['F#M7add13'] = '42,58,61,63,65,0,0'
piano_list['F#M7b5'] = '42,58,60,65,0,0,0'
piano_list['F#M9#11'] = '54,58,62,65,68,72,0'
piano_list['F#M9#5'] = '42,58,62,65,68,0,0'
piano_list['F#M9sus4'] = '42,59,61,65,68,0,0'
piano_list['F#m13'] = '54,57,61,64,68,71,75'
piano_list['F#m6add9'] = '42,61,63,68,69,0,0'
piano_list['F#m7add11'] = '42,59,61,64,69,0,0'
piano_list['F#m7add13'] = '42,61,63,64,69,0,0'
piano_list['F#m7b9'] = '42,61,64,67,69,0,0'
piano_list['F#m9b5'] = '42,60,64,68,69,0,0'
piano_list['F#mM11'] = '54,57,61,65,68,71,0'
piano_list['F#mM13'] = '54,57,61,65,68,71,75'
piano_list['F#mM7add11'] = '42,57,59,61,65,0,0'
piano_list['F#mM7add13'] = '42,61,63,65,69,0,0'
piano_list['F#mM9'] = '42,61,65,68,69,0,0'
piano_list['F#sus4add9'] = '42,59,61,66,68,0,0'
piano_list['GM'] = '43,59,62,67,0,0,0'
piano_list['Gaug'] = '43,59,63,67,0,0,0'
piano_list['Gsus2'] = '43,62,67,69,0,0,0'
piano_list['Gm'] = '43,58,62,67,0,0,0'
piano_list['G6'] = '43,59,62,64,67,0,0'
piano_list['Gsus4'] = '43,60,62,67,0,0,0'
piano_list['Gm6'] = '43,58,62,64,67,0,0'
piano_list['G-5'] = '43,59,61,67,0,0,0'
piano_list['Gdim'] = '43,58,61,67,0,0,0'
piano_list['GM7'] = '43,59,62,66,0,0,0'
piano_list['Gm7b5'] = '43,58,61,65,0,0,0'
piano_list['Gdim7'] = '43,58,61,64,67,0,0'
piano_list['GmM7'] = '43,58,62,66,0,0,0'
piano_list['G9'] = '43,59,62,65,69,0,0'
piano_list['GM9'] = '43,59,62,66,69,0,0'
piano_list['Gadd9'] = '43,59,62,69,0,0,0'
piano_list['Gmadd9'] = '43,58,62,69,0,0,0'
piano_list['G7#9'] = '43,58,59,62,65,0,0'
piano_list['Gm9'] = '43,58,62,65,69,0,0'
piano_list['G7sus4'] = '43,60,62,65,67,0,0'
piano_list['GM7sus4'] = '43,60,62,66,0,0,0'
piano_list['G7sus2'] = '43,62,65,69,0,0,0'
piano_list['GM7#5'] = '43,59,63,66,0,0,0'
piano_list['G7'] = '43,59,62,65,0,0,0'
piano_list['G7b5'] = '43,59,61,65,0,0,0'
piano_list['GAug7'] = '43,59,63,65,0,0,0'
piano_list['G69'] = '43,59,62,64,69,0,0'
piano_list['G7b9'] = '43,59,62,65,68,0,0'
piano_list['Gm7'] = '43,58,62,65,0,0,0'
piano_list['G11'] = '55,59,62,65,69,72,0'
piano_list['Gm11'] = '55,58,62,65,69,72,0'
piano_list['G13'] = '55,59,62,65,69,72,76'
piano_list['G7sus4b9'] = '43,60,62,65,68,0,0'
piano_list['G11b9'] = '55,59,62,65,68,72,0'
piano_list['G13#9'] = '55,59,62,65,70,72,76'
piano_list['G13b5b9'] = '55,59,61,65,68,72,76'
piano_list['G13b9'] = '55,59,62,65,68,72,76'
piano_list['G6sus4'] = '43,60,62,64,67,0,0'
piano_list['G7#11'] = '43,59,61,62,65,0,0'
piano_list['G7#5'] = '43,59,63,65,0,0,0'
piano_list['G7#5#9'] = '43,58,59,63,65,0,0'
piano_list['G7#5b9'] = '43,59,63,65,68,0,0'
piano_list['G7add11'] = '43,59,60,62,65,0,0'
piano_list['G7add13'] = '43,59,62,64,65,0,0'
piano_list['G7b5#9'] = '43,58,59,61,65,0,0'
piano_list['G7b5b9'] = '43,59,61,65,68,0,0'
piano_list['G9#11'] = '55,59,62,65,69,73,0'
piano_list['G9#5'] = '43,59,63,65,69,0,0'
piano_list['G9b13'] = '55,59,62,65,69,75,0'
piano_list['G9b5'] = '43,59,61,65,69,0,0'
piano_list['G9sus4'] = '43,60,62,65,69,0,0'
piano_list['GM11'] = '55,59,62,66,69,72,0'
piano_list['GM13'] = '55,59,62,66,69,72,76'
piano_list['GM7#11'] = '43,59,61,62,66,0,0'
piano_list['GM7add13'] = '43,59,62,64,66,0,0'
piano_list['GM7b5'] = '43,59,61,66,0,0,0'
piano_list['GM9#11'] = '55,59,63,66,69,73,0'
piano_list['GM9#5'] = '43,59,63,66,69,0,0'
piano_list['GM9sus4'] = '43,60,62,66,69,0,0'
piano_list['Gm13'] = '55,58,62,65,69,72,76'
piano_list['Gm6add9'] = '43,58,62,64,69,0,0'
piano_list['Gm7add11'] = '43,58,60,62,65,0,0'
piano_list['Gm7add13'] = '43,58,62,64,65,0,0'
piano_list['Gm7b9'] = '43,58,62,65,68,0,0'
piano_list['Gm9b5'] = '43,58,61,65,69,0,0'
piano_list['GmM11'] = '55,58,62,66,69,72,0'
piano_list['GmM13'] = '55,58,62,66,69,72,76'
piano_list['GmM7add11'] = '43,58,60,62,66,0,0'
piano_list['GmM7add13'] = '43,58,62,64,66,0,0'
piano_list['GmM9'] = '43,58,62,66,69,0,0'
piano_list['Gsus4add9'] = '43,60,62,67,69,0,0'
piano_list['AbM'] = '44,60,63,68,0,0,0'
piano_list['Abaug'] = '44,60,64,68,0,0,0'
piano_list['Absus2'] = '44,58,63,68,0,0,0'
piano_list['Abm'] = '44,59,63,68,0,0,0'
piano_list['Ab6'] = '44,60,63,65,68,0,0'
piano_list['Absus4'] = '44,61,63,68,0,0,0'
piano_list['Abm6'] = '44,59,63,65,68,0,0'
piano_list['Ab-5'] = '44,60,62,68,0,0,0'
piano_list['Abdim'] = '44,59,62,68,0,0,0'
piano_list['AbM7'] = '44,60,63,67,0,0,0'
piano_list['Abm7b5'] = '44,59,62,66,0,0,0'
piano_list['Abdim7'] = '44,59,62,65,68,0,0'
piano_list['AbmM7'] = '44,59,63,67,0,0,0'
piano_list['Ab9'] = '44,58,60,63,66,0,0'
piano_list['AbM9'] = '44,58,60,63,67,0,0'
piano_list['Abadd9'] = '44,58,60,63,68,0,0'
piano_list['Abmadd9'] = '44,58,59,63,68,0,0'
piano_list['Ab7#9'] = '44,59,60,63,66,0,0'
piano_list['Abm9'] = '44,58,59,63,66,0,0'
piano_list['Ab7sus4'] = '44,61,63,66,0,0,0'
piano_list['AbM7sus4'] = '44,61,63,67,0,0,0'
piano_list['Ab7sus2'] = '44,58,63,66,0,0,0'
piano_list['AbM7#5'] = '44,60,64,67,0,0,0'
piano_list['Ab7'] = '44,60,63,66,0,0,0'
piano_list['Ab7b5'] = '44,60,62,66,0,0,0'
piano_list['AbAug7'] = '44,60,64,66,0,0,0'
piano_list['Ab69'] = '44,58,60,63,65,0,0'
piano_list['Ab7b9'] = '44,60,63,66,69,0,0'
piano_list['Abm7'] = '44,59,63,66,0,0,0'
piano_list['Ab11'] = '56,60,63,66,70,73,0'
piano_list['Abm11'] = '56,59,63,66,70,73,0'
piano_list['Ab13'] = '56,60,63,66,70,73,77'
piano_list['Ab7sus4b9'] = '44,61,63,66,69,0,0'
piano_list['Ab11b9'] = '56,60,63,66,69,73,0'
piano_list['Ab13#9'] = '56,60,63,66,71,73,77'
piano_list['Ab13b5b9'] = '56,60,62,66,69,73,77'
piano_list['Ab13b9'] = '56,60,63,66,69,73,77'
piano_list['Ab6sus4'] = '44,61,63,65,68,0,0'
piano_list['Ab7#11'] = '44,60,62,63,66,0,0'
piano_list['Ab7#5'] = '44,60,64,66,0,0,0'
piano_list['Ab7#5#9'] = '44,59,60,64,66,0,0'
piano_list['Ab7#5b9'] = '44,60,64,66,69,0,0'
piano_list['Ab7add11'] = '44,60,61,63,66,0,0'
piano_list['Ab7add13'] = '44,60,63,65,66,0,0'
piano_list['Ab7b5#9'] = '44,59,60,62,66,0,0'
piano_list['Ab7b5b9'] = '44,60,62,66,69,0,0'
piano_list['Ab9#11'] = '56,60,63,66,70,74,0'
piano_list['Ab9#5'] = '44,58,60,64,66,0,0'
piano_list['Ab9b13'] = '56,60,63,66,70,76,0'
piano_list['Ab9b5'] = '44,58,60,62,66,0,0'
piano_list['Ab9sus4'] = '44,58,61,63,66,0,0'
piano_list['AbM11'] = '56,60,63,67,70,73,0'
piano_list['AbM13'] = '56,60,63,67,70,73,77'
piano_list['AbM7#11'] = '44,60,62,63,67,0,0'
piano_list['AbM7add13'] = '44,60,63,65,67,0,0'
piano_list['AbM7b5'] = '44,60,62,67,0,0,0'
piano_list['AbM9#11'] = '56,60,64,67,70,74,0'
piano_list['AbM9#5'] = '44,58,60,64,67,0,0'
piano_list['AbM9sus4'] = '44,58,61,63,67,0,0'
piano_list['Abm13'] = '56,59,63,66,70,73,77'
piano_list['Abm6add9'] = '44,58,59,63,65,0,0'
piano_list['Abm7add11'] = '44,59,61,63,66,0,0'
piano_list['Abm7add13'] = '44,59,63,65,66,0,0'
piano_list['Abm7b9'] = '44,59,63,66,69,0,0'
piano_list['Abm9b5'] = '44,58,59,62,66,0,0'
piano_list['AbmM11'] = '56,59,63,67,70,73,0'
piano_list['AbmM13'] = '56,59,63,67,70,73,77'
piano_list['AbmM7add11'] = '44,59,61,63,67,0,0'
piano_list['AbmM7add13'] = '44,59,63,65,67,0,0'
piano_list['AbmM9'] = '44,58,59,63,67,0,0'
piano_list['Absus4add9'] = '44,58,61,63,68,0,0'
piano_list['AM'] = '45,61,64,69,0,0,0'
piano_list['Aaug'] = '45,61,65,69,0,0,0'
piano_list['Asus2'] = '45,59,64,69,0,0,0'
piano_list['Am'] = '45,60,64,69,0,0,0'
piano_list['A6'] = '45,61,64,66,69,0,0'
piano_list['Asus4'] = '45,62,64,69,0,0,0'
piano_list['Am6'] = '45,60,64,66,69,0,0'
piano_list['A-5'] = '45,61,63,69,0,0,0'
piano_list['Adim'] = '45,60,63,69,0,0,0'
piano_list['AM7'] = '45,61,64,68,0,0,0'
piano_list['Am7b5'] = '45,60,63,67,0,0,0'
piano_list['Adim7'] = '45,60,63,66,69,0,0'
piano_list['AmM7'] = '45,60,64,68,0,0,0'
piano_list['A9'] = '45,59,61,64,67,0,0'
piano_list['AM9'] = '45,59,61,64,68,0,0'
piano_list['Aadd9'] = '45,59,61,64,69,0,0'
piano_list['Amadd9'] = '45,59,60,64,69,0,0'
piano_list['A7#9'] = '45,60,61,64,67,0,0'
piano_list['Am9'] = '45,59,60,64,67,0,0'
piano_list['A7sus4'] = '45,62,64,67,0,0,0'
piano_list['AM7sus4'] = '45,62,64,68,0,0,0'
piano_list['A7sus2'] = '45,59,64,67,0,0,0'
piano_list['AM7#5'] = '45,61,65,68,0,0,0'
piano_list['A7'] = '45,61,64,67,0,0,0'
piano_list['A7b5'] = '45,61,63,67,0,0,0'
piano_list['AAug7'] = '45,61,65,67,0,0,0'
piano_list['A69'] = '45,59,61,64,66,0,0'
piano_list['A7b9'] = '45,58,61,64,67,0,0'
piano_list['Am7'] = '45,60,64,67,0,0,0'
piano_list['A11'] = '57,61,64,67,71,74,0'
piano_list['Am11'] = '57,60,64,67,71,74,0'
piano_list['A13'] = '57,61,64,67,71,74,78'
piano_list['A7sus4b9'] = '45,62,64,67,70,0,0'
piano_list['A11b9'] = '57,61,64,67,70,74,0'
piano_list['A13#9'] = '57,61,64,67,72,74,78'
piano_list['A13b5b9'] = '57,61,63,67,70,74,78'
piano_list['A13b9'] = '57,61,64,67,70,74,78'
piano_list['A6sus4'] = '45,62,64,66,69,0,0'
piano_list['A7#11'] = '45,61,63,64,67,0,0'
piano_list['A7#5'] = '45,61,65,67,0,0,0'
piano_list['A7#5#9'] = '45,60,61,65,67,0,0'
piano_list['A7#5b9'] = '45,58,61,65,67,0,0'
piano_list['A7add11'] = '45,61,62,64,67,0,0'
piano_list['A7add13'] = '45,61,64,66,67,0,0'
piano_list['A7b5#9'] = '45,60,61,63,67,0,0'
piano_list['A7b5b9'] = '45,58,61,63,67,0,0'
piano_list['A9#11'] = '57,61,64,67,71,75,0'
piano_list['A9#5'] = '45,59,61,65,67,0,0'
piano_list['A9b13'] = '57,61,64,67,71,77,0'
piano_list['A9b5'] = '45,59,61,63,67,0,0'
piano_list['A9sus4'] = '45,59,62,64,67,0,0'
piano_list['AM11'] = '57,61,64,68,71,74,0'
piano_list['AM13'] = '57,61,64,68,71,74,78'
piano_list['AM7#11'] = '45,61,63,64,68,0,0'
piano_list['AM7add13'] = '45,61,64,66,68,0,0'
piano_list['AM7b5'] = '45,61,63,68,0,0,0'
piano_list['AM9#11'] = '57,61,65,68,71,75,0'
piano_list['AM9#5'] = '45,59,61,65,68,0,0'
piano_list['AM9sus4'] = '45,59,62,64,68,0,0'
piano_list['Am13'] = '57,60,64,67,71,74,78'
piano_list['Am6add9'] = '45,59,60,64,66,0,0'
piano_list['Am7add11'] = '45,60,62,64,67,0,0'
piano_list['Am7add13'] = '45,60,64,66,67,0,0'
piano_list['Am7b9'] = '45,58,60,64,67,0,0'
piano_list['Am9b5'] = '45,59,60,63,67,0,0'
piano_list['AmM11'] = '57,60,64,68,71,74,0'
piano_list['AmM13'] = '57,60,64,68,71,74,78'
piano_list['AmM7add11'] = '45,60,62,64,68,0,0'
piano_list['AmM7add13'] = '45,60,64,66,68,0,0'
piano_list['AmM9'] = '45,59,60,64,68,0,0'
piano_list['Asus4add9'] = '45,59,62,64,0,0,0'
piano_list['BbM'] = '46,58,62,65,0,0,0'
piano_list['Bbaug'] = '46,58,62,66,0,0,0'
piano_list['Bbsus2'] = '46,58,60,65,0,0,0'
piano_list['Bbm'] = '46,58,61,65,0,0,0'
piano_list['Bb6'] = '46,58,62,65,67,0,0'
piano_list['Bbsus4'] = '46,58,63,65,0,0,0'
piano_list['Bbm6'] = '46,58,61,65,67,0,0'
piano_list['Bb-5'] = '46,58,62,64,0,0,0'
piano_list['Bbdim'] = '46,58,61,64,0,0,0'
piano_list['BbM7'] = '46,62,65,69,0,0,0'
piano_list['Bbm7b5'] = '46,61,64,68,0,0,0'
piano_list['Bbdim7'] = '46,58,61,64,67,0,0'
piano_list['BbmM7'] = '46,61,65,69,0,0,0'
piano_list['Bb9'] = '46,60,62,65,68,0,0'
piano_list['BbM9'] = '46,60,62,65,69,0,0'
piano_list['Bbadd9'] = '46,58,60,62,65,0,0'
piano_list['Bbmadd9'] = '46,58,60,61,65,0,0'
piano_list['Bb7#9'] = '46,61,62,65,68,0,0'
piano_list['Bbm9'] = '46,60,61,65,68,0,0'
piano_list['Bb7sus4'] = '46,63,65,68,0,0,0'
piano_list['BbM7sus4'] = '46,63,65,69,0,0,0'
piano_list['Bb7sus2'] = '46,60,65,68,0,0,0'
piano_list['BbM7#5'] = '46,62,66,69,0,0,0'
piano_list['Bb7'] = '46,62,65,68,0,0,0'
piano_list['Bb7b5'] = '46,62,64,68,0,0,0'
piano_list['BbAug7'] = '46,62,66,68,0,0,0'
piano_list['Bb69'] = '46,60,62,65,67,0,0'
piano_list['Bb7b9'] = '46,59,62,65,68,0,0'
piano_list['Bbm7'] = '46,61,65,68,0,0,0'
piano_list['Bb11'] = '58,62,65,68,72,75,0'
piano_list['Bbm11'] = '58,61,65,68,72,75,0'
piano_list['Bb13'] = '58,62,65,68,72,75,79'
piano_list['Bb7sus4b9'] = '46,59,63,65,68,0,0'
piano_list['Bb11b9'] = '58,62,65,68,71,75,0'
piano_list['Bb13#9'] = '58,62,65,68,73,75,79'
piano_list['Bb13b5b9'] = '58,62,64,68,71,75,79'
piano_list['Bb13b9'] = '58,62,65,68,71,75,79'
piano_list['Bb6sus4'] = '46,58,63,65,67,0,0'
piano_list['Bb7#11'] = '46,62,64,65,68,0,0'
piano_list['Bb7#5'] = '46,62,66,68,0,0,0'
piano_list['Bb7#5#9'] = '46,61,62,66,68,0,0'
piano_list['Bb7#5b9'] = '46,59,62,66,68,0,0'
piano_list['Bb7add11'] = '46,62,63,65,68,0,0'
piano_list['Bb7add13'] = '46,62,65,67,68,0,0'
piano_list['Bb7b5#9'] = '46,61,62,64,68,0,0'
piano_list['Bb7b5b9'] = '46,59,62,64,68,0,0'
piano_list['Bb9#11'] = '58,62,65,68,72,76,0'
piano_list['Bb9#5'] = '46,60,62,66,68,0,0'
piano_list['Bb9b13'] = '58,62,65,68,72,78,0'
piano_list['Bb9b5'] = '46,60,62,64,68,0,0'
piano_list['Bb9sus4'] = '46,60,63,65,68,0,0'
piano_list['BbM11'] = '58,62,65,69,72,75,0'
piano_list['BbM13'] = '58,62,65,69,72,75,79'
piano_list['BbM7#11'] = '46,62,64,65,69,0,0'
piano_list['BbM7add13'] = '46,62,65,67,69,0,0'
piano_list['BbM7b5'] = '46,62,64,69,0,0,0'
piano_list['BbM9#11'] = '58,62,66,69,72,76,0'
piano_list['BbM9#5'] = '46,60,62,66,69,0,0'
piano_list['BbM9sus4'] = '46,60,63,65,69,0,0'
piano_list['Bbm13'] = '58,61,65,68,72,75,79'
piano_list['Bbm6add9'] = '46,60,61,65,67,0,0'
piano_list['Bbm7add11'] = '46,61,63,65,68,0,0'
piano_list['Bbm7add13'] = '46,61,65,67,68,0,0'
piano_list['Bbm7b9'] = '46,59,61,65,68,0,0'
piano_list['Bbm9b5'] = '46,60,61,64,68,0,0'
piano_list['BbmM11'] = '58,61,65,69,72,75,0'
piano_list['BbmM13'] = '58,61,65,69,72,75,79'
piano_list['BbmM7add11'] = '46,61,63,65,69,0,0'
piano_list['BbmM7add13'] = '46,61,65,67,69,0,0'
piano_list['BbmM9'] = '46,60,61,65,69,0,0'
piano_list['Bbsus4add9'] = '46,60,63,65,0,0,0'
piano_list['BM'] = '47,59,63,66,0,0,0'
piano_list['Baug'] = '47,59,63,67,0,0,0'
piano_list['Bsus2'] = '47,59,61,66,0,0,0'
piano_list['Bm'] = '47,59,62,66,0,0,0'
piano_list['B6'] = '47,59,63,66,68,0,0'
piano_list['Bsus4'] = '47,59,64,66,0,0,0'
piano_list['Bm6'] = '47,59,62,66,68,0,0'
piano_list['B-5'] = '47,59,63,65,0,0,0'
piano_list['Bdim'] = '47,59,62,65,0,0,0'
piano_list['BM7'] = '47,58,63,66,0,0,0'
piano_list['Bm7b5'] = '47,62,65,69,0,0,0'
piano_list['Bdim7'] = '47,62,65,68,0,0,0'
piano_list['BmM7'] = '47,58,62,66,0,0,0'
piano_list['B9'] = '47,61,63,66,69,0,0'
piano_list['BM9'] = '47,58,61,63,66,0,0'
piano_list['Badd9'] = '47,59,61,63,66,0,0'
piano_list['Bmadd9'] = '47,59,61,62,66,0,0'
piano_list['B7#9'] = '47,62,63,66,69,0,0'
piano_list['Bm9'] = '47,61,62,66,69,0,0'
piano_list['B7sus4'] = '47,59,64,66,69,0,0'
piano_list['BM7sus4'] = '47,58,64,66,0,0,0'
piano_list['B7sus2'] = '47,61,66,69,0,0,0'
piano_list['BM7#5'] = '47,58,63,67,0,0,0'
piano_list['B7'] = '47,63,66,69,0,0,0'
piano_list['B7b5'] = '47,63,65,69,0,0,0'
piano_list['BAug7'] = '47,63,67,69,0,0,0'
piano_list['B69'] = '47,61,63,66,68,0,0'
piano_list['B7b9'] = '47,60,63,66,69,0,0'
piano_list['Bm7'] = '47,62,66,69,0,0,0'
piano_list['B11'] = '59,63,66,69,73,76,0'
piano_list['Bm11'] = '59,62,66,69,73,76,0'
piano_list['B13'] = '59,63,66,69,73,76,80'
piano_list['B7sus4b9'] = '47,60,64,66,69,0,0'
piano_list['B11b9'] = '59,63,66,69,72,76,0'
piano_list['B13#9'] = '59,63,66,69,74,76,80'
piano_list['B13b5b9'] = '59,63,65,69,72,76,80'
piano_list['B13b9'] = '59,63,66,69,72,76,80'
piano_list['B6sus4'] = '47,59,64,66,68,0,0'
piano_list['B7#11'] = '47,63,65,66,69,0,0'
piano_list['B7#5'] = '47,63,67,69,0,0,0'
piano_list['B7#5#9'] = '47,62,63,67,69,0,0'
piano_list['B7#5b9'] = '47,60,63,67,69,0,0'
piano_list['B7add11'] = '47,63,64,66,69,0,0'
piano_list['B7add13'] = '47,63,66,68,69,0,0'
piano_list['B7b5#9'] = '47,62,63,65,69,0,0'
piano_list['B7b5b9'] = '47,60,63,65,69,0,0'
piano_list['B9#11'] = '59,63,66,69,73,77,0'
piano_list['B9#5'] = '47,61,63,67,69,0,0'
piano_list['B9b13'] = '59,63,66,69,73,79,0'
piano_list['B9b5'] = '47,61,63,65,69,0,0'
piano_list['B9sus4'] = '47,61,64,66,69,0,0'
piano_list['BM11'] = '59,63,66,70,73,76,0'
piano_list['BM13'] = '59,63,66,70,73,76,80'
piano_list['BM7#11'] = '47,58,63,65,66,0,0'
piano_list['BM7add13'] = '47,58,63,66,68,0,0'
piano_list['BM7b5'] = '47,58,63,65,0,0,0'
piano_list['BM9#11'] = '59,63,67,70,73,77,0'
piano_list['BM9#5'] = '47,58,61,63,67,0,0'
piano_list['BM9sus4'] = '47,58,61,64,66,0,0'
piano_list['Bm13'] = '59,62,66,69,73,76,80'
piano_list['Bm6add9'] = '47,61,62,66,68,0,0'
piano_list['Bm7add11'] = '47,62,64,66,69,0,0'
piano_list['Bm7add13'] = '47,62,66,68,69,0,0'
piano_list['Bm7b9'] = '47,60,62,66,69,0,0'
piano_list['Bm9b5'] = '47,61,62,65,69,0,0'
piano_list['BmM11'] = '59,62,66,70,73,76,0'
piano_list['BmM13'] = '59,62,66,70,73,76,80'
piano_list['BmM7add11'] = '47,58,62,64,66,0,0'
piano_list['BmM7add13'] = '47,58,62,66,68,0,0'
piano_list['BmM9'] = '47,58,61,62,66,0,0'
piano_list['Bsus4add9'] = '47,61,64,66,0,0,0'

piano_mode = reaper.GetExtState('Chord Tools', 'piano mode')
if piano_mode == 'true' then
    piano_mode = true
else
    piano_mode = false
end

function chordin()
    local editor = reaper.MIDIEditor_GetActive()
    local take = reaper.MIDIEditor_GetTake(editor)
    reaper.MIDI_DisableSort(take)
    idx = -1
    repeat
        integer = reaper.MIDI_EnumSelNotes(take, idx)
        if integer ~= -1 then
            if piano_mode == false then
                tb_note = {}
                retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
                if pitch < 48 then
                    pitch = (pitch % 12) + 48
                    reaper.MIDI_SetNote(take, integer, NULL, NULL, NULL, NULL, NULL, pitch, NULL, false)
                end
                if chord[leixing] ~= nil then
                    note1, note2, note3, note4, note5, note6 = string.match(chord[leixing], "(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)")
                    if note1 ~= '0' then
                        table.insert(tb_note, tonumber(note1))
                    end
                    if note2 ~= '0' then
                        table.insert(tb_note, tonumber(note2))
                    end
                    if note3 ~= '0' then
                        table.insert(tb_note, tonumber(note3))
                    end
                    if note4 ~= '0' then
                        table.insert(tb_note, tonumber(note4))
                    end
                    if note5 ~= '0' then
                        table.insert(tb_note, tonumber(note5))
                    end
                    if note6 ~= '0' then
                        table.insert(tb_note, tonumber(note6))
                    end
                    for i, v in ipairs(tb_note) do
                        reaper.MIDI_InsertNote(take, false, false, startppqpos, endppqpos, chan, pitch + v, vel, false)
                    end
                end
            else
                key = {}
                key[0] = 'C'
                key[1] = 'C#'
                key[2] = 'D'
                key[3] = 'Eb'
                key[4] = 'E'
                key[5] = 'F'
                key[6] = 'F#'
                key[7] = 'G'
                key[8] = 'Ab'
                key[9] = 'A'
                key[10] = 'Bb'
                key[11] = 'B'
                retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
                pitch_key = pitch % 12
                pitch_key = key[pitch_key] .. leixing
                notetb = piano_list[pitch_key]
                n1, n2, n3, n4, n5, n6, n7 = string.match(notetb, "(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)")
                if n1 ~= '0' then
                    reaper.MIDI_SetNote(take, integer, NULL, NULL, NULL, NULL, NULL, n1, NULL, false)
                end
                if n2 ~= '0' then
                    reaper.MIDI_InsertNote(take, false, false, startppqpos, endppqpos, chan, n2, vel, false)
                end
                if n3 ~= '0' then
                    reaper.MIDI_InsertNote(take, false, false, startppqpos, endppqpos, chan, n3, vel, false)
                end
                if n4 ~= '0' then
                    reaper.MIDI_InsertNote(take, false, false, startppqpos, endppqpos, chan, n4, vel, false)
                end
                if n5 ~= '0' then
                    reaper.MIDI_InsertNote(take, false, false, startppqpos, endppqpos, chan, n5, vel, false)
                end
                if n6 ~= '0' then
                    reaper.MIDI_InsertNote(take, false, false, startppqpos, endppqpos, chan, n6, vel, false)
                end
                if n7 ~= '0' then
                    reaper.MIDI_InsertNote(take, false, false, startppqpos, endppqpos, chan, n7, vel, false)
                end
            end
        end
        idx = integer
        integer = reaper.MIDI_EnumSelNotes(take, idx)
    until integer == -1

    reaper.MIDI_Sort(take)

end -- function end

--------------------------------------------------------------------------------------
function inkeymark0()
    tb_mark = {}
    tb_mark['a'] = 'A'
    tb_mark['b'] = 'B'
    tb_mark['c'] = 'C'
    tb_mark['d'] = 'D'
    tb_mark['e'] = 'E'
    tb_mark['f'] = 'F'
    tb_mark['g'] = 'G'
    tb_mark['ab'] = 'Ab'
    tb_mark['g#'] = 'Ab'
    tb_mark['bb'] = 'Bb'
    tb_mark['a#'] = 'Bb'
    tb_mark['db'] = 'C#'
    tb_mark['c#'] = 'C#'
    tb_mark['d#'] = 'Eb'
    tb_mark['eb'] = 'Eb'
    tb_mark['gb'] = 'F#'
    tb_mark['f#'] = 'F#'
    pos = 0
    -- pos=reaper.GetCursorPosition()
    retval, name = reaper.GetUserInputs('请输入正确的调号！', 1, '                                           Key= ', '')
    if retval == false then
        return
    end
    name_low = string.lower(name)
    if tb_mark[name_low] == nil then
        reaper.MB('调号错误请重新输入！', '', 0)
        return
    end
    key = tb_mark[name_low]
    reaper.AddProjectMarker2(0, false, pos, -1, 'Key=' .. key, -1, 33521664)
end

------------------------------------------------------------------------------
function inkeymark()
    tb_mark = {}
    tb_mark['a'] = 'A'
    tb_mark['b'] = 'B'
    tb_mark['c'] = 'C'
    tb_mark['d'] = 'D'
    tb_mark['e'] = 'E'
    tb_mark['f'] = 'F'
    tb_mark['g'] = 'G'
    tb_mark['ab'] = 'Ab'
    tb_mark['g#'] = 'Ab'
    tb_mark['bb'] = 'Bb'
    tb_mark['a#'] = 'Bb'
    tb_mark['db'] = 'C#'
    tb_mark['c#'] = 'C#'
    tb_mark['d#'] = 'Eb'
    tb_mark['eb'] = 'Eb'
    tb_mark['gb'] = 'F#'
    tb_mark['f#'] = 'F#'

    pos = reaper.GetCursorPosition()
    retval, name = reaper.GetUserInputs('请输入正确的调号！', 1, '                                           Key= ', '')
    if retval == false then
        return
    end
    name_low = string.lower(name)
    if tb_mark[name_low] == nil then
        reaper.MB('调号错误请重新输入！', '', 0)
        return
    end
    key = tb_mark[name_low]
    reaper.AddProjectMarker2(0, false, pos, -1, 'Key=' .. key, -1, 33521664)
end
------------------------------------------------------------
function chordtolyrics()
    local editor = reaper.MIDIEditor_GetActive()

    local take = reaper.MIDIEditor_GetTake(editor)

    key_list = {}
    key_list['key=c'] = 'Db,Eb,F#,Ab,Bb'
    key_list['key=db'] = 'Db,Eb,Gb,Ab,Bb'
    key_list['key=d'] = 'C#,Eb,F#,G#,Bb'
    key_list['key=eb'] = 'Db,Eb,Gb,Ab,Bb'
    key_list['key=e'] = 'C#,D#,F#,G#,A#'
    key_list['key=f'] = 'Db,Eb,Gb,Ab,Bb'
    -- key_list['key=gb']='Db,Eb,Gb,Ab,Bb'
    key_list['key=g'] = 'C#,Eb,F#,Ab,Bb'
    key_list['key=ab'] = 'Db,Eb,Gb,Ab,Bb'
    key_list['key=a'] = 'C#,D#,F#,G#,Bb'
    key_list['key=bb'] = 'Db,Eb,Gb,Ab,Bb'
    key_list['key=b'] = 'C#,D#,F#,G#,A#'
    key_list['key=c#'] = 'C#,D#,F#,G#,A#'
    key_list['key=f#'] = 'C#,D#,F#,G#,A#'

    marklist = {}
    ticklist = {}
    midx, tbi = 0, 1
    postb = {}
    repeat
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
        name_low = string.lower(name)
        if key_list[name_low] ~= nil then
            marklist[tbi] = name_low
            postb[tbi] = pos
            marktick = reaper.MIDI_GetPPQPosFromProjTime(take, pos)
            ticklist[tbi] = marktick
            tbi = tbi + 1
        end

        midx = midx + 1
    until m_retval == 0
    if ticklist[1] == nil or postb[1] ~= 0 then
        getMB = reaper.ShowMessageBox(
            '没有找到 Key=* 标签或者首标签不在工程最前面！\n请创建Key=（大调）标记在工程头或者转调小节处！\n点 确定 创建Key标记在工程最前面！',
            '错误！', 1)
        if getMB == 1 then
            inkeymark0()
        end
    else

        reaper.MIDI_DisableSort(take)

        retval, notecnt, ccevtcnt, extsyxevtcnt = reaper.MIDI_CountEvts(take)

        one = 0
        while one < extsyxevtcnt do
            reaper.MIDI_DeleteTextSysexEvt(take, 0)
            one = one + 1
        end

        noteidx, i, ii, chordnum = 0, 2, 1, 0

        notepitch = {}

        tempst = -240

        chordkey = ''

        zhuanweikey = ''

        chord = ''

        while noteidx <= notecnt do

            retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)

            if startppqpos == tempst then
                notepitch[i] = pitch
                notest = startppqpos
                i = i + 1
            else
                jiange = startppqpos - tempst
                if jiange < 0 then
                    jiange = jiange * (-1)
                end
                if jiange ~= 0 and jiange < 240 then
                    num = reaper.GetCursorPositionEx(0)
                    num_new = reaper.MIDI_GetProjTimeFromPPQPos(take, startppqpos)
                    move = num_new - num
                    hahahaha, measures, cml, fullbeats, cdenom = reaper.TimeMap2_timeToBeats(0, num_new)
                    measures = measures + 1
                    reaper.ShowMessageBox('和弦间隔小于 240 tick 在第 ' .. measures ..
                                              ' 小节，请修正以后重新运行脚本！', '出错啦!', 0)
                    reaper.MoveEditCursor(move, false) -- move cursor
                    break
                end
                --------------------------------------check jiange
                if #notepitch > 1 then
                    zhuanwei = -1
                    table.sort(notepitch)
                    if notepitch[1] < 48 then
                        zhuanwei = notepitch[1]
                        zhuanwei = zhuanwei % 12
                        table.remove(notepitch, 1)
                        if zhuanwei == 0 then
                            zhuanweikey = '/C'
                        end
                        if zhuanwei == 1 then
                            for i, v in ipairs(ticklist) do
                                if notest >= v then
                                    dingwei = i
                                end
                            end
                            B1, B2, B3, B4, B5 = string.match(key_list[marklist[dingwei]], "(..),(..),(..),(..),(..)")
                            zhuanweikey = '/' .. B1
                        end
                        if zhuanwei == 2 then
                            zhuanweikey = '/D'
                        end
                        if zhuanwei == 3 then
                            for i, v in ipairs(ticklist) do
                                if notest >= v then
                                    dingwei = i
                                end
                            end
                            B1, B2, B3, B4, B5 = string.match(key_list[marklist[dingwei]], "(..),(..),(..),(..),(..)")
                            zhuanweikey = '/' .. B2
                        end
                        if zhuanwei == 4 then
                            zhuanweikey = '/E'
                        end
                        if zhuanwei == 5 then
                            zhuanweikey = '/F'
                        end
                        if zhuanwei == 6 then
                            for i, v in ipairs(ticklist) do
                                if notest >= v then
                                    dingwei = i
                                end
                            end
                            B1, B2, B3, B4, B5 = string.match(key_list[marklist[dingwei]], "(..),(..),(..),(..),(..)")
                            zhuanweikey = '/' .. B3
                        end
                        if zhuanwei == 7 then
                            zhuanweikey = '/G'
                        end
                        if zhuanwei == 8 then
                            for i, v in ipairs(ticklist) do
                                if notest >= v then
                                    dingwei = i
                                end
                            end
                            B1, B2, B3, B4, B5 = string.match(key_list[marklist[dingwei]], "(..),(..),(..),(..),(..)")
                            zhuanweikey = '/' .. B4
                        end
                        if zhuanwei == 9 then
                            zhuanweikey = '/A'
                        end
                        if zhuanwei == 10 then
                            for i, v in ipairs(ticklist) do
                                if notest >= v then
                                    dingwei = i
                                end
                            end
                            B1, B2, B3, B4, B5 = string.match(key_list[marklist[dingwei]], "(..),(..),(..),(..),(..)")
                            zhuanweikey = '/' .. B5
                        end
                        if zhuanwei == 11 then
                            zhuanweikey = '/B'
                        end
                    end

                    low = notepitch[1]
                    if low ~= nil then
                        low = low % 12
                    end
                    if low == zhuanwei then
                        num = reaper.GetCursorPositionEx(0)
                        num_new = reaper.MIDI_GetProjTimeFromPPQPos(take, tempst)
                        move = num_new - num
                        hahahaha, measures, cml, fullbeats, cdenom = reaper.TimeMap2_timeToBeats(0, num_new)
                        measures = measures + 1
                        reaper.ShowMessageBox('转位音等于根音 在第 ' .. measures ..
                                                  ' 小节，请删除转位音以后重新运行脚本！', '出错啦!', 0)
                        reaper.MoveEditCursor(move, false)
                        break
                    end
                    if low == 0 then
                        chordkey = 'C'
                    end
                    if low == 1 then
                        for i, v in ipairs(ticklist) do
                            if notest >= v then
                                dingwei = i
                            end
                        end
                        B1, B2, B3, B4, B5 = string.match(key_list[marklist[dingwei]], "(..),(..),(..),(..),(..)")
                        chordkey = B1
                    end
                    if low == 2 then
                        chordkey = 'D'
                    end
                    if low == 3 then
                        for i, v in ipairs(ticklist) do
                            if notest >= v then
                                dingwei = i
                            end
                        end
                        B1, B2, B3, B4, B5 = string.match(key_list[marklist[dingwei]], "(..),(..),(..),(..),(..)")
                        chordkey = B2
                    end
                    if low == 4 then
                        chordkey = 'E'
                    end
                    if low == 5 then
                        chordkey = 'F'
                    end
                    if low == 6 then
                        for i, v in ipairs(ticklist) do
                            if notest >= v then
                                dingwei = i
                            end
                        end
                        B1, B2, B3, B4, B5 = string.match(key_list[marklist[dingwei]], "(..),(..),(..),(..),(..)")
                        chordkey = B3
                    end
                    if low == 7 then
                        chordkey = 'G'
                    end
                    if low == 8 then
                        for i, v in ipairs(ticklist) do
                            if notest >= v then
                                dingwei = i
                            end
                        end
                        B1, B2, B3, B4, B5 = string.match(key_list[marklist[dingwei]], "(..),(..),(..),(..),(..)")
                        chordkey = B4
                    end
                    if low == 9 then
                        chordkey = 'A'
                    end
                    if low == 10 then
                        for i, v in ipairs(ticklist) do
                            if notest >= v then
                                dingwei = i
                            end
                        end
                        B1, B2, B3, B4, B5 = string.match(key_list[marklist[dingwei]], "(..),(..),(..),(..),(..)")
                        chordkey = B5
                    end
                    if low == 11 then
                        chordkey = 'B'
                    end
                    -- quedinggenyin
                    while ii ~= #notepitch do
                        chordnum = chordnum + (notepitch[ii + 1] - notepitch[ii]) * (10 ^ ii)
                        ii = ii + 1
                    end -- while end   
                    ii = 1
                    chord = chordtype[chordnum]

                    if chord == nil then
                        num = reaper.GetCursorPositionEx(0)
                        num_new = reaper.MIDI_GetProjTimeFromPPQPos(take, tempst)
                        move = num_new - num
                        hahahaha, measures, cml, fullbeats, cdenom = reaper.TimeMap2_timeToBeats(0, num_new)
                        measures = measures + 1
                        reaper.ShowMessageBox('有无法识别的和弦排列在第 ' .. measures ..
                                                  ' 小节，请修正以后重新运行脚本！', '出错啦!', 0)
                        reaper.MoveEditCursor(move, false) -- move cursor
                        break
                    end

                    if notest ~= nil then
                        reaper.MIDI_InsertTextSysexEvt(take, false, false, notest, 5, chordkey .. chord .. zhuanweikey)
                        -- reaper.MIDI_InsertTextSysexEvt(take, false, false, notest, 5, chordnum)
                    end -- insert end
                end -- #notepitch > 1

                zhuanweikey = ''
                chordnum = 0
                notepitch = {}
                notepitch[1] = pitch
                tempst = startppqpos
                i = 2
            end

            noteidx = noteidx + 1

            if noteidx > notecnt then
                reaper.TrackCtl_SetToolTip('         恭喜！\n和弦标记全部写入！', 500, 400, true)
            end

        end -- while end
    end -- ticklist end

    reaper.MIDI_Sort(take)
    reaper.MIDIEditor_OnCommand(editor, 40370)
    reaper.SN_FocusMIDIEditor()

end -- chordtolyrics
---------------------------------------------------------------------------
function chordtolyrics_series()

    local editor = reaper.MIDIEditor_GetActive()

    local take = reaper.MIDIEditor_GetTake(editor)

    key_list = {}
    key_list['key=c'] = 'Ⅰ,#Ⅰ,Ⅱ,bⅢ,Ⅲ,Ⅳ,#Ⅳ,Ⅴ,bⅥ,Ⅵ,bⅦ,Ⅶ'
    key_list['key=db'] = 'Ⅶ,Ⅰ,#Ⅰ,Ⅱ,bⅢ,Ⅲ,Ⅳ,#Ⅳ,Ⅴ,bⅥ,Ⅵ,bⅦ'
    key_list['key=c#'] = 'Ⅶ,Ⅰ,#Ⅰ,Ⅱ,bⅢ,Ⅲ,Ⅳ,#Ⅳ,Ⅴ,bⅥ,Ⅵ,bⅦ'
    key_list['key=d'] = 'bⅦ,Ⅶ,Ⅰ,#Ⅰ,Ⅱ,bⅢ,Ⅲ,Ⅳ,#Ⅳ,Ⅴ,bⅥ,Ⅵ'
    key_list['key=eb'] = 'Ⅵ,bⅦ,Ⅶ,Ⅰ,#Ⅰ,Ⅱ,bⅢ,Ⅲ,Ⅳ,#Ⅳ,Ⅴ,bⅥ'
    key_list['key=e'] = 'bⅥ,Ⅵ,bⅦ,Ⅶ,Ⅰ,#Ⅰ,Ⅱ,bⅢ,Ⅲ,Ⅳ,#Ⅳ,Ⅴ'
    key_list['key=f'] = 'Ⅴ,bⅥ,Ⅵ,bⅦ,Ⅶ,Ⅰ,#Ⅰ,Ⅱ,bⅢ,Ⅲ,Ⅳ,#Ⅳ'
    key_list['key=f#'] = '#Ⅳ,Ⅴ,bⅥ,Ⅵ,bⅦ,Ⅶ,Ⅰ,#Ⅰ,Ⅱ,bⅢ,Ⅲ,Ⅳ'
    -- key_list['key=gb']='#Ⅳ,Ⅴ,bⅥ,Ⅵ,bⅦ,Ⅶ,Ⅰ,#Ⅰ,Ⅱ,bⅢ,Ⅲ,Ⅳ'
    key_list['key=g'] = 'Ⅳ,#Ⅳ,Ⅴ,bⅥ,Ⅵ,bⅦ,Ⅶ,Ⅰ,#Ⅰ,Ⅱ,bⅢ,Ⅲ'
    key_list['key=ab'] = 'Ⅲ,Ⅳ,#Ⅳ,Ⅴ,bⅥ,Ⅵ,bⅦ,Ⅶ,Ⅰ,#Ⅰ,Ⅱ,bⅢ'
    key_list['key=a'] = 'bⅢ,Ⅲ,Ⅳ,#Ⅳ,Ⅴ,bⅥ,Ⅵ,bⅦ,Ⅶ,Ⅰ,#Ⅰ,Ⅱ'
    key_list['key=bb'] = 'Ⅱ,bⅢ,Ⅲ,Ⅳ,#Ⅳ,Ⅴ,bⅥ,Ⅵ,bⅦ,Ⅶ,Ⅰ,#Ⅰ'
    key_list['key=b'] = '#Ⅰ,Ⅱ,bⅢ,Ⅲ,Ⅳ,#Ⅳ,Ⅴ,bⅥ,Ⅵ,bⅦ,Ⅶ,Ⅰ'

    marklist = {}
    ticklist = {}
    midx, tbi = 0, 1
    postb = {}
    repeat
        m_retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(midx)
        name_low = string.lower(name)
        if key_list[name_low] ~= nil then
            marklist[tbi] = name_low
            postb[tbi] = pos
            marktick = reaper.MIDI_GetPPQPosFromProjTime(take, pos)
            ticklist[tbi] = marktick
            tbi = tbi + 1
        end

        midx = midx + 1
    until m_retval == 0
    if ticklist[1] == nil or postb[1] ~= 0 then
        getMB = reaper.ShowMessageBox(
            '没有找到 Key=* 标签或者首标签不在工程最前面！\n请创建Key=（大调）标记在工程头或者转调小节处！\n点 确定 创建Key标记在工程最前面！',
            '错误！', 1)
        if getMB == 1 then
            inkeymark0()
        end
    else

        reaper.MIDI_DisableSort(take)

        retval, notecnt, ccevtcnt, extsyxevtcnt = reaper.MIDI_CountEvts(take)

        one = 0
        while one < extsyxevtcnt do
            reaper.MIDI_DeleteTextSysexEvt(take, 0)
            one = one + 1
        end

        noteidx, i, ii, chordnum = 0, 2, 1, 0

        notepitch = {}

        tempst = -240

        chordkey = ''

        zhuanweikey = ''

        chord = ''

        while noteidx <= notecnt do

            retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)

            if startppqpos == tempst then
                notepitch[i] = pitch
                notest = startppqpos
                i = i + 1
            else
                jiange = startppqpos - tempst
                if jiange < 0 then
                    jiange = jiange * (-1)
                end
                if jiange ~= 0 and jiange < 240 then
                    num = reaper.GetCursorPositionEx(0)
                    num_new = reaper.MIDI_GetProjTimeFromPPQPos(take, startppqpos)
                    move = num_new - num
                    hahahaha, measures, cml, fullbeats, cdenom = reaper.TimeMap2_timeToBeats(0, num_new)
                    measures = measures + 1
                    reaper.ShowMessageBox('和弦间隔小于 240 tick 在第 ' .. measures ..
                                              ' 小节，请修正以后重新运行脚本！', '出错啦!', 0)
                    reaper.MoveEditCursor(move, false) -- move cursor
                    break
                end
                --------------------------------------check jiange
                if #notepitch > 1 then
                    zhuanwei = -1
                    table.sort(notepitch)
                    if notepitch[1] < 48 then
                        zhuanwei = notepitch[1]
                        zhuanwei = zhuanwei % 12
                        table.remove(notepitch, 1)
                        if zhuanwei == 0 then
                            for i, v in ipairs(ticklist) do
                                if notest >= v then
                                    dingwei = i
                                end
                            end
                            B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                                string.match(key_list[marklist[dingwei]],
                                    "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                            zhuanweikey = '/' .. B0
                        end
                        if zhuanwei == 1 then
                            for i, v in ipairs(ticklist) do
                                if notest >= v then
                                    dingwei = i
                                end
                            end
                            B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                                string.match(key_list[marklist[dingwei]],
                                    "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                            zhuanweikey = '/' .. B1
                        end
                        if zhuanwei == 2 then
                            for i, v in ipairs(ticklist) do
                                if notest >= v then
                                    dingwei = i
                                end
                            end
                            B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                                string.match(key_list[marklist[dingwei]],
                                    "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                            zhuanweikey = '/' .. B2
                        end
                        if zhuanwei == 3 then
                            for i, v in ipairs(ticklist) do
                                if notest >= v then
                                    dingwei = i
                                end
                            end
                            B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                                string.match(key_list[marklist[dingwei]],
                                    "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                            zhuanweikey = '/' .. B3
                        end
                        if zhuanwei == 4 then
                            for i, v in ipairs(ticklist) do
                                if notest >= v then
                                    dingwei = i
                                end
                            end
                            B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                                string.match(key_list[marklist[dingwei]],
                                    "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                            zhuanweikey = '/' .. B4
                        end
                        if zhuanwei == 5 then
                            for i, v in ipairs(ticklist) do
                                if notest >= v then
                                    dingwei = i
                                end
                            end
                            B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                                string.match(key_list[marklist[dingwei]],
                                    "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                            zhuanweikey = '/' .. B5
                        end
                        if zhuanwei == 6 then
                            for i, v in ipairs(ticklist) do
                                if notest >= v then
                                    dingwei = i
                                end
                            end
                            B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                                string.match(key_list[marklist[dingwei]],
                                    "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                            zhuanweikey = '/' .. B6
                        end
                        if zhuanwei == 7 then
                            for i, v in ipairs(ticklist) do
                                if notest >= v then
                                    dingwei = i
                                end
                            end
                            B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                                string.match(key_list[marklist[dingwei]],
                                    "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                            zhuanweikey = '/' .. B7
                        end
                        if zhuanwei == 8 then
                            for i, v in ipairs(ticklist) do
                                if notest >= v then
                                    dingwei = i
                                end
                            end
                            B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                                string.match(key_list[marklist[dingwei]],
                                    "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                            zhuanweikey = '/' .. B8
                        end
                        if zhuanwei == 9 then
                            for i, v in ipairs(ticklist) do
                                if notest >= v then
                                    dingwei = i
                                end
                            end
                            B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                                string.match(key_list[marklist[dingwei]],
                                    "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                            zhuanweikey = '/' .. B9
                        end
                        if zhuanwei == 10 then
                            for i, v in ipairs(ticklist) do
                                if notest >= v then
                                    dingwei = i
                                end
                            end
                            B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                                string.match(key_list[marklist[dingwei]],
                                    "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                            zhuanweikey = '/' .. B10
                        end
                        if zhuanwei == 11 then
                            for i, v in ipairs(ticklist) do
                                if notest >= v then
                                    dingwei = i
                                end
                            end
                            B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                                string.match(key_list[marklist[dingwei]],
                                    "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                            zhuanweikey = '/' .. B11
                        end
                    end

                    low = notepitch[1]
                    if low ~= nil then
                        low = low % 12
                    end
                    if low == zhuanwei then
                        num = reaper.GetCursorPositionEx(0)
                        num_new = reaper.MIDI_GetProjTimeFromPPQPos(take, tempst)
                        move = num_new - num
                        hahahaha, measures, cml, fullbeats, cdenom = reaper.TimeMap2_timeToBeats(0, num_new)
                        measures = measures + 1
                        reaper.ShowMessageBox('转位音等于根音 在第 ' .. measures ..
                                                  ' 小节，请删除转位音以后重新运行脚本！', '出错啦!', 0)
                        reaper.MoveEditCursor(move, false)
                        break
                    end
                    if low == 0 then
                        for i, v in ipairs(ticklist) do
                            if notest >= v then
                                dingwei = i
                            end
                        end
                        B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                            string.match(key_list[marklist[dingwei]],
                                "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                        chordkey = B0
                    end
                    if low == 1 then
                        for i, v in ipairs(ticklist) do
                            if notest >= v then
                                dingwei = i
                            end
                        end
                        B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                            string.match(key_list[marklist[dingwei]],
                                "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                        chordkey = B1
                    end
                    if low == 2 then
                        for i, v in ipairs(ticklist) do
                            if notest >= v then
                                dingwei = i
                            end
                        end
                        B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                            string.match(key_list[marklist[dingwei]],
                                "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                        chordkey = B2
                    end
                    if low == 3 then
                        for i, v in ipairs(ticklist) do
                            if notest >= v then
                                dingwei = i
                            end
                        end
                        B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                            string.match(key_list[marklist[dingwei]],
                                "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                        chordkey = B3
                    end
                    if low == 4 then
                        for i, v in ipairs(ticklist) do
                            if notest >= v then
                                dingwei = i
                            end
                        end
                        B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                            string.match(key_list[marklist[dingwei]],
                                "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                        chordkey = B4
                    end
                    if low == 5 then
                        for i, v in ipairs(ticklist) do
                            if notest >= v then
                                dingwei = i
                            end
                        end
                        B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                            string.match(key_list[marklist[dingwei]],
                                "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                        chordkey = B5
                    end
                    if low == 6 then
                        for i, v in ipairs(ticklist) do
                            if notest >= v then
                                dingwei = i
                            end
                        end
                        B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                            string.match(key_list[marklist[dingwei]],
                                "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                        chordkey = B6
                    end
                    if low == 7 then
                        for i, v in ipairs(ticklist) do
                            if notest >= v then
                                dingwei = i
                            end
                        end
                        B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                            string.match(key_list[marklist[dingwei]],
                                "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                        chordkey = B7
                    end
                    if low == 8 then
                        for i, v in ipairs(ticklist) do
                            if notest >= v then
                                dingwei = i
                            end
                        end
                        B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                            string.match(key_list[marklist[dingwei]],
                                "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                        chordkey = B8
                    end
                    if low == 9 then
                        for i, v in ipairs(ticklist) do
                            if notest >= v then
                                dingwei = i
                            end
                        end
                        B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                            string.match(key_list[marklist[dingwei]],
                                "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                        chordkey = B9
                    end
                    if low == 10 then
                        for i, v in ipairs(ticklist) do
                            if notest >= v then
                                dingwei = i
                            end
                        end
                        B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                            string.match(key_list[marklist[dingwei]],
                                "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                        chordkey = B10
                    end
                    if low == 11 then
                        for i, v in ipairs(ticklist) do
                            if notest >= v then
                                dingwei = i
                            end
                        end
                        B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11 =
                            string.match(key_list[marklist[dingwei]],
                                "(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?),(..?.?.?)")
                        chordkey = B11
                    end
                    -- quedinggenyin
                    while ii ~= #notepitch do
                        chordnum = chordnum + (notepitch[ii + 1] - notepitch[ii]) * (10 ^ ii)
                        ii = ii + 1
                    end -- while end   
                    ii = 1
                    chord = chordtype[chordnum]

                    if chord == nil then
                        num = reaper.GetCursorPositionEx(0)
                        num_new = reaper.MIDI_GetProjTimeFromPPQPos(take, tempst)
                        move = num_new - num
                        hahahaha, measures, cml, fullbeats, cdenom = reaper.TimeMap2_timeToBeats(0, num_new)
                        measures = measures + 1
                        reaper.ShowMessageBox('有无法识别的和弦排列在第 ' .. measures ..
                                                  ' 小节，请修正以后重新运行脚本！', '出错啦!', 0)
                        reaper.MoveEditCursor(move, false) -- move cursor
                        break
                    end

                    if notest ~= nil then
                        reaper.MIDI_InsertTextSysexEvt(take, false, false, notest, 5, chordkey .. chord .. zhuanweikey)
                        -- reaper.MIDI_InsertTextSysexEvt(take, false, false, notest, 5, chordnum)
                    end -- insert end
                end -- #notepitch > 1

                zhuanweikey = ''
                chordnum = 0
                notepitch = {}
                notepitch[1] = pitch
                tempst = startppqpos
                i = 2
            end

            noteidx = noteidx + 1

            if noteidx > notecnt then
                reaper.TrackCtl_SetToolTip('         恭喜！\n和弦标记全部写入！', 500, 400, true)
            end

        end -- while end
    end -- ticklist end

    reaper.MIDI_Sort(take)
    reaper.MIDIEditor_OnCommand(editor, 40370)
    reaper.SN_FocusMIDIEditor()

end -- chordtolyrics_series
-----------------------------------------------------------------
function LyricsToNote()

    local editor = reaper.MIDIEditor_GetActive()
    local take = reaper.MIDIEditor_GetTake(editor)
    roottb = {}
    roottb['C'] = 60
    roottb['C#'] = 61
    roottb['Db'] = 61
    roottb['D'] = 62
    roottb['D#'] = 63
    roottb['Eb'] = 63
    roottb['E'] = 64
    roottb['F'] = 53
    roottb['F#'] = 54
    roottb['Gb'] = 54
    roottb['G'] = 55
    roottb['G#'] = 56
    roottb['Ab'] = 56
    roottb['A'] = 57
    roottb['A#'] = 58
    roottb['Bb'] = 58
    roottb['B'] = 59

    zhuanweitb = {}
    zhuanweitb['C'] = 36
    zhuanweitb['C#'] = 37
    zhuanweitb['Db'] = 37
    zhuanweitb['D'] = 38
    zhuanweitb['D#'] = 39
    zhuanweitb['Eb'] = 39
    zhuanweitb['E'] = 40
    zhuanweitb['F'] = 41
    zhuanweitb['F#'] = 42
    zhuanweitb['Gb'] = 42
    zhuanweitb['G'] = 43
    zhuanweitb['G#'] = 44
    zhuanweitb['Ab'] = 44
    zhuanweitb['A'] = 45
    zhuanweitb['A#'] = 46
    zhuanweitb['Bb'] = 46
    zhuanweitb['B'] = 47

    message = ''
    reaper.MIDIEditor_OnCommand(editor, 40003) -- select all note
    reaper.MIDIEditor_OnCommand(editor, 40002) -- delete note
    reaper.MIDI_DisableSort(take)
    idx = 0
    retval, selected, muted, ppqpos, txt_type, chord_txt = reaper.MIDI_GetTextSysexEvt(take, idx, true, false, 0, 5, '')
    repeat
        tb_note = {}
        if retval and txt_type == 5 then
            chord_txt = string.gsub(chord_txt, '%s', '')
            zhuanwei_sub = string.match(chord_txt, '%/%S+')
            if zhuanwei_sub ~= nil then
                zhuanwei = string.gsub(zhuanwei_sub, '%/', '')
                chord_new = string.gsub(chord_txt, zhuanwei_sub, '')
                if zhuanweitb[zhuanwei] ~= nil then
                    reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos + 240, 0, zhuanweitb[zhuanwei], 100, false)
                else
                    ProjTime = reaper.MIDI_GetProjTimeFromPPQPos(take, ppqpos)
                    hahahaha, measures, cml, fullbeats, cdenom = reaper.TimeMap2_timeToBeats(0, ProjTime)
                    measures = measures + 1
                    message = message .. '有无法识别的和弦符号 ' .. chord_txt .. ' 在第 ' .. measures .. ' 小节！\n'
                end
            else
                chord_new = chord_txt
            end
            root1 = string.sub(chord_new, 1, 1)
            root2 = string.sub(chord_new, 2, 2)
            if root2 == 'b' or root2 == '#' then
                root = root1 .. root2
                chord_type = string.sub(chord_new, 3)
            else
                root = root1
                chord_type = string.sub(chord_new, 2)
            end
            if roottb[root] ~= nil and chord[chord_type] ~= nil then
                reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos + 240, 0, roottb[root], 100, false)

                note1, note2, note3, note4, note5, note6 = string.match(chord[chord_type], "(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)")
                if note1 ~= '0' then
                    table.insert(tb_note, tonumber(note1))
                end
                if note2 ~= '0' then
                    table.insert(tb_note, tonumber(note2))
                end
                if note3 ~= '0' then
                    table.insert(tb_note, tonumber(note3))
                end
                if note4 ~= '0' then
                    table.insert(tb_note, tonumber(note4))
                end
                if note5 ~= '0' then
                    table.insert(tb_note, tonumber(note5))
                end
                if note6 ~= '0' then
                    table.insert(tb_note, tonumber(note6))
                end
                for i, v in ipairs(tb_note) do
                    reaper.MIDI_InsertNote(take, false, false, ppqpos, ppqpos + 240, 0, roottb[root] + v, 100, false)
                end -- for end
            else
                ProjTime = reaper.MIDI_GetProjTimeFromPPQPos(take, ppqpos)
                hahahaha, measures, cml, fullbeats, cdenom = reaper.TimeMap2_timeToBeats(0, ProjTime)
                measures = measures + 1

                message = message .. '有无法识别的和弦符号 ' .. chord_txt .. ' 在第 ' .. measures .. ' 小节！\n'
            end
        end

        idx = idx + 1

        retval, selected, muted, ppqpos, txt_type, chord_txt = reaper.MIDI_GetTextSysexEvt(take, idx, true, false, 0, 5, '')

    until retval == false

    reaper.MIDI_Sort(take)
    reaper.TrackCtl_SetToolTip('          提示！\n全部和弦音符已写入！', 500, 400, true)
    if message ~= '' then
        reaper.MB(message, '提示！', 0)
    end

end -- LyricsToNote
-----------------------------------------------------------

function LyricsToChordTrack()
    reaper.Undo_BeginBlock()
    editor = reaper.MIDIEditor_GetActive()
    take = reaper.MIDIEditor_GetTake(editor)
    tb_pos = {}
    tb_len = {}
    tbchord = {}

    retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
    if textsyxevtcnt == 0 then
        return
    end
    idx = 0
    tempend = 0
    repeat
        retval, selected, muted, ppqpos_p, t_type, msg = reaper.MIDI_GetTextSysexEvt(take, idx, NULL, NULL, -1, 5, '')
        idx = idx + 1
    until t_type == 5 or idx >= textsyxevtcnt - 1 -- first 
    pos_p = reaper.MIDI_GetProjTimeFromPPQPos(take, ppqpos_p)
    table.insert(tb_pos, pos_p)
    table.insert(tbchord, msg)
    while idx < textsyxevtcnt do
        retval, selected, muted, ppqpos, t_type, msg = reaper.MIDI_GetTextSysexEvt(take, idx, NULL, NULL, -1, 5, '')
        if t_type == 5 then
            pos = reaper.MIDI_GetProjTimeFromPPQPos(take, ppqpos)
            table.insert(tb_pos, pos)
            table.insert(tbchord, msg)
            table.insert(tb_len, (pos - pos_p))
            pos_p = pos
        end
        idx = idx + 1
    end
    endofmeasure = reaper.MIDI_GetPPQPos_EndOfMeasure(take, ppqpos + 1)
    endpos = reaper.MIDI_GetProjTimeFromPPQPos(take, endofmeasure)
    endchordlen = endpos - pos
    table.insert(tb_len, endchordlen)

    reaper.PreventUIRefresh(1)

    track_old = reaper.GetMediaItemTake_Track(take)
    TRnumber = reaper.GetMediaTrackInfo_Value(track_old, 'IP_TRACKNUMBER')
    reaper.InsertTrackAtIndex(TRnumber, false)
    track = reaper.GetTrack(0, TRnumber)
    retval, trackname = reaper.GetSetMediaTrackInfo_String(track_old, 'P_NAME', '', false)
    retval, trackname = reaper.GetSetMediaTrackInfo_String(track, 'P_NAME', trackname .. '_Preview', true)
    boolean = reaper.SetMediaTrackInfo_Value(track, 'I_HEIGHTOVERRIDE', 100)
    reaper.SetOnlyTrackSelected(track)

    i = 1
    while i <= #tb_pos do
        item = reaper.AddMediaItemToTrack(track)
        retval, state = reaper.GetItemStateChunk(item, '', false)
        state = string.gsub(state, 'POSITION 0', 'POSITION ' .. tb_pos[i])
        state = string.gsub(state, 'LENGTH 0', 'LENGTH ' .. tb_len[i])
        state = string.gsub(state, 'LOOP 1', 'LOOP 0 \n<NOTES\n|' .. tbchord[i] .. '\n>\n' .. 'IMGRESOURCEFLAGS 3')
        -- reaper.ShowConsoleMsg(state)
        reaper.SetItemStateChunk(item, state, false)
        i = i + 1
    end

    reaper.PreventUIRefresh(-1)

    retval, isFloatingDocker = reaper.DockIsChildOfDock(editor)
    reaper.MIDIEditor_OnCommand(editor, 40794)
    reaper.Main_OnCommand(40421, 0)
    reaper.Main_OnCommand(40705, 0)

    reaper.Undo_EndBlock('', 0)

end -- LyricsToChordTrack
--------------------------------------------------------

function LyricsToregion()
    reaper.Undo_BeginBlock()
    editor = reaper.MIDIEditor_GetActive()
    take = reaper.MIDIEditor_GetTake(editor)
    tb_pos = {}
    tb_end = {}
    tbchord = {}

    retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
    if textsyxevtcnt == 0 then
        return
    end
    idx = 0
    tempend = 0
    repeat
        retval, selected, muted, ppqpos_p, t_type, msg = reaper.MIDI_GetTextSysexEvt(take, idx, NULL, NULL, -1, 5, '')
        idx = idx + 1
    until t_type == 5 or idx >= textsyxevtcnt - 1 -- first 
    pos_p = reaper.MIDI_GetProjTimeFromPPQPos(take, ppqpos_p)
    table.insert(tb_pos, pos_p)
    table.insert(tbchord, msg)
    while idx < textsyxevtcnt do
        retval, selected, muted, ppqpos, t_type, msg = reaper.MIDI_GetTextSysexEvt(take, idx, NULL, NULL, -1, 5, '')
        if t_type == 5 then
            pos = reaper.MIDI_GetProjTimeFromPPQPos(take, ppqpos)
            table.insert(tb_pos, pos)
            table.insert(tbchord, msg)
            table.insert(tb_end, pos)
            pos_p = pos
        end
        idx = idx + 1
    end
    endofmeasure = reaper.MIDI_GetPPQPos_EndOfMeasure(take, ppqpos + 1)
    endpos = reaper.MIDI_GetProjTimeFromPPQPos(take, endofmeasure)
    table.insert(tb_end, endpos)

    reaper.Main_OnCommand(reaper.NamedCommandLookup('_SWSMARKERLIST10'), 0)
    reaper.PreventUIRefresh(1)

    i = 1
    while i <= #tb_pos do
        reaper.AddProjectMarker(0, true, tb_pos[i], tb_end[i], tbchord[i], -1)
        i = i + 1
    end

    reaper.PreventUIRefresh(-1)

    reaper.Undo_EndBlock('', 0)
end -- Lyrics To region
-----------------------------------------------------------
function Audition()
    reaper.Main_OnCommand(reaper.NamedCommandLookup('_BR_SAVE_SOLO_MUTE_ALL_TRACKS_SLOT_1'), 0)
    reaper.Main_OnCommand(40340, 0) -- unsolo all track
    local editor = reaper.MIDIEditor_GetActive()
    local take = reaper.MIDIEditor_GetTake(editor)

    integer = reaper.MIDI_EnumSelNotes(take, -1)
    if integer ~= -1 then
        if piano_mode == false then
            retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
            if pitch < 48 then
                pitch = (pitch % 12) + 48
            end

            reaper.StuffMIDIMessage(0, 144, pitch, vel)

            if chord[leixing] ~= nil then
                note1, note2, note3, note4, note5, note6 = string.match(chord[leixing], "(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)")
                if note1 ~= '0' then
                    local yanchi = os.clock()
                    while os.clock() - yanchi < 0.07 do
                    end
                    reaper.StuffMIDIMessage(0, 144, pitch + note1, vel)
                end
                if note2 ~= '0' then
                    local yanchi = os.clock()
                    while os.clock() - yanchi < 0.07 do
                    end
                    reaper.StuffMIDIMessage(0, 144, pitch + note2, vel)
                end
                if note3 ~= '0' then
                    local yanchi = os.clock()
                    while os.clock() - yanchi < 0.07 do
                    end
                    reaper.StuffMIDIMessage(0, 144, pitch + note3, vel)
                end
                if note4 ~= '0' then
                    local yanchi = os.clock()
                    while os.clock() - yanchi < 0.07 do
                    end
                    reaper.StuffMIDIMessage(0, 144, pitch + note4, vel)
                end
                if note5 ~= '0' then
                    local yanchi = os.clock()
                    while os.clock() - yanchi < 0.07 do
                    end
                    reaper.StuffMIDIMessage(0, 144, pitch + note5, vel)
                end
                if note6 ~= '0' then
                    local yanchi = os.clock()
                    while os.clock() - yanchi < 0.07 do
                    end
                    reaper.StuffMIDIMessage(0, 144, pitch + note6, vel)
                end
                local yanchi = os.clock()
                while os.clock() - yanchi < 0.3 do
                end
                reaper.StuffMIDIMessage(0, 128, pitch, 0)
                if note1 ~= '0' then
                    reaper.StuffMIDIMessage(0, 128, pitch + note1, 0)
                end
                if note2 ~= '0' then
                    reaper.StuffMIDIMessage(0, 128, pitch + note2, 0)
                end
                if note3 ~= '0' then
                    reaper.StuffMIDIMessage(0, 128, pitch + note3, 0)
                end
                if note4 ~= '0' then
                    reaper.StuffMIDIMessage(0, 128, pitch + note4, 0)
                end
                if note5 ~= '0' then
                    reaper.StuffMIDIMessage(0, 128, pitch + note5, 0)
                end
                if note6 ~= '0' then
                    reaper.StuffMIDIMessage(0, 128, pitch + note6, 0)
                end
                reaper.Main_OnCommand(reaper.NamedCommandLookup('_BR_RESTORE_SOLO_MUTE_ALL_TRACKS_SLOT_1'), 0)
            end
        else
            key = {}
            key[0] = 'C'
            key[1] = 'C#'
            key[2] = 'D'
            key[3] = 'Eb'
            key[4] = 'E'
            key[5] = 'F'
            key[6] = 'F#'
            key[7] = 'G'
            key[8] = 'Ab'
            key[9] = 'A'
            key[10] = 'Bb'
            key[11] = 'B'
            retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, integer)
            pitch_key = pitch % 12
            pitch_key = key[pitch_key] .. leixing
            notetb = piano_list[pitch_key]
            n1, n2, n3, n4, n5, n6, n7 = string.match(notetb, "(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)")
            if n1 ~= '0' then
                local yanchi = os.clock()
                while os.clock() - yanchi < 0.07 do
                end
                reaper.StuffMIDIMessage(0, 144, n1, vel)
            end
            if n2 ~= '0' then
                local yanchi = os.clock()
                while os.clock() - yanchi < 0.07 do
                end
                reaper.StuffMIDIMessage(0, 144, n2, vel)
            end
            if n3 ~= '0' then
                local yanchi = os.clock()
                while os.clock() - yanchi < 0.07 do
                end
                reaper.StuffMIDIMessage(0, 144, n3, vel)
            end
            if n4 ~= '0' then
                local yanchi = os.clock()
                while os.clock() - yanchi < 0.07 do
                end
                reaper.StuffMIDIMessage(0, 144, n4, vel)
            end
            if n5 ~= '0' then
                local yanchi = os.clock()
                while os.clock() - yanchi < 0.07 do
                end
                reaper.StuffMIDIMessage(0, 144, n5, vel)
            end
            if n6 ~= '0' then
                local yanchi = os.clock()
                while os.clock() - yanchi < 0.07 do
                end
                reaper.StuffMIDIMessage(0, 144, n6, vel)
            end
            if n7 ~= '0' then
                local yanchi = os.clock()
                while os.clock() - yanchi < 0.07 do
                end
                reaper.StuffMIDIMessage(0, 144, n7, vel)
            end

            local yanchi = os.clock()
            while os.clock() - yanchi < 0.3 do
            end
            if n1 ~= '0' then
                reaper.StuffMIDIMessage(0, 128, n1, 0)
            end
            if n2 ~= '0' then
                reaper.StuffMIDIMessage(0, 128, n2, 0)
            end
            if n3 ~= '0' then
                reaper.StuffMIDIMessage(0, 128, n3, 0)
            end
            if n4 ~= '0' then
                reaper.StuffMIDIMessage(0, 128, n4, 0)
            end
            if n5 ~= '0' then
                reaper.StuffMIDIMessage(0, 128, n5, 0)
            end
            if n6 ~= '0' then
                reaper.StuffMIDIMessage(0, 128, n6, 0)
            end
            if n7 ~= '0' then
                reaper.StuffMIDIMessage(0, 128, n7, 0)
            end
            reaper.Main_OnCommand(reaper.NamedCommandLookup('_BR_RESTORE_SOLO_MUTE_ALL_TRACKS_SLOT_1'), 0)
        end
    end
end -- function end
----------------------------------------------------
function recst()
    editor = reaper.MIDIEditor_GetActive()
    take = reaper.MIDIEditor_GetTake(editor)
    TK = reaper.GetMediaItemTake_Track(take)

    reaper.Main_OnCommand(40491, 0) -- all rec off
    retval = reaper.SetMediaTrackInfo_Value(TK, 'I_RECARM', 1)
    retval, str = reaper.GetTrackStateChunk(TK, '', false)
    oldrec = string.match(str, 'REC%s%d+%s%d+%s%d+%s%d+%s%d+%s%d+%s%d+')
    if oldrec ~= 'REC 1 5088 1 0 0 0 0' then
        str = string.gsub(str, oldrec, 'REC 1 5088 1 0 0 0 0')
        ok = reaper.SetTrackStateChunk(TK, str, false)
        reaper.TrackCtl_SetToolTip('              提示！\n当前轨道录音监听已打开，全部MIDI输入全部通道！', 50, 0,
            true)
    end
end -- recst end
recst()

local ctx = reaper.ImGui_CreateContext('Chord Tools')
local size = reaper.GetAppVersion():match('OSX') and 12 or 14
local font = reaper.ImGui_CreateFont('sans-serif', 14)
reaper.ImGui_Attach(ctx, font)
is_new_value, filename, sectionID, cmdID, mode, resolution, val = reaper.get_action_context()
filename = string.gsub(filename, 'Chord Tools.lua', 'keyboard.jpg')
filename = string.gsub(filename, '\\', '\\\\')
img = reaper.ImGui_CreateImage(filename)

x, y = reaper.GetMousePosition()
x, y = reaper.ImGui_PointConvertNative(ctx, x, y)
-- reaper.ImGui_SetNextWindowSize(ctx, 385, 340)
reaper.ImGui_SetNextWindowPos(ctx, x, y)
windows_flag = reaper.ImGui_WindowFlags_AlwaysAutoResize()
windows_flag = windows_flag | reaper.ImGui_WindowFlags_NoCollapse()
flag = true
function loop()
    reaper.ImGui_PushFont(ctx, font)
    local visible, open = reaper.ImGui_Begin(ctx, 'Chord Tools ~ Right mouse button audition', true, windows_flag)
    if visible then
        retval, piano_mode = reaper.ImGui_Checkbox(ctx, 'keyboard Mode', piano_mode)
        if piano_mode then
            tint_col_rgba = 0xFFFFFFFF
        else
            tint_col_rgba = 0x6969695F
        end
        reaper.ImGui_SameLine(ctx)
        reaper.ImGui_Image(ctx, img, 200, 20, 0.0, 0.0, 1.0, 1.0, tint_col_rgba, 0x00000000)

        if reaper.ImGui_Button(ctx, "Maj") then
            leixing = 'M'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'M'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "Min") then
            leixing = 'm'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'm'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "sus4") then
            leixing = 'sus4'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'sus4'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "sus2") then
            leixing = 'sus2'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'sus2'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "dim") then
            leixing = 'dim'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'dim'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "Aug") then
            leixing = 'aug'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'aug'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, " 6 ") then
            leixing = '6'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '6'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, " m6 ") then
            leixing = 'm6'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'm6'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "69") then
            leixing = '69'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '69'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "6sus4") then
            leixing = '6sus4'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '6sus4'
            Audition()
        end
        if reaper.ImGui_Button(ctx, "m6add9") then
            leixing = 'm6add9'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'm6add9'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "add9") then
            leixing = 'add9'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'add9'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "madd9") then
            leixing = 'madd9'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'madd9'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "-5") then
            leixing = '-5'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '-5'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, " m7 ") then
            leixing = 'm7'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'm7'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, " 7 ") then
            leixing = '7'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '7'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, " M7 ") then
            leixing = 'M7'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'M7'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "dim7") then
            leixing = 'dim7'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'dim7'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "mM7") then
            leixing = 'mM7'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'mM7'
            Audition()
        end
        if reaper.ImGui_Button(ctx, " 7b5 ") then
            leixing = '7b5'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '7b5'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, " 7#5") then
            leixing = '7#5'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '7#5'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "m7b5") then
            leixing = 'm7b5'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'm7b5'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "7sus4") then
            leixing = '7sus4'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '7sus4'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "M7sus4") then
            leixing = 'M7sus4'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'M7sus4'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "7sus2") then
            leixing = '7sus2'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '7sus2'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "M7#5") then
            leixing = 'M7#5'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'M7#5'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "Aug7") then
            leixing = 'Aug7'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'Aug7'
            Audition()
        end
        if reaper.ImGui_Button(ctx, "7#9") then
            leixing = '7#9'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '7#9'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "7b9") then
            leixing = '7b9'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '7b9'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "M7b5") then
            leixing = 'M7b5'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'M7b5'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "m7b9") then
            leixing = 'm7b9'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'm7b9'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "7sus4b9") then
            leixing = '7sus4b9'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '7sus4b9'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "7#5#9") then
            leixing = '7#5#9'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '7#5#9'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "7#5b9") then
            leixing = '7#5b9'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '7#5b9'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "7#11") then
            leixing = '7#11'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '7#11'
            Audition()
        end
        if reaper.ImGui_Button(ctx, " 7add11 ") then
            leixing = '7add11'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '7add11'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, " 7add13 ") then
            leixing = '7add13'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '7add13'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, " 7b5#9 ") then
            leixing = '7b5#9'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '7b5#9'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, " 7b5b9 ") then
            leixing = '7b5b9'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '7b5b9'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, " M7#11 ") then
            leixing = 'M7#11'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'M7#11'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "M7add13") then
            leixing = 'M7add13'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'M7add13'
            Audition()
        end
        if reaper.ImGui_Button(ctx, "m7add11") then
            leixing = 'm7add11'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'm7add11'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "m7add13") then
            leixing = 'm7add13'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'm7add13'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, " 9 ") then
            leixing = '9'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '9'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, " m9 ") then
            leixing = 'm9'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'm9'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, " M9 ") then
            leixing = 'M9'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'M9'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "9#11") then
            leixing = '9#11'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '9#11'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "9#5") then
            leixing = '9#5'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '9#5'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "9b13") then
            leixing = '9b13'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '9b13'
            Audition()
        end
        if reaper.ImGui_Button(ctx, "9b5") then
            leixing = '9b5'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '9b5'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "9sus4") then
            leixing = '9sus4'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '9sus4'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "M9#11") then
            leixing = 'M9#11'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'M9#11'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "M9#5") then
            leixing = 'M9#5'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'M9#5'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "M9sus4") then
            leixing = 'M9sus4'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'M9sus4'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "m9b5") then
            leixing = 'm9b5'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'm9b5'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, " 11 ") then
            leixing = '11'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '11'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "M11") then
            leixing = 'M11'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'M11'
            Audition()
        end
        if reaper.ImGui_Button(ctx, " m11 ") then
            leixing = 'm11'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'm11'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, " 11b9 ") then
            leixing = '11b9'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '11b9'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, " 13 ") then
            leixing = '13'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '13'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, " M13 ") then
            leixing = 'M13'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'M13'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, " m13 ") then
            leixing = 'm13'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'm13'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "13#9") then
            leixing = '13#9'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '13#9'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "13b9") then
            leixing = '13b9'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '13b9'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "13b5b9") then
            leixing = '13b5b9'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = '13b5b9'
            Audition()
        end
        if reaper.ImGui_Button(ctx, "mM11") then
            leixing = 'mM11'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'mM11'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "mM13") then
            leixing = 'mM13'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'mM13'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "mM7add11") then
            leixing = 'mM7add11'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'mM7add11'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "mM7add13") then
            leixing = 'mM7add13'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'mM7add13'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "mM9") then
            leixing = 'mM9'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'mM9'
            Audition()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "sus4add9") then
            leixing = 'sus4add9'
            chordin()
            flag = false
        end
        if reaper.ImGui_IsItemClicked(ctx, reaper.ImGui_MouseButton_Right()) then
            leixing = 'sus4add9'
            Audition()
        end
        reaper.ImGui_PushStyleColor(ctx, reaper.ImGui_Col_Button(), 0x9400D36F)
        reaper.ImGui_PushStyleColor(ctx, reaper.ImGui_Col_ButtonHovered(), 0x9400D3DF)
        reaper.ImGui_PushStyleColor(ctx, reaper.ImGui_Col_ButtonActive(), 0xFF00FFFF)

        if reaper.ImGui_Button(ctx, "Chord Note To Lyrics") then
            chordtolyrics()
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "Chord Note Series To Lyrics") then
            chordtolyrics_series()
            flag = false
        end

        if reaper.ImGui_Button(ctx, "Lyrics To Track") then
            LyricsToChordTrack()
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "Lyrics To region") then
            LyricsToregion()
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "Lyrics To Note") then
            LyricsToNote()
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, "Help") then
            reaper.MB(help, 'Help', 0)
        end
        reaper.ImGui_PopStyleColor(ctx, 3)

        retval = reaper.ImGui_IsKeyPressed(ctx, 27, nil)
        if retval then
            flag = false
        end

        editor = reaper.MIDIEditor_GetActive()
        if not editor then
            flag = false
        end

        reaper.ImGui_End(ctx)
    end
    reaper.ImGui_PopFont(ctx)

    if open and flag then
        reaper.defer(loop)
    else
        if piano_mode then
            piano_mode = 'true'
        else
            piano_mode = 'false'
        end
        reaper.SetExtState('Chord Tools', 'piano mode', piano_mode, true)
        reaper.SN_FocusMIDIEditor()
    end
end

reaper.defer(loop)

