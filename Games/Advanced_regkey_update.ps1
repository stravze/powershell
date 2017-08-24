<#
Scenario: 

Link - https://blogs.technet.microsoft.com/heyscriptingguy/2010/04/26/2010-scripting-games-advanced-event-1-updating-and-creating-registry-keys/

The boss has decided you need to check computers on the network. After the check has been completed, a registry key needs to be updated with the date and time of the check. 
You should test for the existence of the registry key, and if the registry key does not exist, it should be created. 
If the registry key does exist, it only needs to be updated. So far, this is the same scenario as the Beginner Event 1. Now for the Advanced criteria.
 

Design Criteria
Your script should be able to run remotely, which means you should be able to launch it on your local computer and target a remote computer.

You should include the ability for the script to read a text file that includes a list of remote computer names.

If you determine that your script will require administrative rights to run against a remote computer, you must include a test to ensure that the person launching the script has those rights. 
If the person running the computer does not have the appropriate rights, you should display a readable message informing the reader of that fact—and not simply display an error message.

You should write your script in such a way that you can pass different registry keys to the script when it is called. In other words, do not hard-code the registry key path in your script. 
You can make it a default value if you wish, but do not require editing of the script to write to the registry in a different location.

Your code should be written in such a way to promote code re-use. For example, consider writing the logic in either subroutines or functions.

Style points will be granted to the script that includes command-line help and custom help messages.

We are not concerned in this script with the code that performs the check, only the code that updates the registry key. The registry key should look like the one seen in the following image.

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