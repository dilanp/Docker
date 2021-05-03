#================================Windows Server 2019=================================
#Step 1: Enable the containers feature in Windows Server 2019
#Start an elevated PowerShell session.
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


#================================Linux=================================
#Check Docker documentation for installation instructions for your distro.
#Install using a repository is a good option!
#https://docs.docker.com/engine/install/

#Ignore any Vagrant commands if you are not using it for local.

#Possible error after installation: 1
#Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
#Resolution: check these 2 services are active.
systemctl status docker.service
systemctl status docker.socket
#If the services are not inactive then, start Docker service.
sudo systemctl start docker
#Now, check again for the above 2 services.

#Possible error after installation: 2
#Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: 
#Get http://%2Fvar%2Frun%2Fdocker.sock/v1.24/version: dial unix /var/run/docker.sock: connect: permission denied
#Resolution: check /var/run/docker.sock exists and permission level.
ls -al /var/run/docker.sock
#Check current user and it's group
groups
groups vagrant
#Add vagrant user to the Docker group.
sudo usermod -aG docker vagrant
#Now exit the terminal, restart and login again.
exit
vagrant reload
vagrant ssh
#Remember to start the Docker service again!
sudo systemctl start docker
docker version
docker info

#Check Docker startup status.
systemctl list-unit-files
/docker
#Enable Docker as a startup process.
sudo systemctl enable docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

#OPTIONAL: Check Docker files in its installation packages.
rpm -ql docker-ce
rpm -ql containerd.io
rpm -ql docker-ce-cli
