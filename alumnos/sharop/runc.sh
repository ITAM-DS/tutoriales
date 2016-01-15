#!/bin/sh
#by Sharop
#TODO: Falta agregar condiciones y un poco de inteligencia para que verifique la maquina 
space=docker ps -a | grep -i docker-ds | grep Up | cut -d' ' -f 1  

case "$1" in
    run)
        docker run -d -p 8787:8787 -p 8888:8888 -v $(pwd)/data-docker:/home/itam/proyectos nanounanue/docker-ds
        ;;
    stop)
        docker stop $(echo $(docker ps -a | grep -i docker-ds | grep Up | cut -d' ' -f 1 )) 
        ;;
    kill)
        docker rm $(echo $(docker ps -a | grep -i docker-ds |  cut -d' ' -f 1 ))
        ;;
    start)
        docker start $(echo $(docker ps -a | grep -i docker-ds | cut -d' ' -f 1 )) 
        ;;
    *)
        echo $"Uso $0 {run|stop|kill|start}"
        exit 1

esac

