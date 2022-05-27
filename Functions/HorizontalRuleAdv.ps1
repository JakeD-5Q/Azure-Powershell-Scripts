	
Function Write-HorizontalRuleAdv { #------------------------------------------------------------------------------------
  <#
	.SYNOPSIS
	Writes a horizontal rule across the the console. 
	
	.DESCRIPTION
	Writes either a horzintal rule of different types:
	
	SingleLine "-------------------------" (default)
	DoubleLine "========================="
	DashedLine "- - - - - - - - - - - - -"
	BlankLine  "                         "
	
	Using different output types:
	
	using Write-Host (default):
	"-------------------------"
	
	using Write-Warning:
	"WARNING: ----------------"
	
	using Write-Verbose:
	"VERBOSE: ----------------"
	
	.PARAMETER HRtype
	Horizontal Rule types. Accepted types are 'SingleLine', 'DoubleLine', 'DashedLine', and 'BlankLine'. Defaults to 'SingleLine'.
	
	.PARAMETER SingleLine
	Set horizontal rule type as 'SingleLine'. Uses hyphen ('-'). If no other horizontal rule type is selected, will default to this.
	
	.PARAMETER DoubleLine
	Set horizontal rule type as 'DoubleLine'. Uses equals sign ('=')
	
	.PARAMETER DashedLine
	Set horizontal rule type as 'DashedLine'. Uses spaces between hyphen sign.
	
	.PARAMETER BlankLine
	Set horizontal rule type as 'BlankLine'
	
	.PARAMETER Endcaps
	Add a character to each end of the horizontal rule. Default is '#'. Set a different endcap character using -EndcapCharacter <single character>
	
	.PARAMETER EndcapCharacter
	Define which character is used as the end-cap using -EndcapCharacter "<SINGLE_CHARACTER>". Only works if the -Endcaps switch is also enabled. Default is '#'. 
	
	.PARAMETER IsWarning
	Prints the output as a warning (using Write-Warning).
	
	.PARAMETER IsVerbose
	Prints the output as a verbose message (using Write-Verbose). Will only be displayed if $VerbosePreference = "Continue"
	
	.EXAMPLE
	Write-HorizontalRuleAdv -BlankLine -Endcaps
	
	Prints a horizontal rule string like:
	"#                       #"
	
	.EXAMPLE
	Write-HR -double
	
	Uses the alias Write-HR to print a doubled horizontal rule (using the equals sign) like:
	"========================="
	
	.EXAMPLE
	Write-HR -dashed -IsWarning
	
	Uses the Write-HR alias to print a warning using Write-Warning, like:
	"WARNING:  - - - - - - - -"
	
	.EXAMPLE
	Write-HorizontalRuleAdv -HRtype SingleLine -Endcaps
	PS C:\> Write-HorizontalRuleAdv -HRtype BlankLine -Endcaps -EndcapCharacter `|
	PS C:\> Write-HorizontalRuleAdv -HRtype DashedLine -Endcaps
	PS C:\> Write-HorizontalRuleAdv -HRtype BlankLine -Endcaps -EndcapCharacter `|
	PS C:\> Write-HorizontalRuleAdv -HRtype DoubleLine -Endcaps
	
	Outputs something like:
	"#-----------------------#"
	"|                       |"
	"# - - - - - - - - - - - #"
	"|                       |"
	"#=======================#"
	
	.INPUTS
	If run without any input parameters, will default to a SingleLine "-----" ouput using Write-Host.
	
	.OUTPUTS
	Outputs a horizontal rule across the console of the selected type.
	
	.NOTES
	Command Prompt character width: 79
	PowerShell window character width: 119
	
	WARNING: 
	VERBOSE: 
	123456789
	
	.LINK
	about_Comment_Based_Help
	
	.LINK
	about_Functions_Advanced_Parameters
	
	.LINK
	https://docs.microsoft.com/en-us/powershell/developer/cmdlet/validating-parameter-input
	
	.LINK
	https://social.technet.microsoft.com/wiki/contents/articles/15994.powershell-advanced-function-parameter-attributes.aspx
	
	.LINK
	help about_Automatic_Variables
	
	.LINK
	help about_If
	
	.LINK
	help about_Comparison_Operators
	
  #>
  
    #------------------------------------------------------------------------------
  
  [CmdletBinding(
    DefaultParameterSetName='DefineString'
  )]
  Param (
    #Script parameters go here
    # https://ss64.com/ps/syntax-args.html
    [Parameter(Mandatory=$false,Position=0,
    ParameterSetName='DefineString')]
    [ValidateSet("SingleLine", "DoubleLine", "DashedLine", "BlankLine")]
    [Alias('HorizontalRule','HorizontalRuleType','Type','hr')]
    [string]$HRtype = 'SingleLine',
    
    [Parameter(ParameterSetName='SingleLine')]
    [Alias('s','single')]
    [switch]$SingleLine,
    
    [Parameter(ParameterSetName='DoubleLine')]
    [Alias('d','dbl','double')]
    [switch]$DoubleLine,
    
    [Parameter(ParameterSetName='DashedLine')]
    [Alias('dash','dashed')]
    [switch]$DashedLine,
    
    [Parameter(ParameterSetName='BlankLine')]
    [Alias('blank')]
    [switch]$BlankLine,
    
    [Parameter(Mandatory=$false)]
    [switch]$Endcaps = $false,

    [Parameter(Mandatory=$false)]
    [string]$EndcapCharacter = '#',
    
    [Parameter(Mandatory=$false)]
    [switch]$IsWarning = $false,

    [Parameter(Mandatory=$false)]
    [switch]$IsVerbose = $false,

    [Parameter(Mandatory=$false)]
    [switch]$MaxLineLength = $false
  )
    #------------------------------------------------------------------------------  
  
  # Function name:
  # https://stackoverflow.com/questions/3689543/is-there-a-way-to-retrieve-a-powershell-function-name-from-within-a-function#3690830
  #$FunctionName = (Get-PSCallStack | Select-Object FunctionName -Skip 1 -First 1).FunctionName
  #$FunctionName = (Get-Variable MyInvocation -Scope 1).Value.MyCommand.Name
  $FunctionName = $PSCmdlet.MyInvocation.MyCommand.Name
  
  # Set $HRtype
  If ($SingleLine) {
    $HRtype = "SingleLine"
  } elseif ($DoubleLine) {
    $HRtype = "DoubleLine"
  } elseif ($DashedLine) {
    $HRtype = "DashedLine"
  } elseif ($BlankLine) {
    $HRtype = "BlankLine"
  }
  
  # Detect if $LaunchedInCmd
  
  # help about_Automatic_Variables
  # help about_If
  # help about_Comparison_Operators
  # https://ss64.com/ps/if.html
  IF ($LaunchedInCmd) {
    # Print horizontal rule styles here using Write-Host instead of Write-Verbose, since that would add "VERBOSE: " to the beginning of each line and prevent the horizontal rule from lining up on the screen properly.
    # Command Prompt character width: 79
    IF ($HRtype -eq "DoubleLine") {
      $HRoutput = "==============================================================================="
    } ELSEIF ($HRtype -eq "DashedLine") {
      $HRoutput = "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
    } ELSEIF ($HRtype -eq "BlankLine") {
      $HRoutput = "                                                                               "
    } ELSEIF ($HRtype -eq "SingleLine") {
      #HRoutput = "--------------------------------------------------------------------------------" # This too long
      $HRoutput = "-------------------------------------------------------------------------------"
    } ELSEIF (-Not $HRtype) {
      $HRoutput = "-------------------------------------------------------------------------------"
    } ELSE {
      Write-Error -Message "Parameter -HRtype `"$HRtype`" not recognized."  -Category InvalidData -ErrorId HRtype
      Return
    }
  } ELSE {
    # PowerShell window character width: 119
    IF ($HRtype -eq "DoubleLine") {
      $HRoutput = "======================================================================================================================="
    } ELSEIF ($HRtype -eq "DashedLine") {
      $HRoutput = "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
    } ELSEIF ($HRtype -eq "BlankLine") {
      $HRoutput = "                                                                                                                       "
    } ELSEIF ($HRtype -eq "SingleLine") {
      #HRoutput = "------------------------------------------------------------------------------------------------------------------------" # This too long
      $HRoutput = "-----------------------------------------------------------------------------------------------------------------------"
    } ELSEIF (-Not $HRtype) {
      $HRoutput = "-----------------------------------------------------------------------------------------------------------------------"
    } ELSE {
      Write-Error -Message "Parameter -HRtype `"$HRtype`" not recognized."  -Category InvalidData -ErrorId HRtype
      Return
    }
  }
  
  # Command Prompt character width: 79
  # PowerShell window character width: 119
  $MaxLength = $HRoutput.Length
  
  IF ($IsWarning -eq $true -or $IsVerbose -eq $true) {
    #WARNING: 
    #VERBOSE: 
    #123456789
    $MaxLength = $MaxLength - 9
    $HRoutput = ($HRoutput).Substring(9,$MaxLength)
  }
  
  IF ($Endcaps -eq $true) {
    #$EndcapLength = $MaxLength - 2
    $MaxLength = $MaxLength - 2
    #$HRoutput = ($HRoutput).Substring(1,$EndcapLength)
    $HRoutput = ($HRoutput).Substring(1,$MaxLength)
    $HRoutput = "$EndcapCharacter$HRoutput$EndcapCharacter"
  }
  
  $MaxLineLengthOutput = $MaxLength
  
  # Write output
  
  IF ($MaxLineLength -eq $true) {
    Write-Output $MaxLineLengthOutput
  } ELSEIF ($IsWarning -eq $true) {
    Write-Warning $HRoutput -WarningAction Continue
  } ELSEIF ($IsVerbose -eq $true) {
    # Set Verbose message display
	#$VerbosePreference = "SilentlyContinue" # Will suppress Write-Verbose messages. This is the default value.
	#$VerbosePreference = "Continue" # Will print out Write-Verbose messages. Gets set when -Verbose switch is used to run the script. (Or when you set the variable manually.)
    #$OrigVerbosePreference = $VerbosePreference
    #$VerbosePreference = "Continue" # Print out Write-Verbose messages.
    Write-Verbose $HRoutput
    #$VerbosePreference = $OrigVerbosePreference
  } ELSE {
    Write-Host $HRoutput
  }
  
} # End Write-HorizontalRuleAdv function -------------------------------------------------------------------------------