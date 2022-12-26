# ubuntu-env
just for arm architecture
## useage
build image
```shell
docker build . -t ubuntu-env
```
direct run,the root password is "root"
```shell
docker run -d -p 2222:22 --name="ubuntu-env" -it ubuntu-env
```
customize the root password
```shell
docker run -d -p 2222:22 -e ROOT_PASSWORD=123 --name="ubuntu-env" -it ubuntu-env
```
## added list
- curl
- git
- vim
- openssh-server
- zsh
- oh my zsh
- net-tools
- iputils-ping
- unzip
- openJdk8
- maven