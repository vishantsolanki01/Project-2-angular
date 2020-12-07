#!/bin/bash
echo "=====Build====="
echo "=====Build====="
docker container run --rm -v $(pwd):/app -w /app npm install sonar-scanner  -Dsonar.projectKey=angular  -Dsonar.sources=.  -Dsonar.host.url=http://192.168.0.109:9000  -Dsonar.login=518d11b95dd7bff5d2fe49ec785e30bac18f9808
