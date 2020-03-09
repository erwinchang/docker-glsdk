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
 && apt-get install -y locales \
#fix kernel build fail
 && apt-get install -y bc \
#fix build sgx fail
 && apt-get install -y file
# 32bit lib
RUN apt-get install -y acl bluez bluez-alsa:i386 dbus dbus-x11 dconf-gsettings-backend dconf-service gconf-service gconf-service-backend gconf2 gconf2-common glib-networking:i386 \
                       glib-networking-common glib-networking-services gsettings-desktop-schemas gstreamer0.10-plugins-base:i386 gstreamer0.10-plugins-good:i386 gtk2-engines:i386 \
                    gtk2-engines-murrine:i386 gtk2-engines-oxygen:i386 gtk2-engines-pixbuf:i386 gvfs:i386 gvfs-common gvfs-daemons gvfs-libs gvfs-libs:i386 ia32-libs-multiarch:i386 \
                    ibus-gtk:i386 iso-codes libaa1:i386 libacl1:i386 libaio1:i386 libao-common libao4:i386 libasn1-8-heimdal:i386 libasound2:i386 libasound2-plugins:i386 \
                    libasyncns0:i386 libatasmart4 libatk1.0-0:i386 libattr1:i386 libaudio2:i386 libaudiofile1:i386 libavahi-client3:i386 libavahi-common-data:i386 \
                    libavahi-common3:i386 libavc1394-0:i386 libbz2-1.0:i386 libcaca0:i386 libcairo-gobject2:i386 libcairo2:i386 libcanberra-gtk-module:i386 libcanberra-gtk0:i386 \
                    libcanberra0:i386 libcap-ng0 libcap2:i386 libcapi20-3:i386 libcdparanoia0:i386 libcomerr2:i386 libcroco3:i386 libcups2:i386 libcupsimage2:i386 libcurl3:i386 \
                    libdatrie1:i386 libdb5.1:i386 libdbus-1-3:i386 libdbus-glib-1-2 libdbus-glib-1-2:i386 libdconf0 libdevmapper-event1.02.1 libdv4:i386 libesd0:i386 libexif12:i386 \
                    libexpat1:i386 libffi6:i386 libflac8:i386 libfontconfig1:i386 libfontenc1 libfreetype6:i386 libgail-common:i386 libgail18:i386 libgconf-2-4 libgconf-2-4:i386 \
                    libgcrypt11:i386 libgd2-xpm:i386 libgdbm3:i386 libgdk-pixbuf2.0-0:i386 libgdu0 libgettextpo0:i386 libglib2.0-0:i386 libglu1-mesa:i386 libgnome-keyring-common \
                    libgnome-keyring0 libgnome-keyring0:i386 libgnutls26:i386 libgomp1:i386 libgpg-error0:i386 libgphoto2-2:i386 libgphoto2-port0:i386 libgpm2:i386 \
                    libgssapi-krb5-2:i386 libgssapi3-heimdal:i386 libgstreamer-plugins-base0.10-0:i386 libgstreamer0.10-0:i386 libgtk2.0-0:i386 libgudev-1.0-0 libgudev-1.0-0:i386 \
                    libhcrypto4-heimdal:i386 libheimbase1-heimdal:i386 libheimntlm0-heimdal:i386 libhx509-5-heimdal:i386 libibus-1.0-0:i386 libice6:i386 libidn11:i386 \
                    libiec61883-0:i386 libieee1284-3:i386 libjack-jackd2-0:i386 libjasper1:i386 libjpeg-turbo8:i386 libjpeg8:i386 libjson0:i386 libk5crypto3:i386 libkeyutils1:i386 \
                    libkrb5-26-heimdal:i386 libkrb5-3:i386 libkrb5support0:i386 liblcms1:i386 libldap-2.4-2:i386 libltdl7:i386 liblvm2app2.2 libmad0:i386 libmikmod2:i386 libmng1:i386 \
                    libmpg123-0:i386 libncursesw5:i386 libnspr4:i386 libnss3:i386 libodbc1:i386 libogg0:i386 libopenal-data libopenal1:i386 liborc-0.4-0:i386 libp11-kit0:i386 \
                    libpango1.0-0:i386 libparted0debian1 libpcre3:i386 libpixman-1-0:i386 libpng12-0:i386 libpolkit-gobject-1-0 libproxy1 libproxy1:i386 libpulse-mainloop-glib0:i386 \
                    libpulse0:i386 libpulsedsp:i386 libqt4-dbus:i386 libqt4-declarative:i386 libqt4-designer:i386 libqt4-network:i386 libqt4-opengl:i386 libqt4-qt3support:i386 \
                    libqt4-script:i386 libqt4-scripttools:i386 libqt4-sql:i386 libqt4-svg:i386 libqt4-test:i386 libqt4-xml:i386 libqt4-xmlpatterns:i386 libqtcore4:i386 libqtgui4:i386 \
                    libqtwebkit4:i386 libraw1394-11:i386 libroken18-heimdal:i386 librsvg2-2:i386 librsvg2-common:i386 librtmp0:i386 libsamplerate0:i386 libsane:i386 libsane-common \
                    libsasl2-2:i386 libsdl-image1.2:i386 libsdl-mixer1.2:i386 libsdl-net1.2:i386 libsdl-ttf2.0-0:i386 libsdl1.2debian:i386 libselinux1:i386 libsgutils2-2 \
                    libshout3:i386 libslang2:i386 libsm6:i386 libsndfile1:i386 libsoup-gnome2.4-1:i386 libsoup2.4-1:i386 libspeex1:i386 libspeexdsp1:i386 libsqlite3-0:i386 \
                    libssl0.9.8:i386 libssl1.0.0:i386 libstdc++5:i386 libstdc++6:i386 libtag1-vanilla:i386 libtag1c2a:i386 libtasn1-3:i386 libtdb1:i386 libthai0:i386 libtheora0:i386 \
                    libtiff4:i386 libudev0:i386 libunistring0:i386 libusb-0.1-4:i386 libuuid1:i386 libv4l-0:i386 libv4lconvert0:i386 libvisual-0.4-0:i386 libvorbis0a:i386 \
                    libvorbisenc2:i386 libvorbisfile3:i386 libwavpack1:i386 libwind0-heimdal:i386 libwrap0:i386 libxaw7 libxaw7:i386 libxcb-render0:i386 libxcb-shape0 \
                    libxcb-shm0:i386 libxcomposite1:i386 libxcursor1:i386 libxft2:i386 libxi6:i386 libxinerama1:i386 libxml2:i386 libxmu6 libxmu6:i386 libxmuu1 libxp6:i386 libxpm4 \
                    libxpm4:i386 libxrandr2:i386 libxrender1:i386 libxslt1.1:i386 libxss1:i386 libxt6:i386 libxtst6 libxtst6:i386 libxv1 libxv1:i386 libxxf86dga1 odbcinst \
                    odbcinst1debian2 odbcinst1debian2:i386 oss-compat psmisc python-dbus python-dbus-dev sound-theme-freedesktop udisks x11-utils xaw3dg:i386
#
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
ENTRYPOINT ["/root/docker_entrypoint.sh"]
