#!/bin/sh
[[ -e tmp.kya ]] && rm tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"1 Bouncing ball\"/" < ../lics/bouncing-ball-if.kyx >> tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"2 Safely stopping car\"/" < ../popltutorial/time-safe.kyx >> tmp.kya
sed "s/Exercise *\".*\"/Exercise \"3 Exercise: Runaround Robot\"/" < ../lics/CurveBotExc.kyx >> tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"3 Solution: Runaround Robot\"/" < ../lics/CurveBotDef.kyx >> tmp.kya
sed "s/ArchiveEntry *\".*\"/Exercise \"4 Exercise: Modeling two cars\"/" < TwoCarExc.kyx >> tmp.kya
cat > repls <<- EOM
s/ArchiveEntry *".*"/ArchiveEntry "5 Damped oscillator"/1
s/ArchiveEntry *".*"/ArchiveEntry "5 Increasingly damped oscillator"/2
EOM
sed -f repls < ../lics/damposc.kya >> tmp.kya
cat swirl.kyx >> tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"Parachute\"/" < parachute-nonaero.kyx >> tmp.kya

perl -pe 's/\xEF\xBB\xBF//g' < tmp.kya > lfcps-tutorial.kyx
rm tmp.kya
rm repls

#cat ../lics/bouncing-ball-if.kyx ../lics/lics4a-time-safe.kya  ../lics/CurveBotExc.kyx ../lics/CurveBotDef.kyx TwoCarExc.kyx ../lics/damposc.kya  swirl.kyx ../dlds/parachute.kya > lfcps-tutorial-building.kyx 
