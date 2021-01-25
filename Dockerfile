#
# Check available python tags here:
#   https://hub.docker.com/_/python
#
FROM python:3-slim
LABEL description="Hello world"
LABEL maintainer="github@svalgaard.net"

# Copy all our files into the docker image
RUN mkdir -p /www
WORKDIR /www
COPY . /www

# You COULD do further steps here
# RUN set -x \
#    && apt update \
#    && apt install -y locales \
#    && localedef -i da_DK -c -f UTF-8 -A /usr/share/locale/locale.alias da_DK \
#    && apt clean \
#    && rm -rf /var/lib/apt/lists/*

# Install dependencies (currently none)
RUN pip install --no-cache-dir -r requirements.txt

VOLUME /www

ENTRYPOINT ["python", "-m", "http.server", "--directory", "/www/public", "8008"]
