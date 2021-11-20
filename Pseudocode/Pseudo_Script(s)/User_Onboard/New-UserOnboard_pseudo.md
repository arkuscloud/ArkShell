## [ArkShell 5] New-UserOnboard Pseudocode

X Check for new file

Check directory for new user .csv file

    If there is a .csv file present

        
        
        $Results = Import .csv file contents

        Make New PSCustomObject with column names to match file headers

        Export Triage.csv file in 

    Else

        Write-Verbose "No User File Present"

X 

```powershell
$Path = "C:\FromFTP";
$Destination = "C:\Backup";

$Today = (Get-Date).Date;

#Move item to destination if file write time between today and midnight tomorrow
Get-ChildItem -Path $Path | Where-Object { ($_.LastWriteTime -ge $Today) -and ($_.LastWriteTime -lt $Today.AddDays(1)) } | Move-Item -Destination $Destination;

#Delete every file that was first created (CreationTime) before 14 days before today. The number of days might be off by one, depending on count.
Get-ChildItem -Path $Path | Where-Object { $_.CreationTime -lt $Today.AddDays(-14) } | Remove-Item;
```



