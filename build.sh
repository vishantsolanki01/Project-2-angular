#!/bin/bash
echo "=====Build====="
echo "=====Build====="
docker image build -t reactapp .
docker image rm $(docker image ls --filter label=owner="raja" -q)
docker image tag reactapp vishantsolanki01/reactapp:${BUILD_ID}

