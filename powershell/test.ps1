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
     Show-Menu –Title "JOKKE's AD + PS script"
     $input = Read-Host "Please make a selection"
     Import-Module ActiveDirectory
     switch ($input)
     {
           '1' {
                cls
                'This is for reset a user PW.'
                $user=Read-Host "Enter AD username"
                $newpw=Read-Host "Enter the new password" -AsSecureString
                Set-ADAccountPassword $user -NewPassword $newpw
                Set-ADUser $user -ChangePasswordAtLogon $True
           } '2' {
                cls
                'This is for disabling a user account'
                $user=Read-Host "Enter AD username"
                Disable-ADAccount $user
           } '3' {
                cls
                'This is for enabling a user account'
                $user=Read-Host "Enter AD username"
                Enable-ADAccount $user
           } '4' {
                cls
                'This is for unlocking a user account'
                $user=Read-Host "Enter AD username"
                Unlock-ADAccount $user
           } '5' {
                cls
                'This is for deleting a user for fun (-whatif)'
                $user=Read-Host "Enter AD username"
                Remove-ADUser $user -whatif
           } 'q' {
                return
           }

     }
     pause
}
until ($input -eq 'q')