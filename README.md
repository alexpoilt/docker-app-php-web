# docker-app-php-web
Container docker for aplication web with PHP and/or Wordpress

Create Image: 
```code
# docker build -t image-name .
```
After create image, create now the container 
```code
# docker run -d --name name-you-container -p 80:80 -v "$PWD":/var/www/html image-name
```
Your aplication are available the port 80. 
