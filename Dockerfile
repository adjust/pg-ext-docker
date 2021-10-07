ARG PG_VERSION
FROM postgres:${PG_VERSION}-alpine

# Environment
ENV LANG=C.UTF-8 REPO=/repo

# Install dependencies
RUN echo 'http://dl-3.alpinelinux.org/alpine/edge/main' > /etc/apk/repositories; \
	apk --no-cache add make musl-dev gcc g++ curl-dev util-linux-dev;

# Make directories
RUN	mkdir -p $REPO

# Copy scripts into docker image
COPY bin/* /usr/local/bin/

ENTRYPOINT ["/bin/bash"]
