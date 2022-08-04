#!/bin/bash

source .env
WP_VERSION=${WP_VERSION} PHP_VERSION=${PHP_VERSION} docker-compose run cli wp config create \
    --path="${WP_ROOT_FOLDER}" \
    --dbname="${DB_NAME}" \
    --dbuser="${DB_USER}" \
    --dbpass="${DB_PASSWORD}" \
    --dbhost="${DB_HOST}" \
    --dbprefix="${WP_TABLE_PREFIX}" \
    --allow-root

WP_VERSION=${WP_VERSION} PHP_VERSION=${PHP_VERSION} docker-compose run cli wp core install \
    --path="${WP_ROOT_FOLDER}" \
    --url="${WP_URL}" \
    --title='Test' \
    --admin_user="${ADMIN_USERNAME}" \
    --admin_password="${ADMIN_PASSWORD}" \
    --admin_email="${ADMIN_EMAIL}" \
    --allow-root
