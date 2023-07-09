ARG BRANCH=bookworm
FROM debian:${BRANCH}

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
  apt-get update -qq && \
  apt-get upgrade -qq && \
  apt-get install -qq gnupg2 && \
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
     openjdk-17-jdk-headless && \
  apt-get clean && \
  rm -Rf /var/lib/apt/lists/* && \
  go install github.com/bazelbuild/bazelisk@latest
