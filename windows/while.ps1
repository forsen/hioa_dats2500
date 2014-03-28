# while.ps1

while ($i -le 3){
    Write-Host $i
    $i++
}

# something more useful:

$file=Get-ChildItem
$i=0
while ($i -lt $file.Count) {
    if (!(Get-Item $file[$i]).PSIsContainer) {
        Write-Host $file[$i] "is a file"
    }else{
        Write-Host $file[$i] "is a directory"
    }
    $i++
}