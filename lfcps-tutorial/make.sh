#!/bin/sh
[[ -e tmp.kya ]] && rm tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"LFCPS Tutorial\/1 Bouncing ball\"/" < ../lics/bouncing-ball-if.kyx >> tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"LFCPS Tutorial\/2 Coasting Car\"/" < CoastingCar.kyx >> tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"LFCPS Tutorial\/3 Exercise: Accelerating Car\"/" < carExc.kyx >> tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"LFCPS Tutorial\/3 Solution: Accelerating Car\"/" < ../popltutorial/time-safe.kyx >> tmp.kya
sed "s/Exercise *\".*\"/Exercise \"LFCPS Tutorial\/4 Exercise: Runaround Robot\"/" < ../lics/CurveBotExc.kyx >> tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"LFCPS Tutorial\/4 Solution: Runaround Robot\"/" < ../lics/CurveBotDef.kyx >> tmp.kya
sed "s/Exercise *\".*\"/Exercise \"LFCPS Tutorial\/5 Exercise: Modeling two cars\"/" < TwoCarExc.kyx >> tmp.kya
cat > repls <<- EOM
s/ArchiveEntry *"Damp.*"/ArchiveEntry "LFCPS Tutorial\/6 Damped oscillator"/
s/ArchiveEntry *"Increas.*"/ArchiveEntry "LFCPS Tutorial\/6 Increasingly damped oscillator"/
EOM
sed -f repls < ../lics/damposc.kyx >> tmp.kya
sed "s/ArchiveEntry *\"\(.*\)\"/ArchiveEntry \"LFCPS Tutorial\/7 \1\"/" <swirl.kyx >> tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"LFCPS Tutorial\/8 Parachute simplified\"/" < parachute-nonaero.kyx >> tmp.kya
sed "s/ArchiveEntry *\"\(.*\)\"/ArchiveEntry \"LFCPS Tutorial\/9 \1\"/" <KeplerProblem.kyx >> tmp.kya
sed "s/Exercise *\"\(.*\)\"/Exercise \"LFCPS Tutorial\/9 \1\"/" <gravitational-field-moonExc.kyx >> tmp.kya

perl -pe 's/\xEF\xBB\xBF//g' < tmp.kya > lfcps-tutorial.kyx
rm tmp.kya
rm repls
