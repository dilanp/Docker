#Create a container from local/Docker Hub image.
docker container run -d --name web -p 8000:8080 dilanperera/gsd:first-ctr
docker container ls
#OR
docker ps

#Check running IP address.
docker network inspect bridge

#Stop a Docker container.
docker container stop web
docker container ls -a #OR docker ps -a

#Start a Docker container that's stopped in local.
docker container start web
docker container ls

#Stop and remove a Docker container.
docker container stop web
docker container rm web #OR docker rm web
docker container ls -a


#Forcefully remove a Docker container.
docker container rm web -f
docker container ls -a

#Run a Docker container attached to the terminal
docker container run -it --name test alpine sh
#OR on WINDOWS
docker container run -it mcr.microsoft.com/powershell:nanoserver pwsh.exe
#To release the terminal press => Ctrl+P+Q
docker container ls