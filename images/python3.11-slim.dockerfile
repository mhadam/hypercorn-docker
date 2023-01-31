FROM python:3.11-slim

LABEL author="mhadam <michael@hadam.us>"

RUN python3 -m pip install hypercorn hypercorn[uvloop] aioquic hypercorn[h3] \
    --no-cache-dir --no-color --no-python-version-warning --disable-pip-version-check

COPY ./start.sh /start.sh
RUN chmod +x /start.sh

COPY ./start-reload.sh /start-reload.sh
RUN chmod +x /start-reload.sh

COPY ./hypercorn_conf.py /hypercorn_conf.py

COPY ./app /app

WORKDIR /app
ENV PYTHONPATH=/app

EXPOSE 80
EXPOSE 443

CMD ["/start.sh"]
