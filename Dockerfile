FROM centos:latest
RUN  sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN  sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd zip unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/spering.zip /var/www/html
WORKDIR /var/www/html
RUN unzip spering.zip
RUN rm -rf spering.zip &&\
    cp -rf spering-html/* . &&\
    rm -rf spering-html
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
