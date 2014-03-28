# input-commands.ps1

$name=(Get-WmiObject Win32_OperatingSystem).Name
$kernel=(Get-WmiObject Win32_OperatingSystem).Version
Write-Host "I am running on $name , version $kernel in $(Get-Location)"