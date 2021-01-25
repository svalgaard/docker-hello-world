# Docker Hello World #

This is an almost minimal docker image running a python webserver
on port 8008.


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
docker run --name hello -d -p 8008:8008 hello-world
```

Visit http://localhost:8000/ to see the mini website.

See a list of containers:

```bash
docker container ls
```

See interesting server logs (use `-f` to follow log output):

```bash
docker logs hello -f
```

Start a bash shell "inside" the docker container.
Note that this is (by design) a very minimal Debian server:

```bash
docker exec -it hello /bin/bash
```

Delete and stop the container again:

```bash
docker stop hello
docker container rm hello
```
