<#

##########################################
##                                      ##
##    ArkusCloud.io | ArkShell [ 7 ]    ##
##                                      ##
##########################################

.SYNOPSIS
    [User Onboard] Source directory location

.DESCRIPTION

.PARAMETER Name

.PARAMETER Extension

.INPUTS

.OUTPUTS

.EXAMPLE

.EXAMPLE

.EXAMPLE

.LINK

https://arkuscloud.io

.LINK

#>

function Get-TriageFile {
    
    [CmdletBinding()]
    param (
        $Triagedir      = "c:\Users\$env:username\ArkShell_Files\UserTriageZone",
        $Launchdir      = "c:\Users\$env:username\ArkShell_Files\UserLaunchPad",
        $Transcriptdir  = "c:\Users\$env:username\ArkShell_Files\Get-TriageFile\Transcript", 
        $Errordir       = "c:\Users\$env:username\ArkShell_Files\Get-TriageFile\Error",
        $CSVdir         = "c:\Users\$env:username\ArkShell_Files\Get-TriageFile\.csv",
        $ErrorLog       = "c:\Users\$env:username\ArkShell_Files\Get-TriageFile\Error\Get-TriageFile_Error $( get-date -Format MM-dd-yy_HHmm-ss ).txt",
        $NewReport      = "c:\Users\$env:username\ArkShell_Files\Get-TriageFile\.csv\Get-TriageFile_Report $( get-date -Format MM-dd-yy_HHmm-ss ).csv",
        $LaunchReport   = "c:\Users\$env:username\ArkShell_Files\UserLaunchPad\UserOnboard_Report $( get-date -Format MM-dd-yy_HHmm-ss ).csv",
        $TriageReport   = "c:\Users\$env:username\ArkShell_Files\UserTriageZone\UserOnboard_Report $( get-date -Format MM-dd-yy_HHmm-ss ).csv",
        $Today          = (Get-Date).Date
    )
    
    begin {
        if(!(Test-Path -Path $Launchdir )){
            New-Item -ItemType directory -Path $Launchdir
            Write-Host "Launch Directory created"
        }
        else{ 
            Write-Host "Launch Directory exists"
        }
        if(!(Test-Path -Path $Triagedir )){
            New-Item -ItemType directory -Path $Triagedir
            Write-Host "Triage Directory created"
        }
        else{ 
            Write-Host "Triage Directory exists"
        }
        if(!(Test-Path -Path $Transcriptdir )){
            New-Item -ItemType directory -Path $Transcriptdir
            Write-Host "Transcript Directory created"
        }
        else{ 
            Write-Host "Transcript Directory exists"
        }
        if(!(Test-Path -Path $Errordir )){
            New-Item -ItemType directory -Path $Errordir
            Write-Host "Error Directory created"
        }
        else{ 
            Write-Host "Error Directory exists"
        }
        if(!(Test-Path -Path $CSVdir )){
            New-Item -ItemType directory -Path $CSVdir
            Write-Host ".CSV Directory created"
        }
        else{ 
            Write-Host ".CSV Directory exists"
        }
        Start-Transcript -Path "$Transcriptdir\Get-TriageFile_Transcript $( get-date -Format MM-dd-yy_HHmm-ss ).txt" -Verbose
    }
    
    process {
        $UserDumpdir    = "c:\Users\$env:username\ArkShell_Files\UserDump"
        #Get UserDump File
        Get-ChildItem -Path $UserDumpdir | Where-Object { $_.LastWriteTime -ge $Today -and $_.LastWriteTime -lt $Today.AddDays(1) } | Move-Item -Destination $Triagedir;

        #Get Triage File
        #Get-ChildItem -Path $UserDumpdir | Where-Object { ($_.LastWriteTime -ge $Today) }

        #Import-Csv

    }
    
    end {
        Stop-Transcript
    }
}
