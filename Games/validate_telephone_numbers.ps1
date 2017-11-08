<#
.scenario: 

    The exercise today asks you to validate a telephone number, as if written on an input form. Telephone numbers can be written as ten digits, or with dashes, spaces, or dots between the three segments, or with the area code parenthesized; both the area code and any white space between segments are optional.
    Thus, all of the following are valid telephone numbers: 1234567890, 123-456-7890, 123.456.7890, (123)456-7890, (123) 456-7890 (note the white space following the area code), and 456-7890.
    The following are not valid telephone numbers: 123-45-6789, 123:4567890, and 123/456-7890.
    source: programmingpraxis.com


.link:
    https://www.reddit.com/r/dailyprogrammer/comments/pv98f/2182012_challenge_10_easy/


#>



# Examples
# 0123456789
# 01234-755194


$tel = [string]"+4401234-847519"  #(Read-host -Prompt "Please enter telephone number")

write-host "Validating $tel Format"

$tel = $tel -Replace '[-]',""
$tel = $tel -Replace '[+44]',""

if ($tel.StartsWith("0")) {
    $tel = $tel.replace(" ","") 
 }

 if ($tel.Length -eq 11) { Write-host "Number must contain 11 digits including area code" }
    
 