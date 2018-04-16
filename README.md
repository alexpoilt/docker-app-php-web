# docker-app-php-web
Container docker for aplication web with PHP and/or Wordpress

ENVs default
* DOMAIN_NAME = youapp.com
* DIR_WWW = /var/www/html
* GIT_URL_PROJECT = https://github.com/alvarobacelar/CiclOps.git

You can use this envs in your docker
```code
# docker run -d --name you-app -p 80:80 -v -e DOMAIN_NAME=myapp.com -e DIR_WWW=/home/myapp -e GIT_URL_PROJECT=https://github.com/username/yourapp.git alvarobacelar/docker-app-php-web
```

Create Image: 
```code
# docker build -t image-name .
```
After create image, create now the container 
```code
# docker run -d --name name-you-container -p 80:80 -v "$PWD":/var/www/html image-name
```
Your aplication are available the port 80. 
