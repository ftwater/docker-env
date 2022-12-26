FROM ubuntu:latest
LABEL Author="zypmain@gmail.com"
ENV ROOT_PASSWORD=root 
ADD OpenJDK8U-jdk_aarch64_linux_hotspot_8u345b01.tar.gz /usr/local/jdk
ADD apache-maven-3.8.6-bin.tar.gz /usr/local/maven
RUN set -xe && \
    sed -i s@/ports.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list && \
    apt-get clean && \
    apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl git vim openssh-server zsh net-tools iputils-ping unzip && \
    apt-get autoclean; rm -rf /var/lib/apt/lists/* && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    sed -i -e '/<blocked>/,/<\/blocked>/ s/true/false/g' /usr/local/maven/apache-maven-3.8.6/conf/settings.xml && \
    echo y | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    chsh -s /bin/zsh
RUN yes | unminimize
ENV JAVA_HOME=/usr/local/jdk/jdk8u345-b01
ENV MVN_HOME=/usr/local/maven/apache-maven-3.8.6
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH=$JAVA_HOME/bin:$MVN_HOME/bin:$PATH
COPY setup.sh /
COPY settings.xml /root/.m2/
RUN chmod +x /setup.sh
EXPOSE 2222:22
WORKDIR /root/
ENTRYPOINT ["/setup.sh"]