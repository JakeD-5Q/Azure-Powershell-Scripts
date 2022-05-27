Microsoft.PowerShell_profile.ps1
# Location shortcuts ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$apps = "C:\Users\JakeDerkowski\OneDrive\Apps"
$school = "C:\Users\JakeDerkowski\OneDrive\SHSU"
$mydocs = "C:\Users\JakeDerkowski\OneDrive\Documents"
$mycloud = "C:\Users\JakeDerkowski\OneDrive"
$5q = "C:\Users\JakeDerkowski\OneDrive - 5Q Cloud"
$coding = "C:\Users\JakeDerkowski\OneDrive\Programming"
$ipcheck = "C:\Users\JakeDerkowski\OneDrive - 5Q Cloud\Apps\mySOCTools\ipinfo\check_ip.py"
$ipinfo = "C:\Users\JakeDerkowski\OneDrive\Apps\IP-tools\ip_total_info.py"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Location shortcuts

function Get-Loc {
    Split-Path -leaf -path (Get-Location)
}

function Prompt {
    $colorTable = @{
        "Reset"  = "`e[0m";
        "Red"    = "`e[31;1m";
        "Green"  = "`e[32;1m";
        "Yellow" = "`e[33;1m";
        "Grey"   = "`e[37;0m";
        "White"  = "`e[37;1m";
        "Invert" = "`e[7m";
        "RedBg"  = "`e[41m";
        "CyanBg" = "`e[46m";
    }

    $CurrentDir = (Get-Loc)

    switch ($CurrentDir -like "$($env:USERPROFILE)*") {
        $true {
            # $CurrentDir = $CurrentDir.Replace($env:USERPROFILE)
            $CurrentDir = (Get-Loc)
            break
        }

        Default {
            break
        }
    }

    $PSVersion = "$($PSVersionTable.PSVersion.Major).$($PSVersionTable.PSVersion.Minor).$($PSVersionTable.PSVersion.Patch)"

    $promptKey = $null
    switch ((New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        $true {
            $promptKey = "$($colorTable.Red)`$"
            break
        }

        Default {
            $promptKey = "$($colorTable.Yellow) ~ "
            break
        }
    }

    $promptText = "$($colorTable.Reset)$($colorTable.Red)[$env:COMPUTERNAME]:$($colorTable.Reset)$($colorTable.Green)[$($CurrentDir)]$($colorTable.Reset)$($promptKey)$($colorTable.Reset)"

    "${promptText} "

}

#Import profile functions if the folder exists in the profile's directory
$profileFunctionsFolder = [System.IO.Path]::Combine($PSScriptRoot, "ProfileFunctions")

switch (Test-Path -Path $profileFunctionsFolder) {
    $true {
        $profileFunctions = Get-ChildItem -Path $profileFunctionsFolder -Recurse | Where-Object { $PSItem.Extension -eq ".ps1" }
        $functionsBefore = Get-ChildItem -Path "Function:\"
        foreach ($func in $profileFunctions) {
            . "$($func.FullName)"
        }
        $functionsAfter = Get-ChildItem -Path "Function:\" | Where-Object { $PSItem -notin $functionsBefore }

        switch (($functionsAfter | Measure-Object).Count -gt 0) {
            $true {
                switch ($null -ne $env:WT_SESSION) {
                    $true {
                        Write-Output "$("`e[33;1m")❗❗ WARNING ❗❗"
                        Write-Output "Functions loaded through profile:"
                        Write-Output "$("`e[0m")"
                        break
                    }

                    Default {
                        Write-Warning "Functions loaded through profile -"
                        break
                    }
                }
                foreach ($loadedFunction in $functionsAfter) {
                    Write-Warning "* $($loadedFunction.Name)"
                }
                break
            }
        }
        break
    }
}


if($Host.UI.RawUI.WindowTitle -like "*administrator*"){
    $Host.UI.RawUI.ForegroundColor = "Red"
}

if ($host.Name -eq 'ConsoleHost')
{
 Import-Module PSReadLine
}

# region profile alias initialize
Import-Module -Name HackF5.ProfileAlias -Force -Global -ErrorAction SilentlyContinue
# end region
Import-Module AzureAD
