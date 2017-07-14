#!/bin/sh
cat lics1-continuous-forward.kya lics2-hybrid-forward.kya  lics4a-time-safe.kya bouncing-ball.kya rotational.kya damposc.kya exp.kya > dlds.kya 
perl -pe 's/\xEF\xBB\xBF//g' < dlds.kya > ../dlds/dlds.kya
## sed 's/^\xfe\xff//' < dlds.kya > ../dlds/dlds.kya
## sed 's/^\xef\xbb\xbf//' < dlds.kya > ../dlds/dlds.kya
### sed 's/\xFE\xFF//' < dlds.kya > ../dlds/dlds.kya
###remove BOM byte order marker:   sed '1! s/\xEF\xBB\xBF//' < dlds.kya > ../dlds/dlds.kya
rm dlds.kya