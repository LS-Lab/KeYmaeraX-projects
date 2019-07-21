#!/bin/sh
cat ../lics/bouncing-ball-if.kyx ../lics/lics4a-time-safe.kya  ../lics/CurveBotExc.kyx ../lics/CurveBotDef.kyx TwoCarExc.kyx ../lics/damposc.kya  swirl.kyx ../dlds/parachute.kya > lfcps-tutorial-building.kyx 
perl -pe 's/\xEF\xBB\xBF//g' < lfcps-tutorial-building.kyx > ../lfcps-tutorial/lfcps-tutorial.kyx
rm lfcps-tutorial-building.kyx