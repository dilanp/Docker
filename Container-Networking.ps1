#Create a "bridge" network giving name - isolated_network.
docker network create --driver bridge isolated_network

#View the list of networks available.
docker network ls

#Check the configuration of a network.
docker network inspect isolated_network

#Create new containers assigning them to the network
docker run -d -e POSTGRES_PASSWORD=password --net isolated_network --name postgres postgres
docker container run -d -p 5000:5000 --net=isolated_network --name dotnetcoreapp dilanperera/aspnetcore
docker network inspect isolated_network