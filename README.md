# **hypercorn-docker**

[![Docker Pulls](https://img.shields.io/docker/pulls/mhadam/hypercorn)][docker repo]

A Docker image with [Hypercorn][hypercorn site], available in slim and alpine versions.

## Hypercorn
**[Hypercorn][hypercorn site]** is an HTTP/2-ready ASGI web server, based on the [sans I/O][sans] hyper, h11, h2, and wsproto libraries, and inspired by Gunicorn.

Hypercorn supports HTTP/1, HTTP/2, WebSockets (over HTTP/1 and HTTP/2), ASGI/2, and ASGI/3 specifications. Hypercorn can utilise asyncio, uvloop, or trio worker types.

## How to start
You can use this image as a base image for other images, using this in your Dockerfile:

```dockerfile
FROM mhadam/hypercorn:python3.11-slim

# code to install your project deps
COPY ./app /app
ENTRYPOINT ["hypercorn", "myproject.asgi:application"]
```

Then you can build you Dockerfile, e.g:
```sh
$ docker build -t myimage ./
```

[docker tags]: https://hub.docker.com/r/mhadam/hypercorn/tags
[docker repo]: https://hub.docker.com/r/mhadam/hypercorn
[github repo]: https://github.com/mhadam/hypercorn-docker
[fastapi site]: https://fastapi.tiangolo.com/
[hypercorn site]: https://hypercorn.readthedocs.io/en/latest/
[sans]: https://sans-io.readthedocs.io
