FROM python:3.12.0-bookworm

ARG USER_NAME=nekochan
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USER_NAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USER_NAME \
    && mkdir /work && chown $USER_NAME:$USER_NAME /work

RUN python3 -m pip install --upgrade pip \
&&  pip install --no-cache-dir \
    black \
    jupyterlab \
    jupyterlab_code_formatter \
    jupyterlab-git 

RUN pip install --no-cache-dir \
    numpy \
    pandas \
    scipy \
    mdutils

WORKDIR /work
CMD /bin/sh -c "while sleep 1000; do :; done"
