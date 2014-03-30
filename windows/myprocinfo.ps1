# myprocinfo.ps1

function lastBoot() {
    $wmi = Get-WmiObject Win32_OperatingSystem
    $wmi.ConvertToDateTime($wmi.LocalDateTime) - $wmi.ConvertToDateTime($wmi.LastBootUpTime)
}

function percentUserPriv() {
    $wmi = Get-WmiObject Win32_PerfFormattedData_Counters_ProcessorInformation
    Write-Host $($wmi[0].PercentUserTime) "`% ble brukt i usermode siste sekund, og" $($wmi[0].PercentPrivilegedTime) "`% ble brukt i kernelmode"
}
$continue = "yes"
while( $continue -eq "yes" ) {
    Clear-Host
    Write-Host "1 - Hvem er jeg og hva er navnet på dettes scriptet?"
    Write-Host "2 - Hvor lenge er det siden siste boot?"
    Write-Host "3 - Hvor mange prosesser og tråder finnes?"
    Write-Host "4 - Hvor mange context switch'er fant sted siste sekund?"
    Write-Host "5 - Hvor stor andel av CPU-tiden" `
    "ble benyttet i kernelmode og i usermode siste sekund?"
    Write-Host "6 - Hvor mange interrupts fant sted siste sekund?"
    Write-Host "9 - Avslutt dette scriptet`n"

    $answer=Read-Host "Velg en funksjon"

    switch ($answer) {
        1 { Write-Host "Jeg er"$(hostname) "og dette scriptet heter" $MyInvocation.InvocationName }
        2 { lastBoot }
        3 { Write-Host "Det finnes $((Get-WmiObject Win32_OperatingSystem).NumberOfProcesses) prosesser og tråder." }
        4 { Write-Host "Det var" $((Get-WmiObject Win32_PerfFormattedData_PerfOS_System).ContextSwitchesPersec) "context switcher siste sekund."}
        5 { percentUserPriv }
        6 { Write-Host "Det var" $((Get-WmiObject Win32_PerfFormattedData_Counters_ProcessorInformation)[0].InterruptsPersec) "interrupts siste sekund"}
        9 { $continue = "no" }
    }
    if ($continue -ne "no" ) {  
        Read-Host "Trykk enter for å fortsette"
    }
}
