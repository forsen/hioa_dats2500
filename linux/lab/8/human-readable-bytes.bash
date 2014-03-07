#!/bin/bash

# leser STDIN
read input
size=0

# prøvde først med en whileløkke som sjekket for om input var større enn 1024, og så lenge den var det, så gjorde den
# heltallsdivisjon på input. Problemet var at divisjonen alltid runder nedover (f.eks ble 1.9TB skrevet ut som 1TB),
# så valgte heller en while true løkke, slik at man fikk med desimalene i divisjonen
while [[ true ]]; do
	input=$( echo $input/1024 | bc -l )
	((size++))
	if [[ ${input%.*} -lt 1024 ]]; then
		break
	fi
done

# sannsynligvis ikke så elegant, men den trimmer tallet til å ha kun én desimal. 
input=${input%.*}.$(echo $input |cut -d "." -f 2 | cut -c1 )

# switch-case for å avgjøre benevnelsen
case $size in 
0)
	input=$input"B"
	;;
1)
	input=$input"KB"
	;;
2)
	input=$input"MB"
	;;
3)
	input=$input"GB"
	;;
4)
	input=$input"TB"
	;;
esac

echo $input