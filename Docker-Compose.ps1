#Build the docker images using docker-compose.yml.
docker-compose build

#Start a multi container/service app.
docker-compose up -d

#Stop a multi container/service  app.
docker-compose down

#See what containers/service running.
docker compose ps

#See everything ran/running.
docker compose ps -a

#Get logs of all containers/services running.
docker compose logs

#Stop all containers/service.
docker-compose stop

#Start all containers/service.
docker compose start