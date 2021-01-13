FROM centos:latest

ENV LANG       en_US.UTF-8
RUN rm -rf /bin/sh && ln -sf /bin/bash /bin/sh
RUN dnf install -y epel-release
RUN dnf remove tinyxml
RUN dnf install -y curl wget unzip p7zip vim autoconf automake bzip2 bzip2-devel cmake clang gcc gcc-c++ git libtool make mercurial pkgconfig glibc-devel openssh openssh-server libbluray 
ADD init.sh /init.sh

USER o
WORKDIR /home
CMD mkdir -p ~/.bin && bash /init.sh
