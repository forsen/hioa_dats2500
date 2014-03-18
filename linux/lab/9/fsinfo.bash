#!/bin/bash

antall=$(find $1 -type f |wc -l)
storrelse=$(du -s $1 | awk '{print $1}')
dir=$1
fil=$(find $1 -type f -printf '%s\t%p\n' |sort -n |tail -n1)
hardlinks=$(find $1 -type f -printf '%n\t%p\n'| sort -n | tail -n1)
echo "Partisjonen $1 befinner seg på er $(df $1 | tail -n1 | awk '{ print $5 }') full."
echo "Det finnes $antall filer."
echo "Den største er $(echo $fil |awk '{ print $2 }') som er $(echo $fil |awk '{ print $1 }') ($(du -h `echo $fil |awk '{ print $2 }'` | awk '{print $1}')) stor."
echo "Gjennomsnittlig filstørrelse er ca $(($storrelse/$antall)) bytes."
echo "Filen $(echo $hardlinks |awk '{ print $2}') har flest hardlinks, den har $(echo $hardlinks |awk '{ print $1}')"

