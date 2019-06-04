IMAGE_NAME=$1

mkdir /webserver
touch /webserver/docker-compose.yml
cat << EOF > /webserver/docker-compose.yml
version: "3"

services:
  suprb:
    image: $IMAGE_NAME
    ports:
      - "8090:80"
    # Update with real application

  reverse-proxy:
    image: traefik:1.7-alpine
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./traefik:/etc/traefik       # Traefik configuration 
      - ./volumes/trconf:/trconf     # Traefik multi host configuration
      - ./volumes/traefik-acme:/acme # SSL Certification store
EOF