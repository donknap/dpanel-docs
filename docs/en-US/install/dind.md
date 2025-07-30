# Docker In Docker

The Docker In Docker approach allows running a new Docker server in a container that is isolated from the outside world.

### Standard Edition

```
services:
  dpanel:
    image: dpanel/dpanel:latest
    container_name: dpanel
    restart: always
    ports:
      - 80:80
      - 443:443
      - 8807:8080
    environment:
      APP_NAME: dpanel
      DOCKER_HOST: tcp://docker:2375
    volumes:
      - /home/dpanel:/dpanel
    depends_on:
      - docker
  docker:
    image: docker:dind
    environment:
      DOCKER_TLS_CERTDIR: ""
    privileged: true s
```

### Lite Edition

```
services:
  dpanel:
    image: dpanel/dpanel:lite
    container_name: dpanel
    restart: always
    ports:
      - 8807:8080
    environment:
      APP_NAME: dpanel
      DOCKER_HOST: tcp://docker:2375
    volumes:
      - /home/dpanel:/dpanel
    depends_on:
      - docker
  docker:
    image: docker:dind
    environment:
      DOCKER_TLS_CERTDIR: ""
    privileged: true 
```