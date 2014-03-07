#!/bin/bash

# for-loop som itererer over argumentene. Ingen sjekk for at hverken prosessen finnes,
# eller om det faktisk er en integer som blir gitt som argument. 
for process in $@; do

	# lager filnavnet med riktig datoformat
	filename=$process-$(date +%Y%m%d-%H:%M:%S).meminfo

	# samler variabler
	vmSize=$(grep VmSize /proc/$process/status | awk '{ print $2 }')
	vmData=$(grep VmData /proc/$process/status | awk '{ print $2 }')
	vmStk=$(grep VmStk /proc/$process/status | awk '{ print $2 }')
	vmExe=$(grep VmExe /proc/$process/status | awk '{ print $2 }')
	vmPriv=$(($vmData+$vmStk+$vmExe))
	vmLib=$(grep VmLib /proc/$process/status | awk '{ print $2 }')
	vmRSS=$(grep VmRSS /proc/$process/status | awk '{ print $2 }')
	vmPTE=$(grep VmPTE /proc/$process/status | awk '{ print $2 }')


	# oppretter filen og mater den med informasjon
	touch $filename
	echo "" >> $filename
	echo "******* Minne info om prosess med PID $process ********" >> $filename
	echo "Total bruk av virtuelt minne (VmSize):" $vmSize"KB" >> $filename
	echo "Mengde privat virtuelt minne (VmData+VmStk+VmExe):" $vmPriv"KB" >> $filename
	echo "Mengde shared virtuelt minne (VmLib):" $vmLib"KB" >> $filename
	echo "Total bruk av fysisk minne (VmRSS):" $vmRSS"KB" >> $filename
	echo -n "Mengde fysisk minne som benyttes til page table (VmPTE): " >> $filename
 	echo $vmPTE"KB" >> $filename
done