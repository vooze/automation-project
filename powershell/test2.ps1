function Show-Menu
{
     param (
           [string]$Title = 'My Menu'
     )
     cls
     Write-Host "================ $Title ================"
     
     Write-Host "1: Press '1' to change Password for users"
     Write-Host "2: Press '2' Disable user account"
     Write-Host "3: Press '3' Enable user account"
     Write-Host "4: Press '4' Unlock user account"
     Write-Host "5: Press '5' Delete user account with -whatif"
     Write-Host "Q: Press 'Q' to quit."

}    
do
{
     
     Import-Module ActiveDirectory
     $user=Read-Host "Enter AD username"
     $Name = $user
     $Usercheck = Get-ADUser -LDAPFilter "(SAMAccountName=$user)"
     If ($usercheck -eq $Null)
     {
     Write-Host "User does not exist in AD"
     }
     Else
     {
     Show-Menu –Title "JOKKE's AD + PS script"
     $input = Read-Host "Please make a selection"
     switch ($input)
     {
           '1' {
                cls
                'This is for reset a user PW.'
                $newpw=Read-Host "Enter the new password" -AsSecureString
                Set-ADAccountPassword $user -NewPassword $newpw
                #Set-ADUser $user -ChangePasswordAtLogon $True
           } '2' {
                cls
                'User is now disabled'
                Disable-ADAccount $user
           } '3' {
                cls
                'User is now enabled'
                Enable-ADAccount $user
           } '4' {
                cls
                'User is now unlocked'
                Unlock-ADAccount $user
           } '5' {
                cls
                'User is now "deleted"'
                Remove-ADUser $user -whatif
           } 'q' {
                return
           }

     }
     pause
}
}
until ($input -eq 'q')