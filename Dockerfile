FROM ubuntu:14.04
RUN set -x \
      && apt-get update -y \
      && apt-get install -y \
          build-essential \
          gcc \
          autoconf \
          libgsl0-dev \
          libpq-dev \
          postgresql-server-dev-9.3

ENV PATH="/usr/local/postgresql/9.3/bin:${PATH}"
COPY . /pgreplay
WORKDIR /pgreplay
RUN set -x \
      && ./configure --with-postgres=/usr/lib/postgresql/9.3/bin \
      && make install
