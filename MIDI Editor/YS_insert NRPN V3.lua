--[[
 * ReaScript Name: insert NRPN V3
 * Version: 1.0.2
 * Author: YS
 * provides: [main=midi_editor,midi_eventlisteditor] .
--]]

--[[
 * Changelog:
 * v1.0 (2021-10-14)
  + Initial release
--]]

KIT = {}
KIT["ST0"] = "[88] Standard1 Kick1"
KIT["ST1"] = "[88] Standard1 Kick2"
KIT["ST2"] = "[88] Standard2 Kick1"
KIT["ST3"] = "[88] Standard2 Kick2"
KIT["ST4"] = "[55] Kick Drum1"
KIT["ST5"] = "[55] Kick Drum2"
KIT["ST6"] = "[88] Jazz Kick1"
KIT["ST7"] = "[88] Jazz Kick2"
KIT["ST8"] = "[88] Room Kick1"
KIT["ST9"] = "[88] Room Kick2"
KIT["ST10"] = "[88] Power Kick1"
KIT["ST11"] = "[88] Power Kick2"
KIT["ST12"] = "[88] Electric Kick2"
KIT["ST13"] = "[88] Electric Kick1"
KIT["ST14"] = "[88] TR-808 Kick"
KIT["ST15"] = "[88] TR-909 Kick"
KIT["ST16"] = "[88] Dance Kick"
KIT["ST17"] = "Voice One"
KIT["ST18"] = "Voice Two"
KIT["ST19"] = "Voice Three"
KIT["ST22"] = "MC-500 Beep1"
KIT["ST23"] = "MC-500 Beep2"
KIT["ST24"] = "Concert SD"
KIT["ST25"] = "Snare Roll"
KIT["ST26"] = "Finger Snap2"
KIT["ST27"] = "High Q"
KIT["ST28"] = "Slap"
KIT["ST29"] = "Scratch Push"
KIT["ST30"] = "Scratch Pull"
KIT["ST31"] = "Sticks"
KIT["ST32"] = "Square Click"
KIT["ST33"] = "Metronome Click"
KIT["ST34"] = "MetronomeBell"
KIT["ST35"] = "Standard1 Kick2"
KIT["ST36"] = "Standard1 Kick1"
KIT["ST37"] = "Side Stick"
KIT["ST38"] = "Standard1 Snare1"
KIT["ST39"] = "Hand Clap"
KIT["ST40"] = "Standard1 Snare2"
KIT["ST41"] = "Low Tom2"
KIT["ST42"] = "Closed Hi-Hat"
KIT["ST43"] = "Low Tom1"
KIT["ST44"] = "Pedal Hi-Hat"
KIT["ST45"] = "Mid Tom2"
KIT["ST46"] = "Open Hi-Hat"
KIT["ST47"] = "Mid Tom1"
KIT["ST48"] = "High Tom2"
KIT["ST49"] = "Crash Cymbal1"
KIT["ST50"] = "High Tom1"
KIT["ST51"] = "Ride Cymbal1"
KIT["ST52"] = "Chinese Cymbal"
KIT["ST53"] = "Ride Bell"
KIT["ST54"] = "Tambourine"
KIT["ST55"] = "Splash Cymbal"
KIT["ST56"] = "Cowbell"
KIT["ST57"] = "Crash Cymbal2"
KIT["ST58"] = "Vibra-slap"
KIT["ST59"] = "Ride Cymbal2"
KIT["ST60"] = "High Bongo"
KIT["ST61"] = "Low Bongo"
KIT["ST62"] = "Mute High Conga"
KIT["ST63"] = "Open High Conga"
KIT["ST64"] = "Open Low Conga"
KIT["ST65"] = "High Timbale"
KIT["ST66"] = "Low Timbale"
KIT["ST67"] = "High Agogo"
KIT["ST68"] = "Low Agogo"
KIT["ST69"] = "Cabasa"
KIT["ST70"] = "Maracas"
KIT["ST71"] = "Short High Whisle"
KIT["ST72"] = "Long Low Whisle"
KIT["ST73"] = "Short Guiro"
KIT["ST74"] = "Long Guiro"
KIT["ST75"] = "Claves"
KIT["ST76"] = "High Wood Block"
KIT["ST77"] = "Low Wood Block"
KIT["ST78"] = "Mute Cuica"
KIT["ST79"] = "Open Cuica"
KIT["ST80"] = "Mute Triangle"
KIT["ST81"] = "Open Triangle"
KIT["ST82"] = "Shaker"
KIT["ST83"] = "Jingle Bell"
KIT["ST84"] = "Bell Tree"
KIT["ST85"] = "Castanets"
KIT["ST86"] = "Mute Surdo"
KIT["ST87"] = "Open Surdo"
KIT["ST88"] = "Applaus2"
KIT["ST97"] = "[88] Standard1 Snare1"
KIT["ST98"] = "[88] Standard1 Snare2"
KIT["ST99"] = "[88] Standard2 Snare1"
KIT["ST100"] = "[88] Standard2 Snare2"
KIT["ST101"] = "[55] Snare Drum2"
KIT["ST102"] = "Standard1 Snare1"
KIT["ST103"] = "Standard1 Snare2"
KIT["ST104"] = "Standard Snare3"
KIT["ST105"] = "[88] Jazz Snare1"
KIT["ST106"] = "[88] Jazz Snare2"
KIT["ST107"] = "[88] Room Snare1"
KIT["ST108"] = "[88] Room Snare2"
KIT["ST109"] = "[88] Power Snare1"
KIT["ST110"] = "[88] Power Snare2"
KIT["ST111"] = "[55] Gated Snare"
KIT["ST112"] = "[88] Dance Snare1"
KIT["ST113"] = "[88] Dance Snare2"
KIT["ST114"] = "[88] Disco Snare"
KIT["ST115"] = "[88] Electric Snare2"
KIT["ST116"] = "[55] Electric Snare"
KIT["ST117"] = "[88] Electric Snare 3"
KIT["ST118"] = "TR-707 Snare"
KIT["ST119"] = "[88] TR-808 Snare1"
KIT["ST120"] = "[88] TR-808 Snare2"
KIT["ST121"] = "[88] TR-909 Snare1"
KIT["ST122"] = "[88] TR-909 Snare2"
KIT["ST123"] = "Rap Snare"
KIT["ST124"] = "Jungle Snare1"
KIT["ST125"] = "House Snare1"
KIT["ST126"] = "[88] House Snare"
KIT["ST127"] = "House Snare2"

KIT["BR0"] = "[88] Standard1 Kick1"
KIT["BR1"] = "[88] Standard1 Kick2"
KIT["BR2"] = "[88] Standard2 Kick1"
KIT["BR3"] = "[88] Standard2 Kick2"
KIT["BR4"] = "[55] Kick Drum1"
KIT["BR5"] = "[55] Kick Drum2"
KIT["BR6"] = "[88] Jazz Kick1"
KIT["BR7"] = "[88] Jazz Kick2"
KIT["BR8"] = "[88] Room Kick1"
KIT["BR9"] = "[88] Room Kick2"
KIT["BR10"] = "[88] Power Kick1"
KIT["BR11"] = "[88] Power Kick2"
KIT["BR12"] = "[88] Electric Kick2"
KIT["BR13"] = "[88] Electric Kick1"
KIT["BR14"] = "[88] TR-808 Kick"
KIT["BR15"] = "[88] TR-909 Kick"
KIT["BR16"] = "[88] Dance Kick"
KIT["BR17"] = "Voice One"
KIT["BR18"] = "Voice Two"
KIT["BR19"] = "Voice Three"
KIT["BR22"] = "MC-500 Beep1"
KIT["BR23"] = "MC-500 Beep2"
KIT["BR24"] = "Concert SD"
KIT["BR25"] = "Snare Roll"
KIT["BR26"] = "Finger Snap"
KIT["BR27"] = "High Q"
KIT["BR28"] = "Slap"
KIT["BR29"] = "Scratch Push"
KIT["BR30"] = "Scratch Pull"
KIT["BR31"] = "Sticks"
KIT["BR32"] = "Square Click"
KIT["BR33"] = "Metronome Click"
KIT["BR34"] = "Metronome Bell"
KIT["BR35"] = "Jazz Kick2"
KIT["BR36"] = "Jazz Kick1"
KIT["BR37"] = "Side Stick"
KIT["BR38"] = "Brush Snare1"
KIT["BR39"] = "Brush Slap"
KIT["BR40"] = "Brush Snare2"
KIT["BR41"] = "Brush Low Tom2"
KIT["BR42"] = "Brush Closed Hi-Hat"
KIT["BR43"] = "Brush Low Tom1"
KIT["BR44"] = "Pedal Hi-Hat"
KIT["BR45"] = "Brush Mid Tom2"
KIT["BR46"] = "Brush Open Hi-Hat"
KIT["BR47"] = "Brush Mid Tom1"
KIT["BR48"] = "Brush High Tom2"
KIT["BR49"] = "Brush Crash Cymbal"
KIT["BR50"] = "Brush High Tom1"
KIT["BR51"] = "Ride Cymbal Inner"
KIT["BR52"] = "Chinese Cymbal"
KIT["BR53"] = "Brush Ride Bell"
KIT["BR54"] = "Tambourine"
KIT["BR55"] = "Splash Cymbal"
KIT["BR56"] = "Cowbell"
KIT["BR57"] = "Crash Cymbal2"
KIT["BR58"] = "Vibra-slap"
KIT["BR59"] = "Ride Cymbal Edge"
KIT["BR60"] = "High Bongo"
KIT["BR61"] = "Low Bongo"
KIT["BR62"] = "Mute High Conga"
KIT["BR63"] = "Open High Conga"
KIT["BR64"] = "Open Low Conga"
KIT["BR65"] = "High Timbale"
KIT["BR66"] = "Low Timbale"
KIT["BR67"] = "High Agogo"
KIT["BR68"] = "Low Agogo"
KIT["BR69"] = "Cabasa"
KIT["BR70"] = "Maracas"
KIT["BR71"] = "Short High Whisle"
KIT["BR72"] = "Long Low Whisle"
KIT["BR73"] = "Short Guiro"
KIT["BR74"] = "Long Guiro"
KIT["BR75"] = "Claves"
KIT["BR76"] = "High Wood Block"
KIT["BR77"] = "Low Wood Block"
KIT["BR78"] = "Mute Cuica"
KIT["BR79"] = "Open Cuica"
KIT["BR80"] = "Mute Triangle"
KIT["BR81"] = "Open Triangle"
KIT["BR82"] = "Shaker"
KIT["BR83"] = "Jingle Bell"
KIT["BR84"] = "Bell Tree"
KIT["BR85"] = "Castanets"
KIT["BR86"] = "Mute Surdo"
KIT["BR87"] = "Open Surdo"
KIT["BR88"] = "Applause"
KIT["BR100"] = "[88] Brush Tap1"
KIT["BR101"] = "[88] Brush Tap2"
KIT["BR102"] = "[88] Brush Slap1"
KIT["BR103"] = "[88] Brush Slap2"
KIT["BR104"] = "[88] Brush Slap3"
KIT["BR105"] = "[88] Brush Swirl1"
KIT["BR106"] = "[88] Brush Swirl2"
KIT["BR107"] = "[88] Brush Long Swirl"
KIT["BR108"] = "[88] Jazz Snare1"
KIT["BR109"] = "[88] Jazz Snare2"
KIT["BR110"] = "[88] Standard 1 Snare 1"
KIT["BR111"] = "[88] Standard 1 Snare 2"
KIT["BR112"] = "[88] Standard 2 Snare 1"
KIT["BR113"] = "[88] Standard 2 Snare 2"
KIT["BR114"] = "[55] Snare Drum2"
KIT["BR115"] = "Standard1 Snare1"
KIT["BR116"] = "Standard1 Snare2"
KIT["BR117"] = "Standard Snare3"
KIT["BR118"] = "[88] Room Snare1"
KIT["BR119"] = "[88] Room Snare2"
KIT["BR120"] = "[88] Power Snare1"
KIT["BR121"] = "[88] Power Snare2"
KIT["BR122"] = "[88] Gated Snare"
KIT["BR123"] = "[88] Dance Snare1"
KIT["BR124"] = "[88] Dance Snare2"
KIT["BR125"] = "[88] Disco Snare"
KIT["BR126"] = "[88] Electric Snare2"
KIT["BR127"] = "[88] Electric Snare3"

KIT["JZ0"] = "[88] Standard1 Kick1"
KIT["JZ1"] = "[88] Standard1 Kick2"
KIT["JZ2"] = "[88] Standard2 Kick1"
KIT["JZ3"] = "[88] Standard2 Kick2"
KIT["JZ4"] = "[55] Kick Drum1"
KIT["JZ5"] = "[55] Kick Drum2"
KIT["JZ6"] = "[88] Jazz Kick1"
KIT["JZ7"] = "[88] Jazz Kick2"
KIT["JZ8"] = "[88] Room Kick1"
KIT["JZ9"] = "[88] Room Kick2"
KIT["JZ10"] = "[88] Power Kick1"
KIT["JZ11"] = "[88] Power Kick2"
KIT["JZ12"] = "[88] Electric Kick2"
KIT["JZ13"] = "[88] Electric Kick1"
KIT["JZ14"] = "[88] TR-808 Kick"
KIT["JZ15"] = "[88] TR-909 Kick"
KIT["JZ16"] = "[88] Dance Kick"
KIT["JZ17"] = "Voice One"
KIT["JZ18"] = "Voice Two"
KIT["JZ19"] = "Voice Three"
KIT["JZ22"] = "MC-500 Beep1"
KIT["JZ23"] = "MC-500 Beep2"
KIT["JZ24"] = "Concert SD"
KIT["JZ25"] = "Snare Roll"
KIT["JZ26"] = "Finger Snap"
KIT["JZ27"] = "High Q"
KIT["JZ28"] = "Slap"
KIT["JZ29"] = "Scratch Push"
KIT["JZ30"] = "Scratch Pull"
KIT["JZ31"] = "Sticks"
KIT["JZ32"] = "Square Click"
KIT["JZ33"] = "Metronome Click"
KIT["JZ34"] = "Metronome Bell"
KIT["JZ35"] = "Jazz Kick2"
KIT["JZ36"] = "Jazz Kick1"
KIT["JZ37"] = "Side Stick"
KIT["JZ38"] = "Jazz Snare1"
KIT["JZ39"] = "Hand Clap2"
KIT["JZ40"] = "Jazz Snare2"
KIT["JZ41"] = "Low Tom2"
KIT["JZ42"] = "Closed Hi-Hat2"
KIT["JZ43"] = "Low Tom1"
KIT["JZ44"] = "Pedal Hi-Hat2"
KIT["JZ45"] = "Mid Tom2"
KIT["JZ46"] = "Open Hi-Hat2"
KIT["JZ47"] = "Mid Tom1"
KIT["JZ48"] = "High Tom2"
KIT["JZ49"] = "Crash Cymbal1"
KIT["JZ50"] = "High Tom1"
KIT["JZ51"] = "Ride Cymbal Inner"
KIT["JZ52"] = "Chinese Cymbal"
KIT["JZ53"] = "Ride Bell"
KIT["JZ54"] = "Tambourine"
KIT["JZ55"] = "Splash Cymbal"
KIT["JZ56"] = "Cowbell"
KIT["JZ57"] = "Crash Cymbal2"
KIT["JZ58"] = "Vibra-slap"
KIT["JZ59"] = "Ride Cymbal Edge"
KIT["JZ60"] = "High Bongo"
KIT["JZ61"] = "Low Bongo"
KIT["JZ62"] = "Mute High Conga"
KIT["JZ63"] = "Open High Conga"
KIT["JZ64"] = "Open Low Conga"
KIT["JZ65"] = "High Timbale"
KIT["JZ66"] = "Low Timbale"
KIT["JZ67"] = "High Agogo"
KIT["JZ68"] = "Low Agogo"
KIT["JZ69"] = "Cabasa"
KIT["JZ70"] = "Maracas"
KIT["JZ71"] = "Short High Whisle"
KIT["JZ72"] = "Long Low Whisle"
KIT["JZ73"] = "Short Guiro"
KIT["JZ74"] = "Long Guiro"
KIT["JZ75"] = "Claves"
KIT["JZ76"] = "High Wood Block"
KIT["JZ77"] = "Low Wood Block"
KIT["JZ78"] = "Mute Cuica"
KIT["JZ79"] = "Open Cuica"
KIT["JZ80"] = "Mute Triangle"
KIT["JZ81"] = "Open Triangle"
KIT["JZ82"] = "Shaker"
KIT["JZ83"] = "Jingle Bell"
KIT["JZ84"] = "Bell Tree"
KIT["JZ85"] = "Castanets"
KIT["JZ86"] = "Mute Surdo"
KIT["JZ87"] = "Open Surdo"
KIT["JZ88"] = "Applause"
KIT["JZ100"] = "[88] Brush Tap1"
KIT["JZ101"] = "[88] Brush Tap2"
KIT["JZ102"] = "[88] Brush Slap1"
KIT["JZ103"] = "[88] Brush Slap2"
KIT["JZ104"] = "[88] Brush Slap3"
KIT["JZ105"] = "[88] Brush Swirl1"
KIT["JZ106"] = "[88] Brush Swirl2"
KIT["JZ107"] = "[88] Brush Long Swirl"
KIT["JZ108"] = "[88] Jazz Snare1"
KIT["JZ109"] = "[88] Jazz Snare2"
KIT["JZ110"] = "[88] Standard 1 Snare 1"
KIT["JZ111"] = "[88] Standard 1 Snare 2"
KIT["JZ112"] = "[88] Standard 2 Snare 1"
KIT["JZ113"] = "[88] Standard 2 Snare 2"
KIT["JZ114"] = "[55] Snare Drum2"
KIT["JZ115"] = "Standard1 Snare1"
KIT["JZ116"] = "Standard1 Snare2"
KIT["JZ117"] = "Standard Snare3"
KIT["JZ118"] = "[88] Room Snare1"
KIT["JZ119"] = "[88] Room Snare2"
KIT["JZ120"] = "[88] Power Snare1"
KIT["JZ121"] = "[88] Power Snare2"
KIT["JZ122"] = "[88] Gated Snare"
KIT["JZ123"] = "[88] Dance Snare1"
KIT["JZ124"] = "[88] Dance Snare2"
KIT["JZ125"] = "[88] Disco Snare"
KIT["JZ126"] = "[88] Electric Snare2"
KIT["JZ127"] = "[88] Electric Snare3"

KIT["E0"] = "[88] Electric Kick2"
KIT["E1"] = "[88] Electric Kick1"
KIT["E2"] = "CR-78 Kick1"
KIT["E3"] = "CR-78 Kick2"
KIT["E4"] = "TR-606 Kick1"
KIT["E5"] = "TR-707 Kick1"
KIT["E6"] = "[55] TR-808 Kick"
KIT["E7"] = "[88] TR-808 Kick"
KIT["E8"] = "TR-808 Kick2"
KIT["E9"] = "[88] TR-909 Kick"
KIT["E10"] = "[88] Dance Kick"
KIT["E11"] = "Hip-Hop Kick2"
KIT["E12"] = "TR-909 Kick1"
KIT["E13"] = "Hip-Hop Kick3"
KIT["E14"] = "Jungle Kick1"
KIT["E15"] = "Techno Kick1"
KIT["E16"] = "Bounce Kick"
KIT["E17"] = "Voice One"
KIT["E18"] = "Voice Two"
KIT["E19"] = "Voice Three"
KIT["E22"] = "MC-500 Beep1"
KIT["E23"] = "MC-500 Beep2"
KIT["E24"] = "Concert SD"
KIT["E25"] = "Snare Roll"
KIT["E26"] = "Finger Snap2"
KIT["E27"] = "High Q"
KIT["E28"] = "Slap"
KIT["E29"] = "Scratch Push2"
KIT["E30"] = "Scratch Pull2"
KIT["E31"] = "Sticks"
KIT["E32"] = "Square Click"
KIT["E33"] = "Metronome Click"
KIT["E34"] = "Metronome Bell"
KIT["E35"] = "Kick2"
KIT["E36"] = "Kick1"
KIT["E37"] = "Rim Shot"
KIT["E38"] = "Snare1"
KIT["E39"] = "Hand Clap"
KIT["E40"] = "Snare2"
KIT["E41"] = "Low Tom2"
KIT["E42"] = "Closed Hi-Hat"
KIT["E43"] = "Low Tom1"
KIT["E44"] = "Closed Hi-Hat2"
KIT["E45"] = "Mid Tom2"
KIT["E46"] = "Open Hi-Hat"
KIT["E47"] = "Mid Tom1"
KIT["E48"] = "High Tom2"
KIT["E49"] = "Crash Cymbal"
KIT["E50"] = "High Tom1"
KIT["E51"] = "Ride Cymbal"
KIT["E52"] = "Chinese Cymbal"
KIT["E53"] = "Ride Bell"
KIT["E54"] = "Tambourine"
KIT["E55"] = "Splash Cymbal"
KIT["E56"] = "Cowbell"
KIT["E57"] = "Crash Cymbal"
KIT["E58"] = "Vibra-slap"
KIT["E59"] = "Ride Cymbal Edge"
KIT["E60"] = "High Bongo"
KIT["E61"] = "Low Bongo"
KIT["E62"] = "Mute High Conga"
KIT["E63"] = "Open High Conga"
KIT["E64"] = "Open Low Conga"
KIT["E65"] = "High Timbale"
KIT["E66"] = "Low Timbale"
KIT["E67"] = "High Agogo"
KIT["E68"] = "Low Agogo"
KIT["E69"] = "Cabasa"
KIT["E70"] = "Maracas"
KIT["E71"] = "Short High Whisle"
KIT["E72"] = "Long Low Whisle"
KIT["E73"] = "Short Guiro"
KIT["E74"] = "Guiro"
KIT["E75"] = "Claves"
KIT["E76"] = "High Wood Block"
KIT["E77"] = "Low Wood Block"
KIT["E78"] = "High Hoo"
KIT["E79"] = "Low Hoo"
KIT["E80"] = "Electric Mute Triangle"
KIT["E81"] = "Electric Open Triangle"
KIT["E82"] = "Shaker"
KIT["E83"] = "Jingle Bell"
KIT["E84"] = "Bell Tree"
KIT["E85"] = "Castanets"
KIT["E86"] = "Mute Surdo"
KIT["E87"] = "Open Surdo"
KIT["E88"] = "Small Club1"
KIT["E97"] = "Techno Hit"
KIT["E98"] = "Philly Hit"
KIT["E99"] = "Shock Wave"
KIT["E100"] = "Lo-Fi Rave"
KIT["E101"] = "Bam Hit"
KIT["E102"] = "Bim Hit"
KIT["E103"] = "Tape Rewind"
KIT["E104"] = "Phonograph Noise"
KIT["E105"] = "[88] Power Snare1"
KIT["E106"] = "[88] Dance Snare1"
KIT["E107"] = "[88] Dance Snare2"
KIT["E108"] = "[88] Disco Snare"
KIT["E109"] = "[88] Electric Snare2"
KIT["E110"] = "[55] Electric Snare"
KIT["E111"] = "[88] Electric Snare3"
KIT["E112"] = "TR-606 Snare"
KIT["E113"] = "TR-707 Snare"
KIT["E114"] = "[88] TR-808 Snare1"
KIT["E115"] = "[88] TR-808 Snare2"
KIT["E116"] = "TR-808 Snare2"
KIT["E117"] = "[88] TR-909 Snare1"
KIT["E118"] = "[88] TR-909 Snare2"
KIT["E119"] = "TR-909 Snare1"
KIT["E120"] = "TR-909 Snare2"
KIT["E121"] = "Rap Snare"
KIT["E122"] = "Jungle Snare1"
KIT["E123"] = "House Snare1"
KIT["E124"] = "[88] House Snare"
KIT["E125"] = "House Snare2"
KIT["E126"] = "Voice Tah"
KIT["E127"] = "[88] Slappy"

KIT["ASIA25"] = "Gamelan Gong C#"
KIT["ASIA26"] = "Gamelan Gong D#"
KIT["ASIA27"] = "Gamelan Gong G"
KIT["ASIA28"] = "Gamelan Gong A#"
KIT["ASIA29"] = "Gamelan Gong c"
KIT["ASIA30"] = "Gamelan Gong c#"
KIT["ASIA31"] = "Gamelan Gong d#"
KIT["ASIA32"] = "Gamelan Gong g"
KIT["ASIA33"] = "Gamelan Gong a#"
KIT["ASIA34"] = "Gamelan Gong C"
KIT["ASIA35"] = "Gender C#"
KIT["ASIA36"] = "Gender D#"
KIT["ASIA37"] = "Gender G"
KIT["ASIA38"] = "Gender A#"
KIT["ASIA39"] = "Gender c"
KIT["ASIA40"] = "Bonang C#"
KIT["ASIA41"] = "Bonang D#"
KIT["ASIA42"] = "Bonang G"
KIT["ASIA43"] = "Bonang A#"
KIT["ASIA44"] = "Bonang c"
KIT["ASIA45"] = "Thai Gong"
KIT["ASIA46"] = "Rama Cymbal"
KIT["ASIA47"] = "Sagat Open"
KIT["ASIA48"] = "Sagat Closed"
KIT["ASIA49"] = "Jaws Harp"
KIT["ASIA50"] = "Wadaiko"
KIT["ASIA51"] = "Wadaiko Rim"
KIT["ASIA52"] = "Taiko"
KIT["ASIA53"] = "Shimedaiko"
KIT["ASIA54"] = "Atarigane"
KIT["ASIA55"] = "Hyousigi"
KIT["ASIA56"] = "Ohkawa"
KIT["ASIA57"] = "High Kotsuzumi"
KIT["ASIA58"] = "Low Kotsuzumi"
KIT["ASIA59"] = "Yyoo Dude"
KIT["ASIA60"] = "Buk"
KIT["ASIA61"] = "Buk Rim"
KIT["ASIA62"] = "Gengari p"
KIT["ASIA63"] = "Gengari Mute Low"
KIT["ASIA64"] = "Gengari f"
KIT["ASIA65"] = "Gengari Mute High"
KIT["ASIA66"] = "Gengari Samll"
KIT["ASIA67"] = "Jang-Gu Che"
KIT["ASIA68"] = "Jang-Gu Kun"
KIT["ASIA69"] = "Jang-Gu Rim"
KIT["ASIA70"] = "Jing p"
KIT["ASIA71"] = "Jing f"
KIT["ASIA72"] = "Jing Mute"
KIT["ASIA73"] = "Asian Gong1"
KIT["ASIA74"] = "Big Gong"
KIT["ASIA75"] = "Small Gong"
KIT["ASIA76"] = "Pai Ban"
KIT["ASIA77"] = "Ban Gu"
KIT["ASIA78"] = "Tang Gu"
KIT["ASIA79"] = "Tnag Gu Mute"
KIT["ASIA80"] = "Shou Luo"
KIT["ASIA81"] = "Bend Gong"
KIT["ASIA82"] = "Hu Yin Luo Low"
KIT["ASIA83"] = "Hu Yin Luo Mid"
KIT["ASIA84"] = "Hu Yin Luo Mid Mute"
KIT["ASIA85"] = "Hu Yin Luo High"
KIT["ASIA86"] = "Hu Yin Luo High Mute"
KIT["ASIA87"] = "Nao Bo"
KIT["ASIA88"] = "Xiao Bo"

KIT["CYM32"] = "Reverse Open Hi-Hat"
KIT["CYM33"] = "Reverse Closed Hi-Hat1"
KIT["CYM34"] = "Reverse Closed Hi-Hat2"
KIT["CYM35"] = "Jungle Hi-Hat"
KIT["CYM36"] = "[55] Closed Hi-hat"
KIT["CYM37"] = "[88] Closed Hi-hat2"
KIT["CYM38"] = "[88] Closed Hi-hat3"
KIT["CYM39"] = "Closed Hi-Hat4"
KIT["CYM40"] = "Closed Hi-Hat"
KIT["CYM41"] = "TR-707 Closed Hi-Hat"
KIT["CYM42"] = "TR-606 Closed Hi-Hat"
KIT["CYM43"] = "[88] TR-808 Closed Hi-Hat"
KIT["CYM44"] = "TR-808 Closed Hi-Hat"
KIT["CYM45"] = "CR-78 Closed Hi-Hat"
KIT["CYM46"] = "[55] Pedal Hi-Hat"
KIT["CYM47"] = "[88] Pedal Hi-Hat"
KIT["CYM48"] = "Pedal Hi-Hat"
KIT["CYM49"] = "Half-Open Hi-Hat1"
KIT["CYM50"] = "Half-Open Hi-Hat2"
KIT["CYM51"] = "[55] Open Hi-Hat"
KIT["CYM52"] = "[88] Open Hi-Hat2"
KIT["CYM53"] = "[88] Open Hi-Hat3"
KIT["CYM54"] = "Open Hi-Hat"
KIT["CYM55"] = "TR-909 Open Hi-Hat"
KIT["CYM56"] = "TR-707 Open Hi-Hat"
KIT["CYM57"] = "TR-606 Open Hi-Hat"
KIT["CYM58"] = "[88] TR-808 Open Hi-Hat"
KIT["CYM59"] = "TR-808 Open Hi-Hat"
KIT["CYM60"] = "CR-78 Open Hi-Hat"
KIT["CYM61"] = "Crash Cymbal1"
KIT["CYM62"] = "Crash Cymbal2"
KIT["CYM63"] = "Crash Cymbal3"
KIT["CYM64"] = "Brush Crash Cymbal"
KIT["CYM65"] = "Hard Crash Cymbal"
KIT["CYM66"] = "TR-909 Crash Cymbal"
KIT["CYM67"] = "TR-808 Crash Cymbal"
KIT["CYM68"] = "Mute Crash Cymbal1"
KIT["CYM69"] = "Mute Crash Cymbal2"
KIT["CYM70"] = "Reverse Crash Cymbal1"
KIT["CYM71"] = "Reverse Crash Cymbal2"
KIT["CYM72"] = "Reverse Crash Cymbal3"
KIT["CYM73"] = "Reverse TR-909 Crash Cymbal"
KIT["CYM74"] = "[55] Splash Cymbal"
KIT["CYM75"] = "Splash Cymbal"
KIT["CYM76"] = "[88] Ride Bell"
KIT["CYM77"] = "[88] Brush Ride Bell"
KIT["CYM78"] = "[88] Ride Cymbal1"
KIT["CYM79"] = "[88] Ride Cymbal2"
KIT["CYM80"] = "[88] Brush Ride Cymbal"
KIT["CYM81"] = "Ride Cymbal Low Inner"
KIT["CYM82"] = "Ride Cymbal Mid Inner"
KIT["CYM83"] = "Ride Cymbal High Inner"
KIT["CYM84"] = "Ride Cymbal Low Edge"
KIT["CYM85"] = "Ride Cymbal Mid Edge"
KIT["CYM86"] = "Ride Cymbal High Edge"
KIT["CYM87"] = "TR-606 Ride Cymbal"
KIT["CYM88"] = "TR-808 Ride Cymbal"
KIT["CYM89"] = "Chinese Cymbal1"
KIT["CYM90"] = "Chinese Cymbal2"
KIT["CYM91"] = "[55] Hand Clap"
KIT["CYM92"] = "[88] Hand Clap2"
KIT["CYM93"] = "[88] Hand Clap"
KIT["CYM94"] = "Hand Clap"
KIT["CYM95"] = "Hand Clap2"
KIT["CYM96"] = "TR-707 Hand Clap"

KIT["ETH25"] = "Finger Snap"
KIT["ETH26"] = "Tambourine"
KIT["ETH27"] = "Castanets"
KIT["ETH28"] = "Crash Cymbal1"
KIT["ETH29"] = "Snare Roll"
KIT["ETH30"] = "Concert Snare Drum"
KIT["ETH31"] = "Concert Cymbal"
KIT["ETH32"] = "Concert BD1"
KIT["ETH33"] = "Jingle Bell"
KIT["ETH34"] = "Bell Tree"
KIT["ETH35"] = "Bar Chimes"
KIT["ETH36"] = "Wadaiko"
KIT["ETH37"] = "Wadaiko Rim"
KIT["ETH38"] = "Shime Taiko"
KIT["ETH39"] = "Atarigane"
KIT["ETH40"] = "Hyoushigi"
KIT["ETH41"] = "Ohkawa"
KIT["ETH42"] = "High Kotsuzumi"
KIT["ETH43"] = "Low Kotsuzumi"
KIT["ETH44"] = "Ban Gu"
KIT["ETH45"] = "Big Gong"
KIT["ETH46"] = "Small Gong"
KIT["ETH47"] = "Bend Gong"
KIT["ETH48"] = "Thai Gong"
KIT["ETH49"] = "Rama Cymbal"
KIT["ETH50"] = "Gamelan Gong"
KIT["ETH51"] = "Udo Short"
KIT["ETH52"] = "Udo Long"
KIT["ETH53"] = "Udo Slap"
KIT["ETH54"] = "Bendir"
KIT["ETH55"] = "Req Dum"
KIT["ETH56"] = "Req Tik"
KIT["ETH57"] = "Tabla Te"
KIT["ETH58"] = "Tabla Na"
KIT["ETH59"] = "Tabla Tun"
KIT["ETH60"] = "Tabla Ge"
KIT["ETH61"] = "Tabla Ge Hi"
KIT["ETH62"] = "Talking Drum"
KIT["ETH63"] = "Bend Talking Drum"
KIT["ETH64"] = "Caxixi"
KIT["ETH65"] = "Djembe"
KIT["ETH66"] = "Djembe Rim"
KIT["ETH67"] = "Timbales Low"
KIT["ETH68"] = "Timbales Paila"
KIT["ETH69"] = "Timbales High"
KIT["ETH70"] = "Cowbell"
KIT["ETH71"] = "Hi Bongo"
KIT["ETH72"] = "Low Bongo"
KIT["ETH73"] = "Mute Hi Conga"
KIT["ETH74"] = "Open Hi Conga"
KIT["ETH75"] = "Mute Low Conga"
KIT["ETH76"] = "Conga Slap"
KIT["ETH77"] = "Open Low Conga"
KIT["ETH78"] = "Conga Slide"
KIT["ETH79"] = "Mute Pandiero"
KIT["ETH80"] = "Open Pandiero"
KIT["ETH81"] = "Open Surdo"
KIT["ETH82"] = "Mute Surdo"
KIT["ETH83"] = "Tamborim"
KIT["ETH84"] = "High Agogo"
KIT["ETH85"] = "Low Agogo"
KIT["ETH86"] = "Shaker"
KIT["ETH87"] = "High Whistle"
KIT["ETH88"] = "Low Whistle"
KIT["ETH89"] = "Mute Cuica"
KIT["ETH90"] = "Open Cuica"
KIT["ETH91"] = "Mute Triangle"
KIT["ETH92"] = "Open Triangle"
KIT["ETH93"] = "Short Guiro"
KIT["ETH94"] = "Long Guiro"
KIT["ETH95"] = "Cabasa Up"
KIT["ETH96"] = "Cabasa Down"
KIT["ETH97"] = "Claves"
KIT["ETH98"] = "High Wood Block"
KIT["ETH99"] = "Low Wood Block"

KIT["KS25"] = "CR-78 Kick1"
KIT["KS26"] = "CR-78 Kick2"
KIT["KS27"] = "TR-606 Kick1"
KIT["KS28"] = "TR-707 Kick"
KIT["KS29"] = "TR-808 Kick"
KIT["KS30"] = "Hip-Hop Kick2"
KIT["KS31"] = "TR-909 Kick1"
KIT["KS32"] = "Hip-Hop Kick3"
KIT["KS33"] = "Hip-Hop Kick1"
KIT["KS34"] = "Jungle Kick2"
KIT["KS35"] = "Jungle Kick1"
KIT["KS36"] = "Techno Kick2"
KIT["KS37"] = "Techno Kick1"
KIT["KS38"] = "Standard1 Kick2"
KIT["KS39"] = "Standard1 Kick1"
KIT["KS40"] = "[88] Standard1 Kick1"
KIT["KS41"] = "[88] Standard1 Kick2"
KIT["KS42"] = "[88] Standard2 Kick1"
KIT["KS43"] = "[88] Standard2 Kick2"
KIT["KS44"] = "[55] Kick Drum1"
KIT["KS45"] = "[55] Kick Drum2"
KIT["KS46"] = "[88] Soft Kick"
KIT["KS47"] = "[88] Jazz Kick1"
KIT["KS48"] = "[88] Jazz Kick2"
KIT["KS49"] = "[55] Concert BD1"
KIT["KS50"] = "[88] Room Kick1"
KIT["KS51"] = "[88] Room Kick2"
KIT["KS52"] = "[88] Power Kick1"
KIT["KS53"] = "[88] Power Kick2"
KIT["KS54"] = "[88] Electric Kick2"
KIT["KS55"] = "[88] Electric Kick1"
KIT["KS56"] = "[55] Electric Kick"
KIT["KS57"] = "[88] TR-808 Kick"
KIT["KS58"] = "[88] TR-909 Kick"
KIT["KS59"] = "[88] Dance Kick"
KIT["KS60"] = "[88] Standard1 Snare1"
KIT["KS61"] = "[88] Standard1 Snare2"
KIT["KS62"] = "[88] Standard2 Snare1"
KIT["KS63"] = "[88] Standard2 Snare2"
KIT["KS64"] = "[55] Snare Drum2"
KIT["KS65"] = "[55] Concert Snare"
KIT["KS66"] = "[88] Jazz Snare1"
KIT["KS67"] = "[88] Jazz Snare2"
KIT["KS68"] = "[88] Room Snare1"
KIT["KS69"] = "[88] Room Snare2"
KIT["KS70"] = "[88] Power Snare1"
KIT["KS71"] = "[88] Power Snare2"
KIT["KS72"] = "[55] Gated Snare"
KIT["KS73"] = "[88] Dance Snare1"
KIT["KS74"] = "[88] Dance Snare2"
KIT["KS75"] = "[88] Disco Snare"
KIT["KS76"] = "[88] Electric Snare2"
KIT["KS77"] = "[88] House Snare"
KIT["KS78"] = "[55] Electric Snare1"
KIT["KS79"] = "[88] Electric Snare3"
KIT["KS80"] = "[88] TR-808 Snare1"
KIT["KS81"] = "[88] TR-808 Snare2"
KIT["KS82"] = "[88] TR-909 Snare1"
KIT["KS83"] = "[88] TR-909 Snare2"
KIT["KS84"] = "[88] Brush Tap1"
KIT["KS85"] = "[88] Brush Tap2"
KIT["KS86"] = "[88] Brush Slap1"
KIT["KS87"] = "[88] Brush Slap2"
KIT["KS88"] = "[88] Brush Slap3"
KIT["KS89"] = "[88] Brush Swirl1"
KIT["KS90"] = "[88] Brush Swirl2"
KIT["KS91"] = "[88] Brush Long Swirl"
KIT["KS92"] = "Standard1 Snare1"
KIT["KS93"] = "Standard1 Snare2"
KIT["KS94"] = "Standard Snare3"
KIT["KS95"] = "Rap Snare"
KIT["KS96"] = "Hip-Hop Snare2"
KIT["KS97"] = "Jungle Snare1"
KIT["KS98"] = "Jungle Snare2"
KIT["KS99"] = "Techno Snare1"
KIT["KS100"] = "Techno Snare2"
KIT["KS101"] = "House Snare2"
KIT["KS102"] = "CR-78 Snare1"
KIT["KS103"] = "CR-78 Snare2"
KIT["KS104"] = "TR-606 Snare1"
KIT["KS105"] = "TR-606 Snare2"
KIT["KS106"] = "TR-707 Snare1"
KIT["KS107"] = "TR-707 Snare2"
KIT["KS108"] = "Standard3 Snare2"
KIT["KS109"] = "TR-808 Snare2"
KIT["KS110"] = "TR-909 Snare1"
KIT["KS111"] = "TR-909 Snare2"

KIT["ORC0"] = "[88] Standard1 Kick1"
KIT["ORC1"] = "[88] Standard1 Kick2"
KIT["ORC2"] = "[88] Standard2 Kick1"
KIT["ORC3"] = "[88] Standard2 Kick2"
KIT["ORC4"] = "[55] Kick Drum1"
KIT["ORC5"] = "[55] Kick Drum2"
KIT["ORC6"] = "[88] Jazz Kick1"
KIT["ORC7"] = "[88] Jazz Kick2"
KIT["ORC8"] = "[88] Room Kick1"
KIT["ORC9"] = "[88] Room Kick2"
KIT["ORC10"] = "[88] Power Kick1"
KIT["ORC11"] = "[88] Power Kick2"
KIT["ORC12"] = "[88] Electric Kick2"
KIT["ORC13"] = "[88] Electric Kick1"
KIT["ORC14"] = "[88] TR-808 Kick"
KIT["ORC15"] = "[88] TR-909 Kick"
KIT["ORC16"] = "[88] Dance Kick"
KIT["ORC17"] = "Voice One"
KIT["ORC18"] = "Voice Two"
KIT["ORC19"] = "Voice Three"
KIT["ORC22"] = "MC-500 Beep1"
KIT["ORC23"] = "MC-500 Beep2"
KIT["ORC24"] = "Concert SD"
KIT["ORC25"] = "Snare Roll"
KIT["ORC26"] = "Finger Snap"
KIT["ORC27"] = "Closed Hi-Hat2"
KIT["ORC28"] = "Pedal Hi-Hat"
KIT["ORC29"] = "Open Hi-Hat2"
KIT["ORC30"] = "Ride Cymbal1"
KIT["ORC31"] = "Sticks"
KIT["ORC32"] = "Square Click"
KIT["ORC33"] = "Metronome Click"
KIT["ORC34"] = "Metronome Bell"
KIT["ORC35"] = "Jazz Kick1"
KIT["ORC36"] = "Concert BD1"
KIT["ORC37"] = "Side Stick"
KIT["ORC38"] = "Concert SD"
KIT["ORC39"] = "Castanets"
KIT["ORC40"] = "Concert SD"
KIT["ORC41"] = "Timpani F"
KIT["ORC42"] = "Timpani F#"
KIT["ORC43"] = "Timpani G"
KIT["ORC44"] = "Timpani G#"
KIT["ORC45"] = "Timpani A"
KIT["ORC46"] = "Timpani A#"
KIT["ORC47"] = "Timpani B"
KIT["ORC48"] = "Timpani c"
KIT["ORC49"] = "Timpani c#"
KIT["ORC50"] = "Timpani d"
KIT["ORC51"] = "Timpani d#"
KIT["ORC52"] = "Timpani e"
KIT["ORC53"] = "Timpani f"
KIT["ORC54"] = "Tambourine"
KIT["ORC55"] = "Splash Cymbal"
KIT["ORC56"] = "Cowbell"
KIT["ORC57"] = "Concert Cymbal2"
KIT["ORC58"] = "Vibra-slap"
KIT["ORC59"] = "Concert Cymbal1"
KIT["ORC60"] = "High Bongo"
KIT["ORC61"] = "Low Bongo"
KIT["ORC62"] = "Mute High Conga"
KIT["ORC63"] = "Open High Conga"
KIT["ORC64"] = "Open Low Conga"
KIT["ORC65"] = "High Timbale"
KIT["ORC66"] = "Low Timbale"
KIT["ORC67"] = "High Agogo"
KIT["ORC68"] = "Low Agogo"
KIT["ORC69"] = "Cabasa"
KIT["ORC70"] = "Maracas"
KIT["ORC71"] = "Short High Whisle"
KIT["ORC72"] = "Long Low Whisle"
KIT["ORC73"] = "Short Guiro"
KIT["ORC74"] = "Long Guiro"
KIT["ORC75"] = "Claves"
KIT["ORC76"] = "High Wood Block"
KIT["ORC77"] = "Low Wood Block"
KIT["ORC78"] = "Mute Cuica"
KIT["ORC79"] = "Open Cuica"
KIT["ORC80"] = "Mute Triangle"
KIT["ORC81"] = "Open Triangle"
KIT["ORC82"] = "Shaker"
KIT["ORC83"] = "Jingle Bell"
KIT["ORC84"] = "Bell Tree"
KIT["ORC85"] = "Castanets"
KIT["ORC86"] = "Mute Surdo"
KIT["ORC87"] = "Open Surdo"
KIT["ORC88"] = "Applause"
KIT["ORC97"] = "Applaus2"
KIT["ORC98"] = "Small Club1"
KIT["ORC99"] = "[55] Timpani D#"
KIT["ORC100"] = "[55] Timpani E"
KIT["ORC101"] = "[55] Timpani F"
KIT["ORC102"] = "[55] Timpani F#"
KIT["ORC103"] = "[55] Timpani G"
KIT["ORC104"] = "[55] Timpani G#"
KIT["ORC105"] = "[55] Timpani A"
KIT["ORC106"] = "[55] Timpani A#"
KIT["ORC107"] = "[55] Timpani B"
KIT["ORC108"] = "[55] Timpani c"
KIT["ORC109"] = "[55] Timpani c#"
KIT["ORC110"] = "[55] Timpani d"
KIT["ORC111"] = "[55] Timpani d#"
KIT["ORC112"] = "[55] Timpani e"
KIT["ORC113"] = "[55] Timpani f"
KIT["ORC114"] = "[88] Disco Snare"
KIT["ORC115"] = "[88] Electric Snare2"
KIT["ORC116"] = "[55] Electric Snare"
KIT["ORC117"] = "[88] Electric Snare 3"
KIT["ORC118"] = "TR-707 Snare"
KIT["ORC119"] = "[88] TR-808 Snare1"
KIT["ORC120"] = "[88] TR-808 Snare2"
KIT["ORC121"] = "[88] TR-909 Snare1"
KIT["ORC122"] = "[88] TR-909 Snare2"
KIT["ORC123"] = "Rap Snare"
KIT["ORC124"] = "Jungle Snare1"
KIT["ORC125"] = "House Snare1"
KIT["ORC126"] = "[88] House Snare"
KIT["ORC127"] = "House Snare2"

KIT["RHY236"] = "Reverse TR-707 Kick1"
KIT["RHY237"] = "Reverse TR-909 Kick1"
KIT["RHY238"] = "Reverse Hip-Hop Kick1"
KIT["RHY239"] = "Reverse Jungle Kick2"
KIT["RHY240"] = "Reverse Techno Kick2"
KIT["RHY241"] = "Reverse TR-606 Snare2"
KIT["RHY242"] = "Reverse CR-78 Snare1"
KIT["RHY243"] = "Reverse CR-78 Snare2"
KIT["RHY244"] = "Reverse Jungle Snare2"
KIT["RHY245"] = "Reverse Techno Snare2"
KIT["RHY246"] = "Reverse TR-707 Snare"
KIT["RHY247"] = "Reverse TR-606 Snare1"
KIT["RHY248"] = "Reverse TR-909 Snare1"
KIT["RHY249"] = "Reverse Hip-Hop Snare2"
KIT["RHY250"] = "Reverse Jungle Snare1"
KIT["RHY251"] = "Reverse House Snare"
KIT["RHY252"] = "Reverse Closed Hi-Hat"
KIT["RHY253"] = "Reverse TR-606 Closed Hi-Hat"
KIT["RHY254"] = "Reverse TR-707 Closed Hi-Hat"
KIT["RHY255"] = "Reverse TR-808 Closed Hi-Hat"
KIT["RHY256"] = "Reverse Jungle Hi-Hat"
KIT["RHY257"] = "Reverse Tambourine2"
KIT["RHY258"] = "Reverse Shake Tambourine"
KIT["RHY259"] = "Reverse TR-808 Open Hi-Hat"
KIT["RHY260"] = "Reverse TR-707 Open Hi-Hat"
KIT["RHY261"] = "Reverse Open Hi-Hat"
KIT["RHY262"] = "Reverse TR-606 Open Hi-Hat"
KIT["RHY263"] = "Reverse Hu Yin Luo"
KIT["RHY264"] = "Reverse TR-707 Crash Cymbal"
KIT["RHY265"] = "Voice One"
KIT["RHY266"] = "Reverse Voice One"
KIT["RHY267"] = "Voice Two"
KIT["RHY268"] = "Reverse Voice Two"
KIT["RHY269"] = "Voice Three"
KIT["RHY270"] = "Reverse Voice Three"
KIT["RHY271"] = "Voice Tah"
KIT["RHY272"] = "Reverse Voice Tah"
KIT["RHY273"] = "Voice Ou"
KIT["RHY274"] = "Voice Au"
KIT["RHY275"] = "Voice Whey"
KIT["RHY276"] = "Frog Vpoce"
KIT["RHY277"] = "Reverse Yyoo Dude"
KIT["RHY278"] = "Douby"
KIT["RHY279"] = "Reverse Douby"
KIT["RHY280"] = "Baert High"
KIT["RHY281"] = "Baert Low"
KIT["RHY282"] = "Bounce"
KIT["RHY283"] = "Reverse Bounce"
KIT["RHY284"] = "Dstortion Knock"
KIT["RHY285"] = "Guitar Slide"
KIT["RHY286"] = "Sub Marine"
KIT["RHY287"] = "Noise Attack"
KIT["RHY288"] = "Space Worms"
KIT["RHY289"] = "Emergency!"
KIT["RHY290"] = "Calculating..."
KIT["RHY291"] = "Saw LFO Saw"

KIT["RHY36"] = "Reverse Kick1"
KIT["RHY37"] = "Reverse Concert Bass Drum"
KIT["RHY38"] = "Reverse Power Kick1"
KIT["RHY39"] = "Reverse Electric Kick1"
KIT["RHY40"] = "Reverse Snare1"
KIT["RHY41"] = "Reverse Snare2"
KIT["RHY42"] = "Reverse Standard1 Snare1"
KIT["RHY43"] = "Reverse Snare Drum2"
KIT["RHY44"] = "Reverse Tight Snare"
KIT["RHY45"] = "Reverse 808 Snare"
KIT["RHY46"] = "Reverse Tom1"
KIT["RHY47"] = "Reverse Tom2"
KIT["RHY48"] = "Reverse Sticks"
KIT["RHY49"] = "Reverse Slap"
KIT["RHY50"] = "Reverse Cymbal1"
KIT["RHY51"] = "Reverse Cymbal2"
KIT["RHY52"] = "Reverse Open Hi-hat"
KIT["RHY53"] = "Reverse Ride Cymbal"
KIT["RHY54"] = "Reverse CR-78 Open Hi-Hat"
KIT["RHY55"] = "Reverse Closed Hi-hat"
KIT["RHY56"] = "Reverse Gong"
KIT["RHY57"] = "Reverse Bell Tree"
KIT["RHY58"] = "Reverse Guiro"
KIT["RHY59"] = "Reverse Bendir"
KIT["RHY60"] = "Reverse Gun Shot"
KIT["RHY61"] = "Reverse Scratch"
KIT["RHY62"] = "Reverse Laser Gun"
KIT["RHY63"] = "Key Click"
KIT["RHY64"] = "Techno Trip"
KIT["RHY65"] = "Pop Drop"
KIT["RHY66"] = "Woody Slap"
KIT["RHY67"] = "Distortion Kick"
KIT["RHY68"] = "Syn.Drop"
KIT["RHY69"] = "Reverse High Q"
KIT["RHY70"] = "Pipe"
KIT["RHY71"] = "Ice Block"
KIT["RHY72"] = "Digital Tambourine"
KIT["RHY73"] = "Alias"
KIT["RHY74"] = "Modulated Bell"
KIT["RHY75"] = "Spark"
KIT["RHY76"] = "Metalic Percussion"
KIT["RHY77"] = "Velocity Noise FX"
KIT["RHY78"] = "Stereo Noise Clap"
KIT["RHY79"] = "Swish"
KIT["RHY80"] = "Slappy"
KIT["RHY81"] = "Voice Ou"
KIT["RHY82"] = "Voice Au"
KIT["RHY83"] = "Hoo"
KIT["RHY84"] = "Tape Stop1"
KIT["RHY85"] = "Tape Stop2"
KIT["RHY86"] = "Missile"
KIT["RHY87"] = "Space Bird"
KIT["RHY88"] = "Flying Monster"

-- num = reaper.GetCursorPositionEx(0)

local editor = reaper.MIDIEditor_GetActive()
local take = reaper.MIDIEditor_GetTake(editor)

idx = 0
kit_type = 'ST'
retval, selected, muted, startpos, chanmsg, chan, msg1, msg2 = reaper.MIDI_GetCC(take, idx)
while retval == true do
    if chanmsg == 192 then
        if msg1 == 0 or msg1 == 1 or msg1 == 2 or msg1 == 8 or msg1 == 16 then
            kit_type = 'ST'
        end
        if msg1 == 9 or msg1 == 10 or msg1 == 24 or msg1 == 25 or msg1 == 26 or msg1 == 27 or msg1 == 28 or msg1 == 29 or msg1 == 30 then
            kit_type = 'E'
        end
        if msg1 == 32 then
            kit_type = 'JZ'
        end
        if msg1 == 40 then
            kit_type = 'BR'
        end
        if msg1 == 48 then
            kit_type = 'ORC'
        end
        if msg1 == 49 then
            kit_type = 'ETH'
        end
        if msg1 == 50 then
            kit_type = 'KS'
        end
        if msg1 == 52 then
            kit_type = 'ASIA'
        end
        if msg1 == 53 then
            kit_type = 'CYM'
        end
        if msg1 == 57 then
            kit_type = 'RHY'
        end
        if msg1 == 58 then
            kit_type = 'RHY2'
        end
    end
    idx = idx + 1
    retval, selected, muted, startpos, chanmsg, chan, msg1, msg2 = reaper.MIDI_GetCC(take, idx)
end

track = reaper.GetMediaItemTake_Track(take)
item_cout = reaper.GetTrackNumMediaItems(track)
item_idx = 0
yingao = {}
yingaonew = {}
i = 1
while item_idx < item_cout do
    item = reaper.GetTrackMediaItem(track, item_idx)
    take_note = reaper.GetMediaItemTake(item, 0)

    reaper.MIDI_DisableSort(take_note)

    retval, notecnt, ccevtcnt, extsyxevtcnt = reaper.MIDI_CountEvts(take_note)

    if notecnt > 0 then

        noteidx = 0

        while noteidx < notecnt do

            retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take_note, noteidx)

            yingao[i] = pitch

            noteidx = noteidx + 1
            i = i + 1

        end -- while end

    end -- if notecnt>0
    reaper.MIDI_Sort(take_note)
    item_idx = item_idx + 1
end

if #yingao == 0 then
    reaper.MB('当前轨没有音符！', '错误！', 0)
    reaper.SN_FocusMIDIEditor()
    return
end

-- local startpos = reaper.MIDI_GetPPQPosFromProjTime(take, num)

table.sort(yingao)

i, ii, iii = 1, 2, 1
tempyingao = -1
while i <= #yingao do
    if yingao[i] ~= tempyingao then
        yingaonew[iii] = yingao[i]
        tempyingao = yingao[i]
        iii = iii + 1
    end -- if end
    i = i + 1
end -- while end

jianhao = ''
kit_name = ''
if KIT[kit_type .. yingaonew[1]] ~= nil then
    kit_name = KIT[kit_type .. yingaonew[1]]
else
    kit_name = '无效键号?'
end
jianhao = 'CC98 =' .. yingaonew[1] .. ' * ' .. kit_name
jianhao2 = ''
while (ii <= #yingaonew and ii < 17) do
    if KIT[kit_type .. yingaonew[ii]] ~= nil then
        kit_name = KIT[kit_type .. yingaonew[ii]]
    else
        kit_name = '无效键号?'
    end
    jianhao = jianhao .. ',' .. 'CC98 =' .. yingaonew[ii] .. ' * ' .. kit_name
    ii = ii + 1
end
if #yingaonew > 16 then
    if KIT[kit_type .. yingaonew[ii]] ~= nil then
        kit_name = KIT[kit_type .. yingaonew[ii]]
    else
        kit_name = '无效键号?'
    end
    jianhao2 = 'CC98 =' .. yingaonew[ii] .. ' * ' .. kit_name
    ii = ii + 1
    while (ii <= #yingaonew and ii < 33) do
        if KIT[kit_type .. yingaonew[ii]] ~= nil then
            kit_name = KIT[kit_type .. yingaonew[ii]]
        else
            kit_name = '无效键号?'
        end
        jianhao2 = jianhao2 .. ',' .. 'CC98 =' .. yingaonew[ii] .. ' * ' .. kit_name
        ii = ii + 1
    end
end

-- 
ccidx = reaper.MIDI_EnumSelCC(take, -1)
if ccidx == -1 then
    reaper.MB('请把光标放在 CC99 上！', '光标位置错误！', 0)
    reaper.SN_FocusMIDIEditor()
    return
end
retval, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, ccidx)
startpos = ppqpos
retval2, selected2, muted2, ppqpos2, chanmsg2, chan2, msg22, msg32 = reaper.MIDI_GetCC(take, ccidx + 1)
if retval2 then
    nextcc = ppqpos2 - ppqpos
    if nextcc <= #yingaonew * 2 * 10 + 10 then
        kongjian = #yingaonew * 2 * 10 - nextcc + 20
        kongjian = string.format('%d', kongjian)
        reaper.MB('NRPN 插入空间不足！需要增加 ' .. kongjian .. ' tick', '错误！', 0)
        reaper.SN_FocusMIDIEditor()
        return
    end
end
------------------------------------------------------
endppq = startpos + (#yingaonew * 20)
endpos = reaper.MIDI_GetProjTimeFromPPQPos(take, endppq)
item = reaper.GetMediaItemTake_Item(take)
itempos = reaper.GetMediaItemInfo_Value(item, 'D_POSITION')
itemlength = reaper.GetMediaItemInfo_Value(item, 'D_LENGTH')
itemend = itempos + itemlength
timepos = reaper.format_timestr_pos(endpos, '', 2)
if endpos > itemend then
    reaper.MB('数据将超出对象长度，请输入完以后拖长对象至: ' .. timepos, '警告！', 0)
    reaper.SN_FocusMIDIEditor()
end
----------------------------------------------------------
nrpn = {}
nrpn[24] = 'Note Pitch 音符 音高'
nrpn[26] = 'Note Level 音符 电平'
nrpn[28] = 'Note Pan 音符 声像'
nrpn[29] = 'Note Revb 音符 混响'
nrpn[30] = 'Note Chors 音符 合唱'
nrpn[31] = 'Note Delay 音符 延迟'

input = '128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128'
input2 = '128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128'
chushi = "(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)"
chushi2 = "(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)"
if nrpn[msg3] ~= nil then
    retval, shuzhi = reaper.GetUserInputs(nrpn[msg3], 16, jianhao, input)
    if retval == false then
        reaper.SN_FocusMIDIEditor()
        return
    end
    a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p = string.match(shuzhi, chushi)
    q = tonumber(a)
    r = tonumber(b)
    s = tonumber(c)
    t = tonumber(d)
    u = tonumber(e)
    v = tonumber(f)
    w = tonumber(g)
    x = tonumber(h)
    y = tonumber(i)
    z = tonumber(j)
    aa = tonumber(k)
    ab = tonumber(l)
    ac = tonumber(m)
    ad = tonumber(n)
    ae = tonumber(o)
    af = tonumber(p)

    if (yingaonew[1] ~= nil and q < 128) then
        reaper.MIDI_InsertCC(take, false, false, startpos + 10, 176, chan, 98, yingaonew[1])
        reaper.MIDI_InsertCC(take, false, false, startpos + 20, 176, chan, 6, q)
    end
    if (yingaonew[2] ~= nil and r < 128) then
        reaper.MIDI_InsertCC(take, false, false, startpos + 30, 176, chan, 98, yingaonew[2])
        reaper.MIDI_InsertCC(take, false, false, startpos + 40, 176, chan, 6, r)
    end
    if (yingaonew[3] ~= nil and s < 128) then
        reaper.MIDI_InsertCC(take, false, false, startpos + 50, 176, chan, 98, yingaonew[3])
        reaper.MIDI_InsertCC(take, false, false, startpos + 60, 176, chan, 6, s)
    end
    if (yingaonew[4] ~= nil and t < 128) then
        reaper.MIDI_InsertCC(take, false, false, startpos + 70, 176, chan, 98, yingaonew[4])
        reaper.MIDI_InsertCC(take, false, false, startpos + 80, 176, chan, 6, t)
    end
    if (yingaonew[5] ~= nil and u < 128) then
        reaper.MIDI_InsertCC(take, false, false, startpos + 90, 176, chan, 98, yingaonew[5])
        reaper.MIDI_InsertCC(take, false, false, startpos + 100, 176, chan, 6, u)
    end
    if (yingaonew[6] ~= nil and v < 128) then
        reaper.MIDI_InsertCC(take, false, false, startpos + 110, 176, chan, 98, yingaonew[6])
        reaper.MIDI_InsertCC(take, false, false, startpos + 120, 176, chan, 6, v)
    end
    if (yingaonew[7] ~= nil and w < 128) then
        reaper.MIDI_InsertCC(take, false, false, startpos + 130, 176, chan, 98, yingaonew[7])
        reaper.MIDI_InsertCC(take, false, false, startpos + 140, 176, chan, 6, w)
    end
    if (yingaonew[8] ~= nil and x < 128) then
        reaper.MIDI_InsertCC(take, false, false, startpos + 150, 176, chan, 98, yingaonew[8])
        reaper.MIDI_InsertCC(take, false, false, startpos + 160, 176, chan, 6, x)
    end
    if (yingaonew[9] ~= nil and y < 128) then
        reaper.MIDI_InsertCC(take, false, false, startpos + 170, 176, chan, 98, yingaonew[9])
        reaper.MIDI_InsertCC(take, false, false, startpos + 180, 176, chan, 6, y)
    end
    if (yingaonew[10] ~= nil and z < 128) then
        reaper.MIDI_InsertCC(take, false, false, startpos + 190, 176, chan, 98, yingaonew[10])
        reaper.MIDI_InsertCC(take, false, false, startpos + 200, 176, chan, 6, z)
    end
    if (yingaonew[11] ~= nil and aa < 128) then
        reaper.MIDI_InsertCC(take, false, false, startpos + 210, 176, chan, 98, yingaonew[11])
        reaper.MIDI_InsertCC(take, false, false, startpos + 220, 176, chan, 6, aa)
    end
    if (yingaonew[12] ~= nil and ab < 128) then
        reaper.MIDI_InsertCC(take, false, false, startpos + 230, 176, chan, 98, yingaonew[12])
        reaper.MIDI_InsertCC(take, false, false, startpos + 240, 176, chan, 6, ab)
    end
    if (yingaonew[13] ~= nil and ac < 128) then
        reaper.MIDI_InsertCC(take, false, false, startpos + 250, 176, chan, 98, yingaonew[13])
        reaper.MIDI_InsertCC(take, false, false, startpos + 260, 176, chan, 6, ac)
    end
    if (yingaonew[14] ~= nil and ad < 128) then
        reaper.MIDI_InsertCC(take, false, false, startpos + 270, 176, chan, 98, yingaonew[14])
        reaper.MIDI_InsertCC(take, false, false, startpos + 280, 176, chan, 6, ad)
    end
    if (yingaonew[15] ~= nil and ae < 128) then
        reaper.MIDI_InsertCC(take, false, false, startpos + 290, 176, chan, 98, yingaonew[15])
        reaper.MIDI_InsertCC(take, false, false, startpos + 300, 176, chan, 6, ae)
    end
    if (yingaonew[16] ~= nil and af < 128) then
        reaper.MIDI_InsertCC(take, false, false, startpos + 310, 176, chan, 98, yingaonew[16])
        reaper.MIDI_InsertCC(take, false, false, startpos + 320, 176, chan, 6, af)
    end

    if #yingaonew > 16 then
        retval2, shuzhi2 = reaper.GetUserInputs(nrpn[msg3] .. ' 2', 16, jianhao2, input2)
        if retval2 == false then
            reaper.SN_FocusMIDIEditor()
            return
        end

        a2, b2, c2, d2, e2, f2, g2, h2, i2, j2, k2, l2, m2, n2, o2, p2 = string.match(shuzhi2, chushi2)
        q2 = tonumber(a2)
        r2 = tonumber(b2)
        s2 = tonumber(c2)
        t2 = tonumber(d2)
        u2 = tonumber(e2)
        v2 = tonumber(f2)
        w2 = tonumber(g2)
        x2 = tonumber(h2)
        y2 = tonumber(i2)
        z2 = tonumber(j2)
        aa2 = tonumber(k2)
        ab2 = tonumber(l2)
        ac2 = tonumber(m2)
        ad2 = tonumber(n2)
        ae2 = tonumber(o2)
        af2 = tonumber(p2)
        if (yingaonew[17] ~= nil and q2 < 128) then
            reaper.MIDI_InsertCC(take, false, false, startpos + 330, 176, chan, 98, yingaonew[17])
            reaper.MIDI_InsertCC(take, false, false, startpos + 340, 176, chan, 6, q2)
        end
        if (yingaonew[18] ~= nil and r2 < 128) then
            reaper.MIDI_InsertCC(take, false, false, startpos + 350, 176, chan, 98, yingaonew[18])
            reaper.MIDI_InsertCC(take, false, false, startpos + 360, 176, chan, 6, r2)
        end
        if (yingaonew[19] ~= nil and s2 < 128) then
            reaper.MIDI_InsertCC(take, false, false, startpos + 370, 176, chan, 98, yingaonew[19])
            reaper.MIDI_InsertCC(take, false, false, startpos + 380, 176, chan, 6, s2)
        end
        if (yingaonew[20] ~= nil and t2 < 128) then
            reaper.MIDI_InsertCC(take, false, false, startpos + 390, 176, chan, 98, yingaonew[20])
            reaper.MIDI_InsertCC(take, false, false, startpos + 400, 176, chan, 6, t2)
        end
        if (yingaonew[21] ~= nil and u2 < 128) then
            reaper.MIDI_InsertCC(take, false, false, startpos + 410, 176, chan, 98, yingaonew[21])
            reaper.MIDI_InsertCC(take, false, false, startpos + 420, 176, chan, 6, u2)
        end
        if (yingaonew[22] ~= nil and v2 < 128) then
            reaper.MIDI_InsertCC(take, false, false, startpos + 430, 176, chan, 98, yingaonew[22])
            reaper.MIDI_InsertCC(take, false, false, startpos + 440, 176, chan, 6, v2)
        end
        if (yingaonew[23] ~= nil and w2 < 128) then
            reaper.MIDI_InsertCC(take, false, false, startpos + 450, 176, chan, 98, yingaonew[23])
            reaper.MIDI_InsertCC(take, false, false, startpos + 460, 176, chan, 6, w2)
        end
        if (yingaonew[24] ~= nil and x2 < 128) then
            reaper.MIDI_InsertCC(take, false, false, startpos + 470, 176, chan, 98, yingaonew[24])
            reaper.MIDI_InsertCC(take, false, false, startpos + 480, 176, chan, 6, x2)
        end
        if (yingaonew[25] ~= nil and y2 < 128) then
            reaper.MIDI_InsertCC(take, false, false, startpos + 490, 176, chan, 98, yingaonew[25])
            reaper.MIDI_InsertCC(take, false, false, startpos + 500, 176, chan, 6, y2)
        end
        if (yingaonew[26] ~= nil and z < 128) then
            reaper.MIDI_InsertCC(take, false, false, startpos + 510, 176, chan, 98, yingaonew[26])
            reaper.MIDI_InsertCC(take, false, false, startpos + 520, 176, chan, 6, z)
        end
        if (yingaonew[27] ~= nil and aa2 < 128) then
            reaper.MIDI_InsertCC(take, false, false, startpos + 530, 176, chan, 98, yingaonew[27])
            reaper.MIDI_InsertCC(take, false, false, startpos + 540, 176, chan, 6, aa2)
        end
        if (yingaonew[28] ~= nil and ab2 < 128) then
            reaper.MIDI_InsertCC(take, false, false, startpos + 550, 176, chan, 98, yingaonew[28])
            reaper.MIDI_InsertCC(take, false, false, startpos + 560, 176, chan, 6, ab2)
        end
        if (yingaonew[29] ~= nil and ac2 < 128) then
            reaper.MIDI_InsertCC(take, false, false, startpos + 570, 176, chan, 98, yingaonew[29])
            reaper.MIDI_InsertCC(take, false, false, startpos + 580, 176, chan, 6, ac2)
        end
        if (yingaonew[30] ~= nil and ad2 < 128) then
            reaper.MIDI_InsertCC(take, false, false, startpos + 590, 176, chan, 98, yingaonew[30])
            reaper.MIDI_InsertCC(take, false, false, startpos + 600, 176, chan, 6, ad2)
        end
        if (yingaonew[31] ~= nil and ae2 < 128) then
            reaper.MIDI_InsertCC(take, false, false, startpos + 610, 176, chan, 98, yingaonew[31])
            reaper.MIDI_InsertCC(take, false, false, startpos + 620, 176, chan, 6, ae2)
        end
        if (yingaonew[32] ~= nil and af2 < 128) then
            reaper.MIDI_InsertCC(take, false, false, startpos + 630, 176, chan, 98, yingaonew[32])
            reaper.MIDI_InsertCC(take, false, false, startpos + 640, 176, chan, 6, af2)
        end
    end
end -- nrpn if
reaper.MIDI_Sort(take)
reaper.SN_FocusMIDIEditor()

