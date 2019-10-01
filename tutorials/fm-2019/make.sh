#!/bin/sh
[[ -e tmp.kya ]] && rm tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"1 Bouncing ball\"/" < ../../lics/bouncing-ball-if.kyx >> tmp.kya
sed "s/Exercise *\".*\"/Exercise \"2 Exercise: Runaround Robot\"/" < ../../lics/CurveBotExc.kyx >> tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"2 Solution: Runaround Robot\"/" < ../../lics/CurveBotDef.kyx >> tmp.kya
sed "s/ArchiveEntry *\"\(.*\)\"/ArchiveEntry \"3 \1\"/" <../../lfcps-tutorial/swirl.kyx >> tmp.kya
cat > repls <<- EOM
s/ArchiveEntry *"Damp.*"/ArchiveEntry "4 Damped oscillator"/
s/ArchiveEntry *"Increas.*"/ArchiveEntry "4 Increasingly damped oscillator"/
EOM
sed -f repls < ../../lics/damposc.kya >> tmp.kya
sed "s/ArchiveEntry *\"\(.*\)\"/ArchiveEntry \"5 \1\"/" <../../lfcps-tutorial/KeplerProblem.kyx >> tmp.kya

sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"6 Coasting Car\"/" < ../../lfcps-tutorial/CoastingCar.kyx >> tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"7 Exercise: Accelerating Car\"/" < ../../lfcps-tutorial/carExc.kyx >> tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"7 Solution: Accelerating Car\"/" < ../../popltutorial/time-safe.kyx >> tmp.kya

perl -pe 's/\xEF\xBB\xBF//g' < tmp.kya > fm-2019-tutorial.kyx
rm tmp.kya
rm repls
