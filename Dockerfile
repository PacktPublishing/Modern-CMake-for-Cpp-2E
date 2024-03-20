# Build Environment Stage
FROM ubuntu:jammy as build-env

RUN apt-get update && \
    apt-get install --no-install-recommends -y wget ca-certificates gnupg2 software-properties-common && \
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | gpg --dearmor -o /usr/share/keyrings/llvm-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/llvm-archive-keyring.gpg] http://apt.llvm.org/jammy/ llvm-toolchain-jammy-18 main" | tee /etc/apt/sources.list.d/llvm.list && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
    vim zsh tree git lcov gawk \
    g++ make \
    pkg-config valgrind doxygen graphviz cppcheck \
    protobuf-compiler libprotobuf-dev libpqxx-dev \
    clang-18 clang-tools-18 clang-format-18 clang-tidy-18 \
    && rm -rf /var/lib/apt/lists/*

ENV version=3.28.0
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

# Dev container stage
FROM build-env as devcontainer
RUN apt-get update && apt-get install -y openssh-server sudo && rm -rf /var/lib/apt/lists/*
RUN useradd -m devuser && echo 'devuser:devuser' | chpasswd && adduser devuser sudo
RUN mkdir /var/run/sshd
RUN echo 'PermitRootLogin no' >> /etc/ssh/sshd_config && echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN echo 'PermitUserEnvironment yes' >> /etc/ssh/sshd_config
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

# Examples Stage
FROM devcontainer as examples
COPY . /devuser
WORKDIR /devuser/examples