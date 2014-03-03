#!/bin/bash

width=$(($(tput cols)-10))
height=$(tput lines)
spm[1]="a"
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

result=$(whiptail --title "Tittel!" --menu "Blah" 14 $width 8 "${spm[@]}" 2>&1 >/dev/tty)

case $result in
1)
	whiptail --msgbox "Navnet på dette scriptet er $0" 14 $width
	;;
2)
	epoch=$(date +"%s")
	boot=$(grep btime /proc/stat |awk '{print $2}')
	whiptail --msgbox "Siste boot var for $(($epoch-$boot)) sekunder siden." 14 $width
	;;
3)	
	whiptail --msgbox "Det finnes $(grep processes /proc/stat |awk '{print $2}')  prosesser og tråder."	14 $width
	;;
4) 
	c1=$(grep ctxt /proc/stat |awk '{print $2}')
	sleep 1
	c2=$(grep ctxt /proc/stat |awk '{print $2}')
	whiptail --msgbox "Det er blitt gjort $(($c2-$c1)) contextswitcher siste sekund" 14 $width
	;;
5) 
	user=$(grep cpu /proc/stat |head -1|awk '{print $2,$3,$4}')

	set -- $user
	whiptail --msgbox "Kernelmode: $3, Usermode: $(($1 + $2))" 14 $width
	;;
6)
	i1=$(grep intr /proc/stat |awk '{print $2}')
	sleep 1
	i2=$(grep intr /proc/stat |awk '{print $2}')
	whiptail --msgbox "Det har vært $((i2-i1)) interrupts siste sekundet" 14 $width
	;;
9)
	whiptail --msgbox "Takk og hei, leverpostei!" 14 $width
	break
	;;
*)
	whiptail --msgbox "Ukjent alternativ $result" 14 $width
	;;
esac
done