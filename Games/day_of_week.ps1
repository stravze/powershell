<#
.scenario: 

   The program should take three arguments. The first will be a day, the second will be month, and the third will be year. 
   Then, your program should compute the day of the week that date will fall on.

.links - https://www.reddit.com/r/dailyprogrammer/comments/pwons/2192012_challenge_11_easy/

#>

# Empty Array
$out = @()

# Ensure you can only enter numerical days
try {
        [Validaterange(1,31)][int]$day = Read-host "Enter Day of the Week"
        [Validaterange(1,12)][int]$month = Read-host "Enter Month"
    }
catch 
    { 
        write-host "You need to enter a numerical format"
        
    }



[int]$year = Read-host "Enter Year"

$out = "$day/$month/$year"

(get-date $out).DayOfWeek

