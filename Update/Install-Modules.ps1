Install-Module PSReadLine
# "powershell.exe Start-Process -Verb RunAs wt"
Install-Module winget
Install-Module PowerShellGet
Install-Module AzureAD
Install-Module PSReadLine
Install-Module Az
# the many Az.x modules
Install-Module Find-String
Install-Module AzSentinel
Install-Module AzureADPreview
Install-Module AzureAD.Standard.Preview
Install-Module HackF5.ProfileAlias
Install-Module Microsoft.Graph
Install-Module MicrosoftTeams

# for incident response
Install-Module -Name MSOnline -Verbose
Install-Module -Name AzureAD -Verbose
Install-Module -Name AzureADIncidentResponse -RequiredVersion 4.0
