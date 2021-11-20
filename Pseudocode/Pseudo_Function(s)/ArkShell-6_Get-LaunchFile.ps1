<#

##########################################
##                                      ##
##    ArkusCloud.io | ArkShell [ 6 ]    ##
##                                      ##
##########################################

.SYNOPSIS
    [User Onboard] Destination directory location

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

function Get-LaunchFile {
    
    [CmdletBinding()]
    param (
        $Launchdir      = "c:\Users\$env:username\ArkShell_Files\Get-LaunchPad\Launch",
        $Transcriptdir  = "c:\Users\$env:username\ArkShell_Files\Get-LaunchPad\Transcript", 
        $Errordir       = "c:\Users\$env:username\ArkShell_Files\Get-LaunchPad\Error",
        $CSVdir         = "c:\Users\$env:username\ArkShell_Files\Get-LaunchPad\.csv",
        $ErrorLog       = "c:\Users\$env:username\ArkShell_Files\Get-LaunchPad\Error\Get-LaunchPad_Error $( get-date -Format MM-dd-yy_HHmm-ss ).txt",
        $NewReport      = "c:\Users\$env:username\ArkShell_Files\Get-LaunchPad\.csv\Get-LaunchPad_Report $( get-date -Format MM-dd-yy_HHmm-ss ).csv"
    )
    
    begin {
        if(!(Test-Path -Path $Launchdir )){
            New-Item -ItemType directory -Path $Launchdir
            Write-Host "Launch Directory created"
        }
        else{ 
            Write-Host "Launch Directory exists"
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
        
    }
    
    process {
        
    }
    
    end {
        
    }
}
