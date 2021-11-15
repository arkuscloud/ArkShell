<#
##########################################
##                                      ##
##    ArkusCloud.io | ArkShell [ 3 ]    ##
##                                      ##
##########################################

.SYNOPSIS

.DESCRIPTION

- > 
- > 
- > 


.NOTES
File Name : ArkShell [ 3 ] - New-PseudoCampus.ps1
Author    : Solan White
Requires  : PowerShell Version 3.0 or above

.LINK
https://www.arkuscloud.io

#>

function New-PseudoCampus {
    [CmdletBinding()]
    param (
        $Transcriptdir  = "c:\Users\$env:username\ArkShell_Files\New-PseudoCampus\Transcript", 
        $Errordir       = "c:\Users\$env:username\ArkShell_Files\New-PseudoCampus\Error",
        $CSVdir         = "c:\Users\$env:username\ArkShell_Files\New-PseudoCampus\.csv",
        $ErrorLog       = "c:\Users\$env:username\ArkShell_Files\New-PseudoCampus\Error\New-PseudoCampus_Error $( get-date -Format MM-dd-yy_HHmm-ss ).txt",
        $NewReport      = "c:\Users\$env:username\ArkShell_Files\New-PseudoCampus\.csv\New-PseudoCampus_Report $( get-date -Format MM-dd-yy_HHmm-ss ).csv",
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
        Start-Transcript -Path "$Transcriptdir\New-PseudoCampus_Transcript $( get-date -Format MM-dd-yy_HHmm-ss ).txt" -Verbose
        $Campus = @"
        Charter = [state]-##
        P.O. Box. = [person female first]
        Street = [address]
        State = [state abbr]
        City = [city]
        Zip = 2[numeric][numeric][numeric][numeric]
        Telephone = 210-5[numeric][numeric]-9[numeric][numeric][numeric]
        Country = USA
        POC = [person]
"@
        
    }
    
    process {
        $Results = Invoke-Generate $Campus -Count $Count -AsPSObject | Select-Object POC, Charter, Street, City, State, Zip, Telephone, Country

        $Results

        $Results | Export-Csv -Path $NewReport -Append 2>> $ErrorLog -NoTypeInformation

    }
    
    end {
        
        Set-PSRepository -Name 'PSGallery' -InstallationPolicy Untrusted
        Stop-Transcript
    }
}