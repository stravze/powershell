﻿<#
.scenario: 

    The exercise today asks you to validate a telephone number, as if written on an input form. Telephone numbers can be written as ten digits, or with dashes, spaces, or dots between the three segments, or with the area code parenthesized; both the area code and any white space between segments are optional.
    Thus, all of the following are valid telephone numbers: 1234567890, 123-456-7890, 123.456.7890, (123)456-7890, (123) 456-7890 (note the white space following the area code), and 456-7890.
    The following are not valid telephone numbers: 123-45-6789, 123:4567890, and 123/456-7890.
    source: programmingpraxis.com


.link:
    https://www.reddit.com/r/dailyprogrammer/comments/pv98f/2182012_challenge_10_easy/


#>


$tel = [string](Read-host -Prompt "Please enter telephone number")


if ($tel.StartsWith(("0")) -and ($tel.Length -eq 10) ) {
     continue
    } 
    else {
        Write-host "Phone Number must start with a 0 and contain 10 digits"
}

