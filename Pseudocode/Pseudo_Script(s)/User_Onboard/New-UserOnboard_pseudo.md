## [ArkShell 5] New-UserOnboard Pseudocode

:house: Check for new file

Check directory for new user .csv file

    If there is a .csv file present

        Collect file owner / last modified details
        
        Move file to Triage directory

        $Results = Import .csv file contents

        Make New PSCustomObject with column names to match file headers

        Export LaunchFile_Date.csv file in Launch Directory

    Else

        Write-Verbose "No User File Present"

Check Launch directory for Launch file

    If there is a launchfile_date.csv file present

        x


:point_right: File Metadata - > PSCustomObject Syntax

```PowerShell
$a = get-acl 'Path\to\file.pdf'

$b = Get-ChildItem 'Path\to\file.pdf'

$c = [PSCustomObject]@{
    
}

$c | Add-Member -MemberType NoteProperty -Name 'Owner' -Value $a.Owner
$c | Add-Member -MemberType NoteProperty -Name 'Group' -Value $a.Group
$c | Add-Member -MemberType NoteProperty -Name 'File Name' -Value $b.Name
$c | Add-Member -MemberType NoteProperty -Name 'Created' -Value $b.CreationTime
$c | Add-Member -MemberType NoteProperty -Name 'Modified' -Value $b.LastWriteTime

```



:point_right: Move file based on date condition

```powershell
$Path = "C:\FromFTP";
$Destination = "C:\Backup";

$Today = (Get-Date).Date;

#Move item to destination if file write time between today and midnight tomorrow
Get-ChildItem -Path $Path | Where-Object { ($_.LastWriteTime -ge $Today) -and ($_.LastWriteTime -lt $Today.AddDays(1)) } | Move-Item -Destination $Destination;

#Delete every file that was first created (CreationTime) before 14 days before today. The number of days might be off by one, depending on count.
Get-ChildItem -Path $Path | Where-Object { $_.CreationTime -lt $Today.AddDays(-14) } | Remove-Item;
```



