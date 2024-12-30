FROM debian:latest

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y wget unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set up the working directory
RUN mkdir -p /var/www/html/live

# Download and extract the archive
WORKDIR /var/www/html/live
RUN wget http://my-place.bplaced.net/sources/sss_v2.00.zip && \
    unzip -d /var/www/html/live sss_v2.00.zip && \
    rm sss_v2.00.zip

# Set permissions and ownership
RUN chmod 755 /var/www/html/live && \
    chmod 644 /var/www/html/live/* && \
    chown -R www-data:www-data /var/www/html/live

# Expose the relevant port (e.g., for a web server)
EXPOSE 80

# Default command (to be adjusted based on your web server configuration)
CMD ["echo", "Installation complete. Configure a web server to serve the files."]
