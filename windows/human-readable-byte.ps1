$in = "$input"
$size = 0

write-host $($in -gt 1024)

while( $in -gt 1024 ){
    $in = $in/1024
    $size++
}

switch( $size ){
    0 { $unit="B"}
    1 { $unit="KB"}
    2 { $unit="MB"}
    3 { $unit="GB"}
    4 { $unit="TB"}
}
Write-Host $in$unit
