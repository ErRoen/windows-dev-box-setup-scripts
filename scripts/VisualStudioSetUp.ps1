#--- Installing VS and VS Code with Git
# See this for install args: https://chocolatey.org/packages/VisualStudio2017Community
# https://docs.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-community
# https://docs.microsoft.com/en-us/visualstudio/install/use-command-line-parameters-to-install-visual-studio#list-of-workload-ids-and-component-ids
choco install -y visualstudio2019professional --package-parameters="'--add Microsoft.VisualStudio.Component.Git'"

Update-SessionEnvironment #refreshing env due to Git install

#--- UWP Workload and installing Windows Template Studio ---
choco install -y visualstudio2019-workload-azure
choco install -y visualstudio2019-workload-manageddesktop

choco install -y resharper-platform

#Install-ChocolateyVsixPackage -PackageName "MyPackage" `
#  -VsixUrl http://visualstudiogallery.msdn.microsoft.com/ea3a37c9-1c76-4628-803e-b10a109e7943/file/73131/1/AutoWrockTestable.vsix
