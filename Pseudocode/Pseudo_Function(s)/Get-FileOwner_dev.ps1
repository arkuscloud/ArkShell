<#

##########################################
##                                      ##
##    ArkusCloud.io | ArkShell [ _ ]    ##
##                                      ##
##########################################

.SYNOPSIS

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

function Get-FileOwner {
    [CmdletBinding()]
    param (
        $Path = "c:\Users\$env:username\ArkShell_Files\UserDump",
        $SourceFile = (Get-ChildItem -Path $Path -Filter '*.csv').FullName,
        $FileACL = (get-acl $SourceFile),
        $FileDetail = (Get-ChildItem $SourceFile),
        $Transcriptdir  = "c:\Users\$env:username\ArkShell_Files\Get-FileOwner\Transcript", 
        $Errordir       = "c:\Users\$env:username\ArkShell_Files\Get-FileOwner\Error",
        $CSVdir         = "c:\Users\$env:username\ArkShell_Files\Get-FileOwner\.csv",
        $ErrorLog       = "c:\Users\$env:username\ArkShell_Files\Get-FileOwner\Error\Get-FileOwner_Error $( get-date -Format MM-dd-yy_HHmm-ss ).txt",
        $NewReport      = "c:\Users\$env:username\ArkShell_Files\Get-FileOwner\.csv\Get-FileOwner_Report $( get-date -Format MM-dd-yy_HHmm-ss ).csv"
        
    )
    
    begin {
         
        if(!(Test-Path -Path $Transcriptdir )){

            New-Item -ItemType directory -Path $Transcriptdir

            Write-Host "Transcript Directory created"

        }

        else{ 

            Write-Host "Transcript Directory exists"

        }
        Start-Transcript -Path "$Transcriptdir\Get-FileOwner_Transcript $( get-date -Format MM-dd-yy_HHmm-ss ).txt" -Verbose
    }
    
    process {

        $TrueOwner = [PSCustomObject]@{

    }

        $TrueOwner | Add-Member -MemberType NoteProperty -Name 'Owner' -Value $FileACL.Owner
        $TrueOwner | Add-Member -MemberType NoteProperty -Name 'Group' -Value $FileACL.Group
        $TrueOwner | Add-Member -MemberType NoteProperty -Name 'File Name' -Value $FileDetail.Name
        $TrueOwner | Add-Member -MemberType NoteProperty -Name 'Created' -Value $FileDetail.CreationTime
        $TrueOwner | Add-Member -MemberType NoteProperty -Name 'Modified' -Value $FileDetail.LastWriteTime
        $TrueOwner | Add-Member -MemberType NoteProperty -Name 'Viewd On' -Value $FileDetail.LastAccessTime

        $TrueOwner
    }
    
    end {
        Stop-Transcript
    }
}