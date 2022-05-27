# $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes","Description."
# $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No","Description."
# $cancel = New-Object System.Management.Automation.Host.ChoiceDescription "&Cancel","Description."
# $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no, $cancel)


Write-Output "Please login to your Azure account to get started"

Connect-AzureAD

Write-Host "Sign in successful."
Write-Host "Beginning setup..."

$choices = '&Yes', '&No'
$checkENV = "Does the above information look correct to you?"
$checkRG = "Will you be using the default resource group name?"

if ($Host.UI.PromptForChoice("Playbook Destination (default=RG-Playbooks)", $checkRG, $choices, 1) -eq 0) {
  $RGname = "RG-Playbooks"
} else {
    $RGname = Read-Host "Enter the name of your Playbook resource group"
}







param(
    [Parameter(Mandatory=$true)]$RGname,
    [Parameter(Mandatory=$true)]$PlaybooksFolder
)

Write-Host "Folder is: $($PlaybooksFolder)"

$armTemplateFiles = Get-ChildItem -Path $PlaybooksFolder -Filter *.json

Write-Host "Files are: " $armTemplateFiles

foreach ($armTemplate in $armTemplateFiles) {
    try {
        New-AzResourceGroupDeployment -ResourceGroupName $RGname -TemplateFile $armTemplate 
    }
    catch {
        $ErrorMessage = $_.Exception.Message
        Write-Error "Playbook deployment failed with message: $ErrorMessage" 
    }
}