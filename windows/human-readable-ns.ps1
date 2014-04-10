$in = "$input"
$size = 0


while( $in -gt 1000 ){
    $in = $in/1000
    $size++
}

switch( $size ){
    0 { $unit="ns"}
    1 { $unit="us"}
    2 { $unit="ms"}
    3 { $unit="s"}
}
Write-Host $in$unit
