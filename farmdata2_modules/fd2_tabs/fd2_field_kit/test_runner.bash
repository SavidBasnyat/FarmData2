#!/bin/bash

xhost + > /dev/null

docker run -it \
  -v $PWD:/$(basename $PWD) \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -w /$(basename $PWD) \
  --rm \
  -e DISPLAY=$DISPLAY \
  --entrypoint cypress \
  cypress/included:6.2.1 open --project . \
  --config baseUrl=http://172.17.0.1
