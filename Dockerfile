ARG BRANCH=bullseye
FROM debian:${BRANCH}

RUN apt-get update -qq && \
  apt-get upgrade -qq && \
  echo "deb http://deb.debian.org/debian bullseye-backports main" >> /etc/apt/sources.list.d/backports.list && \
  apt-get install -qq gnupg2 && \
  apt-get update -qq && \
  apt-get install -qq ca-certificates \
     curl \
     build-essential \
     git-buildpackage \
     golang/bullseye-backports \
     golang-glide \
     cmake \
     extra-cmake-modules \
     git \
     dh-golang \
     libterm-readline-gnu-perl \
     pkg-config \
     zip \
     g++ \
     zlib1g-dev \
     unzip \
     python3 \
     openjdk-11-jdk-headless && \
  apt-get clean && \
  rm -Rf /var/lib/apt/lists/* && \
  go get github.com/bazelbuild/bazelisk
