ARG BRANCH=unstable
FROM debian:${BRANCH}

ADD bazel.key /

RUN apt-get update -qq && \
  apt-get upgrade -qq && \
  apt-get install -qq gnupg2 && \
  echo "deb http://storage.googleapis.com/bazel-apt stable jdk1.8" >> /etc/apt/sources.list.d/bazel.list && \
  apt-key add /bazel.key && \
  rm /bazel.key && \
  apt-get update -qq && \
  apt-get install -qq ca-certificates \
     curl \
     build-essential \
     git-buildpackage \
     golang \
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
     openjdk-11-jdk-headless \
     bazel && \
  apt-get clean && \
  rm -Rf /var/lib/apt/lists/*
