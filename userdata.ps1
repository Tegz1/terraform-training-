#start up script
<powershell>
Start-Transcript;

#allows initialization of userdata script when restarted.
C:\ProgramData\Amazon\EC2-Windows\Launch\Scripts\userdata.ps1 –Schedule

#create new index.html file
New-Item -Path "C:\inetpub\wwwroot\" -Name "index.html" -ItemType "file" -Value "Hello from terraform"

# install IIS
Import-Module ServerManager;
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-WebServerRole', 'IIS-WebServer', 'IIS-ManagementConsole';
#change default iis page to index.html
Set-ItemProperty 'IIS:\Sites\Default Web Site\' -name physicalPath -value "C:\inetpub\wwwroot\index.html"


<persist>true</persist>
</powershell>