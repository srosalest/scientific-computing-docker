.DEFAULT_GOAL := help
IMG_NAME=jupyter/scientific-computing
PORTS=8888:8888
CONTAINER_NAME=scientific-computing-jupyter

.PHONY : help
help : 
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)

build : ## Build the image
	@docker build -t $(IMG_NAME) .

run : ## Run the container (after building the image)
	@docker run -p $(PORTS) --name $(CONTAINER_NAME) -v $(PWD)/Notebooks:/root/scientific-computing/Notebooks:Z -d $(IMG_NAME)

stop : ## Stop the container
	@docker stop $(CONTAINER_NAME)

start : ## Start or resume the contairner after it has been stopped
	@docker start $(CONTAINER_NAME)

purge : ## Purge the container and the image
	@docker rm $(CONTAINER_NAME)
	@docker rmi $(IMG_NAME)

bash : ## Interactive access to the container
	@docker exec -it $(CONTAINER_NAME) bash

