#!/bin/bash
clear
echo "1 - Hvem er jeg og hva er navnet på dette scriptet?"
echo "2 - Hvor lenge er det siden siste boot?"
echo "3 - Hvor mange prosesser og tråder finnes?"
echo "4 - Hvor mange context switch'er fant sted siste sekund?"
echo "5 - Hvor stor andel av CPU-tiden ble benyttet i kernelmode og i usermode siste sekund?"
echo "6 - Hvor mange interrupts fant sted siste sekund?"
echo "9 - Avslutt dette scriptet"

while read menuitem; do
case $menuitem in
1)
	echo "Navnet på dette scriptet er $0"
	;;
2)
	epoch=$(date +"%s")
	boot=$(grep btime /proc/stat |awk '{print $2}')
	echo "Siste boot var for $(($epoch-$boot)) sekunder siden."
	;;
3)	
	echo "Det finnes $(grep processes /proc/stat |awk '{print $2}')  prosesser og tråder."	
	;;
4) 
	c1=$(grep ctxt /proc/stat |awk '{print $2}')
	sleep 1
	c2=$(grep ctxt /proc/stat |awk '{print $2}')
	echo "Det er blitt gjort $(($c2-$c1)) contextswitcher siste sekund"
	;;
5) 
	p1=$(grep cpu /proc/stat |head -1|awk '{print $2,$3,$4}')
	sleep 1
	p2=$(grep cpu /proc/stat |head -1|awk '{print $2,$3,$4}')
	p1a=(${p1// / })
	p2a=(${p2// / })

	echo "Kernelmode: $((${p2a[0]} - ${p1a[0]}))"
	echo "Usermode: $(($((${p2a[1]} + ${p2a[2]})) - $((${p1a[1]} + ${p1a[2]}))))"
	;;
6)
	i1=$(grep intr /proc/stat |awk '{print $2}')
	sleep 1
	i2=$(grep intr /proc/stat |awk '{print $2}')
	echo "Det har vært $((i2-i1)) interrupts siste sekundet"
	;;
9)
	echo "Takk og hei, leverpostei!"
	break
	;;
*)
	echo "Ukjent alternativ $menuitem"
	;;
esac
done