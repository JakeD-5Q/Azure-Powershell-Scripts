$choices = '&Yes', '&No'
$checkENV = "Does the above information look correct to you?"
$checkRG = "Will you be using the default resource group name (default='RG-Playbooks')?"



if ($Host.UI.PromptForChoice("Install VSCode", $checkENV, $choices, 1) -eq 0) {
    Write-Output "Answer selected: Yes"
    if ($Host.UI.PromptForChoice("Install Pester", $checkRG, $choices, 1) -eq 0) {
  $RGname = "RG-Playbooks"
  } else {
    $RGname = Read-Host "Enter the name of your Playbook resource group: "
}
} else {
    Write-Error "Please sign into the correct account to try again." -ErrorAction Stop
}



