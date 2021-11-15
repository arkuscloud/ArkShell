<#
##########################################
##                                      ##
##    ArkusCloud.io | ArkShell [ 1 ]    ##
##                                      ##
##########################################

.SYNOPSIS
Create one or more pseudo users with Active Directory user properties.

.DESCRIPTION

- > New-PseudoPersona function will create one or more pseudo users. 
- > These users will be sent to .csv file in your local C:\ Transcript directory.
- > All errors will be sent to your local C:\ Error directory


.NOTES
File Name : ArkShell [ 1 ] - New-PseudoPersona.ps1
Author    : Solan White
Requires  : PowerShell Version 3.0 or above

.LINK
https://www.arkuscloud.io

#>

function New-PseudoPersona {
    [CmdletBinding()]
    param (
        $Transcriptdir  = "c:\Users\$env:username\ArkShell_Files\New-PseudoPersona\Transcript", 
        $Errordir       = "c:\Users\$env:username\ArkShell_Files\New-PseudoPersona\Error",
        $CSVdir         = "c:\Users\$env:username\ArkShell_Files\New-PseudoPersona\.csv",
        $ErrorLog       = "c:\Users\$env:username\ArkShell_Files\New-PseudoPersona\Error\New-PseudoPersona_Error $( get-date -Format MM-dd-yy_HHmm-ss ).txt",
        $NewReport      = "c:\Users\$env:username\ArkShell_Files\New-PseudoPersona\.csv\New-PseudoPersona_Report $( get-date -Format MM-dd-yy_HHmm-ss ).csv",
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
        Start-Transcript -Path "$Transcriptdir\New-PseudoPersona_Transcript $( get-date -Format MM-dd-yy_HHmm-ss ).txt" -Verbose
        $Persona = @"
        FirstName = [person female first]
        LastName = [person female last]
        Street = [address]
        State = [state abbr]
        City = [city]
        Zip = 2[numeric][numeric][numeric][numeric]
        Telephone = 2[numeric][numeric]-7[numeric][numeric]-[numeric][numeric][numeric][numeric]
        Hire Date = 04/1[numeric]/20[numeric][numeric]
        Password = #@#??@#?#?!#??*#?%
        Country = USA
        Company = Arkus Cloud
"@
    }
    
    process {
        Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
        
        Install-Module -Name NameIT -Verbose -Confirm:$false 

        $Results = Invoke-Generate $Persona -Count $Count -AsPSObject

        $Results

        $Results | Export-Csv -Path $NewReport -Append 2>> $ErrorLog -NoTypeInformation

    }
    
    end {
        
        Set-PSRepository -Name 'PSGallery' -InstallationPolicy Untrusted
        Stop-Transcript
    }
}