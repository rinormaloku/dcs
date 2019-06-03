IMAGE_NAME=$1

cat << EOF > /sample/docker-compose.yml
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
    command: --api
      - "80:80" 
      - "443:443" 
    volumes:
      - ./traefik:/etc/traefik       # Traefik configuration 
      - ./volumes/traefik-acme:/acme # SSL Certification store
EOF
