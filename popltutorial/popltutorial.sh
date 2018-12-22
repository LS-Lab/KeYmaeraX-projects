#!/bin/sh
[[ -e tmp.kya ]] && rm tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"POPL: 1 Bouncing ball\"/" < ../lics/bouncing-ball.kya >> tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"POPL: 2 Car drives forward\"/" < ../lics/lics2-hybrid-forward.kya >> tmp.kya 
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"POPL: 3 Safely stopping car\"/" < ../lics/lics4a-time-safe.kya >> tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"POPL: 4 CurveBot\"/" < ../lics/CurveBotDef.kyx >> tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"POPL: 5 Rotational dynamics\"/" < ../lics/rotational.kya >> tmp.kya
cat > repls <<- EOM
s/ArchiveEntry *".*"/ArchiveEntry "POPL: 6 Damped oscillator"/1
s/ArchiveEntry *".*"/ArchiveEntry "POPL: 6 Increasingly damped oscillator"/2
EOM
sed -f repls < ../lics/damposc.kya >> tmp.kya
sed "s/ArchiveEntry *\".*\"/ArchiveEntry \"POPL: 7 Parachute\"/" < ../dlds/parachute.kya >> tmp.kya

#cat ../lics/bouncing-ball.kya  ../lics/lics2-hybrid-forward.kya ../lics/lics4a-time-safe.kya ../lics/CurveBotDef.kya ../lics/rotational.kya ../lics/damposc.kya ../dlds/parachute.kya > tmp.kya 
perl -pe 's/\xEF\xBB\xBF//g' < tmp.kya > popltutorial.kyx
rm tmp.kya
rm repls