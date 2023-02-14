# **hypercorn-docker**

[![Docker Pulls](https://img.shields.io/docker/pulls/mhadam/hypercorn)][docker repo]

A Docker image with [Hypercorn][hypercorn site], available in slim and alpine versions.

## Hypercorn
**[Hypercorn][hypercorn site]** is an HTTP/2-ready ASGI web server, based on the [sans I/O][sans] hyper, h11, h2, and wsproto libraries, and inspired by Gunicorn.

Hypercorn supports HTTP/1, HTTP/2, WebSockets (over HTTP/1 and HTTP/2), ASGI/2, and ASGI/3 specifications. Hypercorn can utilise asyncio, uvloop, or trio worker types.

## How to start
This can be used as a base image. In this example we haven't changed the `PYTHONPATH`, which will by default contain `/app`.

When we copy `/app`, we've got a package `myproject` that has a module called `asgi` and there's a function within `asgi` called `application`:

```dockerfile
FROM mhadam/hypercorn:python3.11-slim

# code to install your project deps
COPY ./app /app
ENTRYPOINT ["hypercorn", "myproject.asgi:application"]
```

Then build your Dockerfile:
```sh
$ docker build -t myimage ./
```

[docker tags]: https://hub.docker.com/r/mhadam/hypercorn/tags
[docker repo]: https://hub.docker.com/r/mhadam/hypercorn
[github repo]: https://github.com/mhadam/hypercorn-docker
[fastapi site]: https://fastapi.tiangolo.com/
[hypercorn site]: https://hypercorn.readthedocs.io/en/latest/
[sans]: https://sans-io.readthedocs.io
