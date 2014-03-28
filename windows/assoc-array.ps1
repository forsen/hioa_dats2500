# assoc-array.ps1

$user=@{
    "frodeh" = "Frode Haug";
    "ivarm"  = "Ivar Moe"; 
 }

 $user+=@{"lailas" = "Laila Skiaker"}
 Write-Host $user["ivarm"]  # print Ivar Moe
 Write-Host @user           # print array values
 Write-Host $user.Keys      # print array Keys
 Write-Host $user.Count     # print length of array