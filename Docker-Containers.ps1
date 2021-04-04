#Create a container from local/Docker Hub image.
docker container run -d --name web -p 8000:8080 dilanperera/gsd:first-ctr
docker container ls
#OR
docker ps

#Pass an environment variable when running a container.
docker run -d --name my-postgres -e POSTGRES_PASSWORD=password postgres

#Inspect the configuration of a running container.
docker container inspect webtest
docker inspect webtest
docker inspect CONTAINER_ID

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

#Remove multiple containers in one go.
docker container rm $(docker container ls -aq) -f
docker rm -f $(docker ps -aq)

#Forcefully remove a Docker container.
docker container rm web -f
docker container ls -a

#Remove a container including the associated volume
docker container rm -v web
#OR
docker rm -v web
#This willonly work if you haven't specified the volume location.

#Run a Docker container attached to the terminal
docker container run -it --name test alpine sh
#OR on WINDOWS
docker container run -it mcr.microsoft.com/powershell:nanoserver pwsh
#To release the terminal press => Ctrl+P+Q
docker container ls

#Execute a command inside a container.
docker exec CONTAINER_NAME COMMAND

#Getting into a terminal of running container.
docker container exec -it CONTAINER_NAME/ID sh
docker container exec -it CONTAINER_NAME/ID pwsh

#Check the port mapping of a running container
docker port CONTAINER_NAME

