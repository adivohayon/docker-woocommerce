FROM wordpress:latest

ENV WOOCOMMERCE_VERSION 3.6.4
ENV WOOCOMMERCE_UPSTREAM_VERSION 3.6.4
ENV JWT_AUTHENTICATION_VERSION 1.2.6

RUN apt-get update
RUN apt-get install -y --no-install-recommends unzip wget vim

# Install woocommerce
RUN wget https://downloads.wordpress.org/plugin/woocommerce.${WOOCOMMERCE_VERSION}.zip -O /tmp/temp.zip \
    && cd /usr/src/wordpress/wp-content/plugins \
    && unzip /tmp/temp.zip \
    && rm /tmp/temp.zip

# Install Woocommerce Admin
RUN wget https://downloads.wordpress.org/plugin/woocommerce-admin.zip -O /tmp/temp.zip \
    && cd /usr/src/wordpress/wp-content/plugins \
    && unzip /tmp/temp.zip \
    && rm /tmp/temp.zip

# Install JWT Auth plugin
RUN wget https://downloads.wordpress.org/plugin/jwt-authentication-for-wp-rest-api.${JWT_AUTHENTICATION_VERSION}.zip -O /tmp/temp.zip \
    && cd /usr/src/wordpress/wp-content/plugins \
    && unzip /tmp/temp.zip \
    && rm /tmp/temp.zip

# Copy Root files
COPY wordpress_root/ /var/www/html/
