FROM python:3.11

LABEL author="mhadam <michael@hadam.us>"

RUN python3 -m pip install hypercorn[h3,uvloop] aioquic \
    --no-cache-dir --no-color --no-python-version-warning --disable-pip-version-check

COPY ./start.sh /start.sh
RUN chmod +x /start.sh

COPY ./start-reload.sh /start-reload.sh
RUN chmod +x /start-reload.sh

COPY ./hypercorn /hypercorn
COPY ./app /app

WORKDIR /app
ENV PYTHONPATH=/hypercorn:/app

EXPOSE 80
EXPOSE 443

CMD ["/start.sh"]
