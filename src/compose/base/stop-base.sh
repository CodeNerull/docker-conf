#!/bin/bash
docker-compose -f docker-compose-base.yaml -f docker-compose-php.yaml -f docker-compose-sync.yaml -f docker-compose-redis.yaml down
