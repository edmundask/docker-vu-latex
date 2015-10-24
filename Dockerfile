FROM ubuntu:trusty
MAINTAINER Edmundas Kondrašovas <as@edmundask.lt>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q && apt-get install -y \
  texlive-full \
  biber \
  python-pygments \
  gnuplot

COPY assets/fonts/ /usr/share/fonts/truetype/

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

WORKDIR /data
VOLUME ["/data"]

ENTRYPOINT ["/sbin/entrypoint.sh"]
