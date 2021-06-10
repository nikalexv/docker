#!/bin/bash

mkdir doc_test && cd doc_test/
touch Dockerfile
mkdir html_dir

echo 'FROM nginx
RUN rm /usr/share/nginx/html/index.html
COPY html_dir /usr/share/nginx/html' > Dockerfile 

echo '<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>DevOps Course 2021</h1>
</body>
</html>' > html_dir/index.html

docker build -t mynginx .
docker run --name mynginx_name -p 80:80 -d mynginx

