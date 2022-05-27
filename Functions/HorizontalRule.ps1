#-----------------------------------------------------------------------------------------------------------------------
Function Write-HorizontalRule { #---------------------------------------------------------------------------------------
  Param (
    #Script parameters go here
    # https://ss64.com/ps/syntax-args.html
    [Parameter(Mandatory=$false,Position=0)]
    [string]$HRtype = 'SingleLine'
  )
  
  # help about_Automatic_Variables
  # help about_If
  # help about_Comparison_Operators
  # https://ss64.com/ps/if.html
  IF ($LaunchedInCmd -eq $true) {
    # Print horizontal rule styles here using Write-Host instead of Write-Verbose, since that would add "VERBOSE: " to the beginning of each line and prevent the horizontal rule from lining up on the screen properly.
	# Command Prompt character width: 79
    IF ($HRtype -eq "DoubleLine") {
      Write-Host ===============================================================================
    } ELSEIF ($HRtype -eq "DashedLine") {
      Write-Host "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
    } ELSEIF ($HRtype -eq "SingleLine") {
      #Write-Host -------------------------------------------------------------------------------- # This too long
      Write-Host -------------------------------------------------------------------------------
    } ELSEIF (-Not $HRtype) {
      Write-Host -------------------------------------------------------------------------------
    } ELSE {
      Write-Verbose "PowerShell Script launched in cmd.exe = $LaunchedInCmd"
      Write-Error -Message "Parameter -HRtype `"$HRtype`" not recognized."  -Category InvalidData -ErrorId HRtype
    }
  } ELSEIF ($LaunchedInCmd -eq $false) {
    # PowerShell window character width: 119
    IF ($HRtype -eq "DoubleLine") {
      Write-Host =======================================================================================================================
    } ELSEIF ($HRtype -eq "DashedLine") {
      Write-Host - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    } ELSEIF ($HRtype -eq "SingleLine") {
      #Write-Host ------------------------------------------------------------------------------------------------------------------------ # This too long
      Write-Host -----------------------------------------------------------------------------------------------------------------------
    } ELSEIF (-Not $HRtype) {
      Write-Host -----------------------------------------------------------------------------------------------------------------------
    } ELSE {
      Write-Verbose "PowerShell Script launched in cmd.exe = $LaunchedInCmd"
      Write-Error -Message "Parameter -HRtype `"$HRtype`" not recognized."  -Category InvalidData -ErrorId HRtype
    }
  }
} # End Write-HorizontalRule function ----------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------
