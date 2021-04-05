#Install Vagrant
brew install vagrant
vagrant --version

#Install Virtualbox
brew install virtualbox
vboxmanage --version

#Check software installed with brew.
brew list --cask

#Don't always trust everything available on Vagrant Cloud for Linux Distro images! 
#Verify visiting the Distro page and following the link for the Vagrant image.
#Click on the "NEW" tab on Vagrant cloud page for the distro and run the command.
vagrant init centos/8

#This will create a vagrantfile at the folder location.
#You may change the vagrantfile to update the VM configuration.
#https://www.vagrantup.com/docs/providers/virtualbox/configuration

#Start the Vagrant Linux distro.
vagrant up

#SSH into the VM.
vagrant ssh
#Check the OS information.
cat /etc/os-release 

#Check Docker documentation for installation instructions for your distro.
#Install using a repository is a good option!
#https://docs.docker.com/engine/install/

#Possible error after installation: 1
#Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
#Resolution: check these 2 services are active.
systemctl status docker.service
systemctl status docker.socket
#If the services are not inactive then, start Docker service.
sudo systemctl start docker
#Noe, check again for the above 2 services.

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
