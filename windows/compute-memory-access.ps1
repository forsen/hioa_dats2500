$TLB=2
$RAMAKSESS=10
$DISK=10000000
$TLBHIT=$args[0]
$PAGEFAULT=$args[1]
echo $TLBHIT
echo $PAGEFAULT

$RAM= 1-$PAGEFAULT-$TLBHIT

$svar=$TLBHIT*($TLB+$RAMAKSESS)+$RAM*($TLB+$RAMAKSESS+$RAMAKSESS)+$PAGEFAULT*($TLB+$RAMAKSESS+$DISK+$TLB+$RAMAKSESS+$RAMAKSESS)

echo $svar "nanosekunder som er "
echo $(echo $svar | .\human-readable-ns.ps1)
