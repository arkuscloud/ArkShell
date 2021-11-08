<#
###########################################################################
##                                                                       ##
##    ArkusCloud.io | ArkShell #2: NameIT PowerShell Module              ##         
##                                                                       ##
###########################################################################

.SYNOPSIS
Bulk create Azure AD User Account.

.DESCRIPTION
Azure AD Bulk user creation from .csv file. Multiple users created at the same time.

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


**********************
Windows PowerShell transcript start
Starttime: 20211107194600
Username: CAMPACTION\Solo
RunAs User: CAMPACTION\Solo
Machine: CAMPACTION (Microsoft Windows NT 10.0.19043.0)
HostApplication: C:\Windows\System32\WindowsPowerShell\v1.0\powershell_ise.exe
PSVersion: 5.1.19041.1237
PSEdition: Desktop
PSCompatibleVersions: 1.0, 2.0, 3.0, 4.0, 5.0, 5.1.19041.1237
BuildVersion: 10.0.19041.1237
CLRVersion: 4.0.30319.42000
WSManStackVersion: 3.0
PSRemotingProtocolVersion: 2.3
SerializationVersion: 1.1.0.1
**********************
Transcript started, output file is C:\Users\Solo\OneDrive - arkuscloud\Documents\PowerShell_transcript.CAMPACTION.73z6Cnr6.20211107194600.txt



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


#Command to create 30 random users and send results to .csv file
PS C:\WINDOWS\system32> Invoke-Generate $Template -Count 30 -AsPSObject | Export-Csv -Path C:\Users\Solo\Documents\RandomUsers.csv -NoTypeInformation

#Generate 30 random users and display on screen
PS C:\WINDOWS\system32> Invoke-Generate $Template -Count 30 -AsPSObject | ft -AutoSize

Password           firstname  street                   Hire Date  Country city            zip   lastname  state telephone
8@1sh@9d8p!9id*4k% Karina     8527 Vafza Clb           1/9/4217   USA     Westover        92049 Bruce     KY    111-949-9689
7@8mu@5f6e!9za*1y% Kayleigh   86108 Cuezufap Dr        8/25/0565  USA     Mc Intyre       37885 Duke      ME    292-108-1786
5@7zp@4e9e!5sq*8h% Angeline   9113 Juharimean Loop     12/2/2345  USA     Pax             78447 Miles     OH    448-034-6044
2@9at@9e1f!0ze*7q% Lia        48795 Oysa Crossroad     12/8/4958  USA     Monticello      50813 Casey     MD    663-411-3710
0@5db@6b2u!5hv*4j% Gabriella  682 Gistehenurhod Missn  4/12/7056  USA     Metcalfe        69592 Hanna     UT    395-854-7807
8@8aj@0b1v!5xo*5c% Kamari     519 Pueymi Bayoo         6/11/9132  USA     Black River     48235 Deleon    WY    980-973-9084
5@9zz@6y1c!4vo*1c% Aracely    525 Ugeyqela Creek       5/16/1306  USA     Bassett         97745 Dickerson WY    884-495-4762
2@0lb@7k7f!5zj*2s% Jaelyn     62090 Dogqefpe Valleys   2/12/1866  USA     Sledge          22023 Conrad    WI    954-450-1073
7@6fd@4w8v!3cz*9f% Rylee      1233 Verudkipar Greens   5/1/0275   USA     Orrville        50200 Osborne   ID    987-940-5888
5@3ts@1f3g!5ae*0c% Yadira     288 Quigahvet Byp        2/19/4599  USA     Campbellsburg   20248 Walls     AZ    054-535-8929
7@8za@9h3b!1bk*9v% Kailee     191 Anjaqakkap Allee     9/17/4293  USA     Jesup           92728 Noble     LA    649-379-6914
4@6ol@2z1h!3cp*6w% Macey      63766 Fumivlosig Key     10/22/5159 USA     Dunkirk         24135 Simon     CO    396-538-3519
7@8cv@0k4h!9uf*9t% Jacqueline 2725 Tuwuwusubil Pass    10/26/8122 USA     Canton          76867 Acevedo   WY    809-288-3858
0@6nh@7u9l!6yj*0i% Christine  77309 Duxki Div          11/3/0097  USA     Somerset        93225 Hoover    VA    316-529-6142
1@4oc@5j2a!1us*9b% Jane       3967 Xainxawdiso Well    1/11/3911  USA     Delmont         76340 Wall      DE    638-392-6066
9@1lj@0k0z!2ts*4y% Carleigh   624 Fitaabxe Pass        4/3/4281   USA     Cromwell        29864 Roberson  KY    644-630-5285
5@9mn@9i8p!1io*5r% Aliza      9300 Jukaqiw Exp         11/9/2034  USA     Woodbridge      76831 Morrison  NJ    011-332-8186
3@4yt@4d0z!7fh*2c% Anne       6536 Ifuceror Glens      12/2/2565  USA     North Beach     21625 Hanna     UT    788-987-2588
4@6hl@5g1y!1ei*2l% Amaya      8747 Zuipfuv View        11/19/9534 USA     Juncos          74810 Spence    AK    544-212-5705
9@5bm@7z4b!2ei*1i% Rubi       68690 Equw Spurs         11/28/0198 USA     Sun City Center 44717 Mason     NC    650-533-9871
4@2aa@5x6i!1ft*7a% Brisa      573 Rocep Pines          8/21/1617  USA     Pownal          53577 Snyder    OR    419-879-7151
6@6km@8n7k!0ok*8h% Melody     53 Piviqlij Highway      2/10/4821  USA     Pinsonfork      84196 Guerra    CA    798-718-7901
3@6wy@2z6e!0kp*0r% Brianna    64199 Zikpo Route        5/23/9344  USA     Oyster Bay      71863 Pena      IL    922-067-6843
0@8ps@3a1l!1ox*0b% Sariah     171 Leficoppeah Landing  3/11/3774  USA     Scottsmoor      85673 Collier   MS    678-973-9360
3@2ue@3f8f!0mk*4r% Paisley    1234 Hodil Jct           11/14/4803 USA     Cornish         85057 Coleman   NH    648-816-1659
4@1gz@1b6b!1ck*4b% Itzel      73257 Qayer Forg         2/6/4224   USA     Beulah          19132 Zavala    WA    793-098-4603
3@4et@4j7y!6ra*7l% Chloe      3782 Adibgungu Camp      12/11/0892 USA     Gulfport        99255 Hughes    IA    936-323-3812
9@5qz@3e5l!5sb*6a% Tamia      794 Loat Ldg             10/13/8153 USA     Gouverneur      50986 Singleton MN    998-776-8287
0@6yl@6j3x!7ic*8v% Mariyah    386 Ruvojrewuwqi Views   5/22/9702  USA     Pocahontas      57156 Nolan     OH    123-332-3002
7@5jj@8a9x!3az*0b% Kylee      3669 Oglikhemogqoh Plain 11/17/0596 USA     Belfast         39691 Whitney   UT    034-712-9446


#Connect to Azure Tenant
PS C:\WINDOWS\system32> Connect-AzureAD

Account             Environment TenantId                             TenantDomain  AccountType
solan@arkuscloud.io AzureCloud  <Your Tenant ID>                     arkuscloud.io User



#ArkShell1_BatchUserCreate Script
PS C:\WINDOWS\system32> $AzureADUsers = Import-Csv C:\Users\Solo\Documents\RandomUsers.csv

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


#Successful screen output of new users
ObjectId                             DisplayName    UserPrincipalName      UserType
09802ccb-863b-462e-895e-984f614a13c9 Hailey.Adams   HAdams@arkuscloud.io   Member
90e1b446-f49a-49b8-9767-fd38344cfaee Diamond.Becker DBecker@arkuscloud.io  Member
979043c9-0109-4d03-9ca2-94d41df67d01 Emmy.Carroll   ECarroll@arkuscloud.io Member
ded5f635-f70a-487e-9eca-a7a9792ec704 Parker.Short   PShort@arkuscloud.io   Member
cf4f1d37-57a8-47e1-b2c1-d511921c992d Cali.Hawkins   CHawkins@arkuscloud.io Member
d11754b5-1d78-4202-aa98-222a134d4bb5 Aliya.Vasquez  AVasquez@arkuscloud.io Member
e726429f-3e02-44f7-9e0b-6eb03940d91a Journey.Lucero JLucero@arkuscloud.io  Member
b8377f76-b9d1-49e5-963a-d6dcebec5598 Shaniya.Luna   SLuna@arkuscloud.io    Member
e25dcb91-bdf3-4897-977a-3d65d4eca8f1 Leilani.Bryant LBryant@arkuscloud.io  Member
4e29e3d5-b549-406a-a257-48d7f4cf0966 Zoe.Faulkner   ZFaulkner@arkusclou... Member
51e8c438-3301-4aa3-aa69-a8b20cb18891 Kaitlynn.Ba... KBallard@arkuscloud.io Member
076145e5-9b50-478f-af6c-41ad107295c0 Deborah.Spears DSpears@arkuscloud.io  Member
3602cca6-1156-45fd-9d88-060301a480a2 Lillianna.L... LLowery@arkuscloud.io  Member
2b4d98d2-1f46-49b3-8e68-894b46dfebe0 Ashley.Cast... ACastillo@arkusclou... Member
c39441b9-0819-4fd6-acae-8688f1f637b0 Nayeli.Midd... NMiddleton@arkusclo... Member
c71071e7-2688-4d70-8fde-8f3624afc044 Makayla.Cop... MCopeland@arkusclou... Member
9ef95839-a72e-470b-81a1-346d1e1a0bda Imani.Bright   IBright@arkuscloud.io  Member
33fe3d7a-e76b-4593-9288-7a804db61b13 Amaya.Lara     ALara@arkuscloud.io    Member
f7193a8d-39ef-46a4-b544-79350a2eeafa Regina.Bates   RBates@arkuscloud.io   Member
4ef26017-7aff-404c-98d5-e7263b5b62a3 Liberty.Pro... LProctor@arkuscloud.io Member
950b3722-3abc-4fe6-8c11-8630c78762c3 Hana.Guerra    HGuerra@arkuscloud.io  Member
9450d07f-fe9d-400d-84db-1e80dd5a3ff0 Emery.Mann     EMann@arkuscloud.io    Member
152c5a6f-3035-4de8-bac8-5c5ddf804d87 Nancy.Blanc... NBlanchard@arkusclo... Member
2aaed151-8224-48db-83ba-450b2e9eb527 Phoenix.And... PAndrade@arkuscloud.io Member
362f8477-a4c7-4077-bcbe-11821a7bc998 Jazlynn.San... JSanders@arkuscloud.io Member
ec7f73b6-fab2-4ddd-9a65-91dc34cf9482 Evangeline.... EJohns@arkuscloud.io   Member
979add70-f951-4f88-a0d2-f92efe954499 Delaney.Ramsey DRamsey@arkuscloud.io  Member
66f7b7ea-aa7a-40d5-9b1e-3d318e7af1f9 Eleanor.Cherry ECherry@arkuscloud.io  Member
679f09b2-403b-411b-8e8a-291887388ac7 Courtney.Ac... CAcevedo@arkuscloud.io Member
cbbf5185-541c-4b10-a545-aaa9955cbac1 Marissa.Shea   MShea@arkuscloud.io    Member


#Total list of Arkus Cloud students
PS C:\WINDOWS\system32> Get-AzureADUser

ObjectId                             DisplayName      UserPrincipalName              UserType
2b4d98d2-1f46-49b3-8e68-894b46dfebe0 Ashley.Castillo  ACastillo@arkuscloud.io        Member
33fe3d7a-e76b-4593-9288-7a804db61b13 Amaya.Lara       ALara@arkuscloud.io            Member
f19f8c52-3d19-46b9-9def-87d8d9d828bc Albert.Miller    AMiller@arkuscloud.io          Member
8d822191-219c-4dd9-91b2-f3e32ea4f818 Ashley.Mitchell  AMitchell@arkuscloud.io        Member
d11754b5-1d78-4202-aa98-222a134d4bb5 Aliya.Vasquez    AVasquez@arkuscloud.io         Member
e2ce1c51-0201-4540-a5ad-ea09689a7b52 Andrew.Williams  AWilliams@arkuscloud.io        Member
66b3e83d-251b-4076-9fac-48c17daf33ab Bobby.Evans      BEvans@arkuscloud.io           Member
2f98c91f-986a-400b-a3c0-05ddf78c5110 Bonnie.Harris    BHarris@arkuscloud.io          Member
aab84950-1e8f-4c59-8903-632f9be37155 Bootsy Rawlings  brawlings@arkuscloud.io        Member
679f09b2-403b-411b-8e8a-291887388ac7 Courtney.Acevedo CAcevedo@arkuscloud.io         Member
cf4f1d37-57a8-47e1-b2c1-d511921c992d Cali.Hawkins     CHawkins@arkuscloud.io         Member
90e1b446-f49a-49b8-9767-fd38344cfaee Diamond.Becker   DBecker@arkuscloud.io          Member
1147bcec-7cc4-4ad9-9464-76c2843fee61 Donald.Howard    DHoward@arkuscloud.io          Member
979add70-f951-4f88-a0d2-f92efe954499 Delaney.Ramsey   DRamsey@arkuscloud.io          Member
076145e5-9b50-478f-af6c-41ad107295c0 Deborah.Spears   DSpears@arkuscloud.io          Member
979043c9-0109-4d03-9ca2-94d41df67d01 Emmy.Carroll     ECarroll@arkuscloud.io         Member
66f7b7ea-aa7a-40d5-9b1e-3d318e7af1f9 Eleanor.Cherry   ECherry@arkuscloud.io          Member
ec7f73b6-fab2-4ddd-9a65-91dc34cf9482 Evangeline.Johns EJohns@arkuscloud.io           Member
9450d07f-fe9d-400d-84db-1e80dd5a3ff0 Emery.Mann       EMann@arkuscloud.io            Member
fd02f601-3674-4f97-9dc9-6754e1127cc4 Gregory.Reed     GReed@arkuscloud.io            Member
09802ccb-863b-462e-895e-984f614a13c9 Hailey.Adams     HAdams@arkuscloud.io           Member
950b3722-3abc-4fe6-8c11-8630c78762c3 Hana.Guerra      HGuerra@arkuscloud.io          Member
9a23cd63-f89e-4aca-9419-033c1fc5da11 Helen.Roberts    HRoberts@arkuscloud.io         Member
9ef95839-a72e-470b-81a1-346d1e1a0bda Imani.Bright     IBright@arkuscloud.io          Member
4039e969-0034-4d3c-a59f-f0149beb82cf Judy.Lopez       JLopez@arkuscloud.io           Member
e726429f-3e02-44f7-9e0b-6eb03940d91a Journey.Lucero   JLucero@arkuscloud.io          Member
18dabc98-877a-41a2-b57e-191e376b0f11 Jeremy.Rivera    JRivera@arkuscloud.io          Member
f34eaa65-d463-4f93-a1d6-eae3a6d57d20 Juan.Ross        JRoss@arkuscloud.io            Member
362f8477-a4c7-4077-bcbe-11821a7bc998 Jazlynn.Sanders  JSanders@arkuscloud.io         Member
51e8c438-3301-4aa3-aa69-a8b20cb18891 Kaitlynn.Ballard KBallard@arkuscloud.io         Member
384496f3-f700-4f2f-a716-5287d285d12a Katherine.Green  KGreen@arkuscloud.io           Member
f332e278-2f86-490f-ba01-703b6aed1bce Kathryn.Wilson   KWilson@arkuscloud.io          Member
e25dcb91-bdf3-4897-977a-3d65d4eca8f1 Leilani.Bryant   LBryant@arkuscloud.io          Member
3602cca6-1156-45fd-9d88-060301a480a2 Lillianna.Lowery LLowery@arkuscloud.io          Member
26ad4880-8984-49fd-b077-93bab382e415 Lisa.Perry       LPerry@arkuscloud.io           Member
4ef26017-7aff-404c-98d5-e7263b5b62a3 Liberty.Proctor  LProctor@arkuscloud.io         Member
272e01fd-9065-44fe-b343-99521c2501c2 Marilyn.Adams    MAdams@arkuscloud.io           Member
41f992ba-9f96-476a-b8ef-b22821e05616 Melissa.Bailey   MBailey@arkuscloud.io          Member
c71071e7-2688-4d70-8fde-8f3624afc044 Makayla.Copeland MCopeland@arkuscloud.io        Member
cbbf5185-541c-4b10-a545-aaa9955cbac1 Marissa.Shea     MShea@arkuscloud.io            Member
a9b76a03-050a-4626-85fe-d2096de183d8 Nancy.Baker      NBaker@arkuscloud.io           Member
152c5a6f-3035-4de8-bac8-5c5ddf804d87 Nancy.Blanchard  NBlanchard@arkuscloud.io       Member
c39441b9-0819-4fd6-acae-8688f1f637b0 Nayeli.Middleton NMiddleton@arkuscloud.io       Member
4965c608-9124-4a71-8434-3675d1f8ee8f Nicholas.Powell  NPowell@arkuscloud.io          Member
2aaed151-8224-48db-83ba-450b2e9eb527 Phoenix.Andrade  PAndrade@arkuscloud.io         Member
5baa0857-7cbf-4bed-9e6e-02881fd94ebf Patricia.Bennett PBennett@arkuscloud.io         Member
47ecec1d-8787-4a6a-adcb-cb0b91c27c42 Paula.Henderson  PHenderson@arkuscloud.io       Member
904f1faa-c308-48b2-bba4-e3d4e401ac08 Paul.Patterson   PPatterson@arkuscloud.io       Member
ded5f635-f70a-487e-9eca-a7a9792ec704 Parker.Short     PShort@arkuscloud.io           Member
f7193a8d-39ef-46a4-b544-79350a2eeafa Regina.Bates     RBates@arkuscloud.io           Member
d1d74f2b-c262-49cc-964a-54557c43230f Ronald.Butler    RButler@arkuscloud.io          Member
955b1ed2-075c-416e-83b4-95e1d1e5fcff Shirley.Long     SLong@arkuscloud.io            Member
b8377f76-b9d1-49e5-963a-d6dcebec5598 Shaniya.Luna     SLuna@arkuscloud.io            Member
3e996785-a16f-4f9a-a08c-035afe93e57b Solan White      solan@arkuscloud.io            Member
eeb13e92-aafb-48d1-9b1d-0cbbe7c16237 Tina.Coleman     TColeman@arkuscloud.io         Member
5286024b-aaca-4b2a-831a-6c0fcc36b0cf William.Cooper   WCooper@arkuscloud.io          Member
4e29e3d5-b549-406a-a257-48d7f4cf0966 Zoe.Faulkner     ZFaulkner@arkuscloud.io        Member


PS C:\WINDOWS\system32> Stop-Transcript
**********************
Windows PowerShell transcript end
End time: 20211107200004
**********************
