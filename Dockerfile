FROM debian:testing-slim
LABEL maintainer="davvid@gmail.com"
ENV DEBIAN_FRONTEND noninteractive
ENV ALLOW 192.168.0.0/16

RUN apt-get update
RUN apt-get install -y -q g++ gcc clang distcc
RUN apt-get -y -q autoremove && apt-get -y clean

RUN useradd distcc
USER distcc
EXPOSE 3632

CMD distccd --jobs $(nproc) --log-stderr --no-detach --daemon --allow-private --allow ${ALLOW} --log-level info
