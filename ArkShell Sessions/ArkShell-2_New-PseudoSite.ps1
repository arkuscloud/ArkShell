<#
##########################################
##                                      ##
##    ArkusCloud.io | ArkShell [ 2 ]    ##
##                                      ##
##########################################

.SYNOPSIS
Create one or more pseudo users with Active Directory user properties.

.DESCRIPTION

- > New-PseudoSite function will create one or more pseudo site locations. 
- > These locations will be sent to .csv file in your local C:\ Transcript directory.
- > All errors will be sent to your local C:\ Error directory


.NOTES
File Name : ArkShell [ 2 ] - New-PseudoSite.ps1
Author    : Solan White
Requires  : PowerShell Version 3.0 or above

.LINK
https://www.arkuscloud.io

#>

function New-PseudoSite {
    [CmdletBinding()]
    param (
        $Transcriptdir  = "c:\Users\$env:username\ArkShell_Files\New-PseudoSite\Transcript", 
        $Errordir       = "c:\Users\$env:username\ArkShell_Files\New-PseudoSite\Error",
        $CSVdir         = "c:\Users\$env:username\ArkShell_Files\New-PseudoSite\.csv",
        $ErrorLog       = "c:\Users\$env:username\ArkShell_Files\New-PseudoSite\Error\New-PseudoSite_Error $( get-date -Format MM-dd-yy_HHmm-ss ).txt",
        $NewReport      = "c:\Users\$env:username\ArkShell_Files\New-PseudoSite\.csv\New-PseudoSite_Report $( get-date -Format MM-dd-yy_HHmm-ss ).csv",
        # NameIT -Count Parameter
        [Parameter(Mandatory,Position=0)]
        [int] $Count 
    )
    
    begin {
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
        Start-Transcript -Path "$Transcriptdir\New-PseudoSite_Transcript $( get-date -Format MM-dd-yy_HHmm-ss ).txt" -Verbose
    }
    
    process {

        $Results = Invoke-Generate  (New-NameItTemplate {[PSCustomObject]@{Address="";State="";zip=""}})  -Count $Count -AsPSObject

        $Results

        $Results | Export-Csv -Path $NewReport -Append 2>> $ErrorLog -NoTypeInformation

    }
    
    end {
        
        Set-PSRepository -Name 'PSGallery' -InstallationPolicy Untrusted
        Stop-Transcript
    }
}