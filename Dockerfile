FROM openjdk:8u212-b04-jdk-stretch
FROM openjdk:8

ENV PYTHON_VERSION=3.7.3

RUN apt-get update && apt-get install -y \
    build-essential \
    checkinstall \
    libreadline-gplv2-dev \
    libncursesw5-dev \
    libssl-dev \
    libsqlite3-dev \
    tk-dev \
    libgdbm-dev \
    libc6-dev \
    libbz2-dev \
    libffi-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /usr/src

RUN wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz

RUN tar xzf Python-$PYTHON_VERSION.tgz

WORKDIR /usr/src/Python-$PYTHON_VERSION

RUN ./configure --enable-optimizations --with-ensurepip=install

RUN make altinstall

RUN ln -s /usr/local/bin/python3.7 /usr/local/bin/python3
RUN ln -s /usr/local/bin/pip3.7 /usr/local/bin/pip3
RUN ln -s /usr/local/bin/pip3.7 /usr/local/bin/pip

WORKDIR /usr/local/src/pyspark-java8

RUN rm -rf /usr/src/Python-$PYTHON_VERSION
RUN rm -rf /usr/src/Python-$PYTHON_VERSION.tgz

COPY tests tests
COPY requirements.txt requirements.txt
COPY Makefile Makefile

RUN make venv && . .venv/bin/activate && make reqs && make test


WORKDIR ~

RUN rm -rf /usr/local/src/pyspark-java8
