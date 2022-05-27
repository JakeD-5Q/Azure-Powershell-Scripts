
# param(
#     # [Parameter(Mandatory=$true)]$RGname,
#     [Parameter(Mandatory=$true)]$targetFolder
# )

$targetFolder = "C:\Users\JakeDerkowski\OneDrive - 5Q Cloud\Programming\Playbook Deployment Automation\Playbooks"

Write-Host "Folder is: $($targetFolder)"

$armTemplateFiles = Get-ChildItem -Path $targetFolder -Filter *.json

Write-Host "Files are: " $armTemplateFiles

foreach ($armTemplate in $armTemplateFiles) {
    try {
        Write-Host $armTemplate
    }
    catch {
        $ErrorMessage = $_.Exception.Message
        Write-Error "Playbook deployment failed with message: $ErrorMessage" 
    }
}