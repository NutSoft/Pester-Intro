# The directory of Get-Planet.Tests.ps1
$script_dir = Split-Path -Parent $MyInvocation.MyCommand.Path
 
# Load the script to test into memory
. "$script_dir\Get-Planet.ps1"
 
Describe 'Get-Planet' {
    It 'Given no parameters, it lists all 8 planets' {
        $allPlanets = Get-Planet
        $allPlanets.Count | Should -Be 8
    }
}