
function Set-WindowsPassword-WCUtil  { 
       param (
            [String]$WinPassword
       )

      #WinPassword = (ConvertTo-SecureString -AsPlainText $(Read-Host "Enter a Password for user $env:USERNAME") -Force)
	$pw = (ConvertTo-SecureString -AsPlainText $(Read-Host "Enter a Password for user $env:USERNAME") -Force)
       
	Set-LocalUser -Name $env:USERNAME -Password $pw
       
	if ($?) { "Updated Password" } else { "Error updating password. Are you admin?"}
}

