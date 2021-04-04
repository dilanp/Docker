#Need a secret info in a file to get started!
echo "a98f6451848b4f4b988ac13a282ff170" > classified

#Run this on a MANAGER NODE so, that the secret is sent to the swarm secret store (raft).
docker secret create wp-sec-v1 classified

#Inspect secret details.
docker secret inspect wp-sec-v1

#Create a service by specifying the secret.
docker service create -d --name secret-service --secret wp-sec-v1 -p 8080:8080 --replicas 3 dilanperera/gsd:first-ctr
#And, check...
docker service ls
docker service inspect secret-service

#Check nodes where service is running.
docker service ps web
#Get into the sell of THAT node.
docker container exec -it 91ac8b76eb8a sh
#Check the secret file.
ls -l /run/secrets/\
cat /run/secrets/wp-sec-v1
#WINDOWS: look for C:\ProgramData\Docker

#You must remove the service before removing the secret.
docker service rm secret-service
docker secret rm wp-sec-v1
