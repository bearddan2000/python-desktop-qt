FROM ubuntu:latest

ENV DISPLAY :0

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list && \
    apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      apt-transport-https \
      software-properties-common && \
    useradd -d /home/developer -m developer -s /bin/bash

RUN apt-get install -y \
    python3 python3-dev python3-pip \
      libgl1-mesa-dev qt5-default

ENV HOME /home/developer

ENV PYTHONPATH /usr/share/python

USER developer

RUN pip3 install --user pyqt5

COPY ./bin/ /home/developer

CMD ["/usr/bin/python3", "/home/developer/main.py"]
