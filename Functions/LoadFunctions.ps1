# Once [Functions] block has finished running, exit the script if -LoadFunctions switch is on.
If ($LoadFunctions) {
  #https://stackoverflow.com/questions/2022326/terminating-a-script-in-powershell
  # Only load functions of script. Do not execute Main script block.
  Return
}