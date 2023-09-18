# Verwende den offiziellen PHP-Basisimage mit Apache-Server
FROM php:7.4-apache

# Installiere die MySQLi-Erweiterung
RUN docker-php-ext-install mysqli

# Kopiere die Dateien deines PHP-Projekts in das Containerverzeichnis /var/www/html
COPY src/* /var/www/html/

# Starte den Apache-Server beim Start des Containers
CMD ["apache2-foreground"]
