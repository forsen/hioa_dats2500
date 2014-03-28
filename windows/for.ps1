# for.ps1

for ($i=1;$i-le3;$i++) {
    Write-Host "$i"
}

#something more useful

$file=Get-ChildItem
for($i=0; $i-lt$file.Count; $i++) {
    if(!(Get-Item $file[$i]).PSIsContainer) {
        Write-Host $file[$i].Name "is a file"
    }else{
        Write-Host $file[$i].Name "is a directory"
    }
}