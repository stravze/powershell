<#
.description: Script to ADD Active Directory Users to Active Directory Groups


.usage:
    When defining users names, it needs to be there {SamName} you can get this form ADSIedit
    When defining groups, you can use the {Group name (pre-Windows 2000)}
    Remember to added Users with spaces in there {SamName} within double quotes " "
    For Multiple Users, should be split with a comma e.g. "John Smith","John Brown"


############################################################################################################################
Comments:

.add the following:
    Powershell Pester - Unit Testing
        Find-Module -Name pester
        install-module -Name pester
    Powershell Script Analyzer - Code Analysis
        Find-Module -Name PSScriptAnalyzer  (Powershell Gallery)
        Install-Module -Name PSScriptAnalyzer
        Invoke-ScriptAnalyzer -Path
#>

# Variables
$Users  = "James Matthews"
$Group = "DevOps"



# Module Import
Import-module ActiveDirectory 

if (! ( get-ADGroupMember -Identity $group | where-object { $_.name -eq $Users } ) ) {
    
        Add-ADGroupMember -Identity $Group -Members $Users

    }


## Adding Pester Unit Tests
Describe 'Active Directory' {

    it 'Does Group Exists' {
       (get-ADGroup -filter * | where-object { $_.name -eq $group } ) | Should Be $true
    }

    it 'Is User Part of Group' {
        ( get-ADGroupMember -Identity $group | where-object { $_.name -eq $Users } ) | Should Be $true 
    }
    
}