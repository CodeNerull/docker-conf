### php-cli

`alias php5="docker-compose -f /data/github/docker-conf/src/compose/base/docker-compose_cli.yaml run --rm php56-cli php"`  
`alias php7="docker-compose -f /data/github/docker-conf/src/compose/docker-compose_cli.yaml run --rm php72-cli php"`

### 开启php服务

`docker-compose -f docker-compose-base.yaml -f docker-compose-php.yaml -f docker-compose-sync.yaml up -d`