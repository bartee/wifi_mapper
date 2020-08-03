FROM python:3.7.5-slim-buster

WORKDIR /app

RUN echo "deb http://deb.debian.org/debian buster main contrib non-free" | tee /etc/apt/sources.list

RUN apt-get update
RUN pip install --upgrade pip
RUN apt-get install -y software-properties-common
RUN apt-get install -y git wireless-tools iperf3 gcc python-cffi libghc-iwlib-dev python3-dev
RUN git clone  https://github.com/jantman/python-wifi-survey-heatmap.git /app
RUN pip install iwlib
RUN python setup.py develop 

# YAY!
