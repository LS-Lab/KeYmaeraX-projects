#!/bin/sh
cat ../lics/lics1-continuous-forward.kya ../lics/lics2-hybrid-forward.kya ../lics/lics4a-time-safe.kya ../lics/bouncing-ball.kya ../lics/rotational.kya ../lics/damposc.kyx ../lics/exp.kya ../dlds/parachute.kyx ../games/dual-filibuster.kya ../games/pusharound-cart.kya ../games/WALL-E-EVE.kya ../games/goalie.kya > dlds-building.kya 
perl -pe 's/\xEF\xBB\xBF//g' < dlds-building.kya > ../dlds/dlds.kya
## sed 's/^\xfe\xff//' < dlds.kya > ../dlds/dlds.kya
## sed 's/^\xef\xbb\xbf//' < dlds.kya > ../dlds/dlds.kya
### sed 's/\xFE\xFF//' < dlds.kya > ../dlds/dlds.kya
###remove BOM byte order marker:   sed '1! s/\xEF\xBB\xBF//' < dlds.kya > ../dlds/dlds.kya
rm dlds-building.kya