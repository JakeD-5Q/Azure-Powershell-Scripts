# Define all required modules
$modules = 'AzureAD', 'ExchangeOnlineManagement', 'MSOnline', 'Az.SecurityInsights'

# Find those that are already installed.
$installed = @((Get-Module $modules -ListAvailable).Name | Select-Object -Unique)

# Infer which ones *aren't* installed.
$notInstalled = Compare-Object $modules $installed -PassThru

if ($notInstalled) {
    # At least one module is missing.

    # Prompt for installing the missing ones.
    $promptText = @"
    The following modules aren't currently installed:
  
      $notInstalled
      
    Would you like to install them now?

"@

    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "Description."
    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", "Description."
    $cancel = New-Object System.Management.Automation.Host.ChoiceDescription "&Cancel", "Description."
    $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no, $cancel)

    ## Use the following each time your want to prompt the use
    $result = $host.ui.PromptForChoice($title, $promptText, $options, 1)

    switch ($result) {
        0 {
            Write-Host "Yes"
            Write-Host "ag"
            Install-Module -Scope CurrentUser
        }1 {
            Write-Host "No"
        }2 {
            Write-Host "Cancel"
        }
    } 
}
