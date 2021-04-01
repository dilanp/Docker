#Build the docker image for the "main" container.
docker build -f aspnetcore.dockerfile -t dilanperera/aspnetcore .

#Run the "second" container with a NAME assigned.
docker run -d --name my-postgres -e POSTGRES_PASSWORD=password postgres

#Create the "main" container and link the "second" container by its name.
#Alias "postgres" is given to the second container so, that it could be referred from the main container.
#This is the "server name" you need to use for connection strings in the main container.
docker run -d -p 5000:5000 --link my-postgres:postgres danwahlin/aspnetcore