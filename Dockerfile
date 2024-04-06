FROM archlinux:latest
LABEL maintainer="jorgen.sellag@protonmail.com"

RUN pacman -Suyyyu --noconfirm \
    && pacman -S --noconfirm \
    clang \
    gcc \
    base-devel \
    distcc

ENV ALLOW "10.0.0.0/24,10.0.0.100"

USER distcc
EXPOSE 3632

CMD distccd --jobs $(nproc) --log-stderr --no-detach --daemon --allow-private --allow ${ALLOW} --log-level info
