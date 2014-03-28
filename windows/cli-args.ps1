# cli-args.ps1

Write-Host "I am" $MyInvocation.InvocationName `
            "and have" $args.Count "arguments" `
            "first is" $args[0]