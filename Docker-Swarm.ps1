#=================Create the Docker swarm cluster======================

#Initialise the Docker swarm (cluster) on the first candidate manager node. Using it's IP address.
docker swarm init --advertise-addr=192.168.0.25

#Generate Docker swarm manager join token.
docker swarm join-token manager
#Copy docker swarm manager join token. E.g: docker swarm join --token SWMTKN-1-1zllulztnxeae72pvgo7oes8o0p1m28e8gcn2athiltw07oa87-27fo5fjkiu8igf6g53vucqv3z 192.168.0.25:2377
#Run this copied command on other candidate manager nodes.

#Verify the status of the swarm.
docker node ls

#Run the following on manager node 1
docker swarm join-token worker
#Copy docker swarm worker join token
#e.g. docker swarm join --token SWMTKN-1-1zllulztnxeae72pvgo7oes8o0p1m28e8gcn2athiltw07oa87-2rngpbc6qlst86gxdwdkfcvxv 192.168.0.25:2377
#Run the copied command on other candidate worker nodes.

#Verify the status of the swarm.
docker node ls

#============================

#Create a service by running this command on a manager.
docker service create --name web -p 8080:8080  --replicas 3 dilanperera/gsd:first-ctr

#Check on which nodes do containers (replicas) run by executing this on a manager node.
docker service ps web
#Alternatively the following could be run on individual node
docker container ls

#Scale up bu running this on a manager node.
docker service scale web=10

#Remove containers at different nodes individually. But, this could be buggy!!!
docker container rm 0555c609f430 -f