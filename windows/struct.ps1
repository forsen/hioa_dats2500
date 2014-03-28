# struct.ps1

$myhost=New-Object PSObject -Property `
    @{os="";
        sw=@();
        user=@{}
    }
$myhost.os="linux"
$myhost.sw+=@("gcc", "flex", "vim")
$myhost.user+=@{
    "frodeh"="Frode Haug";
    "monicas"="Monica Strand"
    }

Write-Host $myhost.os
Write-Host $myhost.sw[2]
Write-Host $myhost.user["monicas"]