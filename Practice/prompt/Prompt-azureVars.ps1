Import-Module Az.Resources

# create a unique suffix for the deployment name
$today = Get-Date -Format "MM-dd-yyyy"
$suffix = Get-Random -Maximum 100

# Deployment region
# all lowercase, no spaces i.e. "eastus"
$location = ''

# Create the appropriate names for the resource groups
$ClientAbbrev = ''
$RGSentinel = 'RG-' + $ClientAbbrev + '-Sentinel'
$RGPlaybooks = 'RG-' + $ClientAbbrev + '-Playbooks'
$RGAPIConnections = 'RG-' + $ClientAbbrev + '-APIConnections'


function Print-ConfigurableValues(){
  Write-Host "Location: $location"
  Write-Host "Abbreviation: $ClientAbbrev"
  Write-Host "Sentinel RG name: $RGSentinel"
  Write-Host "Playbook RG name: $RGPlaybooks"
}


# advisory message
Write-Host "Please ensure that all null variables have been populated 
before continuing with this script."
# Continue?
$yes = New-Object System.Management.Automation.Host.ChoiceDescription 
"&Yes","Run script."
$no = New-Object System.Management.Automation.Host.ChoiceDescription 
"&No","Exit, and set variables."
$view = New-Object System.Management.Automation.Host.ChoiceDescription 
"&View","Print variable to screen and exit."
$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, 
$no, $view)
$heading = ""
$ques = "Have the script variables been configured for the target Azure 
environment?"
$rslt = $host.ui.PromptForChoice($heading, $ques, $options, 1)
switch ($rslt) {
  0{
    Write-Host "Yes" -ForegroundColor Green
  }1{
    Write-Host "No" -ForegroundColor Red;
    Exit;
  }2{
    Write-Host "Cancel" -ForegroundColor Red;
    Print-ConfigurableValues;
    Exit;
    }
}

# Connect to Azure account
Connect-AzAccount
# Set the correct subscription
Set-AzContext $SubscriptionId
# Create resource group for the Log analytic workspace/Sentinel
New-AzResourceGroup `
  -Name myResourceGroup `
  -Location "Central US"




# Create Resource group for Playbooks

# Create Resource group for API Connection

# Create Resource group and Storage account (required to use cloudshell)

