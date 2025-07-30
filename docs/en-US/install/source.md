# Run with binary

DPanel supports running via binary packages. You can download the packaged binary packages from the [Release](https://github.com/donknap/dpanel/releases) page.
If your system does not support it, you can also compile the binary package yourself from source code.

> Running via binary package is equivalent to Lite Edition

##### For Ubuntu、Centos、Debian etc

- dpanel-amd64 
- dpanel-arm
- dpanel-arm64

##### For Alpine and using the MUSL library
- dpanel-musl-amd64
- dpanel-musl-arm64
- dpanel-musl-arm

##### For MacOSX 

- dpanel-darwin-ARM64
- dpanel-darwin-X64

##### For Synology

- dpanel-synology-arm64 
- dpanel-synology-amd64 

##### For Windows

- dpanel.exe 

### Compile

##### Environmental requirements

- Go Version >= 1.23
- Please make sure that the Libc or Musl library has been installed and CC CXX has been configured in the environment variables.
- Windows system needs to install [MinGW](https://winlibs.com/#download-release) 

Please make sure you have the Golang runtime. Check the environment version through go version

```
go version
### go version go1.23.4 linux/amd64
```

```
go version
### go version go1.23.4 windows/amd64
```

```
docker run -it --rm --name dpanel-compile golang:latest go version
#### go version go1.23.4 linux/amd64
```

##### Download source and switch to the source directory

```
git clone https://github.com/donknap/dpanel.git
cd dpanel
```

##### Compile using the make command

> 1.5.0 is replaced with the actual version number, which will be displayed in the system information on the home page

```
make build PROJECT_NAME=dpanel CGO_ENABLED=1 VERSION=1.5.0
```

##### Compile using go build

###### Windows

```
set CGO_ENABLED=1
go build -ldflags '-X main.DPanelVersion=1.5.0 -s -w' -o runtime/dpanel.exe
```

###### Linux 

```
CGO_ENABLED=1 go build -ldflags '-X main.DPanelVersion=1.5.0 -s -w' -o runtime/dpanel
```

### Run

> Run configuration to modify config.yaml
> When running the program, specify the environment variable value defined in config.yaml

When running DPanel via binary, it will automatically connect to the current default Docker engine.
In Linux, it is /var/run/docker.sock, and in Windows, it is //./pipe/docker_engine.

```
chmod 755 ./runtime/dpanel
./runtime/dpanel server:start -f config.yaml
```

```
# Windows PowerShell
 .\dpanel.exe server:start -f .\config.yaml
```

### Docker is not installed on the system

If Docker is not installed on system, after starting the DPanel, you can configure the default remote Docker server through [Multiple Environment Management](zh-cn/manual/setting/docker-env.md).

#### Install docker-cli command

DPanel depends on docker and docker compose (docker-compose) commands.
If you don't have docker engine installed, you need to install these client command components manually, according to the system you use [add Docker software source](https://docs.docker.com/engine/install/debian/).

Install the docker-cli client command component.

```
# Debian

sudo apt install docker-ce-cli docker-compose-plugin
```
