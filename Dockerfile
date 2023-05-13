FROM nginx:stable

# Instalar Tor y OpenSSH Server
RUN apt update && apt upgrade tor openssh-server openssl -y

COPY docker-entrypoint.sh /
COPY torrc /etc/tor/
#COPY sshd_config /etc/ssh/

# Copy page web files
COPY index.html /usr/share/nginx/html/
COPY homer.gif /usr/share/nginx/html/

# Ports
EXPOSE 80
EXPOSE 4242
