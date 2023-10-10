# C03-COMPOSE01

## Make
- [docker-compose.yaml](docker-compose.yaml)

## Command Execution Output

- Execution and output of the command `docker-compose ps`

```
docker compose ps                                                                                                       NAME                 IMAGE               COMMAND                  SERVICE             CREATED             STATUS              PORTS                                                                                                             hawkinswinja-db-1    mysql:5.7           "docker-entrypoint.s…"   db                  6 minutes ago       Up 6 minutes        3306/tcp, 33060/tcp                                                                                               hawkinswinja-web-1   hawkinswinja-web    "docker-php-entrypoi…"   web                 6 minutes ago       Up 6 minutes        0.0.0.0:8100->80/tcp, :::8100->80/tcp
```

- Execution and output of the command `curl http://localhost:8100`

```
curl http://localhost:8100
Connected Successfully
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-compose01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-compose01/README.md)
