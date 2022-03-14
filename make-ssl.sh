# Arg shell $1: your domain_name
mkdir .docker/ssl/$1/;
openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=$1" -addext "subjectAltName=DNS:$1" -newkey rsa:2048 -keyout .docker/ssl/$1/nginx-selfsigned.key -out .docker/ssl/$1/nginx-selfsigned.crt;
docker-compose stop nginx && docker-compose up -d nginx
