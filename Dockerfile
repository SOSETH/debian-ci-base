ARG BRANCH=unstable
FROM debian:${BRANCH}
ARG BRANCH=unstable
ENV BRANCH ${BRANCH:-unknown}

RUN apt update && \
  apt upgrade -y && \
  echo "deb http://ftp.debian.org/debian $BRANCH-backports main" >> /etc/apt/sources.list.d/backports.list && \
  apt update && \
  apt install -y -t ${BRANCH}-backports golang && \
  apt install -y ca-certificates \
     curl \
     gnupg2 \
     build-essential \
     git-buildpackage \
     golang-glide \
     cmake \
     extra-cmake-modules \
     git \
     dh-golang \
     libterm-readline-gnu-perl && \
  apt clean && \
  rm -Rf /var/lib/apt/lists/*
