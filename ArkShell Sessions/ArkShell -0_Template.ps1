<#

##########################################
##                                      ##
##    ArkusCloud.io | ArkShell [ 0 ]    ##
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

function Add-Extension{
    param ([string]$Name,[string]$Extension = "txt")
    $name = $name + "." + $extension
    $name
}