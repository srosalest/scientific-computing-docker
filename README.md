# scientific-computing-docker
Docker containers for jupyter environment

## To run and build the image use the included Makefile.
- To install/update/remove julia packages, add them to the file julia-kernel-installation.jl and build the image again (stop container and execute prune and build).
- To install/update/remove python packages add them to the file requirements.txt (with the container running), access via bash and execute (no need to rebuild the image) $ pip3 install -r requirements.txt
- Volume has been added and mounted into the container for the Notebook, Do not remove that folder.
- Changes in the folder Notebooks wont need to rebuild the image, is mounted to the container.
- To build the image run $ make build
- To run the image for the first time, execute $ make run
- To stop without deleting the running container, $ make stop
- To restart the container, $ make start
- To access the container bash (container must be running), $ make bash
- To remove images and container (container must be stopped before), execute $ make purge
- For help please execute $ make help.

### TODO:
- Add command to rebuild the image.
- Add command to add or remove easily packages for julia and python.

