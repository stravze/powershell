<#
.scenario: 
        create a program that will allow you to enter events organizable by hour. There must be menu options of some form, and you must be able to easily edit, add, and delete events without directly changing the source code.
        (note that by menu i dont necessarily mean gui. as long as you can easily access the different options and receive prompts and instructions telling you how to use the program, it will probably be fine)

.link: https://www.reddit.com/r/dailyprogrammer/comments/pihtx/intermediate_challenge_1/

.breakdown challenge
    create menu (Add / Edit and Delete)


Adding the following:
    Powershell Pester - Unit Testing
        Find-Module -Name pester
        install-module -Name pester
    Powershell Script Analyzer - Code Analysis
        Find-Module -Name PSScriptAnalyzer  (Powershell Gallery)
        Install-Module -Name PSScriptAnalyzer
        Install-Module -Name PSCodeHealth
        Invoke-ScriptAnalyzer -Path
        Invoke-PSCodeHealth -Path -TestsPath

#>

function get-log {
    
    if ([System.Diagnostics.EventLog]::SourceExists("EventCalendar") -eq $False) 
    {
        New-EventLog -LogName "EventCalendar" -Source "EventCalendar"
    }



} get-log


function show-menu {
    
    param (
        [string]$Title = "Event Menu"
    )
clear-host

  Write-Host "================ $Title ================"
     
     Write-Host "Create: Press 'c' for this option."
     Write-Host "Edit: Press 'e' for this option."
     Write-Host "Delete: Press 'd' for this option."
     Write-Host "Q: Press 'Q' to quit."
}

do
{
     Show-Menu
     $input = Read-Host "Please make a selection"
     switch ($input)
     {
           'Create' {
                clear-host
                'You chose option #1'
           } 'Edit' {
                clear-host
                'You chose option #2'
           } 'Delete' {
                cls
                'You chose option #3'
           } 'q' {
                return
           }
     }
     pause
}
until ($input -eq 'q')



## Adding Pester Unit Tests
Describe 'Event Log Exists' {

    it 'Event Log Exists' {
        ([System.Diagnostics.EventLog]::SourceExists("EventCalendar")) | Should Be $true 
 }


}