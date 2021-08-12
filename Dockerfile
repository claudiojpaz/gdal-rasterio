FROM osgeo/gdal:ubuntu-small-latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install tzdata

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    apt-utils \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    vim \
    pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip install rasterio

RUN useradd -ms /bin/bash user
USER user
WORKDIR /home/user

