FROM arm32v7/python:3

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        gfortran \
        libopenblas-dev \
        ninja-build \
        libatlas-base-dev

RUN  apt-get clean && \
        rm -rf /var/lib/apt/lists/*

# Looks as if pip is already installed and up-to-date - Yay!

RUN pip --no-cache-dir install \
        matplotlib ipykernel jupyter

RUN wget https://static.rust-lang.org/dist/rust-nightly-armv7-unknown-linux-gnueabihf.tar.gz

RUN tar -xvzf rust-nightly-armv7-unknown-linux-gnueabihf.tar.gz

RUN ./rust-nightly-armv7-unknown-linux-gnueabihf/install.sh

RUN pip --no-cache-dir install retworkx