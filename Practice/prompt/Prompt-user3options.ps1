
# read host
$msg = 'Do you want to add alternative DNS names or IPs into Certificate? [Y/N]'
do {
    $response = Read-Host -Prompt $msg
    if ($response -eq 'y') {
        # prompt for name/address and add to certificate
    }
} until ($response -eq 'n')

# PromptfiorChoice
$title   = 'Certificate Alternative Names'
$msg     = 'Do you want to add alternative DNS names or IPs?'
$options = '&Yes', '&No'
$default = 1  # 0=Yes, 1=No

do {
    $response = $Host.UI.PromptForChoice($title, $msg, $options, $default)
    if ($response -eq 0) {
        # prompt for name/address and add to certificate
    }
} until ($response -eq 1)



# choice
$msg = 'Do you want to add alternative DNS names or IPs into Certificate'
do {
    choice /c yn /m $msg
    $response = $LASTEXITCODE
    if ($response -eq 0) {
        # prompt for name/address and add to certificate
    }
} until ($response -eq 1)