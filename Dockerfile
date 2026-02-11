# Use an official PHP runtime with Apache
FROM php:8.2-apache

# 1. Install any extra extensions if needed (like PDO for databases later)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# 2. Copy your project files into the web directory
COPY . /var/www/html/

# 3. Set permissions so your upload.php can actually save files
RUN mkdir -p /var/www/html/notes && \
    chown -R www-data:www-data /var/www/html/notes && \
    chmod -R 755 /var/www/html/notes

# 4. Enable Apache mod_rewrite (useful for clean URLs)
RUN a2enmod rewrite

# 5. Expose port 80
EXPOSE 80

