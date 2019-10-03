#!/bin/sh
cat dual-filibuster.kya pusharound-cart.kya WALL-E-EVE.kya goalie.kya > games.kya 
perl -pe 's/\xEF\xBB\xBF//g' -i games.kya 
