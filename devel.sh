#!/bin/sh
docker-compose build
winpty docker-compose run --rm cmake
