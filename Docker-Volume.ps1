#Run a container with a SPECIFIC attached volume, 
#Make it the working directory and move into it,
#Start a terminal in there attaching to the current terminal.
#LINUX/OSX: 
docker container run -it --name test -p 8080:5000 -v $(pwd):/app -w "/app" mcr.microsoft.com/dotnet/sdk /bin/bash
#WINDOWS:
docker container run -it --name test -p 8080:5000 -v ${PWD}:/app -w "/app" mcr.microsoft.com/dotnet/sdk pwsh

#Run a container attaching a volume which is created on the fly.
docker container run -dit --name voltest --mount source=ubervol,target=/vol alpine
#OR like,
docker container run -d -p 5432:5432 -v postgres-data:/var/lib/postgresql/data --name postgres1 postgres

#LINUX: inspect the Docker columes on local disk.
ls -l /var/lib/docker/volumes/
#WINDOWS: inspect here...
C:\ProgramData\Docker

#LINUX test
#Enter into a container terminal interactively,
#Add a new file inside the volume folder mounted,
#Exit the container terminal and check it is available in local disk!
docker container exec -it voltest sh
ls -l /vol/
echo "some data" > /vol/newfile
cat /vol/newfile
exit
cat /var/lib/docker/volumes/ubervol/_data/newfile

#Removing a container doesn't remove the mounted volume!
docker container rm voltest -f
docker volume ls

#Running conrainer must be removed before removing the associated volume.
docker container rm voltest -f
docker volume rm ubertest