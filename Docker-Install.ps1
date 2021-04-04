#================================Windows Server 2019=================================
#Step 1: Enable the containers feature in Windows Server 2019
#Start an elevated PS session.
Install-Module -Name DockerMsftProvider -Repository PSGallery -Force

#Step 2: Install Docker on Windows Server 2019
Install-Package -Name docker -ProviderName DockerMsftProvider

#Step 3: Reboot the computer.
Restart-Computer -Force

#Step 4: Verfy installation
Get-WindowsFeature -Name Containers

#Step 5: Check installed Docker version.
Get-Package -Name Docker -ProviderName DockerMsftProvider
#OR
docker --version

#Step 6: Confirm the Docker client-engine communication is working
docker info

#Step 7: Start Docker Daemon
Start-Service Docker

#Upgrade Docker on Windows Server 2019
#--------------------------------------
Install-Package -Name Docker -ProviderName DockerMsftProvider -Update -Force

#Next, check version and start the Docker deamon.