<#
.scenario: 

    write a program that will allow the user to input digits, and arrange them in numerical order.
    for extra credit, have it also arrange strings in alphabetical order

.links - https://www.reddit.com/r/dailyprogrammer/comments/pu1rf/2172012_challenge_9_easy/

#>


try
    {

        $numbers = @()

        [ValidatePattern("\d+")]$numbers = (Read-Host "Input any number (separate with comma)").split(',') | ForEach-Object {$_.trim()} | Sort-Object

        foreach ($output in $numbers)
            {
                $output 
            }

    }
catch
    {
        Write-Output "Error: Please only enter Numbers"

    }