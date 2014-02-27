#!/bin/bash


spm[1]=1
spm[2]="Hvem er jeg og hva er navnet på dette scriptet?"
spm[3]=2
spm[4]="Hvor lenge er det siden siste boot?"
spm[5]=3
spm[6]="Hvor mange prosesser og tråder finnes?"
spm[7]=4
spm[8]="Hvor mange context switch'er fant sted siste sekund?"
spm[9]=5
spm[10]="Hvor stor andel av CPU-tiden ble benyttet i kernelmode og i usermode siste sekund?"
spm[11]=6
spm[12]="Hvor mange interrupts fant sted siste sekund?"
spm[13]=9
spm[14]="Avslutt dette scriptet"

result=0
while true; do

result=$(whiptail --title "Tittel!" --menu "Blah" 14 100 8 "${spm[@]}" 2>&1 >/dev/tty)

case $result in
1)
	whiptail --msgbox "Navnet på dette scriptet er $0" 14 100
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
	user=$(grep cpu /proc/stat |head -1|awk '{print $2,$3,$4}')

	set -- $user
	echo "Kernelmode: $3"
	echo "Usermode: $(($1 + $2))"
	;;
6)
	i1=$(grep intr /proc/stat |awk '{print $1}')
	sleep 1
	i2=$(grep intr /proc/stat |awk '{print $1}')
	echo "Det har vært $((i2-i1)) interrupts siste sekundet"
	;;
9)
	echo "Takk og hei, leverpostei!"
	break
	;;
*)
	echo "Ukjent alternativ $result"
	;;
esac
done