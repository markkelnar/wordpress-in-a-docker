# Use build args to get the right wordpress + php image
ARG WP_VERSION
ARG PHP_VERSION

FROM wordpress:${WP_VERSION}-php${PHP_VERSION}-apache

# Needed to specify the build args again after the FROM command.
ARG WP_VERSION
ARG PHP_VERSION

# Save the build args for use by the runtime environment
ENV WP_VERSION=${WP_VERSION}
ENV PHP_VERSION=${PHP_VERSION}

SHELL [ "/bin/bash", "-c" ]

# Set up Apache
RUN echo 'ServerName localhost' >> /etc/apache2/apache2.conf

# Custom PHP settings
RUN echo "upload_max_filesize = 50M" >> /usr/local/etc/php/conf.d/custom.ini

# Set up entrypoint
WORKDIR    /var/www/html
CMD ["apache2-foreground"]
