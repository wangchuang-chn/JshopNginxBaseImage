FROM centos:centos7

MAINTAINER wangchuang<mail.wangchuang@gmail.com>

EXPOSE 80 443
COPY nginx.repo /etc/yum.repos.d/


RUN yum-config-manager --enable nginx-stable \
    && yum -y install nginx \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && sed -i 's@worker_processes.*@worker_processes  auto;@g' /etc/nginx/nginx.conf 



ADD nginx-site.conf /etc/nginx/conf.d/default.conf


CMD ["/bin/sh", "/start.sh"]