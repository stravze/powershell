<#
.scenario: 

    create a program that will ask the users name, age, and reddit username. have it tell them the information back, in the format:
    your name is (blank), you are (blank) years old, and your username is (blank)
    for extra credit, have the program log this information in a file to be accessed later.

.link: https://www.reddit.com/r/dailyprogrammer/comments/pih8x/easy_challenge_1/

#>

$name = read-host "Enter your Full Name"
$age = read-host "Enter your Age"
$user = read-host "Enter your Username"

Write-Output "Your name is $name, you are $age years old, and your username is $user" >> "C:\temp\task.log "
