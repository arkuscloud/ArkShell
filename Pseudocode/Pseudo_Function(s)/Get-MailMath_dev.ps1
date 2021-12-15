$path = 'OU=path'

$OrgUnits = Get-ADOrganizationalUnit -SearchBase $path -SearchScope Subtree -Filter * -Properties * | Select-Object -ExpandProperty DistinguishedName -Skip 1

foreach( $Org in $OrgUnits ){
    $UPNs = Get-ADUser -Filter * -SearchBase $Org -Properties * | Select-Object -ExpandProperty userprincipalname -Skip 1
    foreach( $UPN in $UPNs ){
       Get-MailboxFolderStatistics -identity $UPN -FolderScope RecoverableItems | Select-Object Identity,Name,FolderAndSubfolderSize,ItemsinFolder,@{N='Time';E={Get-Date}}

        Write-Progress -id 1 -Activity 'Collecting Mail Math' -PercentComplete ($UPNs.IndexOf($UPN)/$UPNs.Count*100)
    }
    #Write-Progress -id 1 -Activity 'Collecting User Principal Names' -PercentComplete ($OrgUnits.IndexOf($Org)/$OrgUnits.Count*100)
}
