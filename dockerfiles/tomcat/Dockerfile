# Centos based container with Java and Tomcat

FROM centos

MAINTAINER Maksim Koskin <max.koskin@inbox.lv>

# Prepare infrastructure

RUN yum -y update \
  && yum -y install wget

# Prepare environment

ENV JAVA_HOME /opt/java

ENV CATALINA_HOME /opt/tomcat

ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$CATALINA_HOME/scripts

# Install Oracle Java8

ENV JAVA_VERSION 8u112

ENV JAVA_BUILD 8u112-b15

RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
 http://download.oracle.com/otn-pub/java/jdk/${JAVA_BUILD}/jdk-${JAVA_VERSION}-linux-x64.tar.gz \
 && tar -xvf jdk-${JAVA_VERSION}-linux-x64.tar.gz \
 && rm jdk*.tar.gz \
 && mv jdk* ${JAVA_HOME}

# Install Tomcat

ENV TOMCAT_MAJOR 9

ENV TOMCAT_VERSION 9.0.0.M19

RUN wget http://www-us.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz \
 && tar -xvf apache-tomcat-${TOMCAT_VERSION}.tar.gz \
 && rm apache-tomcat*.tar.gz \
 && mv apache-tomcat* ${CATALINA_HOME} \
 && chmod +x ${CATALINA_HOME}/bin/*sh

COPY index.jsp /opt/tomcat/webapps/ROOT/index.jsp

COPY server.xml /opt/tomcat/conf/server.xml

WORKDIR /opt/tomcat

EXPOSE 8080 443 8443 8009

ENTRYPOINT [ "/opt/tomcat/bin/catalina.sh", "run" ]
