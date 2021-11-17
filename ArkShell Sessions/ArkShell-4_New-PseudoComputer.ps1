<#
##########################################
##                                      ##
##    ArkusCloud.io | ArkShell [ 4 ]    ##
##                                      ##
##########################################

.SYNOPSIS

.DESCRIPTION

- > 
- > 
- > 


.NOTES
File Name : ArkShell [ 4 ] - New-PseudoComputer.ps1
Author    : Solan White
Requires  : PowerShell Version 3.0 or above

.LINK
https://www.arkuscloud.io

#>

function New-PseudoComputer {
    [CmdletBinding()]
    param (
        $Transcriptdir  = "c:\Users\$env:username\ArkShell_Files\New-PseudoComputer\Transcript", 
        $Errordir       = "c:\Users\$env:username\ArkShell_Files\New-PseudoComputer\Error",
        $CSVdir         = "c:\Users\$env:username\ArkShell_Files\New-PseudoComputer\.csv",
        $ErrorLog       = "c:\Users\$env:username\ArkShell_Files\New-PseudoComputer\Error\New-PseudoComputer_Error $( get-date -Format MM-dd-yy_HHmm-ss ).txt",
        $NewReport      = "c:\Users\$env:username\ArkShell_Files\New-PseudoComputer\.csv\New-PseudoComputer_Report $( get-date -Format MM-dd-yy_HHmm-ss ).csv",
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
        Start-Transcript -Path "$Transcriptdir\New-PseudoComputer_Transcript $( get-date -Format MM-dd-yy_HHmm-ss ).txt" -Verbose
        $Computer = @"
        ComputerName    = [state abbr]-Optiplex-##-9##
        Description     = [person] '[Desktop]'
        DeviceModel     = Optiplex-3#5#
        CPUName         = Intel([state abbr]) Core([numeric][alpha]) i#-97## CPU @ 3.##GHz
        OSCaption       = Microsoft Windows 1# Pro
        OSVersion       = 2[numeric][numeric]9
        GUID            = [guid]
        Configured By   = [person]
"@
        Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
                
        Install-Module -Name NameIT -Verbose -Confirm:$false 
    }
    
    process {
        $Results = Invoke-Generate $Computer -Count $Count -AsPSObject | Select-Object ComputerName, Description, DeviceModel, CPUName, OSCaption, OSVersion, GUID, 'Configured By'

        $Results

        $Results | Export-Csv -Path $NewReport -Append 2>> $ErrorLog -NoTypeInformation

    }
    
    end {
        
        Set-PSRepository -Name 'PSGallery' -InstallationPolicy Untrusted

        Stop-Transcript

    }
    
}