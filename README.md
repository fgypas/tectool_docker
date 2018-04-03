# Docker container for TECtool


## Installation

docker build -t tectool .

## Run

docker run -it tectool bash

## Extract files from container

docker cp <container id>:<path to file within container> <path to file outside of container>
