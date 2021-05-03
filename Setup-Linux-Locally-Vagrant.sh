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
