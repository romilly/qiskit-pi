FROM arm32v7/python:3.7

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

RUN pip --no-cache-dir install \
        cython numpy

RUN pip --no-cache-dir install \
        scikit-build

RUN apt-get update && apt-get install -y --no-install-recommends libhdf5-100 libhdf5-dev

RUN pip --no-cache-dir install \
         h5py

RUN pip --no-cache-dir install \
        pyscf==1.4.5





