FROM python:3.9.15-alpine3.16
RUN apk add --update ffmpeg netcat-openbsd git
WORKDIR /app

RUN apk add --update gcc libc-dev linux-headers libusb-dev
RUN apk add --update ffmpeg=4.1.6-r0 netcat-openbsd git

COPY . .
RUN pip install .

COPY ./docker/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["unifi-cam-proxy"]
