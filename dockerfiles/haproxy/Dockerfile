FROM centos

MAINTAINER Maksim Koskin <max.koskin@inbox.lv>

#Prepare environment

ENV HAPROXY_MJR_VERSION=1.7

ENV HAPROXY_VERSION=1.7.5 

RUN yum install epel-release -y \
  && yum update -y \
  && yum install wget gcc pcre-static pcre-devel make openssl openssl-devel -y

#Install haproxy

RUN wget -O /tmp/haproxy.tgz http://www.haproxy.org/download/${HAPROXY_MJR_VERSION}/src/haproxy-${HAPROXY_VERSION}.tar.gz \ 
  && tar -zxvf /tmp/haproxy.tgz -C /tmp \ 
  && cd /tmp/haproxy-* \
  && make TARGET=linux2628 \
          USE_PCRE=1 \
          USE_OPENSSL=1 \
          USE_ZLIB=1 \
          USE_CRYPT_H=1 \
          USE_LIBCRYPT=1 \
          CFLAGS="-O2 -g -fno-strict-aliasing -DTCP_USER_TIMEOUT=18" \
  && make install \
  && cp /usr/local/sbin/haproxy /usr/sbin/ \
  && rm -rf /tmp/haproxy*

RUN useradd -r haproxy

RUN mkdir -p /var/lib/haproxy \
  && chown -R haproxy:haproxy /var/lib/haproxy

EXPOSE 80 443

COPY haproxy.cfg /etc/haproxy/haproxy.cfg

CMD ["haproxy", "-f", "/etc/haproxy/haproxy.cfg"]
