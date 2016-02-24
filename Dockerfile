FROM centos
MAINTAINER mnlsn <mike@mnlsn.io>

# install java 7
RUN yum update -y
RUN yum install -y wget && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.rpm
RUN rpm -ivh jdk-7u79-linux-x64.rpm && rm jdk-7u79-linux-x64.rpm
ENV JAVA_HOME /usr/java/jdk1.7.0_79

# install git
RUN yum -y install git

#install maven & set MAVEN_HOME
RUN cd /opt
RUN wget http://www.apache.org/dist/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz
RUN tar xzf apache-maven-3.3.3-bin.tar.gz -C /usr/local
RUN mv /usr/local/apache-maven-3.3.3 /usr/local/maven
ENV M2_HOME /usr/local/maven
ENV PATH ${M2_HOME}/bin:${PATH}
