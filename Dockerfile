FROM dunglas/frankenphp

RUN install-php-extensions \
    pcntl
    # Add other PHP extensions here...

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

WORKDIR /app

COPY . .

RUN composer install --prefer-dist --optimize-autoloader --no-interaction

EXPOSE 8000

CMD ["php", "artisan", "octane:frankenphp"]
