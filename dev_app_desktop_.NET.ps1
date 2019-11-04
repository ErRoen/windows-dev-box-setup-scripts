# Description: Boxstarter Script
# Author: Microsoft
# Common dev settings for desktop app development

Disable-UAC

choco upgrade --yes chocolatey

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
	iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

#--- Setting up Windows ---
executeScript "SystemConfiguration.ps1";
executeScript "FileExplorerSettings.ps1";
executeScript "RemoveDefaultApps.ps1";
executeScript "Browsers.ps1";

executeScript "HyperV.ps1";
RefreshEnv

choco install dotnet4.7.2
choco install dotnetfx
choco install dotnetcore

executeScript "CommonDevTools.ps1";

choco install -y powershell-core
choco install -y azure-cli
Install-Module -Force Az
choco install -y microsoftazurestorageexplorer
choco install -y terraform
choco install -y servicebusexplorer

# Install VS and Extensions
executeScript "VisualStudioSetUp.ps1";

choco install -y sql-server-management-studio

# Pin Items to TaskBar
Install-ChocolateyPinnedTaskBarItem "$env:programfiles\console\console.exe"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Google\Chrome\Application\chrome.exe"

# Update File Associations
Install-ChocolateyFileAssociation ".txt" "$env:programfiles\Notepad++\notepad++.exe"
Install-ChocolateyFileAssociation ".log" "$env:programfiles\Notepad++\notepad++.exe"
Install-ChocolateyFileAssociation ".config" "$env:programfiles\Notepad++\notepad++.exe"
Install-ChocolateyFileAssociation ".xml" "$env:programfiles\Notepad++\notepad++.exe"
Install-ChocolateyFileAssociation ".ps1" "$env:programfiles\Notepad++\notepad++.exe"

#--- reenabling critial items ---
Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
