$OS = Get-wmiobject Win32_OperatingSystem
$Uptime = (Get-Date) - $OS.ConvertToDateTime($OS.LastBootUpTime)
[int]$DaysUp = $Uptime.TotalDays
$Days = 7

if($DaysUp -gt $Days){
    Write-Output "System has been up for $DaysUp Days. Scheduling Reboot."
    $Tomorrow = (Get-Date).AddDays(1).Date.AddHours($Time)
    shutdown -r -t ([decimal]::round(($Tomorrow - (Get-Date)).TotalSeconds))
}