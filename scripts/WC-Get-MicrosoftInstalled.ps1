# gets windows apps [Get-AppPackage === GetAppxPackage]
# log header:  isRemovable|AppPackageName|installedLocation
$(foreach ($app in $(Get-AppPackage)){$app.NonRemovable.toString() + "|" + $app.Name + "|" + $app.InstallLocation})|Sort-Object|Get-Unique|Out-File -FilePath c:\winAppsInfo.log

# gets windows capabilities
# log header: installState|capabilityName
$(foreach ($winCapa in $(Get-WindowsCapability -Online)){$winCapa.State.ToString() + "|" + $wincapa.Name})|Sort-Object|Get-Unique|Out-File -FilePath c:\winCapabilitiesInfo.log