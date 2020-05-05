FROM ubuntu:20.04
LABEL MAINTAINER="Jon Davis"

COPY . /bd_build

RUN /bd_build/prepare.sh && \
    /bd_build/system_services.sh && \
    /bd_build/utilities.sh && \
    /bd_build/cleanup.sh

ENV DEBIAN_FRONTEND="teletype" \
    LANG="en_US.UTF-8" \
    LANGUAGE="en_US:en" \
    LC_ALL="en_US.UTF-8"

RUN echo en_US.UTF-8 UTF-8 > /var/lib/locales/supported.d/en

CMD ["/sbin/my_init"]
