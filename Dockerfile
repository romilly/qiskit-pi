FROM arm32v7/python:3.7

# install required debian packages

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        gfortran \
        libopenblas-dev \
        ninja-build \
        libatlas-base-dev \
        libhdf5-dev \
        cmake

RUN  apt-get clean && \
        rm -rf /var/lib/apt/lists/*

# install rust, install retworkx, remove rust

RUN wget https://static.rust-lang.org/dist/rust-nightly-armv7-unknown-linux-gnueabihf.tar.gz -nv && \
        tar -xvzf rust-nightly-armv7-unknown-linux-gnueabihf.tar.gz && \
        ./rust-nightly-armv7-unknown-linux-gnueabihf/install.sh && \
        pip --no-cache-dir install retworkx && \
        /usr/local/lib/rustlib/uninstall.sh && \
        rm rust-nightly-armv7-unknown-linux-gnueabihf.tar.gz && \
        rm -rf rust-nightly-armv7-unknown-linux-gnueabihf/

# install python3 packages

RUN pip --no-cache-dir install \
        matplotlib ipykernel jupyter

RUN pip --no-cache-dir install \
        cython numpy scikit-build h5py cmake

# pyscf pinned, as I cannot get pip to install later versions

RUN pip --no-cache-dir install \
        pyscf==1.4.5

RUN pip --no-cache-dir install \
        qiskit

COPY notebooks /notebooks

WORKDIR "/notebooks"

EXPOSE 8888

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]





