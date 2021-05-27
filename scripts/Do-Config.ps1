
function WC-Set-WindowsPassword  {
       param (
            [String]$WinPassword
       )

       $WinPassword = (ConvertTo-SecureString -AsPlainText $(Read-Host "Enter a Password for user $env:USERNAME") -Force)

       
       Write-Output "boof" + $WinPassword
       #Set-ADAccountPassword -Identity $user -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $(Read-Host "Enter a Password") -Force)
}

Set-NewWindowsPassword -WinPassword 'Foo'