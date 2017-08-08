# Script to REMOVE Active Directory Users FROM Active Directory Groups
# Usage:
# When defining users names, it needs to be there {SamName} you can get this form ADSIedit
# When defining groups, you can use the {Group name (pre-Windows 2000)}
# Remember to added Users with spaces in there {SamName} within double quotes " "
# For Multiple Users, should be split with a comma e.g. "John Smith","John Brown"

$Users  = "John Smith","Bob Smith"
$Groups1 = "Local Admins (SQL Servers Admins)"
$Groups2 = "Local Admins (Windows Admins)"
Import-module ActiveDirectory  
Remove-ADGroupMember -Identity $Groups1 -Members $Users -Confirm:$false
Remove-ADGroupMember -Identity $Groups2 -Members $Users -Confirm:$false