# Build Environment Stage
FROM ubuntu:latest as build-env
RUN apt-get update && apt-get install --no-install-recommends -y \
    ca-certificates vim tree wget git lcov gawk \
    g++ make \
    pkg-config valgrind doxygen graphviz cppcheck \
    protobuf-compiler libprotobuf-dev libpqxx-dev \
    clang clang-tools clang-format clang-tidy \
    && rm -rf /var/lib/apt/lists/*

ENV version=3.26.0
RUN cd /tmp && \
    mkdir /opt/cmake && \
    wget https://github.com/Kitware/CMake/releases/download/v$version/cmake-$version-Linux-x86_64.sh && \
    chmod a+x ./cmake-$version-Linux-x86_64.sh && \
    ./cmake-$version-Linux-x86_64.sh --prefix=/opt/cmake --skip-license && \
    rm cmake-$version-Linux-x86_64.sh
ENV PATH="/opt/cmake/bin:${PATH}"

RUN cd /tmp && \
    git clone https://github.com/ninja-build/ninja.git && \
    cd ninja && \
    cmake -B build-cmake && \
    cmake --build build-cmake && \
    cmake --install build-cmake && \
    rm -rf /tmp/ninja

# Examples Stage
FROM build-env as examples
COPY . /root
WORKDIR /root/examples
