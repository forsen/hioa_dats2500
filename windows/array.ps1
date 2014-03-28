# array.ps1

$os=@("linux", "windows")
$os+=@("mac")

Write-Host $os[1]       # print windows
Write-Host $os          # print array values
Write-Host $os.Count    # length of array
