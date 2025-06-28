# Install Script

The install script generates and runs the docker run command to create DPanel container through wizard mode.

- Please install bash first in Alpine system, apk add bash

### Install Docker Engine

When the host does not have a Docker Engine, the install script will try to install the Docker Engine through the official script at https://get.docker.com. \
The script has been tested under Debian, Ubuntu, and Alpine, Debian is recommended.

When the script cannot install the Docker environment normally, please ensure that the host machine has installed the Docker environment normally before running the script.

### Upgrade DPanel

When running the install script, if the specified container name already exists, the install script will upgrade DPanel container. The old container will be stopped and backed up.


### Run Script

#### Rootless

```
sudo curl -sSL https://dpanel.cc/quick.sh -o quick.sh && sudo bash quick.sh
```

#### Root

```
curl -sSL https://dpanel.cc/quick.sh -o quick.sh && bash quick.sh
```

#### Debug

Output commands

```
curl -sSL https://dpanel.cc/quick.sh -o quick.sh && bash quick.sh test
```

### Priview

![install-1](https://cdn.w7.cc/dpanel/install-1.png?t=1)