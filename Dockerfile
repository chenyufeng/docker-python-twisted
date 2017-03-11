FROM python:2.7 
MAINTAINER Wax Cage 

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install -q build-essential && \
    apt-get -y install -q python-dev libffi-dev libssl-dev python-pip

RUN pip install service_identity pycrypto && \
    pip install twisted==16.1.0

COPY ./.bash_aliases /root/.bash_aliases

RUN echo "if [ -f ~/.bash_aliases ]; then" >> /root/.bashrc \
    && echo "    . ~/.bash_aliases"  >> /root/.bashrc \
    && echo "fi"  >> /root/.bashrc


CMD ["bash"]
