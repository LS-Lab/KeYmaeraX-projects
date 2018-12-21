#!/bin/sh
cat ../lics/bouncing-ball.kya  ../lics/lics2-hybrid-forward.kya ../lics/lics4a-time-safe.kya ../lics/CurveBot.kya ../lics/rotational.kya ../lics/damposc.kya ../dlds/parachute.kya > popltutorial-building.kya 
perl -pe 's/\xEF\xBB\xBF//g' < popltutorial-building.kya > popltutorial.kya
rm popltutorial-building.kya