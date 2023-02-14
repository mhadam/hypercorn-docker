# **hypercorn-docker**

[![Docker Pulls](https://img.shields.io/docker/pulls/mhadam/hypercorn)][docker repo]

A Docker image with [Hypercorn][hypercorn site], available in slim and alpine versions.

## Hypercorn
**[Hypercorn][hypercorn site]** is an HTTP/2-ready ASGI web server, based on the [sans I/O][sans] hyper, h11, h2, and wsproto libraries, and inspired by Gunicorn.

Hypercorn supports HTTP/1, HTTP/2, WebSockets (over HTTP/1 and HTTP/2), ASGI/2, and ASGI/3 specifications. Hypercorn can utilise asyncio, uvloop, or trio worker types.

## Some crucial info

By default, this image sets `PYTHONPATH=/app:/hypercorn`.

This means that Python will search in `/app` and `/hypercorn` for modules & packages.

`/hypercorn` shouldn't be overwritten. The design of this image uses the two paths `app` and `hypercorn` since this allows you to bind mount to `app` without overwriting the default hypercorn configuration.



## How to start

### As a base image

Copy your project code into `app`.

As an example, let's assume we've got a package (that is, a directory containing a `__init__.py` file) `myproject` that has a module (a `.py` file) called `asgi` and there's a function within `asgi` called `application`.

Here's a possible `Dockerfile`:

```dockerfile
FROM mhadam/hypercorn:python3.11-slim

# Here you should put code to install your project dependencies

COPY ./app /app
ENV APP_MODULE=myproject.asgi:application
```

Then build your Dockerfile:
```sh
$ docker build -t myimage .
```

### Docker Compose

Here I'd like to explain what this image looks like, in practice, as a Docker Compose service. Really the only takeaway here should be how we're able to use the bind mount declared under `volume:` in order for the image to load our application without copying the files. This effectively overwrites the demo files that are in the `app` directory by default.

Let's assume our project repo folder is `code_repo`, which contains the package `myproject` and submodule `asgi` with callable `application`.

Our Docker Compose file (`compose.yaml`) could look like this:
```yaml
service:
  image: mhadam/hypercorn:python3.11-slim
  volume:
    - ./code_repo:/app
  env:
    - APP_MODULE=myproject.asgi:application
```

[docker tags]: https://hub.docker.com/r/mhadam/hypercorn/tags
[docker repo]: https://hub.docker.com/r/mhadam/hypercorn
[github repo]: https://github.com/mhadam/hypercorn-docker
[fastapi site]: https://fastapi.tiangolo.com/
[hypercorn site]: https://hypercorn.readthedocs.io/en/latest/
[sans]: https://sans-io.readthedocs.io
