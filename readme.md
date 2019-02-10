docker build -t lamp .
docker run -dit -p 8080:80 -p 443:443 lamp
