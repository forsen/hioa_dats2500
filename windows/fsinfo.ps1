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
$dir = $args[0]
$items = Get-ChildItem -recurse $dir | Where-Object {!$_.PSIsContainer} | sort Length -descending
$full = (($items[0].PSDrive.Free/$items[0].PSDrive.Used)*100)
$max = hrb $items[0].Length
$avg = hrb ($items | Measure-Object -property length -average).average
Write-Output "Partisjonen $dir befinner seg på er $full% full"
Write-Output "Det finnes $(($items | Measure-Object).Count) filer."
Write-Output "Den største er  $($items[0].FullName) som er $max stor."
Write-Output "Gjennomsnittlig filstørrelse er $avg"
