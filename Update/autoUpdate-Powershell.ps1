https://4bes.nl/2019/06/30/get-pwshupdates-check-if-there-is-a-powershell-update-available-and-install-it/

# update powershell from powershell
Install-Script -Name Get-PwshUpdate

# to save to a different location
# Save-Script -Name Get-PwshUpdate -Path C:\temp

########################################################################
# BELOW IS THE SCRIPT TO CREATE THE SCEDULED TASK FOR
# CHECKING FOR NEW VERSION OF POWERSHELL AND INSTALLING IT
########################################################################

# Run as administrator!
# Run in Windows PowerShell, this does not work in Core

$InstalledScriptPath = (Get-InstalledScript -Name Get-PwshUpdate).InstalledLocation
$ScriptPath = "$InstalledScriptPath\Get-PwshUpdate.ps1"
#Format as Date-Time
[DateTime]$CheckTime = "10pm"

$Parameters = @{
"Execute" = "Powershell.exe"
"Argument" = "-ExecutionPolicy Bypass -NoProfile -WindowStyle Hidden -file `" $ScriptPath`" "
}
$Action = New-ScheduledTaskAction @Parameters

$Trigger =  New-ScheduledTaskTrigger -Daily -At $CheckTime

$Parameters = @{
"Action" =  $Action
"Trigger"= $Trigger
"TaskName" = "PWSH Update check"
"RunLevel" =  "Highest"
"Description" = "Daily check for PWSH updates"
}

Register-ScheduledTask @Parameters
