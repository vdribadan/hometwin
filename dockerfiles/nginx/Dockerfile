FROM centos

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
  && yum update -y \
  && yum install -y nginx \
  && yum remove -y epel-release \
  && yum -y clean all \
  && rm -rf /tmp/* \
  && ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log

RUN openssl genrsa -out /etc/ssl/twino.key 2048 \
  && openssl req -new -key /etc/ssl/twino.key -out /etc/ssl/twino.csr -subj "/C=LV/L=Riga/O=Twino/CN=10.10.10.3" \
  && openssl x509 -req -days 3650 -in /etc/ssl/twino.csr -signkey /etc/ssl/twino.key -out /etc/ssl/twino.crt

COPY conf/default.conf /etc/nginx/conf.d

COPY conf/nginx.conf /etc/nginx
