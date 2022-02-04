FROM ubuntu:latest

# https://stackoverflow.com/questions/22466255/is-it-possible-to-answer-dialog-questions-when-installing-under-docker
ARG DEBIAN_FRONTEND=noninteractive

# updating and installing sudo and openssh-server
# by default docker doens't have sudo installed
RUN apt-get update && apt-get install openssh-server sudo -y

# creating a admin user
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 admin 

# setting the admin password to admin
RUN  echo 'admin:admin' | chpasswd

# starting the ssh server
RUN service ssh start

EXPOSE 22

# starting the SSH Daemon
CMD ["/usr/sbin/sshd", "-D"]
