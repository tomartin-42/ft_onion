FROM nginx:alpine

# Instalar Tor y OpenSSH Server
RUN apk update && apk add --no-cache tor openssh-server

# Crear el directorio /var/run/sshd
RUN mkdir /var/run/sshd

COPY torrc /etc/tor/

# Copy page web files
COPY index.html /usr/share/nginx/html/
COPY homer.gif /usr/share/nginx/html/

# Ports
EXPOSE 80
EXPOSE 4242
