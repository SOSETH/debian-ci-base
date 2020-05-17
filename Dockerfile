ARG BRANCH=unstable
FROM debian:${BRANCH}

ADD bazel.key /

RUN apt update && \
  apt upgrade -y && \
  apt install -y gnupg2 && \
  echo "deb http://storage.googleapis.com/bazel-apt stable jdk1.8" >> /etc/apt/sources.list.d/bazel.list && \
  apt-key add /bazel.key && \
  rm /bazel.key && \
  apt update && \
  apt install -y ca-certificates \
     curl \
     build-essential \
     git-buildpackage \
     golang \
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
     python \
     openjdk-11-jdk-headless \
     bazel && \
  apt clean && \
  rm -Rf /var/lib/apt/lists/*
