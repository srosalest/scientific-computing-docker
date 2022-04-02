IMG_NAME=jupyter/scientific-computing
PORTS=8888:8888
CONTAINER_NAME=scientific-computing-jupyter

.PHONY : help

help :
	@echo 'make commands: build run bash start stop purge'

build :
	docker build -t $(IMG_NAME) .

run : 
	docker run -p $(PORTS) --name $(CONTAINER_NAME) -d $(IMG_NAME)

stop :
	docker stop $(CONTAINER_NAME)

start :
	docker start $(CONTAINER_NAME)

purge:
	docker rm $(CONTAINER_NAME)
	docker rmi $(IMG_NAME)

bash:
	docker exec -it $(CONTAINER_NAME) bash

