FROM centos:latest
RUN  sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN  sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd zip unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page288/global.zip /var/www/html
WORKDIR /var/www/html
RUN unzip global.zip
RUN rm -rf global.zip &&\
    cp -rf global-master/* . &&\
    rm -rf global-master
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
