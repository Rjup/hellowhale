FROM jenkins/jnlp-slave

USER root

RUN apt-get update && 
apt-get -y install apt-transport-https 
ca-certificates 
curl 
gnupg2 
software-properties-common && 
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \ add-apt-repository \ "deb [arch=amd64] https://download.docker.com/linux/(. /etc/os-release; echo “ID") \ (lsb_release -cs) 
stable” && 
apt-get update && 
apt-get -y install docker-ce && 
apt-get -y install sudo

VOLUME /var/run/docker.sock

RUN adduser jenkins sudo

RUN echo “jenkins ALL=NOPASSWD: ALL” >> /etc/sudoers

RUN usermod -aG docker jenkins

RUN chmod 777 /var/run/docker.sock

RUN chown root:jenkins /var/run/docker.sock

USER jenkins

FROM nginx

COPY wrapper.sh /

COPY html /usr/share/nginx/html

CMD ["./wrapper.sh"]
