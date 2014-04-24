function hrb($arg1){
    $size=0

    while( $arg1 -gt 1024) {
        $arg1 = $arg1/1024
        $size++
    }

    switch( $size ){
        0 { $unit="B"}
        1 { $unit="KB"}
        2 { $unit="MB"}
        3 { $unit="GB"}
        4 { $unit="TB"}
    }
    $return = "$arg1"+"$unit"
    return $return
}

foreach( $processid in $args ){
    $filename = [string]$processid+"--"+$(Get-Date -format yyyyMMdd-HHmmss)+".meminfo"
    $process = Get-process -id $processid
    $VM = hrb $process.VirtualMemorySize
    $WS = hrb $process.WorkingSet
    Write-Output "******** Minne info om prosess med PID $processid ******" >> $filename
    Write-Output "Total bruk av virtuelt minne: $VM" >> $filename
    Write-Output "Størrelse på Working Set: $WS" >> $filename
}

