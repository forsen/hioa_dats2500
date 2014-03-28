# foreach-pipe.ps1

foreach ($i in $input) {
    $foo += @($i)
}

Write-Host "size of foo is" $foo.Count
