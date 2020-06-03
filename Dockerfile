FROM arm32v7/python:3

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl