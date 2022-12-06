--[[
 * ReaScript Name: 显示MIDI模板信息
 * Version: 1.0.4
 * Author: YS
--]]

--[[
 * Changelog:
 * v1.0 (2021-8-29)
  + Initial release
--]]

_, _, sectionID, ownCommandID, _, _, _ = reaper.get_action_context()
reaper.SetToggleCommandState(0, reaper.NamedCommandLookup('_RSc86451697eb9e2a4d8f6a114868b10b271c49c69'), 1)
reaper.SetToggleCommandState(32060, reaper.NamedCommandLookup('_RS7d3c_c86451697eb9e2a4d8f6a114868b10b271c49c69'), 1)
reaper.SetToggleCommandState(32061, reaper.NamedCommandLookup('_RS7d3d_c86451697eb9e2a4d8f6a114868b10b271c49c69'), 1)
reaper.RefreshToolbar2(0, reaper.NamedCommandLookup('_RSc86451697eb9e2a4d8f6a114868b10b271c49c69'))
reaper.RefreshToolbar2(32060, reaper.NamedCommandLookup('_RS7d3c_c86451697eb9e2a4d8f6a114868b10b271c49c69'))
reaper.RefreshToolbar2(32061, reaper.NamedCommandLookup('_RS7d3d_c86451697eb9e2a4d8f6a114868b10b271c49c69'))

tb_ins_bank = {}
tb_ins_bank['1,0'] = 'SC55_Piano 1'
tb_ins_bank['1,1'] = 'SC55_Piano 2'
tb_ins_bank['1,2'] = 'SC55_Piano 3'
tb_ins_bank['1,3'] = 'SC55_Honky-tonk'
tb_ins_bank['1,4'] = 'SC55_E.Piano 1'
tb_ins_bank['1,5'] = 'SC55_E.Piano 2'
tb_ins_bank['1,6'] = 'SC55_Harpsichord'
tb_ins_bank['1,7'] = 'SC55_Clav.'
tb_ins_bank['1,8'] = 'SC55_Celesta'
tb_ins_bank['1,9'] = 'SC55_Glockenspiel'
tb_ins_bank['1,10'] = 'SC55_Music Box'
tb_ins_bank['1,11'] = 'SC55_Vibraphone'
tb_ins_bank['1,12'] = 'SC55_Marimba'
tb_ins_bank['1,13'] = 'SC55_Xylophone'
tb_ins_bank['1,14'] = 'SC55_Tubular-bell'
tb_ins_bank['1,15'] = 'SC55_Santur'
tb_ins_bank['1,16'] = 'SC55_Organ 1'
tb_ins_bank['1,17'] = 'SC55_Organ 2'
tb_ins_bank['1,18'] = 'SC55_Organ 3'
tb_ins_bank['1,19'] = 'SC55_Church Org.1'
tb_ins_bank['1,20'] = 'SC55_Reed Organ'
tb_ins_bank['1,21'] = 'SC55_Accordion Fr'
tb_ins_bank['1,22'] = 'SC55_Harmonica'
tb_ins_bank['1,23'] = 'SC55_Bandoneon'
tb_ins_bank['1,24'] = 'SC55_Nylon-str.Gt'
tb_ins_bank['1,25'] = 'SC55_Steel-str.Gt'
tb_ins_bank['1,26'] = 'SC55_Jazz Gt.'
tb_ins_bank['1,27'] = 'SC55_Clean Gt.'
tb_ins_bank['1,28'] = 'SC55_Muted Gt.'
tb_ins_bank['1,29'] = 'SC55_Overdrive Gt'
tb_ins_bank['1,30'] = 'SC55_DistortionGt'
tb_ins_bank['1,31'] = 'SC55_Gt.Harmonics'
tb_ins_bank['1,32'] = 'SC55_Acoustic Bs.'
tb_ins_bank['1,33'] = 'SC55_Fingered Bs.'
tb_ins_bank['1,34'] = 'SC55_Picked Bass'
tb_ins_bank['1,35'] = 'SC55_Fretless Bs.'
tb_ins_bank['1,36'] = 'SC55_Slap Bass 1'
tb_ins_bank['1,37'] = 'SC55_Slap Bass 2'
tb_ins_bank['1,38'] = 'SC55_Synth Bass 1'
tb_ins_bank['1,39'] = 'SC55_Synth Bass 2'
tb_ins_bank['1,40'] = 'SC55_Violin'
tb_ins_bank['1,41'] = 'SC55_Viola'
tb_ins_bank['1,42'] = 'SC55_Cello'
tb_ins_bank['1,43'] = 'SC55_Contrabass'
tb_ins_bank['1,44'] = 'SC55_Tremolo Str'
tb_ins_bank['1,45'] = 'SC55_PizzicatoStr'
tb_ins_bank['1,46'] = 'SC55_Harp'
tb_ins_bank['1,47'] = 'SC55_Timpani'
tb_ins_bank['1,48'] = 'SC55_Strings'
tb_ins_bank['1,49'] = 'SC55_Slow Strings'
tb_ins_bank['1,50'] = 'SC55_Syn.Strings1'
tb_ins_bank['1,51'] = 'SC55_Syn.Strings2'
tb_ins_bank['1,52'] = 'SC55_Choir Aahs'
tb_ins_bank['1,53'] = 'SC55_Voice Oohs'
tb_ins_bank['1,54'] = 'SC55_SynVox'
tb_ins_bank['1,55'] = 'SC55_OrchestraHit'
tb_ins_bank['1,56'] = 'SC55_Trumpet'
tb_ins_bank['1,57'] = 'SC55_Trombone'
tb_ins_bank['1,58'] = 'SC55_Tuba'
tb_ins_bank['1,59'] = 'SC55_MutedTrumpet'
tb_ins_bank['1,60'] = 'SC55_French Horn'
tb_ins_bank['1,61'] = 'SC55_Brass 1'
tb_ins_bank['1,62'] = 'SC55_Synth Brass 1'
tb_ins_bank['1,63'] = 'SC55_Synth Brass 2'
tb_ins_bank['1,64'] = 'SC55_Soprano Sax'
tb_ins_bank['1,65'] = 'SC55_Alto Sax'
tb_ins_bank['1,66'] = 'SC55_Tenor Sax'
tb_ins_bank['1,67'] = 'SC55_Baritone Sax'
tb_ins_bank['1,68'] = 'SC55_Oboe'
tb_ins_bank['1,69'] = 'SC55_English Horn'
tb_ins_bank['1,70'] = 'SC55_Bassoon'
tb_ins_bank['1,71'] = 'SC55_Clarinet'
tb_ins_bank['1,72'] = 'SC55_Piccolo'
tb_ins_bank['1,73'] = 'SC55_Flute'
tb_ins_bank['1,74'] = 'SC55_Recorder'
tb_ins_bank['1,75'] = 'SC55_Pan Flute'
tb_ins_bank['1,76'] = 'SC55_Bottle Blow'
tb_ins_bank['1,77'] = 'SC55_Shakuhachi'
tb_ins_bank['1,78'] = 'SC55_Whistle'
tb_ins_bank['1,79'] = 'SC55_Ocarina'
tb_ins_bank['1,80'] = 'SC55_Square Wave'
tb_ins_bank['1,81'] = 'SC55_Saw Wave'
tb_ins_bank['1,82'] = 'SC55_Syn.Calliope'
tb_ins_bank['1,83'] = 'SC55_Chiffer Lead'
tb_ins_bank['1,84'] = 'SC55_Charang'
tb_ins_bank['1,85'] = 'SC55_Solo Vox'
tb_ins_bank['1,86'] = 'SC55_5th Saw Wave'
tb_ins_bank['1,87'] = 'SC55_Bass & Lead'
tb_ins_bank['1,88'] = 'SC55_Fantasia'
tb_ins_bank['1,89'] = 'SC55_Warm Pad'
tb_ins_bank['1,90'] = 'SC55_Polysynth'
tb_ins_bank['1,91'] = 'SC55_Space Voice'
tb_ins_bank['1,92'] = 'SC55_Bowed Glass'
tb_ins_bank['1,93'] = 'SC55_Metal Pad'
tb_ins_bank['1,94'] = 'SC55_Halo Pad'
tb_ins_bank['1,95'] = 'SC55_Sweep Pad'
tb_ins_bank['1,96'] = 'SC55_Ice Rain'
tb_ins_bank['1,97'] = 'SC55_Soundtrack'
tb_ins_bank['1,98'] = 'SC55_Crystal'
tb_ins_bank['1,99'] = 'SC55_Atmosphere'
tb_ins_bank['1,100'] = 'SC55_Brightness'
tb_ins_bank['1,101'] = 'SC55_Goblin'
tb_ins_bank['1,102'] = 'SC55_Echo Drops'
tb_ins_bank['1,103'] = 'SC55_Star Theme'
tb_ins_bank['1,104'] = 'SC55_Sitar'
tb_ins_bank['1,105'] = 'SC55_Banjo'
tb_ins_bank['1,106'] = 'SC55_Shamisen'
tb_ins_bank['1,107'] = 'SC55_Koto'
tb_ins_bank['1,108'] = 'SC55_Kalimba'
tb_ins_bank['1,109'] = 'SC55_Bag Pipe'
tb_ins_bank['1,110'] = 'SC55_Fiddle'
tb_ins_bank['1,111'] = 'SC55_Shanai'
tb_ins_bank['1,112'] = 'SC55_Tinkle Bell'
tb_ins_bank['1,113'] = 'SC55_Agogo'
tb_ins_bank['1,114'] = 'SC55_Steel Drums'
tb_ins_bank['1,115'] = 'SC55_Woodblock'
tb_ins_bank['1,116'] = 'SC55_Taiko'
tb_ins_bank['1,117'] = 'SC55_Melo. Tom 1'
tb_ins_bank['1,118'] = 'SC55_Synth Drum'
tb_ins_bank['1,119'] = 'SC55_Reverse Cym.'
tb_ins_bank['1,120'] = 'SC55_Gt.FretNoise'
tb_ins_bank['1,121'] = 'SC55_Breath Noise'
tb_ins_bank['1,122'] = 'SC55_Seashore'
tb_ins_bank['1,123'] = 'SC55_Bird'
tb_ins_bank['1,124'] = 'SC55_Telephone 1'
tb_ins_bank['1,125'] = 'SC55_Helicopter'
tb_ins_bank['1,126'] = 'SC55_Applause'
tb_ins_bank['1,127'] = 'SC55_Gun Shot'
tb_ins_bank['898,81'] = 'SC88_LA Saw'
tb_ins_bank['898,98'] = 'SC88_ChristmasBel'
tb_ins_bank['898,124'] = 'SC88_Scratch 2'
tb_ins_bank['898,125'] = 'SC88_Jetplane'
tb_ins_bank['770,80'] = 'SC88_LM Square'
tb_ins_bank['770,81'] = 'SC88_GR-300'
tb_ins_bank['770,98'] = 'SC88_Clear Bells'
tb_ins_bank['770,99'] = 'SC88_Ambient Pad'
tb_ins_bank['770,102'] = 'SC88_Water Piano'
tb_ins_bank['770,120'] = 'SC88_Pick Scrape'
tb_ins_bank['770,125'] = 'SC88_Train'
tb_ins_bank['770,126'] = 'SC88_Applause 2'
tb_ins_bank['642,35'] = 'SC88_Mr.Smooth'
tb_ins_bank['642,80'] = 'SC88_Shmoog'
tb_ins_bank['642,81'] = 'SC88_Velo Lead'
tb_ins_bank['642,98'] = 'SC88_GlockenChime'
tb_ins_bank['642,99'] = 'SC88_Nylon+Rhodes'
tb_ins_bank['642,102'] = 'SC88_Reso Panner'
tb_ins_bank['642,120'] = 'SC88_Bass Slide'
tb_ins_bank['642,122'] = 'SC88_Bubble'
tb_ins_bank['642,123'] = 'SC88_Growl'
tb_ins_bank['642,124'] = 'SC88_Wind Chimes'
tb_ins_bank['642,125'] = 'SC88_Siren'
tb_ins_bank['642,126'] = 'SC88_Footsteps'
tb_ins_bank['514,35'] = 'SC88_Syn Fretless'
tb_ins_bank['514,80'] = 'SC88_CC Solo'
tb_ins_bank['514,81'] = 'SC88_Big Lead'
tb_ins_bank['514,89'] = 'SC88_Soft Pad'
tb_ins_bank['514,98'] = 'SC88_Loud Glock'
tb_ins_bank['514,99'] = 'SC88_HollowReleas'
tb_ins_bank['514,102'] = 'SC88_Big Panner'
tb_ins_bank['514,120'] = 'SC88_Dist.CutNoiz'
tb_ins_bank['514,122'] = 'SC88_Stream'
tb_ins_bank['514,123'] = 'SC88_Kitty'
tb_ins_bank['514,124'] = 'SC88_Scratch'
tb_ins_bank['514,125'] = 'SC88_Car-Crash'
tb_ins_bank['514,126'] = 'SC88_Heart Beat'
tb_ins_bank['386,35'] = 'SC88_Fretless Bs4'
tb_ins_bank['386,39'] = 'SC88_Seq Bass'
tb_ins_bank['386,80'] = 'SC88_Mellow FM'
tb_ins_bank['386,81'] = 'SC88_Feline GR'
tb_ins_bank['386,89'] = 'SC88_Rotary Strng'
tb_ins_bank['386,98'] = 'SC88_Round Glock'
tb_ins_bank['386,99'] = 'SC88_Harpvox'
tb_ins_bank['386,102'] = 'SC88_Echo Pan 2'
tb_ins_bank['386,120'] = 'SC88_Gt.CutNoise2'
tb_ins_bank['386,122'] = 'SC88_Wind'
tb_ins_bank['386,123'] = 'SC88_Bird 2'
tb_ins_bank['386,124'] = 'SC88_Door'
tb_ins_bank['386,125'] = 'SC88_Car-Pass'
tb_ins_bank['386,126'] = 'SC88_Punch'
tb_ins_bank['386,127'] = 'SC88_Explosion'
tb_ins_bank['258,2'] = 'SC88_EG+Rhodes 2'
tb_ins_bank['258,30'] = 'SC88_Dazed Guitar'
tb_ins_bank['258,33'] = 'SC88_Jazz Bass'
tb_ins_bank['258,35'] = 'SC88_Fretless Bs3'
tb_ins_bank['258,39'] = 'SC88_Modular Bass'
tb_ins_bank['258,80'] = 'SC88_Hollow Mini'
tb_ins_bank['258,81'] = 'SC88_Pulse Saw'
tb_ins_bank['258,82'] = 'SC88_Pure PanLead'
tb_ins_bank['258,87'] = 'SC88_Fat & Perky'
tb_ins_bank['258,89'] = 'SC88_Horn Pad'
tb_ins_bank['258,93'] = 'SC88_Panner Pad'
tb_ins_bank['258,96'] = 'SC88_African Wood'
tb_ins_bank['258,97'] = 'SC88_Prologue'
tb_ins_bank['258,98'] = 'SC88_Soft Crystal'
tb_ins_bank['258,99'] = 'SC88_Nylon Harp'
tb_ins_bank['258,101'] = 'SC88_50\'s Sci-Fi'
tb_ins_bank['258,102'] = 'SC88_Echo Pan'
tb_ins_bank['258,120'] = 'SC88_String Slap'
tb_ins_bank['258,122'] = 'SC88_Thunder'
tb_ins_bank['258,123'] = 'SC88_Horse-Gallop'
tb_ins_bank['258,124'] = 'SC88_DoorCreaking'
tb_ins_bank['258,125'] = 'SC88_Car-Stop'
tb_ins_bank['258,126'] = 'SC88_Screaming'
tb_ins_bank['258,127'] = 'SC88_Lasergun'
tb_ins_bank['130,2'] = 'SC88_EG+Rhodes 1'
tb_ins_bank['130,11'] = 'SC88_Hard Vibe'
tb_ins_bank['130,15'] = 'SC88_Santur 2'
tb_ins_bank['130,16'] = 'SC88_Organ 101'
tb_ins_bank['130,17'] = 'SC88_Organ 201'
tb_ins_bank['130,22'] = 'SC88_Harmonica 2'
tb_ins_bank['130,26'] = 'SC88_Mellow Gt.'
tb_ins_bank['130,28'] = 'SC88_Muted Dis.Gt'
tb_ins_bank['130,30'] = 'SC88_Dist.Gt2'
tb_ins_bank['130,33'] = 'SC88_Fingered Bs2'
tb_ins_bank['130,35'] = 'SC88_Fretless Bs2'
tb_ins_bank['130,38'] = 'SC88_Synth Bass101'
tb_ins_bank['130,39'] = 'SC88_SynthBass201'
tb_ins_bank['130,48'] = 'SC88_Strings 2'
tb_ins_bank['130,49'] = 'SC88_SlowStrings2'
tb_ins_bank['130,50'] = 'SC88_OB Strings'
tb_ins_bank['130,56'] = 'SC88_Trumpet 2'
tb_ins_bank['130,57'] = 'SC88_Trombone 2'
tb_ins_bank['130,58'] = 'SC88_Tuba 2'
tb_ins_bank['130,60'] = 'SC88_French Horn2'
tb_ins_bank['130,62'] = 'SC88_Poly Brass'
tb_ins_bank['130,63'] = 'SC88_Soft Brass'
tb_ins_bank['130,80'] = 'SC88_Square'
tb_ins_bank['130,81'] = 'SC88_Saw'
tb_ins_bank['130,82'] = 'SC88_Vent Synth'
tb_ins_bank['130,86'] = 'SC88_Big Fives'
tb_ins_bank['130,87'] = 'SC88_Big & Raw'
tb_ins_bank['130,88'] = 'SC88_Fantasia 2'
tb_ins_bank['130,89'] = 'SC88_Thick Pad'
tb_ins_bank['130,90'] = 'SC88_80\'s PolySyn'
tb_ins_bank['130,91'] = 'SC88_Heaven II'
tb_ins_bank['130,93'] = 'SC88_Tine Pad'
tb_ins_bank['130,95'] = 'SC88_Polar Pad'
tb_ins_bank['130,96'] = 'SC88_Harmo Rain'
tb_ins_bank['130,97'] = 'SC88_Ancestral'
tb_ins_bank['130,98'] = 'SC88_Syn Mallet'
tb_ins_bank['130,99'] = 'SC88_Warm Atmos'
tb_ins_bank['130,101'] = 'SC88_Goblinson'
tb_ins_bank['130,102'] = 'SC88_Echo Bell'
tb_ins_bank['130,103'] = 'SC88_Star Theme 2'
tb_ins_bank['130,104'] = 'SC88_Sitar 2'
tb_ins_bank['130,105'] = 'SC88_Muted Banjo'
tb_ins_bank['130,106'] = 'SC88_Tsugaru'
tb_ins_bank['130,111'] = 'SC88_Shannai 2'
tb_ins_bank['130,117'] = 'SC88_Real Tom'
tb_ins_bank['130,119'] = 'SC88_Reverse Cym2'
tb_ins_bank['130,120'] = 'SC88_Gt.Cut Noise'
tb_ins_bank['130,121'] = 'SC88_Fl.Key Click'
tb_ins_bank['130,122'] = 'SC88_Rain'
tb_ins_bank['130,123'] = 'SC88_Dog'
tb_ins_bank['130,124'] = 'SC88_Telephone 2'
tb_ins_bank['130,125'] = 'SC88_Car-Engine'
tb_ins_bank['130,126'] = 'SC88_Laughing'
tb_ins_bank['130,127'] = 'SC88_Machine Gun'
tb_ins_bank['2,0'] = 'SC88_Piano 1'
tb_ins_bank['2,1'] = 'SC88_Piano 2'
tb_ins_bank['2,2'] = 'SC88_Piano 3'
tb_ins_bank['2,3'] = 'SC88_Honky-tonk'
tb_ins_bank['2,4'] = 'SC88_E.Piano 1'
tb_ins_bank['2,5'] = 'SC88_E.Piano 2'
tb_ins_bank['2,6'] = 'SC88_Harpsichord'
tb_ins_bank['2,7'] = 'SC88_Clav.'
tb_ins_bank['2,8'] = 'SC88_Celesta'
tb_ins_bank['2,9'] = 'SC88_Glockenspiel'
tb_ins_bank['2,10'] = 'SC88_Music Box'
tb_ins_bank['2,11'] = 'SC88_Vibraphone'
tb_ins_bank['2,12'] = 'SC88_Marimba'
tb_ins_bank['2,13'] = 'SC88_Xylophone'
tb_ins_bank['2,14'] = 'SC88_Tubular-bell'
tb_ins_bank['2,15'] = 'SC88_Santur'
tb_ins_bank['2,16'] = 'SC88_Organ 1'
tb_ins_bank['2,17'] = 'SC88_Organ 2'
tb_ins_bank['2,18'] = 'SC88_Organ 3'
tb_ins_bank['2,19'] = 'SC88_Church Org.1'
tb_ins_bank['2,20'] = 'SC88_Reed Organ'
tb_ins_bank['2,21'] = 'SC88_Accordion Fr'
tb_ins_bank['2,22'] = 'SC88_Harmonica'
tb_ins_bank['2,23'] = 'SC88_Bandoneon'
tb_ins_bank['2,24'] = 'SC88_Nylon-str.Gt'
tb_ins_bank['2,25'] = 'SC88_Steel-str.Gt'
tb_ins_bank['2,26'] = 'SC88_Jazz Gt.'
tb_ins_bank['2,27'] = 'SC88_Clean Gt.'
tb_ins_bank['2,28'] = 'SC88_Muted Gt.'
tb_ins_bank['2,29'] = 'SC88_Overdrive Gt'
tb_ins_bank['2,30'] = 'SC88_DistortionGt'
tb_ins_bank['2,31'] = 'SC88_Gt.Harmonics'
tb_ins_bank['2,32'] = 'SC88_Acoustic Bs.'
tb_ins_bank['2,33'] = 'SC88_Fingered Bs.'
tb_ins_bank['2,34'] = 'SC88_Picked Bass'
tb_ins_bank['2,35'] = 'SC88_Fretless Bs.'
tb_ins_bank['2,36'] = 'SC88_Slap Bass 1'
tb_ins_bank['2,37'] = 'SC88_Slap Bass 2'
tb_ins_bank['2,38'] = 'SC88_Synth Bass 1'
tb_ins_bank['2,39'] = 'SC88_Synth Bass 2'
tb_ins_bank['2,40'] = 'SC88_Violin'
tb_ins_bank['2,41'] = 'SC88_Viola'
tb_ins_bank['2,42'] = 'SC88_Cello'
tb_ins_bank['2,43'] = 'SC88_Contrabass'
tb_ins_bank['2,44'] = 'SC88_Tremolo Str'
tb_ins_bank['2,45'] = 'SC88_PizzicatoStr'
tb_ins_bank['2,46'] = 'SC88_Harp'
tb_ins_bank['2,47'] = 'SC88_Timpani'
tb_ins_bank['2,48'] = 'SC88_Strings'
tb_ins_bank['2,49'] = 'SC88_Slow Strings'
tb_ins_bank['2,50'] = 'SC88_Syn.Strings1'
tb_ins_bank['2,51'] = 'SC88_Syn.Strings2'
tb_ins_bank['2,52'] = 'SC88_Choir Aahs'
tb_ins_bank['2,53'] = 'SC88_Voice Oohs'
tb_ins_bank['2,54'] = 'SC88_SynVox'
tb_ins_bank['2,55'] = 'SC88_OrchestraHit'
tb_ins_bank['2,56'] = 'SC88_Trumpet'
tb_ins_bank['2,57'] = 'SC88_Trombone'
tb_ins_bank['2,58'] = 'SC88_Tuba'
tb_ins_bank['2,59'] = 'SC88_MutedTrumpet'
tb_ins_bank['2,60'] = 'SC88_French Horn'
tb_ins_bank['2,61'] = 'SC88_Brass 1'
tb_ins_bank['2,62'] = 'SC88_Synth Brass 1'
tb_ins_bank['2,63'] = 'SC88_Synth Brass 2'
tb_ins_bank['2,64'] = 'SC88_Soprano Sax'
tb_ins_bank['2,65'] = 'SC88_Alto Sax'
tb_ins_bank['2,66'] = 'SC88_Tenor Sax'
tb_ins_bank['2,67'] = 'SC88_Baritone Sax'
tb_ins_bank['2,68'] = 'SC88_Oboe'
tb_ins_bank['2,69'] = 'SC88_English Horn'
tb_ins_bank['2,70'] = 'SC88_Bassoon'
tb_ins_bank['2,71'] = 'SC88_Clarinet'
tb_ins_bank['2,72'] = 'SC88_Piccolo'
tb_ins_bank['2,73'] = 'SC88_Flute'
tb_ins_bank['2,74'] = 'SC88_Recorder'
tb_ins_bank['2,75'] = 'SC88_Pan Flute'
tb_ins_bank['2,76'] = 'SC88_Bottle Blow'
tb_ins_bank['2,77'] = 'SC88_Shakuhachi'
tb_ins_bank['2,78'] = 'SC88_Whistle'
tb_ins_bank['2,79'] = 'SC88_Ocarina'
tb_ins_bank['2,80'] = 'SC88_Square Wave'
tb_ins_bank['2,81'] = 'SC88_Saw Wave'
tb_ins_bank['2,82'] = 'SC88_Syn.Calliope'
tb_ins_bank['2,83'] = 'SC88_Chiffer Lead'
tb_ins_bank['2,84'] = 'SC88_Charang'
tb_ins_bank['2,85'] = 'SC88_Solo Vox'
tb_ins_bank['2,86'] = 'SC88_5th Saw Wave'
tb_ins_bank['2,87'] = 'SC88_Bass & Lead'
tb_ins_bank['2,88'] = 'SC88_Fantasia'
tb_ins_bank['2,89'] = 'SC88_Warm Pad'
tb_ins_bank['2,90'] = 'SC88_Polysynth'
tb_ins_bank['2,91'] = 'SC88_Space Voice'
tb_ins_bank['2,92'] = 'SC88_Bowed Glass'
tb_ins_bank['2,93'] = 'SC88_Metal Pad'
tb_ins_bank['2,94'] = 'SC88_Halo Pad'
tb_ins_bank['2,95'] = 'SC88_Sweep Pad'
tb_ins_bank['2,96'] = 'SC88_Ice Rain'
tb_ins_bank['2,97'] = 'SC88_Soundtrack'
tb_ins_bank['2,98'] = 'SC88_Crystal'
tb_ins_bank['2,99'] = 'SC88_Atmosphere'
tb_ins_bank['2,100'] = 'SC88_Brightness'
tb_ins_bank['2,101'] = 'SC88_Goblin'
tb_ins_bank['2,102'] = 'SC88_Echo Drops'
tb_ins_bank['2,103'] = 'SC88_Star Theme'
tb_ins_bank['2,104'] = 'SC88_Sitar'
tb_ins_bank['2,105'] = 'SC88_Banjo'
tb_ins_bank['2,106'] = 'SC88_Shamisen'
tb_ins_bank['2,107'] = 'SC88_Koto'
tb_ins_bank['2,108'] = 'SC88_Kalimba'
tb_ins_bank['2,109'] = 'SC88_Bag Pipe'
tb_ins_bank['2,110'] = 'SC88_Fiddle'
tb_ins_bank['2,111'] = 'SC88_Shanai'
tb_ins_bank['2,112'] = 'SC88_Tinkle Bell'
tb_ins_bank['2,113'] = 'SC88_Agogo'
tb_ins_bank['2,114'] = 'SC88_Steel Drums'
tb_ins_bank['2,115'] = 'SC88_Woodblock'
tb_ins_bank['2,116'] = 'SC88_Taiko'
tb_ins_bank['2,117'] = 'SC88_Melo. Tom 1'
tb_ins_bank['2,118'] = 'SC88_Synth Drum'
tb_ins_bank['2,119'] = 'SC88_Reverse Cym.'
tb_ins_bank['2,120'] = 'SC88_Gt.FretNoise'
tb_ins_bank['2,121'] = 'SC88_Breath Noise'
tb_ins_bank['2,122'] = 'SC88_Seashore'
tb_ins_bank['2,123'] = 'SC88_Bird'
tb_ins_bank['2,124'] = 'SC88_Telephone 1'
tb_ins_bank['2,125'] = 'SC88_Helicopter'
tb_ins_bank['2,126'] = 'SC88_Applause'
tb_ins_bank['2,127'] = 'SC88_Gun Shot'
tb_ins_bank['2049,0'] = 'SC55_Piano 1d'
tb_ins_bank['2049,4'] = 'SC55_E.Piano 1w'
tb_ins_bank['2049,5'] = 'SC55_E.Piano 2w'
tb_ins_bank['2049,6'] = 'SC55_Harpsi.w'
tb_ins_bank['2049,16'] = 'SC55_60\'s Organ 1'
tb_ins_bank['2049,19'] = 'SC55_Church Org.3'
tb_ins_bank['2049,24'] = 'SC55_Nylon Gt.o'
tb_ins_bank['2049,25'] = 'SC55_Mandolin'
tb_ins_bank['2049,28'] = 'SC55_Funk Gt.2'
tb_ins_bank['2049,39'] = 'SC55_Rubber Bass'
tb_ins_bank['2049,62'] = 'SC55_AnalogBrass1'
tb_ins_bank['2049,63'] = 'SC55_AnalogBrass2'
tb_ins_bank['1153,14'] = 'SC55_Carillon'
tb_ins_bank['1153,118'] = 'SC55_Elec Perc'
tb_ins_bank['1153,125'] = 'SC55_Burst Noise'
tb_ins_bank['1025,0'] = 'SC55_Piano 1w'
tb_ins_bank['1025,1'] = 'SC55_Piano 2w'
tb_ins_bank['1025,2'] = 'SC55_Piano 3w'
tb_ins_bank['1025,3'] = 'SC55_Honky-tonk w'
tb_ins_bank['1025,4'] = 'SC55_Detuned EP 1'
tb_ins_bank['1025,5'] = 'SC55_Detuned EP 2'
tb_ins_bank['1025,6'] = 'SC55_Coupled Hps.'
tb_ins_bank['1025,11'] = 'SC55_Vib.w'
tb_ins_bank['1025,12'] = 'SC55_Marimba w'
tb_ins_bank['1025,14'] = 'SC55_Church Bell'
tb_ins_bank['1025,16'] = 'SC55_Detuned Or.1'
tb_ins_bank['1025,17'] = 'SC55_Detuned Or.2'
tb_ins_bank['1025,19'] = 'SC55_Church Org.2'
tb_ins_bank['1025,21'] = 'SC55_Accordion It'
tb_ins_bank['1025,24'] = 'SC55_Ukulele'
tb_ins_bank['1025,25'] = 'SC55_12-str.Gt'
tb_ins_bank['1025,26'] = 'SC55_Hawaiian Gt.'
tb_ins_bank['1025,27'] = 'SC55_Chorus Gt.'
tb_ins_bank['1025,28'] = 'SC55_Funk Gt.'
tb_ins_bank['1025,30'] = 'SC55_Feedback Gt.'
tb_ins_bank['1025,31'] = 'SC55_Gt.Feedback'
tb_ins_bank['1025,38'] = 'SC55_Synth Bass 3'
tb_ins_bank['1025,39'] = 'SC55_Synth Bass 4'
tb_ins_bank['1025,40'] = 'SC55_Slow Violine'
tb_ins_bank['1025,48'] = 'SC55_Orchestra'
tb_ins_bank['1025,50'] = 'SC55_Syn.Strings3'
tb_ins_bank['1025,61'] = 'SC55_Brass 2'
tb_ins_bank['1025,62'] = 'SC55_Synth Brass3'
tb_ins_bank['1025,63'] = 'SC55_Synth Brass4'
tb_ins_bank['1025,80'] = 'SC55_Sine Wave'
tb_ins_bank['1025,81'] = 'SC55_Doctor Solo'
tb_ins_bank['1025,107'] = 'SC55_Taisho Koto'
tb_ins_bank['1025,115'] = 'SC55_Castanets'
tb_ins_bank['1025,116'] = 'SC55_Concert BD'
tb_ins_bank['1025,117'] = 'SC55_Melo. Tom 2'
tb_ins_bank['1025,118'] = 'SC55_808 Tom'
tb_ins_bank['1025,125'] = 'SC55_Starship'
tb_ins_bank['897,125'] = 'SC55_Jetplane'
tb_ins_bank['769,125'] = 'SC55_Train'
tb_ins_bank['513,122'] = 'SC55_Stream'
tb_ins_bank['513,124'] = 'SC55_Scratch'
tb_ins_bank['513,125'] = 'SC55_Car-Crash'
tb_ins_bank['513,126'] = 'SC55_Heart Beat'
tb_ins_bank['385,122'] = 'SC55_Wind'
tb_ins_bank['385,123'] = 'SC55_Bird 2'
tb_ins_bank['385,124'] = 'SC55_Door'
tb_ins_bank['385,125'] = 'SC55_Car-Pass'
tb_ins_bank['385,126'] = 'SC55_Punch'
tb_ins_bank['385,127'] = 'SC55_Explosion'
tb_ins_bank['257,102'] = 'SC55_Echo Pan'
tb_ins_bank['257,120'] = 'SC55_String Slap'
tb_ins_bank['257,122'] = 'SC55_Thunder'
tb_ins_bank['257,123'] = 'SC55_Horse-Gallop'
tb_ins_bank['257,124'] = 'SC55_DoorCreaking'
tb_ins_bank['257,125'] = 'SC55_Car-Stop'
tb_ins_bank['257,126'] = 'SC55_Screaming'
tb_ins_bank['257,127'] = 'SC55_Lasergun'
tb_ins_bank['129,38'] = 'SC55_Synth Bass101'
tb_ins_bank['129,57'] = 'SC55_Trombone 2'
tb_ins_bank['129,60'] = 'SC55_French Horn2'
tb_ins_bank['129,80'] = 'SC55_Square'
tb_ins_bank['129,81'] = 'SC55_Saw'
tb_ins_bank['129,98'] = 'SC55_Syn Mallet'
tb_ins_bank['129,102'] = 'SC55_Echo Bell'
tb_ins_bank['129,104'] = 'SC55_Sitar 2'
tb_ins_bank['129,120'] = 'SC55_Gt.Cut Noise'
tb_ins_bank['129,121'] = 'SC55_Fl.Key Click'
tb_ins_bank['129,122'] = 'SC55_Rain'
tb_ins_bank['129,123'] = 'SC55_Dog'
tb_ins_bank['129,124'] = 'SC55_Telephone 2'
tb_ins_bank['129,125'] = 'SC55_Car-Engine'
tb_ins_bank['129,126'] = 'SC55_Laughing'
tb_ins_bank['129,127'] = 'SC55_Machine Gun'
tb_ins_bank['4097,16'] = 'SC55_Organ 4'
tb_ins_bank['4097,17'] = 'SC55_Organ 5'
tb_ins_bank['4097,24'] = 'SC55_Nylon Gt.2'
tb_ins_bank['4097,52'] = 'SC55_Choir Aahs 2'
tb_ins_bank['3073,4'] = 'SC55_60\'s E.Piano'
tb_ins_bank['3073,6'] = 'SC55_Harpsi.o'
tb_ins_bank['6147,16'] = 'SC88Pro_5th Organ'
tb_ins_bank['5763,81'] = 'SC88Pro_Rhythmic Saw'
tb_ins_bank['5635,81'] = 'SC88Pro_Cheese Saw 2'
tb_ins_bank['5507,81'] = 'SC88Pro_Cheese Saw 1'
tb_ins_bank['4355,81'] = 'SC88Pro_MG unison'
tb_ins_bank['4227,7'] = 'SC88Pro_JP8 Clav. 1'
tb_ins_bank['4227,16'] = 'SC88Pro_Even Bar'
tb_ins_bank['4227,19'] = 'SC88Pro_Theater Org.'
tb_ins_bank['4227,48'] = 'SC88Pro_Oct Strings2'
tb_ins_bank['4227,52'] = 'SC88Pro_Male Aah+Str'
tb_ins_bank['4227,81'] = 'SC88Pro_P5 Saw Lead'
tb_ins_bank['4227,111'] = 'SC88Pro_Suona 2'
tb_ins_bank['4099,6'] = 'SC88Pro_Synth Harpsi'
tb_ins_bank['4099,7'] = 'SC88Pro_Analog Clav.'
tb_ins_bank['4099,16'] = 'SC88Pro_70\'s E.Organ'
tb_ins_bank['4099,17'] = 'SC88Pro_Perc. Organ'
tb_ins_bank['4099,19'] = 'SC88Pro_Trem.Flute'
tb_ins_bank['4099,24'] = 'SC88Pro_Nylon Gt.2'
tb_ins_bank['4099,25'] = 'SC88Pro_Steel Gt.2'
tb_ins_bank['4099,48'] = 'SC88Pro_Oct Strings1'
tb_ins_bank['4099,52'] = 'SC88Pro_Chorus Aahs'
tb_ins_bank['4099,56'] = 'SC88Pro_Syn. Trumpet'
tb_ins_bank['4099,81'] = 'SC88Pro_OB Saw Lead'
tb_ins_bank['4099,105'] = 'SC88Pro_Pi Pa'
tb_ins_bank['4099,111'] = 'SC88Pro_Suona 1'
tb_ins_bank['4099,115'] = 'SC88Pro_909 HandClap'
tb_ins_bank['3971,81'] = 'SC88Pro_MG Saw Lead'
tb_ins_bank['3843,81'] = 'SC88Pro_CS Saw'
tb_ins_bank['3715,16'] = 'SC88Pro_Digi Church'
tb_ins_bank['3715,81'] = 'SC88Pro_SH-101 Saw'
tb_ins_bank['3587,16'] = 'SC88Pro_VS Organ'
tb_ins_bank['3587,39'] = 'SC88Pro_Bubble Bass'
tb_ins_bank['3587,81'] = 'SC88Pro_D-50 Saw'
tb_ins_bank['3587,105'] = 'SC88Pro_Oud+Strings'
tb_ins_bank['1411,38'] = 'SC88Pro_TB303 Bass 2'
tb_ins_bank['1411,39'] = 'SC88Pro_WireStr Bass'
tb_ins_bank['1411,48'] = 'SC88Pro_Choir Str.'
tb_ins_bank['1411,55'] = 'SC88Pro_Perc. Hit'
tb_ins_bank['1411,81'] = 'SC88Pro_D-50 Fat Saw'
tb_ins_bank['1411,90'] = 'SC88Pro_Techno Stack'
tb_ins_bank['1411,91'] = 'SC88Pro_Vocorderman'
tb_ins_bank['1411,95'] = 'SC88Pro_Bag Sweep'
tb_ins_bank['1411,98'] = 'SC88Pro_Analog Bell'
tb_ins_bank['1411,101'] = 'SC88Pro_LFO Horror'
tb_ins_bank['1411,112'] = 'SC88Pro_St.Gamelan'
tb_ins_bank['1411,118'] = 'SC88Pro_606 Tom'
tb_ins_bank['1411,120'] = 'SC88Pro_Chord Stroke'
tb_ins_bank['1411,124'] = 'SC88Pro_MC-500 Beep'
tb_ins_bank['1411,125'] = 'SC88Pro_Perc. Bang'
tb_ins_bank['1283,4'] = 'SC88Pro_SilentRhodes'
tb_ins_bank['1283,38'] = 'SC88Pro_Tekno Bass'
tb_ins_bank['1283,39'] = 'SC88Pro_X Wire Bass'
tb_ins_bank['1283,48'] = 'SC88Pro_Tremolo Orch'
tb_ins_bank['1283,49'] = 'SC88Pro_St.Slow Str.'
tb_ins_bank['1283,52'] = 'SC88Pro_Church Choir'
tb_ins_bank['1283,55'] = 'SC88Pro_Double Hit'
tb_ins_bank['1283,61'] = 'SC88Pro_Brass sfz'
tb_ins_bank['1283,63'] = 'SC88Pro_Reso Brass'
tb_ins_bank['1283,80'] = 'SC88Pro_KG Lead'
tb_ins_bank['1283,84'] = 'SC88Pro_Acid Guitar2'
tb_ins_bank['1283,90'] = 'SC88Pro_Reso Stack'
tb_ins_bank['1283,91'] = 'SC88Pro_AuhAuh'
tb_ins_bank['1283,95'] = 'SC88Pro_Celestial Pd'
tb_ins_bank['1283,98'] = 'SC88Pro_Music Bell'
tb_ins_bank['1283,101'] = 'SC88Pro_LFO RAVE'
tb_ins_bank['1283,112'] = 'SC88Pro_Gamelan Gong'
tb_ins_bank['1283,118'] = 'SC88Pro_Sine Perc.'
tb_ins_bank['1283,120'] = 'SC88Pro_Guitar Slap'
tb_ins_bank['1283,124'] = 'SC88Pro_Phono Noise'
tb_ins_bank['1283,125'] = 'SC88Pro_Calculating'
tb_ins_bank['1155,4'] = 'SC88Pro_Cho. E.Piano'
tb_ins_bank['1155,11'] = 'SC88Pro_Vibraphones'
tb_ins_bank['1155,14'] = 'SC88Pro_Carillon'
tb_ins_bank['1155,16'] = 'SC88Pro_Organ o'
tb_ins_bank['1155,17'] = 'SC88Pro_Octave Organ'
tb_ins_bank['1155,21'] = 'SC88Pro_Dist. Accord'
tb_ins_bank['1155,25'] = 'SC88Pro_Nylon+Steel'
tb_ins_bank['1155,27'] = 'SC88Pro_JC Chorus Gt'
tb_ins_bank['1155,29'] = 'SC88Pro_LP OverDrv:'
tb_ins_bank['1155,30'] = 'SC88Pro_Feedback Gt2'
tb_ins_bank['1155,31'] = 'SC88Pro_Gt.Feedback2'
tb_ins_bank['1155,36'] = 'SC88Pro_Unison Slap'
tb_ins_bank['1155,38'] = 'SC88Pro_TB303 Bass'
tb_ins_bank['1155,39'] = 'SC88Pro_Dly Bass'
tb_ins_bank['1155,44'] = 'SC88Pro_Suspense Str'
tb_ins_bank['1155,48'] = 'SC88Pro_Orchestra 2'
tb_ins_bank['1155,49'] = 'SC88Pro_Warm Strings'
tb_ins_bank['1155,50'] = 'SC88Pro_Syn.Strings4'
tb_ins_bank['1155,52'] = 'SC88Pro_Melted Choir'
tb_ins_bank['1155,54'] = 'SC88Pro_Silent Night'
tb_ins_bank['1155,55'] = 'SC88Pro_Philly Hit'
tb_ins_bank['1155,60'] = 'SC88Pro_Dual Horns'
tb_ins_bank['1155,61'] = 'SC88Pro_Brass 3'
tb_ins_bank['1155,62'] = 'SC88Pro_P5 Brass'
tb_ins_bank['1155,63'] = 'SC88Pro_OB Brass'
tb_ins_bank['1155,65'] = 'SC88Pro_Grow Sax'
tb_ins_bank['1155,66'] = 'SC88Pro_St.Tenor Sax'
tb_ins_bank['1155,72'] = 'SC88Pro_Nay Tremolo'
tb_ins_bank['1155,80'] = 'SC88Pro_Sine Lead'
tb_ins_bank['1155,81'] = 'SC88Pro_Fat Saw Lead'
tb_ins_bank['1155,84'] = 'SC88Pro_Acid Guitar1'
tb_ins_bank['1155,85'] = 'SC88Pro_LFO Vox'
tb_ins_bank['1155,89'] = 'SC88Pro_Stack Pad'
tb_ins_bank['1155,90'] = 'SC88Pro_Octave Stack'
tb_ins_bank['1155,91'] = 'SC88Pro_Auh Vox'
tb_ins_bank['1155,95'] = 'SC88Pro_Shwimmer'
tb_ins_bank['1155,98'] = 'SC88Pro_Digi Bells'
tb_ins_bank['1155,99'] = 'SC88Pro_Noise Piano'
tb_ins_bank['1155,101'] = 'SC88Pro_Falling Down'
tb_ins_bank['1155,102'] = 'SC88Pro_Aqua'
tb_ins_bank['1155,103'] = 'SC88Pro_Silky Pad'
tb_ins_bank['1155,105'] = 'SC88Pro_San Xian'
tb_ins_bank['1155,110'] = 'SC88Pro_Gao Hu'
tb_ins_bank['1155,112'] = 'SC88Pro_Gender'
tb_ins_bank['1155,117'] = 'SC88Pro_Rock Tom'
tb_ins_bank['1155,118'] = 'SC88Pro_Elec Perc'
tb_ins_bank['1155,119'] = 'SC88Pro_Rev.Snare 2'
tb_ins_bank['1155,120'] = 'SC88Pro_Bartok Pizz.'
tb_ins_bank['1155,124'] = 'SC88Pro_TapeRewind'
tb_ins_bank['1155,125'] = 'SC88Pro_Burst Noise'
tb_ins_bank['1027,0'] = 'SC88Pro_Piano 1w'
tb_ins_bank['1027,1'] = 'SC88Pro_Piano 2w'
tb_ins_bank['1027,2'] = 'SC88Pro_Piano 3w'
tb_ins_bank['1027,3'] = 'SC88Pro_Honky-tonk 2'
tb_ins_bank['1027,4'] = 'SC88Pro_St.Soft EP'
tb_ins_bank['1027,5'] = 'SC88Pro_Detuned EP 2'
tb_ins_bank['1027,6'] = 'SC88Pro_Coupled Hps.'
tb_ins_bank['1027,7'] = 'SC88Pro_Comp Clav.'
tb_ins_bank['1027,11'] = 'SC88Pro_Vibraphone w'
tb_ins_bank['1027,12'] = 'SC88Pro_Marimba w'
tb_ins_bank['1027,14'] = 'SC88Pro_Church Bell'
tb_ins_bank['1027,15'] = 'SC88Pro_Cimbalom'
tb_ins_bank['1027,16'] = 'SC88Pro_Trem. Organ'
tb_ins_bank['1027,17'] = 'SC88Pro_Chorus Or.2'
tb_ins_bank['1027,18'] = 'SC88Pro_Rotary Org.'
tb_ins_bank['1027,19'] = 'SC88Pro_Church Org.2'
tb_ins_bank['1027,20'] = 'SC88Pro_Wind Organ'
tb_ins_bank['1027,21'] = 'SC88Pro_Accordion It'
tb_ins_bank['1027,23'] = 'SC88Pro_Bandoneon 2'
tb_ins_bank['1027,24'] = 'SC88Pro_Ukulele'
tb_ins_bank['1027,25'] = 'SC88Pro_12-str.Gt'
tb_ins_bank['1027,26'] = 'SC88Pro_Pedal Steel'
tb_ins_bank['1027,27'] = 'SC88Pro_Chorus Gt.'
tb_ins_bank['1027,28'] = 'SC88Pro_Funk Pop'
tb_ins_bank['1027,29'] = 'SC88Pro_LP OverDrvGt'
tb_ins_bank['1027,30'] = 'SC88Pro_Feedback Gt.'
tb_ins_bank['1027,31'] = 'SC88Pro_Gt. Feedback'
tb_ins_bank['1027,32'] = 'SC88Pro_Wild A.Bass'
tb_ins_bank['1027,33'] = 'SC88Pro_ChorusJazzBs'
tb_ins_bank['1027,34'] = 'SC88Pro_Muted PickBs'
tb_ins_bank['1027,35'] = 'SC88Pro_Wood+FlessBs'
tb_ins_bank['1027,36'] = 'SC88Pro_Reso Slap'
tb_ins_bank['1027,37'] = 'SC88Pro_FM Slap'
tb_ins_bank['1027,38'] = 'SC88Pro_Acid Bass'
tb_ins_bank['1027,39'] = 'SC88Pro_Beef FM Bass'
tb_ins_bank['1027,40'] = 'SC88Pro_Slow Violin'
tb_ins_bank['1027,44'] = 'SC88Pro_Slow Tremolo'
tb_ins_bank['1027,45'] = 'SC88Pro_Solo Pizz.'
tb_ins_bank['1027,48'] = 'SC88Pro_Orchestra'
tb_ins_bank['1027,49'] = 'SC88Pro_Legato Str.'
tb_ins_bank['1027,50'] = 'SC88Pro_Syn.Strings3'
tb_ins_bank['1027,51'] = 'SC88Pro_Air Strings'
tb_ins_bank['1027,52'] = 'SC88Pro_St.ChoirAahs'
tb_ins_bank['1027,53'] = 'SC88Pro_Voice Dahs'
tb_ins_bank['1027,54'] = 'SC88Pro_Syn.Voice'
tb_ins_bank['1027,55'] = 'SC88Pro_Impact Hit'
tb_ins_bank['1027,56'] = 'SC88Pro_Flugel Horn'
tb_ins_bank['1027,57'] = 'SC88Pro_Bs. Trombone'
tb_ins_bank['1027,59'] = 'SC88Pro_Muted Horns'
tb_ins_bank['1027,60'] = 'SC88Pro_F.Hrn Slow:'
tb_ins_bank['1027,61'] = 'SC88Pro_Brass 2'
tb_ins_bank['1027,62'] = 'SC88Pro_Pro Brass'
tb_ins_bank['1027,63'] = 'SC88Pro_SynBrass sfz'
tb_ins_bank['1027,64'] = 'SC88Pro_Soprano Exp.'
tb_ins_bank['1027,65'] = 'SC88Pro_AltoSax Exp.'
tb_ins_bank['1027,66'] = 'SC88Pro_BreathyTn.:'
tb_ins_bank['1027,68'] = 'SC88Pro_Oboe Exp.'
tb_ins_bank['1027,71'] = 'SC88Pro_Bs Clarinet'
tb_ins_bank['1027,72'] = 'SC88Pro_Nay'
tb_ins_bank['1027,73'] = 'SC88Pro_Flute + Vln'
tb_ins_bank['1027,75'] = 'SC88Pro_Kawala'
tb_ins_bank['1027,80'] = 'SC88Pro_2600 Sine'
tb_ins_bank['1027,81'] = 'SC88Pro_Doctor Solo'
tb_ins_bank['1027,83'] = 'SC88Pro_Mad Lead'
tb_ins_bank['1027,84'] = 'SC88Pro_Dist.Lead'
tb_ins_bank['1027,85'] = 'SC88Pro_Vox Lead'
tb_ins_bank['1027,86'] = 'SC88Pro_4th Lead'
tb_ins_bank['1027,89'] = 'SC88Pro_Octave Pad'
tb_ins_bank['1027,90'] = 'SC88Pro_Power Stack'
tb_ins_bank['1027,91'] = 'SC88Pro_Cosmic Voice'
tb_ins_bank['1027,94'] = 'SC88Pro_Horror Pad'
tb_ins_bank['1027,95'] = 'SC88Pro_Converge'
tb_ins_bank['1027,96'] = 'SC88Pro_Clavi Pad'
tb_ins_bank['1027,97'] = 'SC88Pro_Rave'
tb_ins_bank['1027,98'] = 'SC88Pro_Vibra Bells'
tb_ins_bank['1027,99'] = 'SC88Pro_Pulsey Key'
tb_ins_bank['1027,100'] = 'SC88Pro_Org Bell'
tb_ins_bank['1027,101'] = 'SC88Pro_LowBirds Pad'
tb_ins_bank['1027,102'] = 'SC88Pro_Pan Sequence'
tb_ins_bank['1027,103'] = 'SC88Pro_Dream Pad'
tb_ins_bank['1027,104'] = 'SC88Pro_Tambra'
tb_ins_bank['1027,105'] = 'SC88Pro_Rabab'
tb_ins_bank['1027,106'] = 'SC88Pro_Syn Shamisen'
tb_ins_bank['1027,107'] = 'SC88Pro_Taisho Koto'
tb_ins_bank['1027,108'] = 'SC88Pro_Sanza'
tb_ins_bank['1027,109'] = 'SC88Pro_Didgeridoo'
tb_ins_bank['1027,110'] = 'SC88Pro_Er Hu'
tb_ins_bank['1027,111'] = 'SC88Pro_Pungi'
tb_ins_bank['1027,112'] = 'SC88Pro_Bonang'
tb_ins_bank['1027,113'] = 'SC88Pro_Atarigane'
tb_ins_bank['1027,115'] = 'SC88Pro_Castanets'
tb_ins_bank['1027,116'] = 'SC88Pro_Concert BD'
tb_ins_bank['1027,117'] = 'SC88Pro_Melo. Tom 2'
tb_ins_bank['1027,118'] = 'SC88Pro_808 Tom'
tb_ins_bank['1027,119'] = 'SC88Pro_Rev.Snare 1'
tb_ins_bank['1027,120'] = 'SC88Pro_Gt. FX Menu'
tb_ins_bank['1027,124'] = 'SC88Pro_ScratchKey'
tb_ins_bank['1027,125'] = 'SC88Pro_Starship'
tb_ins_bank['1027,126'] = 'SC88Pro_ApplauseWave'
tb_ins_bank['899,39'] = 'SC88Pro_MG Blip Bs:'
tb_ins_bank['899,81'] = 'SC88Pro_LA Saw'
tb_ins_bank['899,98'] = 'SC88Pro_ChristmasBel'
tb_ins_bank['899,99'] = 'SC88Pro_Invisible'
tb_ins_bank['899,101'] = 'SC88Pro_Random Pad'
tb_ins_bank['899,124'] = 'SC88Pro_Scratch 2'
tb_ins_bank['899,125'] = 'SC88Pro_Jetplane'
tb_ins_bank['899,126'] = 'SC88Pro_Small Club'
tb_ins_bank['2947,39'] = 'SC88Pro_KG Bass'
tb_ins_bank['2947,55'] = 'SC88Pro_Rave Hit'
tb_ins_bank['2819,39'] = 'SC88Pro_House Bass:'
tb_ins_bank['2819,55'] = 'SC88Pro_Technorg Hit'
tb_ins_bank['2691,39'] = 'SC88Pro_Spike Bass'
tb_ins_bank['2691,55'] = 'SC88Pro_Bim Hit'
tb_ins_bank['3459,16'] = 'SC88Pro_Hybrid Organ'
tb_ins_bank['3459,39'] = 'SC88Pro_WowMG Bass'
tb_ins_bank['3459,80'] = 'SC88Pro_MG Reso. Pls'
tb_ins_bank['3459,81'] = 'SC88Pro_OB Saw 2'
tb_ins_bank['3331,4'] = 'SC88Pro_MellowRhodes'
tb_ins_bank['3331,16'] = 'SC88Pro_JUNO Organ'
tb_ins_bank['3331,39'] = 'SC88Pro_RND Bass'
tb_ins_bank['3331,80'] = 'SC88Pro_JP8 PulseLd2'
tb_ins_bank['3331,81'] = 'SC88Pro_OB Saw 1'
tb_ins_bank['3203,4'] = 'SC88Pro_Hard Rhodes'
tb_ins_bank['3203,16'] = 'SC88Pro_D-50 Organ'
tb_ins_bank['3203,21'] = 'SC88Pro_Soft Accord'
tb_ins_bank['3203,30'] = 'SC88Pro_Rock Rhythm2'
tb_ins_bank['3203,39'] = 'SC88Pro_MG 5th Bass'
tb_ins_bank['3203,50'] = 'SC88Pro_Noiz Strings'
tb_ins_bank['3203,55'] = 'SC88Pro_Stack Hit'
tb_ins_bank['3203,56'] = 'SC88Pro_Warm Tp.'
tb_ins_bank['3203,61'] = 'SC88Pro_Brass + Reed'
tb_ins_bank['3203,80'] = 'SC88Pro_JP8 PulseLd1'
tb_ins_bank['3203,81'] = 'SC88Pro_MG Saw 2'
tb_ins_bank['3203,119'] = 'SC88Pro_Rev.Tom 2'
tb_ins_bank['3075,0'] = 'SC88Pro_Piano + Str.'
tb_ins_bank['3075,4'] = 'SC88Pro_Wurly'
tb_ins_bank['3075,5'] = 'SC88Pro_Hard FM EP'
tb_ins_bank['3075,6'] = 'SC88Pro_Harpsi.o'
tb_ins_bank['3075,7'] = 'SC88Pro_Clav.o'
tb_ins_bank['3075,12'] = 'SC88Pro_Log drum'
tb_ins_bank['3075,15'] = 'SC88Pro_Dulcimer'
tb_ins_bank['3075,16'] = 'SC88Pro_Cheese Organ'
tb_ins_bank['3075,18'] = 'SC88Pro_Rotary Org.F'
tb_ins_bank['3075,19'] = 'SC88Pro_Organ Flute'
tb_ins_bank['3075,21'] = 'SC88Pro_Hard Accord'
tb_ins_bank['3075,24'] = 'SC88Pro_Velo Harmnix'
tb_ins_bank['3075,30'] = 'SC88Pro_Rock Rhythm'
tb_ins_bank['3075,30'] = 'SC88Pro_M.G'
tb_ins_bank['3075,31'] = 'SC88Pro_E.Bass Harm.'
tb_ins_bank['3075,38'] = 'SC88Pro_Arpeggio Bs'
tb_ins_bank['3075,39'] = 'SC88Pro_Sync Bass'
tb_ins_bank['3075,48'] = 'SC88Pro_Velo Strings'
tb_ins_bank['3075,50'] = 'SC88Pro_Tron Strings'
tb_ins_bank['3075,52'] = 'SC88Pro_Chorus Lahs'
tb_ins_bank['3075,55'] = 'SC88Pro_Strings Hit'
tb_ins_bank['3075,56'] = 'SC88Pro_Bright Tp.'
tb_ins_bank['3075,60'] = 'SC88Pro_F.Horn Rip'
tb_ins_bank['3075,61'] = 'SC88Pro_Octave Brass'
tb_ins_bank['3075,80'] = 'SC88Pro_Pulse Lead'
tb_ins_bank['3075,81'] = 'SC88Pro_MG Saw 1'
tb_ins_bank['3075,84'] = 'SC88Pro_JUNO Sub Osc'
tb_ins_bank['3075,105'] = 'SC88Pro_Oud'
tb_ins_bank['3075,107'] = 'SC88Pro_Oct Harp'
tb_ins_bank['3075,111'] = 'SC88Pro_Mizmar'
tb_ins_bank['3075,115'] = 'SC88Pro_Finger Snaps'
tb_ins_bank['3075,119'] = 'SC88Pro_Rev.Tom 1'
tb_ins_bank['5379,81'] = 'SC88Pro_Reso Saw'
tb_ins_bank['5251,81'] = 'SC88Pro_SequenceSaw2'
tb_ins_bank['5123,16'] = 'SC88Pro_Organ Bass'
tb_ins_bank['5123,24'] = 'SC88Pro_Lequint Gt.'
tb_ins_bank['5123,81'] = 'SC88Pro_SequenceSaw1'
tb_ins_bank['4483,7'] = 'SC88Pro_JP8 Clav. 2'
tb_ins_bank['4483,81'] = 'SC88Pro_Oct Saw Lead'
tb_ins_bank['2563,39'] = 'SC88Pro_SH101 Bass 3'
tb_ins_bank['2563,55'] = 'SC88Pro_Bit Hit'
tb_ins_bank['2563,84'] = 'SC88Pro_Dirty Sync'
tb_ins_bank['2563,98'] = 'SC88Pro_JUNO Bell'
tb_ins_bank['2563,126'] = 'SC88Pro_Voice Whey'
tb_ins_bank['2435,16'] = 'SC88Pro_Farf Organ'
tb_ins_bank['2435,27'] = 'SC88Pro_TC Clean 2:'
tb_ins_bank['2435,39'] = 'SC88Pro_Smooth Bass'
tb_ins_bank['2435,55'] = 'SC88Pro_Bam Hit'
tb_ins_bank['2435,84'] = 'SC88Pro_5th DecaSync'
tb_ins_bank['2435,98'] = 'SC88Pro_Gamelimba'
tb_ins_bank['2435,107'] = 'SC88Pro_Kanoon+Choir'
tb_ins_bank['2435,117'] = 'SC88Pro_909 SD'
tb_ins_bank['2435,126'] = 'SC88Pro_Voice Tah'
tb_ins_bank['2307,16'] = 'SC88Pro_60\'s Organ 3'
tb_ins_bank['2307,18'] = 'SC88Pro_Rock Organ 2'
tb_ins_bank['2307,25'] = 'SC88Pro_MandolinTrem'
tb_ins_bank['2307,27'] = 'SC88Pro_TC Clean ff'
tb_ins_bank['2307,30'] = 'SC88Pro_5th Dist.'
tb_ins_bank['2307,38'] = 'SC88Pro_TB303 DistBs'
tb_ins_bank['2307,39'] = 'SC88Pro_SH101 Bass 2'
tb_ins_bank['2307,55'] = 'SC88Pro_Dist. Hit'
tb_ins_bank['2307,80'] = 'SC88Pro_JP-8 Square'
tb_ins_bank['2307,81'] = 'SC88Pro_CS Saw Lead'
tb_ins_bank['2307,84'] = 'SC88Pro_Rock Lead'
tb_ins_bank['2307,98'] = 'SC88Pro_Bell Harp'
tb_ins_bank['2307,103'] = 'SC88Pro_Galaxy Way'
tb_ins_bank['2307,116'] = 'SC88Pro_Bounce'
tb_ins_bank['2307,117'] = 'SC88Pro_Jungle SD'
tb_ins_bank['2307,126'] = 'SC88Pro_Voice Three'
tb_ins_bank['2179,4'] = 'SC88Pro_Dist E.Piano'
tb_ins_bank['2179,12'] = 'SC88Pro_Barafon 2'
tb_ins_bank['2179,15'] = 'SC88Pro_Zither 2'
tb_ins_bank['2179,16'] = 'SC88Pro_60\'s Organ 2'
tb_ins_bank['2179,18'] = 'SC88Pro_Rock Organ 1'
tb_ins_bank['2179,25'] = 'SC88Pro_Mandolin 2'
tb_ins_bank['2179,27'] = 'SC88Pro_TC Rear Pick'
tb_ins_bank['2179,30'] = 'SC88Pro_Power Gt.2'
tb_ins_bank['2179,38'] = 'SC88Pro_TB303 Sqr Bs'
tb_ins_bank['2179,39'] = 'SC88Pro_SH101 Bass 1'
tb_ins_bank['2179,50'] = 'SC88Pro_Hybrid Str.'
tb_ins_bank['2179,54'] = 'SC88Pro_Vinyl Choir'
tb_ins_bank['2179,55'] = 'SC88Pro_Techno Hit'
tb_ins_bank['2179,61'] = 'SC88Pro_Trumpet Fall'
tb_ins_bank['2179,62'] = 'SC88Pro_Hybrid Brass'
tb_ins_bank['2179,63'] = 'SC88Pro_Transbrass'
tb_ins_bank['2179,75'] = 'SC88Pro_Zampona Atk'
tb_ins_bank['2179,80'] = 'SC88Pro_OB Square'
tb_ins_bank['2179,81'] = 'SC88Pro_PM Lead'
tb_ins_bank['2179,84'] = 'SC88Pro_Fat SyncLead'
tb_ins_bank['2179,98'] = 'SC88Pro_Air Bells'
tb_ins_bank['2179,103'] = 'SC88Pro_7th Atmos.'
tb_ins_bank['2179,115'] = 'SC88Pro_Angkl Rhythm'
tb_ins_bank['2179,116'] = 'SC88Pro_Techno BD'
tb_ins_bank['2179,117'] = 'SC88Pro_House SD'
tb_ins_bank['2179,119'] = 'SC88Pro_Rev.ConBD'
tb_ins_bank['2179,122'] = 'SC88Pro_White Noise'
tb_ins_bank['2179,126'] = 'SC88Pro_Voice Two'
tb_ins_bank['2051,0'] = 'SC88Pro_European Pf'
tb_ins_bank['2051,1'] = 'SC88Pro_Dance Piano'
tb_ins_bank['2051,4'] = 'SC88Pro_FM+SA EP'
tb_ins_bank['2051,5'] = 'SC88Pro_St.FM EP'
tb_ins_bank['2051,6'] = 'SC88Pro_Harpsi.w'
tb_ins_bank['2051,7'] = 'SC88Pro_Reso Clav.'
tb_ins_bank['2051,12'] = 'SC88Pro_Barafon'
tb_ins_bank['2051,15'] = 'SC88Pro_Zither 1'
tb_ins_bank['2051,16'] = 'SC88Pro_60\'s Organ 1'
tb_ins_bank['2051,18'] = 'SC88Pro_Rotary Org.S'
tb_ins_bank['2051,19'] = 'SC88Pro_Church Org.3'
tb_ins_bank['2051,21'] = 'SC88Pro_Cho. Accord'
tb_ins_bank['2051,23'] = 'SC88Pro_Bandoneon 3'
tb_ins_bank['2051,24'] = 'SC88Pro_Nylon Gt.o'
tb_ins_bank['2051,25'] = 'SC88Pro_Mandolin'
tb_ins_bank['2051,27'] = 'SC88Pro_TC FrontPick'
tb_ins_bank['2051,28'] = 'SC88Pro_Funk Gt.2'
tb_ins_bank['2051,30'] = 'SC88Pro_Power Guitar'
tb_ins_bank['2051,31'] = 'SC88Pro_Ac.Gt.Harmnx'
tb_ins_bank['2051,32'] = 'SC88Pro_Bass + OHH'
tb_ins_bank['2051,33'] = 'SC88Pro_F.Bass/Harm.'
tb_ins_bank['2051,34'] = 'SC88Pro_P.Bass/Harm.'
tb_ins_bank['2051,38'] = 'SC88Pro_Reso SH Bass'
tb_ins_bank['2051,39'] = 'SC88Pro_RubberBass 2'
tb_ins_bank['2051,45'] = 'SC88Pro_Solo Spic.'
tb_ins_bank['2051,46'] = 'SC88Pro_Synth Harp'
tb_ins_bank['2051,48'] = 'SC88Pro_St. Strings'
tb_ins_bank['2051,50'] = 'SC88Pro_High Strings'
tb_ins_bank['2051,52'] = 'SC88Pro_Choir Hahs'
tb_ins_bank['2051,54'] = 'SC88Pro_VP330 Choir'
tb_ins_bank['2051,55'] = 'SC88Pro_Lo Fi Rave'
tb_ins_bank['2051,56'] = 'SC88Pro_4th Trumpets'
tb_ins_bank['2051,60'] = 'SC88Pro_Synth Horn'
tb_ins_bank['2051,61'] = 'SC88Pro_Brass Fall'
tb_ins_bank['2051,62'] = 'SC88Pro_Oct SynBrass'
tb_ins_bank['2051,63'] = 'SC88Pro_Velo Brass 1'
tb_ins_bank['2051,65'] = 'SC88Pro_AltoSax + Tp'
tb_ins_bank['2051,68'] = 'SC88Pro_Multi Reed'
tb_ins_bank['2051,71'] = 'SC88Pro_Multi Wind'
tb_ins_bank['2051,72'] = 'SC88Pro_Di'
tb_ins_bank['2051,73'] = 'SC88Pro_Tron Flute'
tb_ins_bank['2051,75'] = 'SC88Pro_Zampona'
tb_ins_bank['2051,80'] = 'SC88Pro_P5 Square'
tb_ins_bank['2051,81'] = 'SC88Pro_Waspy Synth'
tb_ins_bank['2051,84'] = 'SC88Pro_P5 Sync Lead'
tb_ins_bank['2051,98'] = 'SC88Pro_Choral Bells'
tb_ins_bank['2051,101'] = 'SC88Pro_Sweep FX'
tb_ins_bank['2051,103'] = 'SC88Pro_New Century'
tb_ins_bank['2051,104'] = 'SC88Pro_Tamboura'
tb_ins_bank['2051,105'] = 'SC88Pro_Gopichant'
tb_ins_bank['2051,107'] = 'SC88Pro_Kanoon'
tb_ins_bank['2051,111'] = 'SC88Pro_Hichiriki'
tb_ins_bank['2051,112'] = 'SC88Pro_RAMA Cymbal'
tb_ins_bank['2051,113'] = 'SC88Pro_Tambourine'
tb_ins_bank['2051,115'] = 'SC88Pro_Angklung'
tb_ins_bank['2051,116'] = 'SC88Pro_Jungle BD'
tb_ins_bank['2051,117'] = 'SC88Pro_Rash SD'
tb_ins_bank['2051,119'] = 'SC88Pro_Rev.Kick 1'
tb_ins_bank['2051,122'] = 'SC88Pro_Pink Noise'
tb_ins_bank['2051,126'] = 'SC88Pro_Voice One'
tb_ins_bank['1923,38'] = 'SC88Pro_Reso 303 Bs'
tb_ins_bank['1923,101'] = 'SC88Pro_Gargle Man'
tb_ins_bank['1795,38'] = 'SC88Pro_Rubber303 Bs'
tb_ins_bank['1795,101'] = 'SC88Pro_UFO FX'
tb_ins_bank['1667,38'] = 'SC88Pro_TB303 Saw Bs'
tb_ins_bank['1667,39'] = 'SC88Pro_RubberBass 1'
tb_ins_bank['1667,101'] = 'SC88Pro_Alternative'
tb_ins_bank['1667,120'] = 'SC88Pro_Biwa Tremolo'
tb_ins_bank['1539,38'] = 'SC88Pro_Kicked TB303'
tb_ins_bank['1539,39'] = 'SC88Pro_Blip Bass :'
tb_ins_bank['1539,48'] = 'SC88Pro_Strings+Horn'
tb_ins_bank['1539,55'] = 'SC88Pro_Shock Wave'
tb_ins_bank['1539,101'] = 'SC88Pro_LFO Techno'
tb_ins_bank['1539,112'] = 'SC88Pro_Jang Gu'
tb_ins_bank['1539,118'] = 'SC88Pro_909 Tom'
tb_ins_bank['1539,120'] = 'SC88Pro_Biwa Stroke'
tb_ins_bank['1154,14'] = 'SC88_Carillon'
tb_ins_bank['1154,16'] = 'SC88_Organ 109'
tb_ins_bank['1154,25'] = 'SC88_Nylon+Steel'
tb_ins_bank['1154,30'] = 'SC88_Feedback Gt2'
tb_ins_bank['1154,38'] = 'SC88_TB303 Bass'
tb_ins_bank['1154,39'] = 'SC88_X Wire Bass'
tb_ins_bank['1154,44'] = 'SC88_Suspense Str'
tb_ins_bank['1154,48'] = 'SC88_Orchestra 2'
tb_ins_bank['1154,49'] = 'SC88_Warm Strings'
tb_ins_bank['1154,52'] = 'SC88_Mello Choir'
tb_ins_bank['1154,55'] = 'SC88_Philly Hit'
tb_ins_bank['1154,62'] = 'SC88_Quack Brass'
tb_ins_bank['1154,95'] = 'SC88_Shwimmer'
tb_ins_bank['1154,98'] = 'SC88_Digi Bells'
tb_ins_bank['1154,112'] = 'SC88_Gender'
tb_ins_bank['1154,117'] = 'SC88_Rock Tom'
tb_ins_bank['1154,118'] = 'SC88_Elec Perc'
tb_ins_bank['1154,119'] = 'SC88_Rev.Snare 2'
tb_ins_bank['1154,125'] = 'SC88_Burst Noise'
tb_ins_bank['1026,0'] = 'SC88_Piano 1w'
tb_ins_bank['1026,1'] = 'SC88_Piano 2w'
tb_ins_bank['1026,2'] = 'SC88_Piano 3w'
tb_ins_bank['1026,3'] = 'SC88_Old Upright'
tb_ins_bank['1026,4'] = 'SC88_St.Soft EP'
tb_ins_bank['1026,5'] = 'SC88_Detuned EP 2'
tb_ins_bank['1026,6'] = 'SC88_Coupled Hps'
tb_ins_bank['1026,11'] = 'SC88_Vib.w'
tb_ins_bank['1026,12'] = 'SC88_Marimba w'
tb_ins_bank['1026,14'] = 'SC88_Church Bell'
tb_ins_bank['1026,15'] = 'SC88_Cimbalom'
tb_ins_bank['1026,16'] = 'SC88_Detuned Or.1'
tb_ins_bank['1026,17'] = 'SC88_Detuned Or.2'
tb_ins_bank['1026,18'] = 'SC88_Rotary Org.'
tb_ins_bank['1026,19'] = 'SC88_Church Org.2'
tb_ins_bank['1026,21'] = 'SC88_Accordion It'
tb_ins_bank['1026,24'] = 'SC88_Ukulele'
tb_ins_bank['1026,25'] = 'SC88_12-str.Gt'
tb_ins_bank['1026,26'] = 'SC88_Pedal Steel'
tb_ins_bank['1026,27'] = 'SC88_Chorus Gt.'
tb_ins_bank['1026,28'] = 'SC88_Funk Pop'
tb_ins_bank['1026,30'] = 'SC88_Feedback Gt.'
tb_ins_bank['1026,31'] = 'SC88_Gt. Feedback'
tb_ins_bank['1026,34'] = 'SC88_Mute PickBs.'
tb_ins_bank['1026,36'] = 'SC88_Reso Slap'
tb_ins_bank['1026,38'] = 'SC88_Acid Bass'
tb_ins_bank['1026,39'] = 'SC88_Beef FM Bass'
tb_ins_bank['1026,40'] = 'SC88_Slow Violin'
tb_ins_bank['1026,44'] = 'SC88_Slow Tremolo'
tb_ins_bank['1026,48'] = 'SC88_Orchestra'
tb_ins_bank['1026,49'] = 'SC88_Legato Str.'
tb_ins_bank['1026,50'] = 'SC88_Syn.Strings3'
tb_ins_bank['1026,52'] = 'SC88_St.Choir'
tb_ins_bank['1026,54'] = 'SC88_Syn.Voice'
tb_ins_bank['1026,55'] = 'SC88_Impact Hit'
tb_ins_bank['1026,56'] = 'SC88_Flugel Horn'
tb_ins_bank['1026,60'] = 'SC88_Fr.Horn Solo'
tb_ins_bank['1026,61'] = 'SC88_Brass 2'
tb_ins_bank['1026,62'] = 'SC88_Synth Brass3'
tb_ins_bank['1026,63'] = 'SC88_Synth Brass4'
tb_ins_bank['1026,65'] = 'SC88_Hyper Alto'
tb_ins_bank['1026,66'] = 'SC88_BreathyTenor'
tb_ins_bank['1026,71'] = 'SC88_Bs Clarinet'
tb_ins_bank['1026,75'] = 'SC88_Kawala'
tb_ins_bank['1026,80'] = 'SC88_Sine Wave'
tb_ins_bank['1026,81'] = 'SC88_Doctor Solo'
tb_ins_bank['1026,84'] = 'SC88_Dist.Lead'
tb_ins_bank['1026,95'] = 'SC88_Converge'
tb_ins_bank['1026,96'] = 'SC88_Clavi Pad'
tb_ins_bank['1026,97'] = 'SC88_Rave'
tb_ins_bank['1026,98'] = 'SC88_Vibra Bells'
tb_ins_bank['1026,104'] = 'SC88_Tambra'
tb_ins_bank['1026,105'] = 'SC88_Rabab'
tb_ins_bank['1026,107'] = 'SC88_Taisho Koto'
tb_ins_bank['1026,111'] = 'SC88_Pungi'
tb_ins_bank['1026,112'] = 'SC88_Bonang'
tb_ins_bank['1026,113'] = 'SC88_Atarigane'
tb_ins_bank['1026,115'] = 'SC88_Castanets'
tb_ins_bank['1026,116'] = 'SC88_Concert BD'
tb_ins_bank['1026,117'] = 'SC88_Melo. Tom 2'
tb_ins_bank['1026,118'] = 'SC88_808 Tom'
tb_ins_bank['1026,119'] = 'SC88_Rev.Snare 1'
tb_ins_bank['1026,125'] = 'SC88_Starship'
tb_ins_bank['771,38'] = 'SC88Pro_JPMG Bass'
tb_ins_bank['771,39'] = 'SC88Pro_MG Oct Bass2'
tb_ins_bank['771,80'] = 'SC88Pro_LM Square'
tb_ins_bank['771,81'] = 'SC88Pro_GR-300'
tb_ins_bank['771,87'] = 'SC88Pro_SH-5 Bs.Lead'
tb_ins_bank['771,98'] = 'SC88Pro_Clear Bells'
tb_ins_bank['771,99'] = 'SC88Pro_Ambient Pad'
tb_ins_bank['771,101'] = 'SC88Pro_Random Str'
tb_ins_bank['771,102'] = 'SC88Pro_Water Piano'
tb_ins_bank['771,120'] = 'SC88Pro_Pick Scrape'
tb_ins_bank['771,122'] = 'SC88Pro_Wind 2'
tb_ins_bank['771,125'] = 'SC88Pro_Train'
tb_ins_bank['771,126'] = 'SC88Pro_Applause 2'
tb_ins_bank['643,35'] = 'SC88Pro_Mr.Smooth'
tb_ins_bank['643,38'] = 'SC88Pro_P5 Bass'
tb_ins_bank['643,39'] = 'SC88Pro_Mg Oct Bass1'
tb_ins_bank['643,80'] = 'SC88Pro_Shmoog'
tb_ins_bank['643,81'] = 'SC88Pro_Velo Lead'
tb_ins_bank['643,87'] = 'SC88Pro_JP8 BsLead 2'
tb_ins_bank['643,98'] = 'SC88Pro_GlockenChime'
tb_ins_bank['643,99'] = 'SC88Pro_Nylon+Rhodes'
tb_ins_bank['643,101'] = 'SC88Pro_LFO Pad'
tb_ins_bank['643,102'] = 'SC88Pro_Reso Panner'
tb_ins_bank['643,120'] = 'SC88Pro_Bass Slide'
tb_ins_bank['643,122'] = 'SC88Pro_Bubble'
tb_ins_bank['643,123'] = 'SC88Pro_Growl'
tb_ins_bank['643,124'] = 'SC88Pro_Wind Chimes'
tb_ins_bank['643,125'] = 'SC88Pro_Siren'
tb_ins_bank['643,126'] = 'SC88Pro_Footsteps'
tb_ins_bank['643,127'] = 'SC88Pro_Big Shot'
tb_ins_bank['515,27'] = 'SC88Pro_JC Clean Gt.'
tb_ins_bank['515,30'] = 'SC88Pro_Dist.Fast :'
tb_ins_bank['515,33'] = 'SC88Pro_Rock Bass'
tb_ins_bank['515,35'] = 'SC88Pro_Syn Fretless'
tb_ins_bank['515,38'] = 'SC88Pro_JP-8 Bass'
tb_ins_bank['515,39'] = 'SC88Pro_MG Bass'
tb_ins_bank['515,62'] = 'SC88Pro_MKS Brass'
tb_ins_bank['515,80'] = 'SC88Pro_CC Solo'
tb_ins_bank['515,81'] = 'SC88Pro_Big Lead'
tb_ins_bank['515,87'] = 'SC88Pro_JP8 BsLead 1'
tb_ins_bank['515,89'] = 'SC88Pro_OB Soft Pad'
tb_ins_bank['515,96'] = 'SC88Pro_Rattle Pad'
tb_ins_bank['515,97'] = 'SC88Pro_Hols Strings'
tb_ins_bank['515,98'] = 'SC88Pro_Loud Glock'
tb_ins_bank['515,99'] = 'SC88Pro_HollowReleas'
tb_ins_bank['515,101'] = 'SC88Pro_Auhbient'
tb_ins_bank['515,102'] = 'SC88Pro_Big Panner'
tb_ins_bank['515,120'] = 'SC88Pro_Dist.CutNoiz'
tb_ins_bank['515,122'] = 'SC88Pro_Stream'
tb_ins_bank['515,123'] = 'SC88Pro_Kitty'
tb_ins_bank['515,124'] = 'SC88Pro_Scratch'
tb_ins_bank['515,125'] = 'SC88Pro_Car-Crash'
tb_ins_bank['515,126'] = 'SC88Pro_Heart Beat'
tb_ins_bank['515,127'] = 'SC88Pro_Eruption'
tb_ins_bank['387,27'] = 'SC88Pro_Open Hard 2'
tb_ins_bank['387,29'] = 'SC88Pro_More Drive'
tb_ins_bank['387,30'] = 'SC88Pro_Distortion:'
tb_ins_bank['387,33'] = 'SC88Pro_Jazz Bass 2'
tb_ins_bank['387,34'] = 'SC88Pro_Picked Bass4'
tb_ins_bank['387,35'] = 'SC88Pro_Fretless Bs4'
tb_ins_bank['387,38'] = 'SC88Pro_JP-4 Bass'
tb_ins_bank['387,39'] = 'SC88Pro_Seq Bass'
tb_ins_bank['387,45'] = 'SC88Pro_St.Pizzicato'
tb_ins_bank['387,48'] = 'SC88Pro_Cello sect.'
tb_ins_bank['387,50'] = 'SC88Pro_JP Strings'
tb_ins_bank['387,60'] = 'SC88Pro_Wide FreHrns'
tb_ins_bank['387,62'] = 'SC88Pro_SH-5 Brass'
tb_ins_bank['387,73'] = 'SC88Pro_Flt Travelso'
tb_ins_bank['387,80'] = 'SC88Pro_Mellow FM'
tb_ins_bank['387,81'] = 'SC88Pro_Feline GR'
tb_ins_bank['387,86'] = 'SC88Pro_5th Ana.Clav'
tb_ins_bank['387,87'] = 'SC88Pro_JUNO Rave'
tb_ins_bank['387,88'] = 'SC88Pro_Bell Heaven'
tb_ins_bank['387,89'] = 'SC88Pro_Rotary Strng'
tb_ins_bank['387,90'] = 'SC88Pro_Poly King'
tb_ins_bank['387,92'] = 'SC88Pro_7thBelPad'
tb_ins_bank['387,96'] = 'SC88Pro_Anklung Pad'
tb_ins_bank['387,97'] = 'SC88Pro_Prologue 2'
tb_ins_bank['387,98'] = 'SC88Pro_Round Glock'
tb_ins_bank['387,99'] = 'SC88Pro_Harpvox'
tb_ins_bank['387,101'] = 'SC88Pro_Abduction'
tb_ins_bank['387,102'] = 'SC88Pro_Echo Pan 2'
tb_ins_bank['387,104'] = 'SC88Pro_Sitar 3'
tb_ins_bank['387,120'] = 'SC88Pro_Gt.CutNoise2'
tb_ins_bank['387,122'] = 'SC88Pro_Wind'
tb_ins_bank['387,123'] = 'SC88Pro_Bird 2'
tb_ins_bank['387,124'] = 'SC88Pro_Door'
tb_ins_bank['387,125'] = 'SC88Pro_Car-Pass'
tb_ins_bank['387,126'] = 'SC88Pro_Punch'
tb_ins_bank['387,127'] = 'SC88Pro_Explosion'
tb_ins_bank['259,2'] = 'SC88Pro_EG+Rhodes 2'
tb_ins_bank['259,17'] = 'SC88Pro_E.Organ 16+2'
tb_ins_bank['259,27'] = 'SC88Pro_Open Hard 1'
tb_ins_bank['259,28'] = 'SC88Pro_TC Muted Gt.'
tb_ins_bank['259,29'] = 'SC88Pro_Overdrive 3'
tb_ins_bank['259,30'] = 'SC88Pro_Dazed Guitar'
tb_ins_bank['259,33'] = 'SC88Pro_Jazz Bass'
tb_ins_bank['259,34'] = 'SC88Pro_Picked Bass3'
tb_ins_bank['259,35'] = 'SC88Pro_Fretless Bs3'
tb_ins_bank['259,38'] = 'SC88Pro_CS Bass'
tb_ins_bank['259,39'] = 'SC88Pro_Modular Bass'
tb_ins_bank['259,45'] = 'SC88Pro_Chamber Pizz'
tb_ins_bank['259,48'] = 'SC88Pro_ChamberStr:'
tb_ins_bank['259,50'] = 'SC88Pro_StackStrings'
tb_ins_bank['259,51'] = 'SC88Pro_JUNO Strings'
tb_ins_bank['259,56'] = 'SC88Pro_Trumpet   :'
tb_ins_bank['259,57'] = 'SC88Pro_Twin bones'
tb_ins_bank['259,60'] = 'SC88Pro_Horn + Orche'
tb_ins_bank['259,61'] = 'SC88Pro_Bones Sect.'
tb_ins_bank['259,62'] = 'SC88Pro_Stack Brass'
tb_ins_bank['259,63'] = 'SC88Pro_Warm Brass'
tb_ins_bank['259,73'] = 'SC88Pro_Flute Exp.'
tb_ins_bank['259,80'] = 'SC88Pro_Hollow Mini'
tb_ins_bank['259,81'] = 'SC88Pro_Pulse Saw'
tb_ins_bank['259,82'] = 'SC88Pro_Pure PanLead'
tb_ins_bank['259,86'] = 'SC88Pro_5th Lead'
tb_ins_bank['259,87'] = 'SC88Pro_Fat & Perky'
tb_ins_bank['259,88'] = 'SC88Pro_New Age Pad'
tb_ins_bank['259,89'] = 'SC88Pro_Horn Pad'
tb_ins_bank['259,90'] = 'SC88Pro_Polysynth 2'
tb_ins_bank['259,91'] = 'SC88Pro_SC Heaven'
tb_ins_bank['259,92'] = 'SC88Pro_JP8 Sqr Pad'
tb_ins_bank['259,93'] = 'SC88Pro_Panner Pad'
tb_ins_bank['259,94'] = 'SC88Pro_Vox Sweep'
tb_ins_bank['259,96'] = 'SC88Pro_African wood'
tb_ins_bank['259,97'] = 'SC88Pro_Prologue'
tb_ins_bank['259,98'] = 'SC88Pro_Soft Crystal'
tb_ins_bank['259,99'] = 'SC88Pro_Nylon Harp'
tb_ins_bank['259,100'] = 'SC88Pro_OB Stab'
tb_ins_bank['259,101'] = 'SC88Pro_50\'s Sci-Fi'
tb_ins_bank['259,102'] = 'SC88Pro_Echo Pan'
tb_ins_bank['259,104'] = 'SC88Pro_Detune Sitar'
tb_ins_bank['259,119'] = 'SC88Pro_Reverse Cym3'
tb_ins_bank['259,120'] = 'SC88Pro_String Slap'
tb_ins_bank['259,122'] = 'SC88Pro_Thunder'
tb_ins_bank['259,123'] = 'SC88Pro_Horse-Gallop'
tb_ins_bank['259,124'] = 'SC88Pro_DoorCreaking'
tb_ins_bank['259,125'] = 'SC88Pro_Car-Stop'
tb_ins_bank['259,126'] = 'SC88Pro_Screaming'
tb_ins_bank['259,127'] = 'SC88Pro_Lasergun'
tb_ins_bank['131,2'] = 'SC88Pro_EG+Rhodes 1'
tb_ins_bank['131,6'] = 'SC88Pro_Harpsichord2'
tb_ins_bank['131,8'] = 'SC88Pro_Pop Celesta'
tb_ins_bank['131,11'] = 'SC88Pro_Pop Vibe.'
tb_ins_bank['131,15'] = 'SC88Pro_Santur 2'
tb_ins_bank['131,16'] = 'SC88Pro_Organ 101'
tb_ins_bank['131,17'] = 'SC88Pro_Jazz Organ'
tb_ins_bank['131,22'] = 'SC88Pro_Harmonica 2'
tb_ins_bank['131,26'] = 'SC88Pro_Mellow Gt.'
tb_ins_bank['131,27'] = 'SC88Pro_Clean Half'
tb_ins_bank['131,28'] = 'SC88Pro_Muted Dis.Gt'
tb_ins_bank['131,29'] = 'SC88Pro_Overdrive 2'
tb_ins_bank['131,30'] = 'SC88Pro_Dist. Gt2 :'
tb_ins_bank['131,32'] = 'SC88Pro_Rockabilly'
tb_ins_bank['131,33'] = 'SC88Pro_Fingered Bs2'
tb_ins_bank['131,34'] = 'SC88Pro_Picked Bass2'
tb_ins_bank['131,35'] = 'SC88Pro_Fretless Bs2'
tb_ins_bank['131,36'] = 'SC88Pro_Slap Pop'
tb_ins_bank['131,38'] = 'SC88Pro_SynthBass101'
tb_ins_bank['131,39'] = 'SC88Pro_SynthBass201'
tb_ins_bank['131,40'] = 'SC88Pro_Violin Atk:'
tb_ins_bank['131,41'] = 'SC88Pro_Viola Atk.:'
tb_ins_bank['131,42'] = 'SC88Pro_Cello Atk.:'
tb_ins_bank['131,45'] = 'SC88Pro_Vcs&Cbs Pizz'
tb_ins_bank['131,48'] = 'SC88Pro_Bright Str:'
tb_ins_bank['131,49'] = 'SC88Pro_SlowStrings2'
tb_ins_bank['131,50'] = 'SC88Pro_OB Strings'
tb_ins_bank['131,51'] = 'SC88Pro_Syn.Strings5'
tb_ins_bank['131,56'] = 'SC88Pro_Trumpet 2'
tb_ins_bank['131,57'] = 'SC88Pro_Trombone 2'
tb_ins_bank['131,58'] = 'SC88Pro_Tuba 2'
tb_ins_bank['131,60'] = 'SC88Pro_Fr.Horn 2'
tb_ins_bank['131,61'] = 'SC88Pro_Brass ff'
tb_ins_bank['131,62'] = 'SC88Pro_JUNO Brass'
tb_ins_bank['131,63'] = 'SC88Pro_Soft Brass'
tb_ins_bank['131,66'] = 'SC88Pro_Tenor Sax :'
tb_ins_bank['131,67'] = 'SC88Pro_Bari. Sax :'
tb_ins_bank['131,72'] = 'SC88Pro_Piccolo   :'
tb_ins_bank['131,73'] = 'SC88Pro_Flute 2   :'
tb_ins_bank['131,77'] = 'SC88Pro_Shakuhachi:'
tb_ins_bank['131,78'] = 'SC88Pro_Whistle 2'
tb_ins_bank['131,80'] = 'SC88Pro_MG Square'
tb_ins_bank['131,81'] = 'SC88Pro_OB2 Saw'
tb_ins_bank['131,82'] = 'SC88Pro_Vent Synth'
tb_ins_bank['131,83'] = 'SC88Pro_TB Lead'
tb_ins_bank['131,86'] = 'SC88Pro_Big Fives'
tb_ins_bank['131,87'] = 'SC88Pro_Big & Raw'
tb_ins_bank['131,88'] = 'SC88Pro_Fantasia 2'
tb_ins_bank['131,89'] = 'SC88Pro_Thick Matrix'
tb_ins_bank['131,90'] = 'SC88Pro_80\'s PolySyn'
tb_ins_bank['131,91'] = 'SC88Pro_Heaven II'
tb_ins_bank['131,92'] = 'SC88Pro_SoftBellPad'
tb_ins_bank['131,93'] = 'SC88Pro_Tine Pad'
tb_ins_bank['131,94'] = 'SC88Pro_Vox Pad'
tb_ins_bank['131,95'] = 'SC88Pro_Polar Pad'
tb_ins_bank['131,96'] = 'SC88Pro_Harmo Rain'
tb_ins_bank['131,97'] = 'SC88Pro_Ancestral'
tb_ins_bank['131,98'] = 'SC88Pro_Syn Mallet'
tb_ins_bank['131,99'] = 'SC88Pro_Warm Atmos'
tb_ins_bank['131,100'] = 'SC88Pro_Shining Star'
tb_ins_bank['131,101'] = 'SC88Pro_Goblinson'
tb_ins_bank['131,102'] = 'SC88Pro_Echo Bell'
tb_ins_bank['131,103'] = 'SC88Pro_Star Theme 2'
tb_ins_bank['131,104'] = 'SC88Pro_Sitar 2'
tb_ins_bank['131,105'] = 'SC88Pro_Muted Banjo'
tb_ins_bank['131,106'] = 'SC88Pro_Tsugaru'
tb_ins_bank['131,107'] = 'SC88Pro_Gu Zheng'
tb_ins_bank['131,111'] = 'SC88Pro_Shanai 2'
tb_ins_bank['131,114'] = 'SC88Pro_Island Mlt'
tb_ins_bank['131,116'] = 'SC88Pro_Small Taiko'
tb_ins_bank['131,117'] = 'SC88Pro_Real Tom'
tb_ins_bank['131,119'] = 'SC88Pro_Reverse Cym2'
tb_ins_bank['131,120'] = 'SC88Pro_Gt.Cut Noise'
tb_ins_bank['131,121'] = 'SC88Pro_Fl.Key Click'
tb_ins_bank['131,122'] = 'SC88Pro_Rain'
tb_ins_bank['131,123'] = 'SC88Pro_Dog'
tb_ins_bank['131,124'] = 'SC88Pro_Telephone 2'
tb_ins_bank['131,125'] = 'SC88Pro_Car-Engine'
tb_ins_bank['131,126'] = 'SC88Pro_Laughing'
tb_ins_bank['131,127'] = 'SC88Pro_Machine Gun'
tb_ins_bank['3,0'] = 'SC88Pro_Piano 1'
tb_ins_bank['3,1'] = 'SC88Pro_Piano 2'
tb_ins_bank['3,2'] = 'SC88Pro_Piano 3'
tb_ins_bank['3,3'] = 'SC88Pro_Honky-tonk'
tb_ins_bank['3,4'] = 'SC88Pro_E.Piano 1'
tb_ins_bank['3,5'] = 'SC88Pro_E.Piano 2'
tb_ins_bank['3,6'] = 'SC88Pro_Harpsichord'
tb_ins_bank['3,7'] = 'SC88Pro_Clav.'
tb_ins_bank['3,8'] = 'SC88Pro_Celesta'
tb_ins_bank['3,9'] = 'SC88Pro_Glockenspiel'
tb_ins_bank['3,10'] = 'SC88Pro_Music Box'
tb_ins_bank['3,11'] = 'SC88Pro_Vibraphone'
tb_ins_bank['3,12'] = 'SC88Pro_Marimba'
tb_ins_bank['3,13'] = 'SC88Pro_Xylophone'
tb_ins_bank['3,14'] = 'SC88Pro_Tubular-bell'
tb_ins_bank['3,15'] = 'SC88Pro_Santur'
tb_ins_bank['3,16'] = 'SC88Pro_Organ 1'
tb_ins_bank['3,17'] = 'SC88Pro_Organ 2'
tb_ins_bank['3,18'] = 'SC88Pro_Organ 3'
tb_ins_bank['3,19'] = 'SC88Pro_Church Org.1'
tb_ins_bank['3,20'] = 'SC88Pro_Reed Organ'
tb_ins_bank['3,21'] = 'SC88Pro_Accordion Fr'
tb_ins_bank['3,22'] = 'SC88Pro_Harmonica'
tb_ins_bank['3,23'] = 'SC88Pro_Bandoneon'
tb_ins_bank['3,24'] = 'SC88Pro_Nylon-str.Gt'
tb_ins_bank['3,25'] = 'SC88Pro_Steel-str.Gt'
tb_ins_bank['3,26'] = 'SC88Pro_Jazz Gt.'
tb_ins_bank['3,27'] = 'SC88Pro_Clean Gt.'
tb_ins_bank['3,28'] = 'SC88Pro_Muted Gt.'
tb_ins_bank['3,29'] = 'SC88Pro_Overdrive Gt'
tb_ins_bank['3,30'] = 'SC88Pro_DistortionGt'
tb_ins_bank['3,31'] = 'SC88Pro_Gt.Harmonics'
tb_ins_bank['3,32'] = 'SC88Pro_Acoustic Bs.'
tb_ins_bank['3,33'] = 'SC88Pro_Fingered Bs.'
tb_ins_bank['3,34'] = 'SC88Pro_Picked Bass'
tb_ins_bank['3,35'] = 'SC88Pro_Fretless Bs.'
tb_ins_bank['3,36'] = 'SC88Pro_Slap Bass 1'
tb_ins_bank['3,37'] = 'SC88Pro_Slap Bass 2'
tb_ins_bank['3,38'] = 'SC88Pro_Synth Bass 1'
tb_ins_bank['3,39'] = 'SC88Pro_Synth Bass 2'
tb_ins_bank['3,40'] = 'SC88Pro_Violin    :'
tb_ins_bank['3,41'] = 'SC88Pro_Viola     :'
tb_ins_bank['3,42'] = 'SC88Pro_Cello     :'
tb_ins_bank['3,43'] = 'SC88Pro_Contrabass'
tb_ins_bank['3,44'] = 'SC88Pro_Tremolo Str'
tb_ins_bank['3,45'] = 'SC88Pro_PizzicatoStr'
tb_ins_bank['3,46'] = 'SC88Pro_Harp'
tb_ins_bank['3,47'] = 'SC88Pro_Timpani'
tb_ins_bank['3,48'] = 'SC88Pro_Strings   :'
tb_ins_bank['3,49'] = 'SC88Pro_Slow Strings'
tb_ins_bank['3,50'] = 'SC88Pro_Syn.Strings1'
tb_ins_bank['3,51'] = 'SC88Pro_Syn.Strings2'
tb_ins_bank['3,52'] = 'SC88Pro_Choir Aahs'
tb_ins_bank['3,53'] = 'SC88Pro_Voice Oohs'
tb_ins_bank['3,54'] = 'SC88Pro_SynVox'
tb_ins_bank['3,55'] = 'SC88Pro_OrchestraHit'
tb_ins_bank['3,56'] = 'SC88Pro_Trumpet'
tb_ins_bank['3,57'] = 'SC88Pro_Trombone'
tb_ins_bank['3,58'] = 'SC88Pro_Tuba'
tb_ins_bank['3,59'] = 'SC88Pro_MutedTrumpet'
tb_ins_bank['3,60'] = 'SC88Pro_French Horns'
tb_ins_bank['3,61'] = 'SC88Pro_Brass 1'
tb_ins_bank['3,62'] = 'SC88Pro_Synth Brass1'
tb_ins_bank['3,63'] = 'SC88Pro_Synth Brass2'
tb_ins_bank['3,64'] = 'SC88Pro_Soprano Sax'
tb_ins_bank['3,65'] = 'SC88Pro_Alto Sax'
tb_ins_bank['3,66'] = 'SC88Pro_Tenor Sax'
tb_ins_bank['3,67'] = 'SC88Pro_Baritone Sax'
tb_ins_bank['3,68'] = 'SC88Pro_Oboe'
tb_ins_bank['3,69'] = 'SC88Pro_English Horn'
tb_ins_bank['3,70'] = 'SC88Pro_Bassoon'
tb_ins_bank['3,71'] = 'SC88Pro_Clarinet'
tb_ins_bank['3,72'] = 'SC88Pro_Piccolo'
tb_ins_bank['3,73'] = 'SC88Pro_Flute'
tb_ins_bank['3,74'] = 'SC88Pro_Recorder'
tb_ins_bank['3,75'] = 'SC88Pro_Pan Flute'
tb_ins_bank['3,76'] = 'SC88Pro_Bottle Blow'
tb_ins_bank['3,77'] = 'SC88Pro_Shakuhachi'
tb_ins_bank['3,78'] = 'SC88Pro_Whistle'
tb_ins_bank['3,79'] = 'SC88Pro_Ocarina'
tb_ins_bank['3,80'] = 'SC88Pro_Square Wave'
tb_ins_bank['3,81'] = 'SC88Pro_Saw Wave'
tb_ins_bank['3,82'] = 'SC88Pro_Syn.Calliope'
tb_ins_bank['3,83'] = 'SC88Pro_Chiffer Lead'
tb_ins_bank['3,84'] = 'SC88Pro_Charang'
tb_ins_bank['3,85'] = 'SC88Pro_Solo Vox'
tb_ins_bank['3,86'] = 'SC88Pro_5th Saw Wave'
tb_ins_bank['3,87'] = 'SC88Pro_Bass & Lead'
tb_ins_bank['3,88'] = 'SC88Pro_Fantasia'
tb_ins_bank['3,89'] = 'SC88Pro_Warm Pad'
tb_ins_bank['3,90'] = 'SC88Pro_Polysynth'
tb_ins_bank['3,91'] = 'SC88Pro_Space Voice'
tb_ins_bank['3,92'] = 'SC88Pro_Bowed Glass'
tb_ins_bank['3,93'] = 'SC88Pro_Metal Pad'
tb_ins_bank['3,94'] = 'SC88Pro_Halo Pad'
tb_ins_bank['3,95'] = 'SC88Pro_Sweep Pad'
tb_ins_bank['3,96'] = 'SC88Pro_Ice Rain'
tb_ins_bank['3,97'] = 'SC88Pro_Soundtrack'
tb_ins_bank['3,98'] = 'SC88Pro_Crystal'
tb_ins_bank['3,99'] = 'SC88Pro_Atmosphere'
tb_ins_bank['3,100'] = 'SC88Pro_Brightness'
tb_ins_bank['3,101'] = 'SC88Pro_Goblin'
tb_ins_bank['3,102'] = 'SC88Pro_Echo Drops'
tb_ins_bank['3,103'] = 'SC88Pro_Star Theme'
tb_ins_bank['3,104'] = 'SC88Pro_Sitar'
tb_ins_bank['3,105'] = 'SC88Pro_Banjo'
tb_ins_bank['3,106'] = 'SC88Pro_Shamisen'
tb_ins_bank['3,107'] = 'SC88Pro_Koto'
tb_ins_bank['3,108'] = 'SC88Pro_Kalimba'
tb_ins_bank['3,109'] = 'SC88Pro_Bagpipe'
tb_ins_bank['3,110'] = 'SC88Pro_Fiddle'
tb_ins_bank['3,111'] = 'SC88Pro_Shanai'
tb_ins_bank['3,112'] = 'SC88Pro_Tinkle Bell'
tb_ins_bank['3,113'] = 'SC88Pro_Agogo'
tb_ins_bank['3,114'] = 'SC88Pro_Steel Drums'
tb_ins_bank['3,115'] = 'SC88Pro_Woodblock'
tb_ins_bank['3,116'] = 'SC88Pro_Taiko'
tb_ins_bank['3,117'] = 'SC88Pro_Melo. Tom 1'
tb_ins_bank['3,118'] = 'SC88Pro_Synth Drum'
tb_ins_bank['3,119'] = 'SC88Pro_Reverse Cym.'
tb_ins_bank['3,120'] = 'SC88Pro_Gt.FretNoise'
tb_ins_bank['3,121'] = 'SC88Pro_Breath Noise'
tb_ins_bank['3,122'] = 'SC88Pro_Seashore'
tb_ins_bank['3,123'] = 'SC88Pro_Bird'
tb_ins_bank['3,124'] = 'SC88Pro_Telephone 1'
tb_ins_bank['3,125'] = 'SC88Pro_Helicopter'
tb_ins_bank['3,126'] = 'SC88Pro_Applause'
tb_ins_bank['3,127'] = 'SC88Pro_Gun Shot'
tb_ins_bank['5122,16'] = 'SC88_Organ Bass'
tb_ins_bank['5122,24'] = 'SC88_Lequint Gt.'
tb_ins_bank['4226,16'] = 'SC88_Even Bar'
tb_ins_bank['4098,16'] = 'SC88_Organ 4'
tb_ins_bank['4098,17'] = 'SC88_Organ 5'
tb_ins_bank['4098,19'] = 'SC88_Trem.Flute'
tb_ins_bank['4098,24'] = 'SC88_Nylon Gt.2'
tb_ins_bank['4098,25'] = 'SC88_Steel Gt.2'
tb_ins_bank['3330,4'] = 'SC88_MellowRhodes'
tb_ins_bank['3202,4'] = 'SC88_Hard Rhodes'
tb_ins_bank['3202,30'] = 'SC88_Rock Rhythm2'
tb_ins_bank['3202,30'] = 'SC88_M.G'
tb_ins_bank['3202,56'] = 'SC88_Warm Tp.'
tb_ins_bank['3202,119'] = 'SC88_Rev.Tom 2'
tb_ins_bank['3074,4'] = 'SC88_60\'s E.Piano'
tb_ins_bank['3074,5'] = 'SC88_Hard FM EP'
tb_ins_bank['3074,6'] = 'SC88_Harpsi.o'
tb_ins_bank['3074,12'] = 'SC88_Log Drum'
tb_ins_bank['3074,16'] = 'SC88_Cheese Organ'
tb_ins_bank['3074,18'] = 'SC88_Rotary Org.F'
tb_ins_bank['3074,19'] = 'SC88_Organ Flute'
tb_ins_bank['3074,24'] = 'SC88_Velo Harmnix'
tb_ins_bank['3074,30'] = 'SC88_Rock Rhythm'
tb_ins_bank['3074,30'] = 'SC88_M.G'
tb_ins_bank['3074,48'] = 'SC88_Velo Strings'
tb_ins_bank['3074,56'] = 'SC88_Bright Tp.'
tb_ins_bank['3074,105'] = 'SC88_Oud'
tb_ins_bank['3074,119'] = 'SC88_Rev.Tom 1'
tb_ins_bank['2434,39'] = 'SC88_Smooth Bass'
tb_ins_bank['2434,98'] = 'SC88_Gamelimba'
tb_ins_bank['2306,16'] = 'SC88_60\'s Organ 3'
tb_ins_bank['2306,30'] = 'SC88_5th Dist.'
tb_ins_bank['2306,39'] = 'SC88_SH101 Bass 2'
tb_ins_bank['2306,98'] = 'SC88_Bell Harp'
tb_ins_bank['2178,12'] = 'SC88_Barafon 2'
tb_ins_bank['2178,16'] = 'SC88_60\'s Organ 2'
tb_ins_bank['2178,30'] = 'SC88_Power.Gt.2'
tb_ins_bank['2178,39'] = 'SC88_SH101 Base 1'
tb_ins_bank['2178,63'] = 'SC88_Velo Brass 2'
tb_ins_bank['2178,98'] = 'SC88_Air Bells'
tb_ins_bank['2178,119'] = 'SC88_Rev.ConBD'
tb_ins_bank['2050,0'] = 'SC88_Piano 1d'
tb_ins_bank['2050,4'] = 'SC88_FM+SA EP'
tb_ins_bank['2050,5'] = 'SC88_St.FM EP'
tb_ins_bank['2050,6'] = 'SC88_Harpsi.w'
tb_ins_bank['2050,12'] = 'SC88_Barafon'
tb_ins_bank['2050,16'] = 'SC88_60\'s Organ 1'
tb_ins_bank['2050,18'] = 'SC88_Rotary Org.S'
tb_ins_bank['2050,19'] = 'SC88_Church Org.3'
tb_ins_bank['2050,24'] = 'SC88_Nylon Gt.o'
tb_ins_bank['2050,25'] = 'SC88_Mandolin'
tb_ins_bank['2050,28'] = 'SC88_Funk Gt.2'
tb_ins_bank['2050,30'] = 'SC88_Power Guitar'
tb_ins_bank['2050,31'] = 'SC88_Ac.Gt.Harmnx'
tb_ins_bank['2050,38'] = 'SC88_Reso SH Bass'
tb_ins_bank['2050,39'] = 'SC88_Rubber Bass'
tb_ins_bank['2050,48'] = 'SC88_St.Strings'
tb_ins_bank['2050,55'] = 'SC88_Lo Fi Rave'
tb_ins_bank['2050,60'] = 'SC88_Horn Orch'
tb_ins_bank['2050,61'] = 'SC88_Brass Fall'
tb_ins_bank['2050,62'] = 'SC88_Octave Brass'
tb_ins_bank['2050,63'] = 'SC88_Velo Brass 1'
tb_ins_bank['2050,81'] = 'SC88_Waspy Synth'
tb_ins_bank['2050,98'] = 'SC88_Choral Bells'
tb_ins_bank['2050,104'] = 'SC88_Tamboura'
tb_ins_bank['2050,105'] = 'SC88_Gopichant'
tb_ins_bank['2050,107'] = 'SC88_Kanoon'
tb_ins_bank['2050,111'] = 'SC88_Hichiriki'
tb_ins_bank['2050,112'] = 'SC88_RAMA Cymbal'
tb_ins_bank['2050,119'] = 'SC88_Rev.Kick 1'
tb_ins_bank['1410,48'] = 'SC88_Choir Str.'
tb_ins_bank['1410,112'] = 'SC88_St.Gamelan'
tb_ins_bank['1282,38'] = 'SC88_Tekno Bass'
tb_ins_bank['1282,48'] = 'SC88_Tremolo Orch'
tb_ins_bank['1282,49'] = 'SC88_St.Slow Str.'
tb_ins_bank['1282,55'] = 'SC88_Double Hit'
tb_ins_bank['1282,95'] = 'SC88_Celestial Pd'
tb_ins_bank['1282,112'] = 'SC88_Gamelan Gong'
tb_ins_bank['10243,22'] = 'SC88Pro_Guide Harmonica'
tb_ins_bank['10242,22'] = 'SC88_Guide Harmonica'
tb_ins_bank['10241,22'] = 'SC55_Guide Harmonica'
tb_ins_bank['10243,64'] = 'SC88Pro_Guide Soprano Sax'
tb_ins_bank['10242,64'] = 'SC88_Guide Soprano Sax'
tb_ins_bank['10241,64'] = 'SC55_Guide Soprano Sax'
tb_ins_bank['10243,68'] = 'SC88Pro_Guide Oboe'
tb_ins_bank['10242,68'] = 'SC88_Guide Oboe'
tb_ins_bank['10241,68'] = 'SC55_Guide Oboe'
tb_ins_bank['10243,11'] = 'SC88Pro_Guide Vibraphone'
tb_ins_bank['10242,11'] = 'SC88_Guide Vibraphone'
tb_ins_bank['10241,11'] = 'SC55_Guide Vibraphone'
tb_ins_bank['10243,73'] = 'SC88Pro_Guide Flute'
tb_ins_bank['10242,73'] = 'SC88_Guide Flute'
tb_ins_bank['10241,73'] = 'SC55_Guide Flute'
tb_ins_bank['10371,73'] = 'SC88Pro_Guide Flute'
tb_ins_bank['10370,73'] = 'SC88_Guide Flute'
tb_ins_bank['10369,73'] = 'SC55_Guide Flute'
tb_ins_bank['10243,34'] = 'SC88Pro_Pingered Bs.'
tb_ins_bank['12291,34'] = 'SC88Pro_Pingered Bs./Harm.'
tb_ins_bank['10241,29'] = 'SC55_Fh_OverdriveGt'
tb_ins_bank['10241,30'] = 'SC55_Rh2_Dist.Gt.'
tb_ins_bank['11265,30'] = 'SC55_Rh_Feedback Gt.'
tb_ins_bank['10370,28'] = 'SC88_Rh Mt_Muted Dis.Gt'
tb_ins_bank['10242,29'] = 'SC88_Rh_OverdriveGt'
tb_ins_bank['10242,30'] = 'SC88_Rh2_DistortionGt'
tb_ins_bank['10370,30'] = 'SC88_Rh2_Dist. Gt2'
tb_ins_bank['11266,30'] = 'SC88_Rh_Feedback Gt'
tb_ins_bank['11394,30'] = 'SC88_Rh_Feedback Gt2'
tb_ins_bank['12290,30'] = 'SC88_Rh_Power Guitar'
tb_ins_bank['13314,30'] = 'SC88_Rh_Rock Rhythm'
tb_ins_bank['13442,30'] = 'SC88_Rh_Rock Rhythm2'
tb_ins_bank['10371,28'] = 'SC88Pro_Rh Mt_Muted Dis.Gt'
tb_ins_bank['10243,29'] = 'SC88Pro_Fh_Overdrive Gt'
tb_ins_bank['10371,29'] = 'SC88Pro_Rh_Overdrive 2'
tb_ins_bank['10499,29'] = 'SC88Pro_Rh_Overdrive 3'
tb_ins_bank['10627,29'] = 'SC88Pro_Rh_More Drive'
tb_ins_bank['11267,29'] = 'SC88Pro_Fh_LP OverDrvGt'
tb_ins_bank['11395,29'] = 'SC88Pro_Fh_LP OverDrv:'
tb_ins_bank['10243,30'] = 'SC88Pro_Rh_DistortionGt'
tb_ins_bank['10371,30'] = 'SC88Pro_Rh2_Dist. Gt2 :'
tb_ins_bank['10627,30'] = 'SC88Pro_Rh_Distortion:'
tb_ins_bank['10755,30'] = 'SC88Pro_Rh_Dist.Fast :'
tb_ins_bank['11267,30'] = 'SC88Pro_Rh_Feedback Gt.'
tb_ins_bank['11395,30'] = 'SC88Pro_Rh_Feedback Gt2'
tb_ins_bank['12291,30'] = 'SC88Pro_Rh_Power Guitar'
tb_ins_bank['13315,30'] = 'SC88Pro_Rh_Rock Rhythm'
tb_ins_bank['13443,30'] = 'SC88Pro_Rh_Rock Rhythm2'

function getset_track_info(take)
    reaper.Undo_BeginBlock()
    MediaTrack = reaper.GetMediaItemTake_Track(take)
    retval, tk_name = reaper.GetSetMediaTrackInfo_String(MediaTrack, 'P_NAME', '', false)
    tk_name = string.gsub(tk_name, '\'', '\a')
    num = reaper.GetMediaTrackInfo_Value(MediaTrack, 'I_MIDIHWOUT')
    if num == -1 then
        port = 0
        chan = 0
    else
        port = math.modf(num / 32) + 1
        chan = math.fmod(num, 32)
        chan = string.match(chan, '%d+')
    end
    msg = tk_name .. ',' .. port .. ',' .. chan
    bl, input = reaper.GetUserInputs('GetSet Track Info', 3, 'Track Name 轨道名称:,Track Midi Port 端口:,Track Midi Channel 通道 :,extrawidth=200', msg)
    if bl == false then return end
    idx = string.find(input, ',', 1)
    name_in = string.sub(input, 0, idx - 1)
    name_in = string.gsub(name_in, '\a', '\'')
    reaper.GetSetMediaTrackInfo_String(MediaTrack, 'P_NAME', name_in, true)
    input2 = string.sub(input, idx + 1)
    port_new, chan_new = string.match(input2, '(%d+),(%d+)')
    port_new = tonumber(port_new) - 1
    if port_new > 15 then port_new = 15 end
    chan_new = tonumber(chan_new)
    if chan_new > 16 then chan_new = 16 end
    num_new = port_new * 32 + chan_new
    reaper.SetMediaTrackInfo_Value(MediaTrack, 'I_MIDIHWOUT', num_new)
    reaper.Undo_EndBlock('设置轨道面板信息', -1)

end -- function end

function openlist(take)
    edititem = reaper.GetMediaItemTake_Item(take)
    reaper.SelectAllMediaItems(0,false)
    reaper.SetMediaItemSelected(edititem , true)
    reaper.Main_OnCommand(40153,0) -- open midi editor
    editor=reaper.MIDIEditor_GetActive()
    reaper.MIDIEditor_OnCommand(editor , 40056) -- list
end  --funtion end

function O_Song_Time()
    wavitem_pos = 0
    wavitem1 = reaper.GetMediaItem(0, 0)
    wavitem2 = reaper.GetMediaItem(0, 1)
    if wavitem1 then
        take1 = reaper.GetTake(wavitem1, 0)
        if not reaper.TakeIsMIDI(take1) then
            wavitem_pos = reaper.GetMediaItemInfo_Value(wavitem1, 'D_POSITION')
        else
            if wavitem2 then
                take2 = reaper.GetTake(wavitem2, 0)
                if not reaper.TakeIsMIDI(take2) then
                    wavitem_pos = reaper.GetMediaItemInfo_Value(wavitem2, 'D_POSITION')
                end
            end
        end
    end

end -- function end
O_Song_Time()

function getmark()
    idx = 0
    marktb = {}
    MKname = ''
    retval, isrgn, pos, rgnend, markname, markrgnindexnumber = reaper.EnumProjectMarkers(idx)
    while retval ~= 0 do
        if markname ~= '' then
            table.insert(marktb, pos .. ',' .. markname)
        end
        idx = idx + 1
        retval, isrgn, pos, rgnend, markname, markrgnindexnumber = reaper.EnumProjectMarkers(idx)
    end
end -- getmark end
getmark()

function MaxEvent()
    evtinfo = {}
    maxdata = ''
    datacount = 0
    measureend = 0

    integer = reaper.CountMediaItems(0)
    idx = 0
    while idx < integer do
        MediaItem = reaper.GetMediaItem(0, idx)
        idx = idx + 1
        take = reaper.GetTake(MediaItem, 0)

        if take ~= nil and reaper.TakeIsMIDI(take) then
            evtidx = 0
            retval, selected, muted, ppqpos, msg = reaper.MIDI_GetEvt(take, evtidx)

            while retval do
                pos = reaper.MIDI_GetProjTimeFromPPQPos(take, ppqpos)

                retval, measures, cml, fullbeats, cdenom = reaper.TimeMap2_timeToBeats(0, pos)

                measures = measures + 1

                if measureend < measures then
                    measureend = measures
                end

                if evtinfo[measures] == nil then
                    evtinfo[measures] = 0
                else
                    evtinfo[measures] = evtinfo[measures] + 1
                end
                evtidx = evtidx + 1
                retval, selected, muted, ppqpos, msg = reaper.MIDI_GetEvt(take, evtidx)
            end

        end
    end

    tbidx = 1
    while tbidx <= measureend do
        if evtinfo[tbidx] == nil then evtinfo[tbidx] = 0 end
        tbidx = tbidx + 1
    end

    for i, v in ipairs(evtinfo) do
        if v > datacount then
            datacount = v
            maxmeasure = i
        end
    end
    maxdata = maxdata .. '第 ' .. maxmeasure .. ' 小节数据量为: ' .. datacount .. '\n'
    datacount1 = datacount
    datacount = 0

    for i, v in ipairs(evtinfo) do
        if v > datacount and v < datacount1 then
            datacount = v
            maxmeasure = i
        end
    end
    maxdata = maxdata .. '第 ' .. maxmeasure .. ' 小节数据量为: ' .. datacount .. '\n'
    datacount2 = datacount
    datacount = 0

    for i, v in ipairs(evtinfo) do
        if v > datacount and v < datacount2 then
            datacount = v
            maxmeasure = i
        end
    end
    maxdata = maxdata .. '第 ' .. maxmeasure .. ' 小节数据量为: ' .. datacount .. '\n'
    datacount3 = datacount
    datacount = 0

    for i, v in ipairs(evtinfo) do
        if v > datacount and v < datacount3 then
            datacount = v
            maxmeasure = i
        end
    end
    maxdata = maxdata .. '第 ' .. maxmeasure .. ' 小节数据量为: ' .. datacount .. '\n'
    datacount4 = datacount
    datacount = 0

    for i, v in ipairs(evtinfo) do
        if v > datacount and v < datacount4 then
            datacount = v
            maxmeasure = i
        end
    end
    maxdata = maxdata .. '第 ' .. maxmeasure .. ' 小节数据量为: ' .. datacount .. '\n'
    datacount5 = datacount
    datacount = 0

    for i, v in ipairs(evtinfo) do
        if v > datacount and v < datacount5 then
            datacount = v
            maxmeasure = i
        end
    end
    maxdata = maxdata .. '第 ' .. maxmeasure .. ' 小节数据量为: ' .. datacount .. '\n'
    datacount6 = datacount
    datacount = 0

end -- function end

function Maxsound()
    noteinfo = {}
    notelist = {}
    maxpos = 0
    notedata = ''
    timemax = 0
    integer = reaper.CountMediaItems(0)
    idx = 0
    while idx < integer do
        MediaItem = reaper.GetMediaItem(0, idx)
        idx = idx + 1
        take = reaper.GetTake(MediaItem, 0)
        if take ~= nil and reaper.TakeIsMIDI(take) then

            retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
            if notecnt > 0 then
                noteidx = 0
                retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)

                while noteidx < notecnt do
                    retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, noteidx)
                    table.insert(noteinfo, startppqpos + (endppqpos / 100000000))
                    if maxpos < endppqpos then
                        maxpos = endppqpos
                    end
                    noteidx = noteidx + 1
                end
            end
            MIDItake = take
        end
    end -- while end
    table.sort(noteinfo)

    maxnote = 0
    checkst = 0
    tbidx = 1
    count = 0
    noteall = 0

    while checkst < maxpos do
        noteover = 0

        while tbidx <= #noteinfo do
            notest, noteend = math.modf(noteinfo[tbidx])
            noteend = math.modf(noteend * 100000000)
            if noteend > checkst and notest <= checkst then
                noteover = noteover + 1
            end
            if notest > checkst then break end
            tbidx = tbidx + 1
        end
        tbidx = tbidx - 150
        if tbidx < 1 then tbidx = 1 end
        if noteover > 0 then
            noteall = noteall + noteover
            count = count + 1
        end

        if noteover > maxnote then
            maxnote = noteover
            posmax = reaper.MIDI_GetProjTimeFromPPQPos(MIDItake, checkst)
            timemax = reaper.format_timestr_pos(posmax, '', 2)
        end

        checkst = checkst + 60

    end
    average = noteall / count
    average = math.floor(average + 0.5)
    notedata =
        '最大发音数在 ' .. timemax .. ' 同时音符数量为： ' .. maxnote .. '\n' .. '平均发音数：' .. average .. '\n'
    MaxEvent()
    reaper.ClearConsole()
    reaper.ShowConsoleMsg(notedata .. maxdata)
    
    function SetReaScriptConsole_FontStyle(style)
    -- parameter style must be between 1 and 19
    
      local translation = reaper.JS_Localize("ReaScript console output", "DLG_437")
    
      local reascript_console_hwnd = reaper.JS_Window_Find(translation, true)
      if reascript_console_hwnd==nil then return false end
      local styles={32,33,36,31,214,37,218,1606,4373,3297,220,3492,3733,3594,35,1890,2878,3265,4392}
      local Textfield=reaper.JS_Window_FindChildByID(reascript_console_hwnd, 1177)
      reaper.JS_WindowMessage_Send(Textfield, "WM_SETFONT", styles[style] ,0,1,0)
    end
    SetReaScriptConsole_FontStyle(2)
end  --function end

function showmarklist()
function Msg(param)
  reaper.ShowConsoleMsg(tostring(param) .. "\n")
end

if not reaper.APIExists("JS_Window_Find") then
  reaper.MB("請右鍵單擊並安裝 'js_ReaScriptAPI: API functions for ReaScripts'. 然後重新啟動 REAPER 並再次運行腳本. 謝謝!", "你必須安裝 JS_ReaScriptAPI", 0)
  local ok, err = reaper.ReaPack_AddSetRepository("ReaTeam Extensions", "https://github.com/ReaTeam/Extensions/raw/master/index.xml", true, 1)
  if ok then
    reaper.ReaPack_BrowsePackages("js_ReaScriptAPI")
  else
    reaper.MB(err, "出了些問題...", 0)
  end
  return reaper.defer(function() end)
end

local _, num_markers = reaper.CountProjectMarkers(0)
if num_markers < 1 then
    x, y = reaper.GetMousePosition()
    reaper.TrackCtl_SetToolTip('项目中没有任何标记', x, y - 20, true)
  return reaper.defer(function() end)
end

 markers = {}
local cur_pos = reaper.GetCursorPosition()
local idx = -1
while true do
  idx = idx + 1
  local ok, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(idx)
  if ok == 0 then
    break
  else
    if not isrgn then -- isrgn == false 為標記
         name = string.format('%-8s',name)
      if math.abs(cur_pos - pos) < 0.001 then
        markers[#markers + 1] = {cur = true, pos = pos, name = name, idx = markrgnindexnumber}
      else
        markers[#markers + 1] = {pos = pos, name = name, idx = markrgnindexnumber}
      end
    end
  end
end

local menu = "" -- #MARKERS|#[ID] [Hr:Mn:Sc:Fr] [Meas:Beat] [Name]||
for m = 1, #markers do
  local space = " "
  --space = space:sub(tostring(markers[m].idx):len()*2)
  tiemcode_proj_default = reaper.format_timestr_pos(markers[m].pos, "", -1) -- 0=time, -1=proj default
  tiemcode_0 = reaper.format_timestr_pos(markers[m].pos, "", 0) -- 0=time, -1=proj default
  tiemcode_1 = reaper.format_timestr_pos(markers[m].pos, "", 1) -- 1=measures.beats + time
  tiemcode_2 = reaper.format_timestr_pos(markers[m].pos, "", 2) -- 2=measures.beats
  tiemcode_3 = reaper.format_timestr_pos(markers[m].pos, "", 3) -- 3=seconds
  tiemcode_4 = reaper.format_timestr_pos(markers[m].pos, "", 4) -- 4=samples
  tiemcode_5 = reaper.format_timestr_pos(markers[m].pos, "", 5) -- 5=h:m:s:f
  --menu = menu .. (markers[m].cur and "!" or "") .. 'Marker ' .. markers[m].idx .. ': ' .. space .. (markers[m].name == "" and "" or markers[m].name) .. space .. ' [' .. tiemcode_proj_default .. '] ' .. "|"
  menu = menu .. (markers[m].cur and "!" or "") .. (markers[m].name == "" and "" or markers[m].name) .. space .. ' [' .. tiemcode_proj_default .. '] ' .. "|"
end

local title = "hidden " .. reaper.genGuid()
gfx.init( title, 0, 0, 0, 0, 0 )
local hwnd = reaper.JS_Window_Find( title, true )
if hwnd then
  reaper.JS_Window_Show( hwnd, "HIDE" )
end
gfx.x, gfx.y = gfx.mouse_x-0, gfx.mouse_y-0
local selection = gfx.showmenu(menu)
gfx.quit()

selection = selection - 0 -- 此處selection值與標題行數關聯，標題佔用一行-1，佔用兩行則-2

if selection > 0 then
  reaper.GoToMarker(0, selection, true)
end

local window, _, _ = reaper.BR_GetMouseCursorContext()
local _, inline_editor, _, _, _, _ = reaper.BR_GetMouseCursorContext_MIDI()
if window == "midi_editor" and not inline_editor then reaper.SN_FocusMIDIEditor() end -- 聚焦 MIDI Editor
reaper.defer(function() end)

end -- function end


function miditempinfo()
    out = ''
    info_tb = {}
    take_tb = {}
    ccidx_tb = {}
    count = reaper.CountTracks(0)
    idx = 0
    
    while idx < count do
        track = reaper.GetTrack(0, idx)
        item = reaper.GetTrackMediaItem(track, 0)
        if item ~= nil then
             take = reaper.GetMediaItemTake(item, 0)
            if reaper.TakeIsMIDI(take) then
                retval, name = reaper.GetSetMediaTrackInfo_String(track, 'P_NAME', '', false)

                retval, notecnt, ccevtcnt, textsyxevtcnt = reaper.MIDI_CountEvts(take)
                ccidx = 0
                if ccevtcnt ~= 0 then
                    bank = '-1    '
                    PC = '-1  '
                    vol = '-1  '
                    pan = '-1  '
                    rev = '-1  '
                    cho = '-1  '
                    delay = '-1  '
                    cc7_idx, cc10_idx, cc91_idx, cc93_idx, cc94_idx, cc0_idx, cc32_idx, pc_idx = '', '', '', '', '', '', '', ''
                    while ccidx < ccevtcnt do
                        retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
                        if chanmsg == 176 then

                            if msg2 == 0 then
                                cc0 = msg3
                                cc0_idx = ccidx
                            end
                            if msg2 == 32 then
                                bank = cc0 * 128 + msg3
                                cc32_idx = ccidx
                                bank = tostring(bank)
                            end

                            if msg2 == 7 then
                                vol = msg3
                                vol = tostring(vol)
                                cc7_idx = ccidx
                            end

                            if msg2 == 10 then
                                pan = msg3
                                pan = tostring(pan)
                                cc10_idx = ccidx
                            end

                            if msg2 == 91 then
                                rev = msg3
                                rev = tostring(rev)
                                cc91_idx = ccidx
                            end

                            if msg2 == 93 then
                                cho = msg3
                                cho = tostring(cho)
                                cc93_idx = ccidx

                            end

                            if msg2 == 94 then
                                delay = msg3
                                delay = tostring(delay)
                                cc94_idx = ccidx
                            end

                        end -- chanmsg==176

                        if chanmsg == 192 then
                            PC = msg2
                            PC = tostring(PC)
                            pc_idx = ccidx
                        end

                        ccidx = ccidx + 1
                    end -- while
                    
                    table.insert(info_tb, name .. '|Bank=' .. bank .. '|Patch=' .. PC .. '|Vol=' .. vol .. '|Pan=' .. pan ..
                                 '|Rev=' .. rev .. '|Cho=' .. cho .. '|Delay=' .. delay)
                    table.insert(take_tb, take)
                    table.insert(ccidx_tb, 'cc7_idx=' .. cc7_idx .. 'cc10_idx=' .. cc10_idx .. 'cc91_idx=' .. cc91_idx .. 
                                     'cc93_idx=' .. cc93_idx .. 'cc94_idx=' .. cc94_idx .. 'pc_idx=' .. pc_idx ..
                                     'cc0_idx=' .. cc0_idx .. 'cc32_idx=' .. cc32_idx)
                end -- ccevtcnt~=0
            end -- TakeIsMIDI
        end -- item~=nil
        idx = idx + 1
    end
    -- reaper.ShowConsoleMsg('')
    -- reaper.ShowConsoleMsg(out)
end -- function end
miditempinfo()

local ctx = reaper.ImGui_CreateContext('tempinfo')
local size = reaper.GetAppVersion():match('OSX') and 12 or 14
local font = reaper.ImGui_CreateFont('sans-serif', size)
reaper.ImGui_Attach(ctx, font)

StateChangeCount_old=reaper.GetProjectStateChangeCount(0)

function loop()
    reaper.ImGui_SetNextWindowSize(ctx, 730, 70+(#take_tb*23.7))
    
    StateChangeCount=reaper.GetProjectStateChangeCount(0)
    if StateChangeCount ~= StateChangeCount_old then
        miditempinfo()      O_Song_Time()  getmark()
        StateChangeCount_old = StateChangeCount
    end
    

    reaper.ImGui_PushFont(ctx, font)
    playmode = reaper.GetToggleCommandStateEx(0, 1007)
    if playmode == 1 then
        tpos = reaper.GetPlayPosition()
    else
        tpos = reaper.GetCursorPosition()
    end
    for i, v in ipairs(marktb) do
        markpos, name = string.match(v, '(%d+%.%d+),(.+)')
        if markpos and name then
            markpos = tonumber(markpos)
            if tpos > markpos then MKname = name end
        end
    end

    O_pos = tpos - wavitem_pos
    time_buf = reaper.format_timestr_pos(tpos, '', 5)
    Original_song_time = reaper.format_timestr_pos(O_pos, '', 5)
    ptidx = reaper.FindTempoTimeSigMarker(0, tpos)
    retval, timepos, measurepos, beatpos, bpm, timesig_num, timesig_denom, lineartempo = reaper.GetTempoTimeSigMarker(0, ptidx)
    bpm = string.format("%3.3f", bpm)

    local visible, open = reaper.ImGui_Begin(ctx, 'MIDI Template information', true)
    if visible then

        if reaper.ImGui_Button(ctx, 'Jump Audio') then
           reaper.OnStopButton()
           ret,csv=reaper.GetUserInputs('跳转到原曲音频时间',2,'输入时间**分：,输入时间**秒：','0,0')
                if ret then 
                   mm,ss=string.match(csv , '(%d+),(%d+)')
                   mm=tonumber(mm)  ss=tonumber(ss) 
                   inputtime = mm * 60 + ss + wavitem_pos
                   reaper.SetEditCurPos(inputtime,true,true)
                end
        end
        reaper.ImGui_SameLine(ctx)
        reaper.ImGui_Button(ctx, 'Project: ' .. time_buf)
        reaper.ImGui_SameLine(ctx)
        reaper.ImGui_Button(ctx, 'Audio: ' .. Original_song_time)
        reaper.ImGui_SameLine(ctx)
        reaper.ImGui_Button(ctx, 'Tempo: ' .. bpm)
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'Marker: ' .. MKname) then
            showmarklist()
        end
        reaper.ImGui_SameLine(ctx)
        if reaper.ImGui_Button(ctx, 'MaxVoice') then Maxsound() end
        reaper.ImGui_SameLine(ctx)
        getlock=reaper.GetExtState('Template state', 'lock')
        track1solo=reaper.GetToggleCommandStateEx(0, 23)
        if getlock == 'lock'  then
           reaper.ImGui_RadioButton(ctx, 'TPL lock',true)
        else
           if track1solo == 1 then
             reaper.ImGui_RadioButton(ctx, 'TRK1 solo',true)
           else
             reaper.ImGui_RadioButton(ctx, 'TPL unlock',false)
           end
        end
        

        for i, v in ipairs(info_tb) do
            reaper.ImGui_PushID(ctx, i)
            a, b, c, d, e, f, g, h = string.match(v, '(.+)|(.+)|(.+)|(.+)|(.+)|(.+)|(.+)|(.+)')
            if reaper.ImGui_Button(ctx, a, 180) then
                getset_track_info(take_tb[i])
            end

            reaper.ImGui_SameLine(ctx)
            if reaper.ImGui_Button(ctx, b, 80) then
                reaper.Undo_BeginBlock()
                retval, Val = reaper.GetUserInputs('Edit Val', 1, '输入 Bank = ', string.gsub(b, 'Bank=', ''))
                shuru = tonumber(Val)
                if shuru then
                    cc0_idx = string.match(ccidx_tb[i], 'cc0_idx=%d+')
                    cc0_idx = string.gsub(cc0_idx, 'cc0_idx=', '')
                    cc0_idx = tonumber(cc0_idx)
                    cc32_idx = string.match(ccidx_tb[i], 'cc32_idx=%d+')
                    cc32_idx = string.gsub(cc32_idx, 'cc32_idx=', '')
                    cc32_idx = tonumber(cc32_idx)
                    MSB = math.modf(shuru / 128)
                    LSB = shuru % 128
                    reaper.MIDI_SetCC(take_tb[i], cc0_idx, NULL, false, NULL, NULL, NULL, NULL, MSB, true)
                    reaper.MIDI_SetCC(take_tb[i], cc32_idx, NULL, false, NULL, NULL, NULL, NULL, LSB, true)
                    reaper.MIDI_SetCC(take_tb[i], pc_idx, NULL, false, NULL, NULL, NULL, NULL, NULL, true)
                    if playmode == 1 then
                        reaper.Main_OnCommand(1008, 0)
                        reaper.Main_OnCommand(1008, 0)
                    end
                end
                reaper.Undo_EndBlock('修改Bank=' .. shuru, -1)
            end
            if reaper.ImGui_IsItemHovered(ctx) then
                getbank = string.match(v, 'Bank=%d+')
                if getbank == nil then
                    getbank = 0
                else
                    getbank = string.gsub(getbank, 'Bank=', '')
                end
                getpatch = string.match(v, 'Patch=%d+')
                if getpatch == nil then
                    getpatch = 0
                else
                    getpatch = string.gsub(getpatch, 'Patch=', '')
                end
                reaper.ImGui_SetTooltip(ctx,
                                        tb_ins_bank[getbank .. ',' .. getpatch])
            end
            reaper.ImGui_SameLine(ctx)
            if reaper.ImGui_Button(ctx, c, 70) then
                reaper.Undo_BeginBlock()
                retval, Val = reaper.GetUserInputs('Edit Val', 1, '输入 Patch = ', string.gsub(c, 'Patch=', ''))
                shuru = tonumber(Val)
                pc_idx = string.match(ccidx_tb[i], 'pc_idx=%d+')
                pc_idx = string.gsub(pc_idx, 'pc_idx=', '')
                pc_idx = tonumber(pc_idx)
                reaper.MIDI_SetCC(take_tb[i], pc_idx, NULL, false, NULL, NULL,
                                  NULL, shuru, NULL, true)
                if playmode == 1 then
                    reaper.Main_OnCommand(1008, 0)
                    reaper.Main_OnCommand(1008, 0)
                end
                reaper.Undo_EndBlock('修改PC=' .. shuru, -1)
            end
            if reaper.ImGui_IsItemHovered(ctx) then
                getbank = string.match(v, 'Bank=%d+')
                if getbank == nil then
                    getbank = 0
                else
                    getbank = string.gsub(getbank, 'Bank=', '')
                end
                getpatch = string.match(v, 'Patch=%d+')
                if getpatch == nil then
                    getpatch = 0
                else
                    getpatch = string.gsub(getpatch, 'Patch=', '')
                end
                reaper.ImGui_SetTooltip(ctx, tb_ins_bank[getbank .. ',' .. getpatch])
            end
            reaper.ImGui_SameLine(ctx)
            if reaper.ImGui_Button(ctx, d, 56) then
                reaper.Undo_BeginBlock()
                retval, Val = reaper.GetUserInputs('Edit Val', 1, '输入 CC7 = ', string.gsub(d, 'Vol=', ''))
                shuru = tonumber(Val)
                cc7_idx = string.match(ccidx_tb[i], 'cc7_idx=%d+')
                cc7_idx = string.gsub(cc7_idx, 'cc7_idx=', '')
                cc7_idx = tonumber(cc7_idx)
                reaper.MIDI_SetCC(take_tb[i], cc7_idx, NULL, NULL, NULL, NULL, NULL, NULL, shuru, true)
                if playmode == 1 then
                    reaper.Main_OnCommand(1008, 0)
                    reaper.Main_OnCommand(1008, 0)
                end
                reaper.Undo_EndBlock('修改CC7数值=' .. shuru, -1)

            end
            reaper.ImGui_SameLine(ctx)
            if reaper.ImGui_Button(ctx, e, 56) then
                reaper.Undo_BeginBlock()
                retval, Val = reaper.GetUserInputs('Edit Val', 1, '输入 CC10 = ', string.gsub(e, 'Pan=', ''))
                shuru = tonumber(Val)
                cc10_idx = string.match(ccidx_tb[i], 'cc10_idx=%d+')
                cc10_idx = string.gsub(cc10_idx, 'cc10_idx=', '')
                cc10_idx = tonumber(cc10_idx)
                reaper.MIDI_SetCC(take_tb[i], cc10_idx, NULL, NULL, NULL, NULL, NULL, NULL, shuru, true)
                if playmode == 1 then
                    reaper.Main_OnCommand(1008, 0)
                    reaper.Main_OnCommand(1008, 0)
                end
                reaper.Undo_EndBlock('修改CC10数值=' .. shuru, -1)
            end
            reaper.ImGui_SameLine(ctx)
            if reaper.ImGui_Button(ctx, f, 56) then
                reaper.Undo_BeginBlock()
                retval, Val = reaper.GetUserInputs('Edit Val', 1, '输入 CC91 = ', string.gsub(f, 'Rev=', ''))
                shuru = tonumber(Val)
                cc91_idx = string.match(ccidx_tb[i], 'cc91_idx=%d+')
                cc91_idx = string.gsub(cc91_idx, 'cc91_idx=', '')
                cc91_idx = tonumber(cc91_idx)
                reaper.MIDI_SetCC(take_tb[i], cc91_idx, NULL, NULL, NULL, NULL, NULL, NULL, shuru, true)
                if playmode == 1 then
                    reaper.Main_OnCommand(1008, 0)
                    reaper.Main_OnCommand(1008, 0)
                end
                reaper.Undo_EndBlock('修改CC91数值=' .. shuru, -1)
            end
            reaper.ImGui_SameLine(ctx)
            if reaper.ImGui_Button(ctx, g, 56) then
                reaper.Undo_BeginBlock()
                retval, Val = reaper.GetUserInputs('Edit Val', 1, '输入 CC93 = ', string.gsub(g, 'Cho=', ''))
                shuru = tonumber(Val)
                cc93_idx = string.match(ccidx_tb[i], 'cc93_idx=%d+')
                cc93_idx = string.gsub(cc93_idx, 'cc93_idx=', '')
                cc93_idx = tonumber(cc93_idx)
                reaper.MIDI_SetCC(take_tb[i], cc93_idx, NULL, NULL, NULL, NULL, NULL, NULL, shuru, true)
                if playmode == 1 then
                    reaper.Main_OnCommand(1008, 0)
                    reaper.Main_OnCommand(1008, 0)
                end
                reaper.Undo_EndBlock('修改CC93数值=' .. shuru, -1)
            end
            reaper.ImGui_SameLine(ctx)
            if reaper.ImGui_Button(ctx, h, 65) then
                reaper.Undo_BeginBlock()
                retval, Val = reaper.GetUserInputs('Edit Val', 1, '输入 CC94 = ', string.gsub(h, 'Delay=', ''))
                shuru = tonumber(Val)
                cc94_idx = string.match(ccidx_tb[i], 'cc94_idx=%d+')
                cc94_idx = string.gsub(cc94_idx, 'cc94_idx=', '')
                cc94_idx = tonumber(cc94_idx)
                reaper.MIDI_SetCC(take_tb[i], cc94_idx, NULL, NULL, NULL, NULL, NULL, NULL, shuru, true)
                if playmode == 1 then
                    reaper.Main_OnCommand(1008, 0)
                    reaper.Main_OnCommand(1008, 0)
                end
                reaper.Undo_EndBlock('修改CC94数值=' .. shuru, -1)
            end
            reaper.ImGui_SameLine(ctx)
            if reaper.ImGui_SmallButton(ctx, 'List') then
                openlist(take_tb[i])
            end
            if reaper.ImGui_IsItemHovered(ctx) then
                reaper.ImGui_SetTooltip(ctx, a)
            end
            
            reaper.ImGui_PopID(ctx)
        end

        reaper.ImGui_End(ctx)
    end
    reaper.ImGui_PopFont(ctx)

    if open then

        reaper.defer(loop)
    else
        reaper.ImGui_DestroyContext(ctx)
    end
end

reaper.defer(loop)

function exit()
    reaper.SetToggleCommandState(0, reaper.NamedCommandLookup('_RSc86451697eb9e2a4d8f6a114868b10b271c49c69'), 0)
    reaper.SetToggleCommandState(32060, reaper.NamedCommandLookup('_RS7d3c_c86451697eb9e2a4d8f6a114868b10b271c49c69'), 0)
    reaper.SetToggleCommandState(32061, reaper.NamedCommandLookup('_RS7d3d_c86451697eb9e2a4d8f6a114868b10b271c49c69'), 0)
    reaper.RefreshToolbar2(0, reaper.NamedCommandLookup('_RSc86451697eb9e2a4d8f6a114868b10b271c49c69'))
    reaper.RefreshToolbar2(32060, reaper.NamedCommandLookup('_RS7d3c_c86451697eb9e2a4d8f6a114868b10b271c49c69'))
    reaper.RefreshToolbar2(32061, reaper.NamedCommandLookup('_RS7d3d_c86451697eb9e2a4d8f6a114868b10b271c49c69'))
end
reaper.atexit(exit)

