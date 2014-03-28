# where.ps1

Get-ChildItem | Where-Object {$_.Length -gt 1KB}