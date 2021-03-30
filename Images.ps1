#Build image in local.
docker image build -t dilanperera/gsd:first-ctr .

#View the images on local.
docker image ls
docker images

#Push local Docker image to the Docker Hub.
docker image push dilanperera/gsd:first-ctr

#Remove Docker image from local.
docker image rm dilanperera/gsd:first-ctr
docker image ls

#=======================================================

#Search docker images on docker hub.
docker search IMAGE_SEARCH_TEXT

docker pull alpine:latest