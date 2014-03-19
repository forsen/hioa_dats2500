#!/bin/bash

TLB=2
RAMAKSESS=10
DISK=10000000
TLBHIT=$1
PAGEFAULT=$2
RAM=$( echo "1-$PAGEFAULT-$TLBHIT"|bc)

svar=$(echo "$TLBHIT*($TLB+$RAMAKSESS)+$RAM*($TLB+$RAMAKSESS+$RAMAKSESS)+$PAGEFAULT*($TLB+$RAMAKSESS+$DISK+$TLB+$RAMAKSESS+$RAMAKSESS)" |bc)

echo $svar "nanosekunder som er "
echo $(echo $svar |cut -f 1 -d . | bash human-readable-ns.bash)