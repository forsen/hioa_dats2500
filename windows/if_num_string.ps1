# if_num_string.ps1

if ($args.Count -ne 2) {
    Write-Host "usage:" $MyInvocation.InvocationName "<argument> <argument>"
    exit 0
} elseif ($args[0] -gt $args[1]) {
    Write-Host $args[0] "larger than" $args[1]
} else {
    Write-Host $args[0] "smaller than or equal to" $args[1]
}
if (Test-Path $args[0]) {
    if(!(Get-Item $args[0]).PSIsContainer) {
        Write-Host $args[0] "is a file"
        }
}
