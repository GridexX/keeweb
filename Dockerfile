FROM debian:bullseye
RUN apt update && apt upgrade -y
RUN apt install apache2 -y
RUN a2enmod dav
RUN a2enmod dav_fs
RUN a2enmod rewrite  
RUN a2enmod headers
WORKDIR /var/www/html
COPY . .
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN chown www-data:www-data -R /var/www/html
RUN chmod 775 -R /var/www/html
ENTRYPOINT ["/usr/sbin/apache2ctl", "-DFOREGROUND"]