$a = get-content C:\dev\vagrant.txt | ForEach-Object { $_ -replace "\d+ hours ago, ", "" } | set-content C:\dev\vagrant-new.txt
$b = Get-Content C:\dev\vagrant-new.txt| foreach-object { add-content C:\dev\vagrant-output.txt "start-process echo Y | knife node delete $_ --yes"}
$c = Get-Content C:\dev\vagrant-output.txt

ForEach ($d in $c){
    set-location c:\chef
    Invoke-Expression $d 
    write-host "Running following $d"

}

