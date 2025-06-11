FROM php:8.2.0-cli

RUN apt-get update \
    && apt-get install -y libxml2-dev wget \
    && docker-php-ext-install iconv simplexml \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN wget https://get.symfony.com/cli/installer -O - | bash \
    && mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

RUN symfony check:requirements