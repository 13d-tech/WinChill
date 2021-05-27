set file=%1

#This currently scans the installed, online OS you are executing from

$winchillHome=$(Get-Location)
$OSDrive=$($env:SystemDrive)
$files=@(Get-Content "$winchillHome\config\WC-AME20H2Scan-SearchTerms.txt")
$windirs=@($($env:ProgramData,$env:ProgramFiles,${env:CommonProgramFiles(x86)},$env:CommonProgramFiles,$env:CommonProgramW6432,$env:CommonProgramW6432,$env:ProgramW6432,$env:windir)|Sort-Object|Get-Unique)


$i = 0
$wcLogFilePath = "$winchillHome\fzfresults.log"
echo "[WinChill]" > $wcLogFilePath
foreach ($file in $files) {
	$thissearch=$file
	(echo "[$file]") | Out-File -Append -FilePath $wcLogFilePath
	for ($i=0;$i -lt $windirs.Count;$i++){
		$thisdir=$(write-output $windirs[$i])
		
		cd "$thisdir"
		write-host "scanning for $file   in   $thisdir"
		#Start-Sleep 
		
		#$result = $thissearch + "|" + $result
		#$result=$

		$results=@(C:\.fzf\bin\fzf.exe -e -f $file) 
		
		#$lnout = @("$thissearch|$thisdir\$result")
		
	}
	$results=@($results|Sort-Object|Get-Unique)
	foreach ($result in $results) {
		(echo "$thisdir\$result") | Out-File -Append -FilePath "C:\fzfresults.log"
	}
	#($lnout) | Out-File -Append -FilePath "C:\fzfresults.log"
}
