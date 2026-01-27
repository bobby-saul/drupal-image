# Drupal Image

This repo is for building a docker image for running a Drupal site for
development. This build uses the latest php version with the Drupal support 
and apache as its base. It includes all the php extensions and composer for
easier development.

## Drupal version

Currently installing Drupal version 11.3.2.

## Php version

Currently using PHP version 8.4 for Drupal 10 - 11.3 support.

## Php extensions

https://www.drupal.org/docs/getting-started/system-requirements/php-requirements#extensions

Drupal required:
- Database extension
  - Mysql
    - pdo_mysql enabled.
    - mysqli enabled.
  - PostgreSQL
    - libpq-dev installed.
    - pdo_pgsql enabled.
    - pgsql enabled.
- XML - Already enabled by default.
- Image library
  - GD library
    - libfreetype6-dev installed.
    - libjpeg62-turbo-dev installed.
    - libwebp-dev installed.
    - libavif-dev installed.
    - libpng-dev installed.
    - gd configured.
    - gd enabled.
- OpenSSL - Already enabled by default.
- JSON - Already enabled by default.
- cURL - Already enabled by default.
- Mbstring - Already enabled by default.

Drupal recommended:
- Opcache
  - opcache enabled.
- Zip
  - libzip-dev installed.
  - zip enabled.
- uploadprogress
  - pecl install uploadprogress
  - docker-php-ext-enable uploadprogress

## Composer

Composer is installed globally and is used for downloading Drupal core and is
left for development ease.
https://getcomposer.org/doc/00-intro.md#installation-linux-unix-macos

apt installed packages:
- git installed.

## Installation

Installing Drupal with composer:
https://www.drupal.org/docs/getting-started/installing-drupal/install-dependencies-with-composer

```
composer create-project drupal/recommended-project:11.3.2 drupal
```

The project is installed at /var/www/drupal, and the default html directory is
removed and a link is made to /var/www/drupal/web so the default apache config
serves the proper Drupal directory.

## Build image

```
docker build -t docker.localhost/drupal:latest . 
```
