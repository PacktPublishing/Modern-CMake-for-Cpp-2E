FROM ubuntu:latest

RUN apt-get update && apt-get install --no-install-recommends -y \
ca-certificates vim tree wget git lcov gawk \
g++ make \
pkg-config valgrind doxygen graphviz cppcheck \
protobuf-compiler libprotobuf-dev libpqxx-dev\
&& rm -rf /var/lib/apt/lists/*

# install clang
RUN echo "deb http://apt.llvm.org/jammy/ llvm-toolchain-jammy main" >> /etc/apt/sources.list && \
echo "deb-src http://apt.llvm.org/jammy/ llvm-toolchain-jammy main" >> /etc/apt/sources.list && \
wget -qO- https://apt.llvm.org/llvm-snapshot.gpg.key | tee /etc/apt/trusted.gpg.d/apt.llvm.org.asc && \
apt-get update && apt-get install --no-install-recommends -y \
clang clang-tools clang-format clang-tidy \
&& rm -rf /var/lib/apt/lists/*

# install cmake
ENV version=3.26.0

RUN cd /tmp && \
mkdir /opt/cmake && \
wget https://github.com/Kitware/CMake/releases/download/v$version/cmake-$version-Linux-x86_64.sh && \
chmod a+x ./cmake-$version-Linux-x86_64.sh && \
./cmake-$version-Linux-x86_64.sh --prefix=/opt/cmake --skip-license && \
rm cmake-$version-Linux-x86_64.sh

RUN ln -s /opt/cmake/bin/* /usr/local/bin/

RUN cd /tmp && \
git clone https://github.com/ninja-build/ninja.git && \
cd ninja && \
cmake -B build-cmake && \
cmake --build build-cmake && \
cmake --install build-cmake && \
rm -rf /tmp/ninja
