# Docker Create Container Task

## Docker setup check

docker --version
docker ps
docker run --rm hello-world

## NGINX container

cd nginx-task
docker pull nginx:latest
docker rm -f my-nginx || true
docker run -d --name my-nginx -p 8080:80 -v "$PWD/index.html:/usr/share/nginx/html/index.html:ro" nginx:latest
docker ps
curl localhost:8080

Browser:
http://localhost:8080

## Node.js + React application

docker build --no-cache -t node-react-app .
docker rm -f node-react-container || true
docker run -d --name node-react-container -p 3000:3000 node-react-app
docker ps
curl localhost:3000
curl -I localhost:3000/static/bundle.js

Browser:
http://localhost:3000
