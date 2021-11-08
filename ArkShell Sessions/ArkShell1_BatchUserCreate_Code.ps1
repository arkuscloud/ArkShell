<#
###########################################################################
##                                                                       ##
##    ArkusCloud.io | ArkShell #1: Batch User Create PowerShell Script   ##         
##                                                                       ##
###########################################################################

.SYNOPSIS
Bulk create Azure AD User Account.

.DESCRIPTION
Azure AD Bulk user creation from .csv file. Multiple users created at the same time.

.NOTES
File Name : ArkShell1_BatchUserCreate
Author    : Solan White
Version   : 1.0
Date      : 11/07/21
Requires  : PowerShell Version 3.0 or above
Product   : Azure Active Directory

.LINK
{www.arkuscloud.io}

#>

#Import users from .csv file, and store those users in a variable 
$AzureADUsers = Import-Csv C:\Users\Solo\Documents\ArkShell\DevFiles\UserTemplate_ready.csv

#Loop through each record in the .csv file to store details in new variables
foreach ($User in $AzureADUsers)
{
    $Firstname                = $User.firstname
    $Lastname                 = $User.lastname
    $DisplayName              = $User.firstname + "." + $User.lastname
    $PasswordProfile          = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
    $PasswordProfile.Password = $User.password
    $UserPrincipalName        = $User.userprincipalname
    $Streetaddress            = $User.streetaddress
    $City                     = $User.city
    $Zipcode                  = $User.zipcode
    $State                    = $User.state
    $Country                  = $User.country
    $Telephone                = $User.telephone
    $Department               = $User.department
    $Company                  = $User.company

    #Create Azure Active Directory Users with variables created from .csv file
    New-AzureADUser -DisplayName $DisplayName `
                    -GivenName $Firstname `
                    -Surname $Lastname `
                    -MailNickName $DisplayName `
                    -PasswordProfile $PasswordProfile `
                    -UserPrincipalName $UserPrincipalName `
                    -AccountEnabled $true `
                    -StreetAddress $Streetaddress `
                    -City $City `
                    -State $State `
                    -PostalCode $Zipcode `
                    -Country $Country `
                    -Department $Department `
                    -TelephoneNumber $Telephone `
                    -CompanyName $Company

}

