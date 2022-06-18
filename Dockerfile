FROM centos:latest
MAINTAINER sumit@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd zip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page277/kidkinder.zip /var/www/html
WORKDIR /var/www/html
RUN unzip kidkinder.zip
RUN cp -rvf kindergarten-website-template/* .
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 80
