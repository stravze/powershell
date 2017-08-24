<#
Scenario:

The boss has decided you need to check computers on the network. 
After the check has been completed, a registry key needs to be updated with the date and time of the check. 
You should test for the existence of the registry key, and if the registry key does not exist, it should be created. 
If the registry key does exist, it only needs to be updated.

Because this script will be called from a logon script, it does not need the ability to run against a remote machine. 
We are not concerned in this script with the code that performs the check, only the code that updates the registry key. 
The registry key should look like the one shown in the following image.

############################################################################################################################
Comments:

Additional work:

Adding the following:
    Powershell Pester - Unit Testing
        Find-Module -Name pester
        install-module -Name pester
    Powershell Script Analyzer - Code Analysis
        Find-Module -Name PSScriptAnalyzer  (Powershell Gallery)
        Install-Module -Name PSScriptAnalyzer
        Invoke-ScriptAnalyzer -Path
#>

$reg_key = "HKLM:\SOFTWARE\SEJM"

if (!(test-path  $reg_key)) {

    new-item "HKLM:\SOFTWARE\SEJM"
    set-ItemProperty -path "HKLM:\SOFTWARE\SEJM" -Name update -value (get-date) -Type string

    }

if ( (Get-ItemProperty  -path "HKLM:\SOFTWARE\SEJM" -Name update).update -lt (get-date) )
    {
    set-ItemProperty -path "HKLM:\SOFTWARE\SEJM" -Name update -value (get-date) -Type string
    }

## Adding Pester Unit Tests
Describe 'Registry Folder should Exist' {

    it $reg_key {
       $reg_key | Should Exist
    }

    it 'Registry String' {
        (Get-ItemProperty  -path "HKLM:\SOFTWARE\SEJM" -Name update) | Should Be $true 
 }

    it 'Registry Value' {
        (Get-ItemProperty  -path "HKLM:\SOFTWARE\SEJM" -Name update).update | Should Not BeNullOrEmpty
    }

}