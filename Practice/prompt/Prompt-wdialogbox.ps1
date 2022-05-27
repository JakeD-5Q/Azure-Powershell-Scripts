$yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes","Run script."
$no = New-Object System.Management.Automation.Host.ChoiceDescription "&No","Exit, and set variables."
$view = New-Object System.Management.Automation.Host.ChoiceDescription "&View","Print variable to screen and exit."
$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no, $view)
$heading = ""
$ques = "Have the script variables been configured for the target Azure environment?"
$rslt = $host.ui.PromptForChoice($heading, $ques, $options, 1)
switch ($rslt) {
  0{
    Write-Host "Yes" -ForegroundColor Green
  }1{
    Write-Host "No" -ForegroundColor Red;
    Exit;
  }2{
    Write-Host "Cancel" -ForegroundColor Red
    }
}
