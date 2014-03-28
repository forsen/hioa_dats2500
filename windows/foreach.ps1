# foreach.ps1

foreach ($i in Get-ChildItem) {
    Write-Host $i.Name
}

# with associative arrays

$user = @{
    "frodeh" = "Frode Haugh";
    "monicas" = "Monia Strand";
    "ivarm" = "Ivar Moe"
}
foreach ($key in $user.Keys) {
    Write-Host $user[$key]
}