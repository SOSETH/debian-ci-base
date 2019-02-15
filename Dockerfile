ARG BRANCH=unstable
FROM debian:${BRANCH}
ARG BRANCH=unstable
ENV BRANCH ${BRANCH:-unknown}

ADD bazel.key /

RUN apt update && \
  apt upgrade -y && \
  apt install -y gnupg2 && \
  echo "deb http://ftp.debian.org/debian $BRANCH-backports main" >> /etc/apt/sources.list.d/backports.list && \
  echo "deb http://storage.googleapis.com/bazel-apt stable jdk1.8" >> /etc/apt/sources.list.d/bazel.list && \
  apt-key add /bazel.key && \
  rm /bazel.key && \
  apt update && \
  apt install -y -t ${BRANCH}-backports golang && \
  apt install -y ca-certificates \
     curl \
     build-essential \
     git-buildpackage \
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
     openjdk-8-jdk-headless \
     bazel && \
  apt clean && \
  rm -Rf /var/lib/apt/lists/*
