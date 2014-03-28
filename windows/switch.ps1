# switch.ps1

$short = @{ yes="y"; nope="n" }
$ans = Read-Host
switch ($ans) {
    yes { Write-Host "yes" }
    nope { Write-Host "nope"; break }
    {$short.ContainsKey("$ans")} `
    { Write-Host $short[$ans] }
    default { Write-Host "$ans`???"}
}