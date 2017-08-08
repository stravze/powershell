cls
$Domain = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
$DomainRootPath = [ADSI]"LDAP://$Domain"

$adsearch = New-Object DirectoryServices.DirectorySearcher([adsi]$DomainRootPath)



#$adsearch.filter = "(objectclass=user)"
$adsearch.Filter = "(&(objectCategory=person)(objectClass=user))"
$adsearch.PropertiesToLoad.AddRange(@("name"))
$adsearch.PropertiesToLoad.AddRange(@("lastlogontimestamp")) 
$adsearch.PropertiesToLoad.AddRange(@("givenName"))
$adsearch.PropertiesToLoad.AddRange(@("whencreated"))
$adsearch.PropertiesToLoad.AddRange(@("DisplayName"))
$adsearch.PropertiesToLoad.AddRange(@("pwdLastSet"))
$adsearch.PropertiesToLoad.AddRange(@("description"))
$adsearch.PropertiesToLoad.AddRange(@("userAccountControl"))
$adsearch.Container
$adsearch.PageSize = 1000
$adsearch.SearchScope = "Subtree"

$users = $adsearch.findall()


$users.Count


$report = @()


foreach ($objResult in $users)
{

    $objItem = $objResult.Properties

    $llt = $objItem.lastlogontimestamp
    $pls = $objItem.pwdlastset
    

    If ([string]$pls -eq 0)
    {
        $plsDate = "--Never Reset Pwd--"
        $PassLastSet = $plsDate
    }
    ElseIf (!$pls)
    {
        $plsDate = "--Never Reset Pwd--"
        $PassLastSet = $plsDate
    }
    
    Else
    {
        # Interpret 64-bit integer as a date.
        $plsDate = $pls = [DateTime]$objItem.pwdlastset.item(0)
        $PassLastSet = $plsDate.AddYears(1600).ToLocalTime()
    }
    
    If (!$llt)
    {
        $lltDate = "--Never Logged In--"
        $lastLogon = $lltDate
    }
    ElseIf ([string]$llt -eq 0)
    {
        $lltDate = "--Never Logged In--"
        $lastLogon = $lltDate
    }
    Else
    {
        # Interpret 64-bit integer as a date.
        $lltDate = $llt = [DateTime]$objItem.lastlogontimestamp.item(0)
        $lastLogon = $lltDate.AddYears(1600).ToLocalTime()
    }
    
    $temp = New-Object PSObject


    $temp | Add-Member NoteProperty name $($objitem.name)
    $temp | Add-Member NoteProperty lastlogontimestamp $lastLogon
    $temp | Add-Member NoteProperty pwdLastSet $PassLastSet
    #$temp | Add-Member NoteProperty displayname $($objitem.displayname)
    $temp | Add-Member NoteProperty whencreated $($objitem.whencreated)
    #$temp | Add-Member NoteProperty givenname $($objitem.givenname)
    #$temp | Add-Member NoteProperty sn $($objitem.sn)
    $temp | Add-Member NoteProperty comment $($objitem.description)


    $report += $temp
}

if (!(Test-Path $csvpath)){
    New-Item $csvpath -ItemType Directory
}

$datetime = Get-Date -format yyyy.MM.dd-HH.mm.ss
$csvpath = "C:\Windows\Logs\PowerShell"
$csvfile = "$csvpath\$datetime-userlist.csv"


$report | export-csv -notypeinformation $csvfile
