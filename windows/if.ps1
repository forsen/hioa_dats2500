# if.ps1

if ($args.Length -ne 1) {
    Write-Host "usage:" $MyInvocation.InvocationName "<argument>"
}