# Stage 1: Build Composer dependencies
FROM php:8.2-cli AS build

RUN apt-get update && apt-get install -y \
    git unzip zip curl libzip-dev libonig-dev libxml2-dev \
    && docker-php-ext-install pdo pdo_mysql zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

WORKDIR /app
COPY . /app

# This will fail if .env is missing — make sure it's present
RUN composer install --no-interaction --optimize-autoloader

# Stage 2: Runtime container
FROM php:8.2-cli

WORKDIR /app
COPY --from=build /app /app

EXPOSE 8000

CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]

