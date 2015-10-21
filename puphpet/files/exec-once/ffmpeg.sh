#!/bin/sh

sudo yum erase ffmpeg faac libfaac x264 libx264 libvpx

sudo yum install gcc gcc-c++ automake autoconf libtool git subversion pkgconfig

export LD_LIBRARY_PATH=/usr/local/lib/
sudo echo /usr/local/lib > sudo /etc/ld.so.conf.d/custom-libs.conf
sudo ldconfig

cd ~

# Yasm is an assembler used by x264 and FFmpeg.
sudo wget http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz
sudo tar xzvf yasm-1.2.0.tar.gz
cd yasm-1.2.0
sudo ./configure
sudo make
sudo make install
sudo ldconfig
cd ..

#NASM
sudo wget www.nasm.us/pub/nasm/releasebuilds/2.11.08/nasm-2.11.08.tar.xz
sudo tar -xf nasm-2.11.08.tar.xz
cd nasm-2.11.08
sudo ./configure --prefix=/usr
sudo make
sudo make install
cd ..

sudo wget http://downloads.xvid.org/downloads/xvidcore-1.3.2.tar.gz
sudo tar zxf xvidcore-1.3.2.tar.gz
cd xvidcore/build/generic
sudo ./configure --enable-shared
sudo make 
sudo make install
sudo ldconfig
cd ../../../

sudo wget http://downloads.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz
sudo tar zxf lame-3.99.5.tar.gz
cd lame-3.99.5
sudo ./configure --enable-shared
sudo make
sudo make install
sudo ldconfig
cd ..

sudo wget http://downloads.sourceforge.net/faac/faac-1.28.tar.gz
sudo tar xzf faac-1.28.tar.gz
cd faac-1.28
sudo ./bootstrap
sudo ./configure --enable-shared
sudo make
sudo make install
sudo ldconfig
cd ..

sudo wget http://downloads.sourceforge.net/project/opencore-amr/opencore-amr/opencore-amr-0.1.3.tar.gz
sudo tar xzf opencore-amr-0.1.3.tar.gz
cd opencore-amr-0.1.3
sudo ./configure --enable-shared
sudo make 
sudo make install
sudo ldconfig
cd ..

sudo wget http://downloads.xiph.org/releases/ogg/libogg-1.3.0.tar.gz
sudo tar xzf libogg-1.3.0.tar.gz
cd libogg-1.3.0
sudo ./configure --enable-shared
sudo make
sudo make install
sudo ldconfig
cd ..

sudo wget http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.3.tar.gz
sudo tar xzf libvorbis-1.3.3.tar.gz
cd libvorbis-1.3.3
sudo ./configure --enable-shared
sudo make 
sudo make install
sudo ldconfig
cd ..

sudo wget http://downloads.xiph.org/releases/theora/libtheora-1.1.1.tar.bz2
sudo tar xjf libtheora-1.1.1.tar.bz2
cd libtheora-1.1.1
sudo ./configure --enable-shared
sudo make
sudo make install
sudo ldconfig
cd ..

sudo git clone git://git.videolan.org/x264.git
cd x264

# Fix the error in between that will cause problems in installing x264

su root -c 'PATH=$PATH:/usr/local/bin ./configure --enable-shared'
su root -c 'PATH=$PATH:/usr/local/bin make && make install'
#PATH=$PATH:/usr/local/bin ./configure --enable-shared
#PATH=$PATH:/usr/local/bin make && make install
sudo ldconfig
cd ..

sudo wget http://downloads.sourceforge.net/opencore-amr/vo-aacenc-0.1.2.tar.gz
sudo tar xzvf vo-aacenc-0.1.2.tar.gz
cd vo-aacenc-0.1.2
sudo ./configure --enable-shared
sudo make 
sudo make install
sudo ldconfig
cd ..

sudo git clone https://chromium.googlesource.com/webm/libvpx.git 
cd libvpx
sudo ./configure --enable-shared
sudo make 
sudo make install
sudo ldconfig
cd ..

sudo wget http://zlib.net/zlib-1.2.8.tar.gz
sudo tar xzvf zlib-1.2.8.tar.gz
cd zlib-1.2.8
sudo ./configure --enable-shared
sudo make
sudo make install
sudo ldconfig
cd ..

# Make sure to register local lib path so ffmpeg can find libraries here
su root -c 'echo "/usr/local/lib" >> /etc/ld.so.conf'
#echo "/usr/local/lib" >> /etc/ld.so.conf
sudo ldconfig

sudo git clone git://git.videolan.org/ffmpeg.git ffmpeg
cd ffmpeg
sudo ./configure --enable-version3 --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libvpx --enable-libfaac --enable-libmp3lame --enable-libtheora --enable-libvorbis --enable-libx264 --enable-libxvid --enable-gpl --enable-postproc --enable-nonfree --enable-pthreads --enable-libvo-aacenc --enable-postproc --enable-swscale --enable-avfilter --enable-shared --enable-runtime-cpudetect --disable-stripping --extra-cflags='-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic -fPIC'
sudo make
sudo make install
sudo ldconfig
