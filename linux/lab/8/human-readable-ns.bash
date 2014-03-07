#!/bin/bash

# leser STDIN
read input
size=0

# her har jeg laget en enkel while loop, alle verdier blir flooret pga heltallsdivisjon
while [[ $input -gt 1000 ]]; do
	input=$(($input/1000))
	((size++))
done

# switch-case for å avgjøre benevnelsen
case $size in 
0)
	input=$input"ns"
	;;
1)
	input=$input"us"
	;;
2)
	input=$input"ms"
	;;
3)
	input=$input"s"
	;;
esac

echo $input