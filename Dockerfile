FROM ubuntu:14.04
# Set the locale
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 

RUN apt-get update && apt-get install -y \
    curl \
    g++ \
    libssl-dev \
    locales \
    libyaml-0-2 \
    python-pip \
    python-dev \
    libffi-dev \
    libssl-dev 

RUN locale-gen en_US.UTF-8  
COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt
COPY acicobra-1.3_2h-py2.7.egg /opt/
COPY acimodel-1.3_2h-py2.7.egg /opt/
RUN easy_install -Z /opt/acicobra-1.3_2h-py2.7.egg
RUN easy_install -Z /opt/acimodel-1.3_2h-py2.7.egg
EXPOSE 5000

