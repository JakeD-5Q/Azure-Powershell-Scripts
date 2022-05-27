Write-Host "Ths is practice"


function PrintHeader {
    param ( $header )
    $line = "-------------------------------------------------------------"

    Write-Output $line
    Write-Output "`t`t$header"
    Write-Output $line    
}
PrintHeader "Automated Playbook Deployment"

