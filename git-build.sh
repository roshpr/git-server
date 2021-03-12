#!/bin/bash

cd docker
docker build --progress=plain -t git-server:latest .

#docker tag git-server:latest svl-artifactory.juniper.net/atom-docker/atom-of/jdeployer/git-server:latest
#docker push svl-artifactory.juniper.net/atom-docker/atom-of/jdeployer/git-server:latest
