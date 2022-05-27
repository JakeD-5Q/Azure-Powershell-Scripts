Import-Module LogicAppTemplate

Import-Module Az.Accounts

Login-AzAccount

$Playbook = '5QC.EscalateIncident'
$Rg = '5Q-RG-Playbooks'
$SubId = 'a1a21640-263b-45e1-9ad1-be5b4e1eb6ad'


function Get-LogicAppTemplate {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$true)] [string] $outfile 
    )
    $token = Get-AzAccessToken -ResourceUrl "https://management.azure.com" | Select-Object -ExpandProperty Token
    Get-LogicAppTemplate -LogicApp $Playbook -ResourceGroup $Rg -SubscriptionId $SubId -Token $token -Verbose | Out-File $outfile
}

Get-LogicAppTemplate outfile.json