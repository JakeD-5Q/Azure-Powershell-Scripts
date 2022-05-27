Import-Module PSReadLine
# "powershell.exe Start-Process -Verb RunAs wt"
Import-Module winget
Import-Module PowerShellGet
Import-Module AzureAD
Import-Module PSReadLine
Import-Module Az
# the many Az.x modules
Import-Module Find-String
Import-Module AzSentinel
Import-Module AzureADPreview
Import-Module AzureAD.Standard.Preview
Import-Module HackF5.ProfileAlias
Import-Module Microsoft.Graph
Import-Module MicrosoftTeams

# for incident response
Import-Module -Name MSOnline
Import-Module -Name AzureAD
Import-Module -Name AzureADIncidentResponse -RequiredVersion 4.0
