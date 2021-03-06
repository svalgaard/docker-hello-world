# Docker Hello World #

This is an almost minimal docker image running a python webserver
on port 8008.
Mount a folder on top of `/www/public` using `-v` to show
your own content.

## Image ##

To create the image `hello-world`, execute the following command
in the root folder:

```bash
docker build --tag hello-world .
```

See a list of available images:

```bash
docker image ls
```

Delete the image again:

```bash
docker image rm -f --tag hello-world
```


## Running the docker image ##

Start your image. Forward port 8008 to port 8008 inside the container:

```bash
docker run --name hello --detach -p 8008:8008 hello-world
```

You can also ask docker to find an available port itself
using `-P`.
Use `docker port CONTAINER` to see which port was used:

```bash
docker run --name hello --detach -P hello-world
docker port hello
```

You can also ask docker to use a local folder inside the
container:

```bash
docker run --name hello --detach -P -v /tmp:/www/public hello-world
```

See a list of containers:

```bash
docker container ls
```

Delete and stop the container again:

```bash
docker stop hello
docker container rm hello
```

## Working with the container

Visit http://localhost:8008/ to see the mini website.
Or use curl or wget to to get the hello.txt file:

```bash
curl http://localhost:8008/hello.txt
wget -O- http://localhost:8008/hello.txt
```

See server logs (use `-f` to follow log output):

```bash
docker logs hello -f
```

Start a bash shell "inside" the docker container.
Note that by design this is a very minimal Debian server:

```bash
docker exec -it hello /bin/bash
```

## Make your docker image appear on hub.docker.com ##

Use the same name for the image as the repository on docker:

```bash
docker build --tag svalgaard/hello-world
```

Push the image to docker hub:

```bash
docker push svalgaard/hello-world
```

If this fails with
`denied: requested access to the resource is denied`,
you must first login using `docker login`.

If your code is on GitHub, a better solution is to setup a build
trigger which automatically pulls updates from GitHub to Docker.
