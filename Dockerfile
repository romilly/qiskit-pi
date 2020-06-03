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

RUN pip install retworkx