# https://www.drupal.org/docs/getting-started/system-requirements/php-requirements
FROM php:8.4-apache
# Enable rewrite
RUN a2enmod rewrite
# Install git (for composer) and packages for php extensions
# https://www.drupal.org/docs/getting-started/system-requirements/php-requirements#extensions
RUN apt update && apt install -y \
  git \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  libzip-dev \
  libpq-dev \
  && docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install -j$(nproc) \
  gd \
  opcache \
  pdo_mysql \
  mysqli \
  zip \
  pdo_pgsql \
  pgsql \
  && apt-get clean && rm -rf /var/lib/apt/lists/*
# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# Install drupal
RUN cd /var/www && \
  composer create-project drupal/recommended-project:11.3.2 drupal && \
  rm -rf html && \
  ln -sf drupal/web/ html \
  && chown -R www-data:www-data drupal/web/
