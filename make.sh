#!/bin/bash

containerName=market-manager

if [[ $1 == shell ]];
then

    docker exec -it $containerName sh

elif [[ $1 == build ]];
then

    docker build . -t $containerName --build-arg UID=$(id -u) --build-arg GID=$(id -g)

elif [[ $1 == run ]];
then

    docker run --name $containerName -d -v $(pwd):/var/www/html -p 80:80 -p 5174:5174 --add-host market-manager.local:127.0.0.1 $containerName

elif [[ $1 == logs ]];
then

    docker logs $containerName

elif [[ $1 == clear ]];
then

    docker rm $(docker ps -a -q -f name=$containerName) --force

elif [[ $1 == tests ]];
then

    docker exec -it $containerName vendor/bin/phpunit ./tests

else
    echo "Доступные команды:"
    echo "build"
    echo "run"
    echo "bash"
    echo "logs"
    echo "clear"
    echo "tests"
fi