FROM arm32v7/python:3.7

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        ninja-build

RUN pip --no-cache-dir install packaging

RUN pip --no-cache-dir install scikit-build

RUN pip --no-cache-dir install wheel

RUN apt-get install -y --no-install-recommends \
        cmake

RUN pip --no-cache-dir install cmake

