# Docker Create Container Task

This repository contains my practical Docker task for creating and running containers.

The main goal of this task was to practice basic Docker commands, run an NGINX container, build a custom Docker image for a Node.js + React application, and verify that both containers work correctly.

---

## Project Overview

This task includes two practical parts:

1. Running an NGINX container with a custom `index.html`.
2. Building and running a custom Docker image for a Node.js + React application.

The project helped me practice the full basic Docker workflow:

- checking Docker installation;
- pulling an image;
- running a container;
- publishing ports;
- mounting a local file into a container;
- building a custom Docker image;
- verifying the result with `curl` and browser.

---

## Technologies Used

- Docker
- NGINX
- Node.js
- React
- Express
- Webpack
- Git / GitHub

---

## Docker Setup Check

Before starting the task, I checked that Docker was installed and working:

```bash
docker --version
docker ps
docker run --rm hello-world
```

---

## Part 1 — NGINX Container

For the first part, I used the official NGINX image and mounted my own HTML file into the container.

Commands used:

```bash
cd nginx-task

docker pull nginx:latest

docker rm -f my-nginx || true

docker run -d \
  --name my-nginx \
  -p 8080:80 \
  -v "$PWD/index.html:/usr/share/nginx/html/index.html:ro" \
  nginx:latest
```

Verification:

```bash
docker ps
curl localhost:8080
```

Browser check:

```text
http://localhost:8080
```

---

## Part 2 — Node.js + React Application

For the second part, I created a Docker image for a Node.js + React application.

The Dockerfile:

- uses `node:16-alpine`;
- sets `/app` as the working directory;
- copies `package.json` files;
- installs dependencies;
- copies project files;
- builds frontend assets;
- exposes port `3000`;
- starts the application with `npm start`.

Build command:

```bash
docker build --no-cache -t node-react-app .
```

Run command:

```bash
docker rm -f node-react-container || true

docker run -d \
  --name node-react-container \
  -p 3000:3000 \
  node-react-app
```

Verification:

```bash
docker ps
curl localhost:3000
curl -I localhost:3000/static/bundle.js
```

Browser check:

```text
http://localhost:3000
```

---

## What I Practiced

- Docker installation verification
- Running a test container with `hello-world`
- Pulling public Docker images
- Running NGINX in a container
- Publishing container ports
- Mounting a local file into a container
- Writing a Dockerfile
- Building a custom Docker image
- Running a Node.js application in Docker
- Verifying containers with `docker ps`, `curl` and browser

---

## Result

The final result of this task:

- NGINX container works on port `8080`;
- custom HTML page is served by NGINX;
- Node.js + React application is built into a Docker image;
- application container runs on port `3000`;
- both containers were verified from terminal and browser.

This repository demonstrates my basic practical Docker skills: running containers, publishing ports, mounting files, building images and checking containerized applications.


---


# example-app-nodejs-backend-react-frontend

> This is an example app created for the blog post '[What is a good directory structure for a monorepo with a Node.js back end and React front end?](https://simonplend.com/what-is-a-good-directory-structure-for-a-monorepo-with-a-node-js-back-end-and-react-front-end/)'.

## Requirements

- Node.js >= v12

## Application structure

- `client/` directory - React front end code.
- `server/` directory - Node.js back end code.
- `static/` directory - Compiled front end assets. Created by webpack when you run the
command `npm run build`. The Node.js back end serves serves these assets using the
[`express.static`](https://expressjs.com/en/starter/static-files.html#serving-static-files-in-express) middleware.

## Usage

```bash
# Install dependencies for front end and back end
npm install

# Build front end assets with webpack
npm run build

# Run Node.js back end server
npm start
```

Load up http://localhost:3000 in your browser to view the example website.

## Libraries and frameworks used

- [Express](https://expressjs.com/) - "Fast, unopinionated, minimalist web framework for Node.js".

- [React](https://reactjs.org/) - "A JavaScript library for building user interfaces".

- [Webpack](https://www.npmjs.com/package/webpack) - A popular tool for building
front end assets e.g. CSS and JavaScript.

- [Sucrase](https://www.npmjs.com/package/sucrase) - A simpler and faster
alternative to [Babel](https://babeljs.io/) which brings support
for JSX, TypeScript, ES modules, and more to your client side and server side
JavaScript.
