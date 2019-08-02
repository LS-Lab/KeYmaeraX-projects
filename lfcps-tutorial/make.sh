#!/bin/sh
[[ -e tmp.kya ]] && rm tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"1 Bouncing ball\"/" < ../lics/bouncing-ball-if.kyx >> tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"2 Exercise: Car\"/" < carExc.kyx >> tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"3 Safely stopping car\"/" < ../popltutorial/time-safe.kyx >> tmp.kya
sed "s/Exercise *\".*\"/Exercise \"4 Exercise: Runaround Robot\"/" < ../lics/CurveBotExc.kyx >> tmp.kya
#sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"3 Solution: Runaround Robot\"/" < ../lics/CurveBotDef.kyx >> tmp.kya
sed "s/Exercise *\".*\"/Exercise \"5 Exercise: Modeling two cars\"/" < TwoCarExc.kyx >> tmp.kya
cat > repls <<- EOM
s/ArchiveEntry *"Damp.*"/ArchiveEntry "6 Damped oscillator"/
s/ArchiveEntry *"Increas.*"/ArchiveEntry "6 Increasingly damped oscillator"/
EOM
sed -f repls < ../lics/damposc.kya >> tmp.kya
sed "s/ArchiveEntry *\"\(.*\)\"/ArchiveEntry \"7 \1\"/" <swirl.kyx >> tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"8 Parachute simplified\"/" < parachute-nonaero.kyx >> tmp.kya
sed "s/ArchiveEntry *\"\(.*\)\"/ArchiveEntry \"9 \1\"/" <KeplerProblem.kyx >> tmp.kya
sed "s/Exercise *\"\(.*\)\"/Exercise \"9 \1\"/" <gravitational-field-moonExc.kyx >> tmp.kya

perl -pe 's/\xEF\xBB\xBF//g' < tmp.kya > lfcps-tutorial.kyx
rm tmp.kya
rm repls
