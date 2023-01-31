FROM python:3.11-slim

LABEL author="mhadam <michael@hadam.us>"

# g++ inetutils-ping
RUN apt-get update -q \
  && apt-get install --no-install-recommends -qy build-essential libssl-dev libffi-dev python3-dev g++ gcc \
  && python3 -m pip install hypercorn[uvloop,h3] aioquic \
    --progress-bar off --no-cache-dir --no-color --no-python-version-warning --disable-pip-version-check \
  && apt-get remove -qy build-essential libssl-dev libffi-dev python3-dev g++ gcc --purge

COPY ./start.sh /start.sh
RUN chmod +x /start.sh

COPY ./start-reload.sh /start-reload.sh
RUN chmod +x /start-reload.sh

COPY ./app /app

WORKDIR /app
ENV PYTHONPATH=/app

EXPOSE 80
EXPOSE 443

CMD ["/start.sh"]
