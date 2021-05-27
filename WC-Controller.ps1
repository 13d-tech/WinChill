# routine to install software here
# echo $env:SYSTEMDRIVE$env:SYSTEM
#install busybox 
$pwd/lib/busybox --install $pwd/bin

# choco needs to install git

function choco-install-apps {
# https://github.com/rmyorston/busybox-w32.git
}

function install-gnu-bins {
	busybox.exe --install $pwd\tmp\

	
}

function setup-path {
	#Get Current Path
$Environment = [System.Environment]::GetEnvironmentVariable("Path", "Machine")


#Add Items to Environment
$AddPathItems = "C:\Windows\CCM\;C:\ProgramData\WaaS\;"
$Environment = $Environment.Insert($Environment.Length,$AddPathItems)

return $environment
#Set Updated Path
[System.Environment]::SetEnvironmentVariable("Path", $Environment, "Machine")
}
	
}