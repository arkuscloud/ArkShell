<#
###########################################################################
##                                                                       ##
##    ArkusCloud.io | ArkShell #2: NameIT PowerShell Module              ##         
##                                                                       ##
###########################################################################

.SYNOPSIS
Create list of random users.

.DESCRIPTION
NameIT #PowerShell module is available from the PSGallery. 

.NOTES
File Name : ArkShell2_GenerateRandomUsers
Author    : Solan White
Version   : 1.0
Date      : 11/07/21
Requires  : PowerShell Version 3.0 or above
Product   : Azure Active Directory

.LINK
{www.arkuscloud.io}

#>

#New AzureADUser Pseudo profile custom PSObject
$Template = @"
    firstname = [person female first]
    lastname = [person female last]
    street = [address]
    state = [state abbr]
    city = [city]
    zip = [numeric][numeric][numeric][numeric][numeric]
    telephone = [numeric][numeric][numeric]-[numeric][numeric][numeric]-[numeric][numeric][numeric][numeric]
    Hire Date = [randomdate]
    Password = #@#??@#?#?!#??*#?%
    Country = USA
    Company = Arkus Cloud
"@

#Generate 30 random users and display on screen
PS C:\WINDOWS\system32> Invoke-Generate $Template -Count 30 -AsPSObject | ft -AutoSize


#ArkShell1_BatchUserCreate Script
PS C:\WINDOWS\system32> $AzureADUsers = Import-Csv 

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


