#!/bin/sh
[[ -e tmp.kya ]] && rm tmp.kya
sed "s/ArchiveEntry *\"\(.*\)\"/ArchiveEntry \"DLDS\/01 Continuous car accelerates\"/" < ../lics/lics1-continuous-forward.kyx >> tmp.kya
sed "s/ArchiveEntry *\"\(.*\)\"/ArchiveEntry \"DLDS\/02 Single car drives forward\"/" < ../lics/lics2-hybrid-forward.kyx >> tmp.kya
sed "s/ArchiveEntry *\"\(.*\)\"/ArchiveEntry \"DLDS\/03 Safe stopping of time-triggered car\"/" < ../lics/lics4a-time-safe.kyx >> tmp.kya
sed "s/ArchiveEntry *\"\(.*\)\"/ArchiveEntry \"DLDS\/04 \1\"/" < ../lics/bouncing-ball.kyx >> tmp.kya
sed "s/ArchiveEntry *\"\(.*\)\"/ArchiveEntry \"DLDS\/05 \1\"/" < ../lics/rotational.kyx >> tmp.kya
sed "s/ArchiveEntry *\"\(.*\)\"/ArchiveEntry \"DLDS\/06 \1\"/" < ../lics/damposc.kyx >> tmp.kya
sed "s/ArchiveEntry *\"\(.*\)\"/ArchiveEntry \"DLDS\/07 \1\"/" < ../lics/exp-decay.kyx >> tmp.kya
sed "s/ArchiveEntry *\"\(.*\)\"/ArchiveEntry \"DLDS\/08 \1\"/" < ../dlds/parachute.kyx >> tmp.kya
sed "s/ArchiveEntry *\"\(.*\)\"/ArchiveEntry \"DLDS\/09 \1\"/" < ../games/dual-filibuster.kyx >> tmp.kya
sed "s/ArchiveEntry *\"\(.*\)\"/ArchiveEntry \"DLDS\/10 \1\"/" < ../games/pusharound-cart.kyx >> tmp.kya
sed "s/ArchiveEntry *\"\(.*\)\"/ArchiveEntry \"DLDS\/11 \1\"/" < ../games/WALL-E-EVE.kyx >> tmp.kya
sed "s/ArchiveEntry *\"\(.*\)\"/ArchiveEntry \"DLDS\/12 \1\"/" < ../games/goalie.kyx >> tmp.kya

#cat ../lics/lics1-continuous-forward.kya ../lics/lics2-hybrid-forward.kya ../lics/lics4a-time-safe.kya ../lics/bouncing-ball.kya ../lics/rotational.kya ../lics/damposc.kyx ../lics/exp.kya ../dlds/parachute.kyx ../games/dual-filibuster.kyx ../games/pusharound-cart.kyx ../games/WALL-E-EVE.kyx ../games/goalie.kyx > dlds-building.kya 

perl -pe 's/\xEF\xBB\xBF//g' < tmp.kya > ../dlds/dlds.kya
## sed 's/^\xfe\xff//' < dlds.kya > ../dlds/dlds.kya
## sed 's/^\xef\xbb\xbf//' < dlds.kya > ../dlds/dlds.kya
### sed 's/\xFE\xFF//' < dlds.kya > ../dlds/dlds.kya
###remove BOM byte order marker:   sed '1! s/\xEF\xBB\xBF//' < dlds.kya > ../dlds/dlds.kya
rm tmp.kya