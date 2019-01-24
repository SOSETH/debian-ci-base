ARG BRANCH=unstable
FROM debian:${BRANCH}

RUN apt update && \
  apt upgrade -y && \
  apt install -y ca-certificates \
     curl \
     gnupg2 \
     build-essential \
     git-buildpackage \
     golang \
     golang-glide \
     cmake \
     extra-cmake-modules \
     git \
     dh-golang
     libterm-readline-gnu-perl && \
  apt clean && \
  rm -Rf /var/lib/apt/lists/*
