FROM postgres:${PG_VERSION}

# Environment
ENV LANG=C.UTF-8 REPO=/repo

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential && \
    apt-get clean && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/*

# Make directories
RUN	mkdir -p $REPO

# Copy scripts into docker image
COPY bin/* /usr/local/bin/

