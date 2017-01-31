FROM debian:jessie

RUN apt-get update                                       \
 && apt-get install -y --no-install-recommends           \
    xauth xvfb                                           \
 && rm -fr /var/lib/apt/lists/*

COPY xvfb.sh /usr/local/bin/

ENTRYPOINT ["xvfb.sh"]
