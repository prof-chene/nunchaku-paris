FROM webdevops/php-nginx:8.0

ENV APP_PATH=/app

WORKDIR ${APP_PATH}

ENV WEB_DOCUMENT_ROOT=${APP_PATH}/wp \
    WEB_DOCUMENT_INDEX=index.php \
    PHP_MEMORY_LIMIT=2048M

# See https://www.php.net/manual/en/ini.core.php#ini.realpath-cache-ttl
# I/O on filesystem is very slow in Windows / Mac, so we increase this value
ENV php.realpath_cache_ttl=7200

# @see https://stackoverflow.com/questions/48162574/how-to-circumvent-apt-key-output-should-not-be-parsed
ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

# Add PPAs
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash

# Install dependencies
RUN apt-get update && apt-get install -y default-mysql-client curl less vim
