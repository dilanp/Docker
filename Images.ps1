#Build image in local if the name is not "Dockerfile".
docker image build -f DockerFileName -t dilanperera/gsd:first-ctr .
#OR
docker build -f DockerFileName -t dilanperera/gsd:first-ctr .
#Build image in local if the name is "Dockerfile".
docker image build -t dilanperera/gsd:first-ctr .

#View the images on local.
docker image ls
docker images

#Push local Docker image to the Docker Hub.
docker login
docker image push dilanperera/gsd:first-ctr
#OR
docker push dilanperera/gsd:first-ctr

#Remove Docker image from local.
docker image rm dilanperera/gsd:first-ctr #OR docker rmi dilanperera/gsd:first-ctr
docker image ls

#=======================================================

#Search docker images on docker hub.
docker search IMAGE_SEARCH_TEXT

#Pull a docker image from docker hub to local.
docker pull alpine:latest