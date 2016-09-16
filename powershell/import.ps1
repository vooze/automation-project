$Users = Import-Csv -Path "C:\Users\Administrator\Desktop\lol.csv"
foreach ($User in $Users)
{
    $Displayname = $User.Firstname + " " + $User.Lastname
    $UserFirstname = $User.Firstname
    $UserLastname = $User.Lastname
    $SAM = $User.SAM
    $UPN = $User.Firstname + "." + $User.Lastname + "@" + $User.Maildomain
    $Description = $User.Description
    $Password = $User.Password
    New-ADUser -Name "$Displayname" -Displayname "$Displayname" -SamAccountName $SAM -UserPrincipalName $UPN -GivenName "$UserFirstname" -Surname "$UserLastname" -Description "$Description" -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) -Enabled $true -ChangePasswordAtLogon $false -PasswordNeverExpires $true 
}