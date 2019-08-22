FROM ubuntu:12.04

MAINTAINER Erwin "m9207216@gmail.com"

RUN linux32 sed -i 's/archive.ubuntu.com/ubuntu.stu.edu.tw/g' /etc/apt/sources.list
RUN echo "APT::Install-Recommends 0;" >> /etc/apt/apt.conf.d/01norecommends \
 && echo "APT::Install-Suggests 0;" >> /etc/apt/apt.conf.d/01norecommends \
 && apt-get update -y \
 && apt-get install -y git gnupg flex bison gperf build-essential zip curl libc6-dev libncurses5-dev:i386 x11proto-core-dev libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown libxml2-utils xsltproc zlib1g-dev:i386 \
 && apt-get install -y libsdl-dev \
 && apt-get install -y libesd0-dev \
 && apt-get install -y libwxgtk2.6-dev \
 && apt-get install -y uboot-mkimage \
 && apt-get install -y expect \
 && apt-get install -y imagemagick \
 && apt-get install -y vim.tiny wget \
 && apt-get install -y lib32z1 lib32z1-dev lib32ncurses5 lib32ncurses5-dev \
 && apt-get install -y unzip \
 && apt-get install -y sudo \
#for glsdk
 && apt-get install -y lsb-release \
 && apt-get install -y xinetd tftpd nfs-kernel-server minicom build-essential libncurses5-dev uboot-mkimage autoconf automake python git diffstat texinfo gawk chrpath subversion dos2unix m2crypto lzop \
#
 && apt-get install -y locales
#RUN rm -rf /var/lib/apt/lists/*


RUN locale-gen en_US.UTF-8
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

#bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

#
ADD gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2 /opt

# All builds will be done by user aosp
COPY gitconfig /root/.gitconfig
COPY ssh_config /root/.ssh/config

WORKDIR /mnt/aosp

COPY utils/docker_entrypoint.sh /root/docker_entrypoint.sh
COPY utils/aosp_bashrc.sh /root/aosp_bashrc.sh
RUN mkdir -p /root/aosp
COPY utils/aosp/.bash_logout /root/aosp
COPY utils/aosp/.bashrc /root/aosp
COPY utils/aosp/.profile /root/aosp
RUN chmod +x /root/docker_entrypoint.sh
#ENTRYPOINT ["/root/docker_entrypoint.sh"]
