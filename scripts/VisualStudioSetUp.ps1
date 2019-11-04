#--- Installing VS and VS Code with Git
# See this for install args: https://chocolatey.org/packages/VisualStudio2017Community
# https://docs.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-community
# https://docs.microsoft.com/en-us/visualstudio/install/use-command-line-parameters-to-install-visual-studio#list-of-workload-ids-and-component-ids
choco install -y visualstudio2019professional --package-parameters="--add Microsoft.VisualStudio.Component.Git"

Update-SessionEnvironment #refreshing env due to Git install

#--- Workloads and installing Windows Template Studio ---
choco install -y visualstudio2019-workload-azure
choco install -y visualstudio2019-workload-netweb
choco install -y visualstudio2019-workload-netcoretools
choco install -y visualstudio2019-workload-data

#choco install -y resharper-platform
choco install resharper --pre 
choco install dotpeek --pre 

#Install-ChocolateyVsixPackage -PackageName "AddNewFile" `
#  -VsixUrl https://marketplace.visualstudio.com/_apis/public/gallery/publishers/MadsKristensen/vsextensions/AddNewFile/3.5.134/vspackage
