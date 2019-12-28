FROM phpmyadmin/phpmyadmin

LABEL Author=mikamboo

COPY ./conf/apache2/ports.conf /etc/apache2/ports.conf

COPY ./conf/apache2/000-default.conf /etc/apache2/sites-enabled/000-default.conf

COPY install.sh /install.sh

# Install phpmyadmin
RUN chmod +x /install.sh && /install.sh

# Override entrypoint script
COPY docker-entrypoint.sh /tmp/docker-entrypoint.sh

WORKDIR /tmp