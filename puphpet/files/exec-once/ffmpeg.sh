#!/bin/sh
# 150326 | 15:53:00, michael.haehnel@metadesign.de

sudo yum -y erase ffmpeg x264 x264-devel
sudo yum -y install gcc make nasm pkgconfig wget speex-devel

sudo mkdir -p /usr/local/dist/
#svn update # NOT NEEDED

sudo mkdir -p /usr/local/ffmpeg-source

PREFIX="/usr/local/ffmpeg-source"
BIN="/usr/local/bin"

cd /usr/local/ffmpeg-source

# YASM
cd /usr/local/ffmpeg-source
sudo curl -O http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz
sudo tar xzvf yasm-1.2.0.tar.gz
cd yasm-1.2.0
sudo ./configure --prefix="/usr/local/ffmpeg-source" --bindir="/usr/local/bin"
sudo make -j12
sudo make install
sudo make distclean


# X264
cd /usr/local/ffmpeg-source
sudo git clone --depth 1 git://git.videolan.org/x264
cd x264
sudo ./configure --prefix="/usr/local/ffmpeg-source" --bindir="/usr/local/bin" --disable-asm
sudo make -j12 && sudo make install
sudo make distclean

#AAC audio encoder.
cd /usr/local/ffmpeg-source
sudo git clone --depth 1 git://git.code.sf.net/p/opencore-amr/fdk-aac
cd fdk-aac
sudo autoreconf -fiv
sudo ./configure --prefix="/usr/local/ffmpeg-source" --disable-shared
sudo make -j12
sudo make install
sudo make distclean


# LAME
cd /usr/local/ffmpeg-source
sudo wget http://downloads.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz
sudo tar xzf lame-3.99.5.tar.gz
cd lame-3.99.5
sudo ./configure --prefix="/usr/local/ffmpeg-source" --bindir="/usr/local/bin" --disable-shared --enable-nasm
sudo make -j12 && sudo make install


# Opus
cd /usr/local/ffmpeg-source
sudo curl -O http://downloads.xiph.org/releases/opus/opus-1.0.3.tar.gz
sudo tar xzvf opus-1.0.3.tar.gz
cd opus-1.0.3
sudo ./configure --prefix="/usr/local/ffmpeg-source" --disable-shared
sudo make -j12
sudo make install
sudo make distclean


# libogg
cd /usr/local/ffmpeg-source
sudo curl -O http://downloads.xiph.org/releases/ogg/libogg-1.3.1.tar.gz
sudo tar xzvf libogg-1.3.1.tar.gz
cd libogg-1.3.1
sudo ./configure --prefix="/usr/local/ffmpeg-source" --disable-shared
sudo make -j12
sudo make install
sudo make distclean

# libtheora
cd /usr/local/ffmpeg-source
sudo curl -O http://downloads.xiph.org/releases/theora/libtheora-1.1.1.tar.gz
sudo tar xzvf libtheora-1.1.1.tar.gz
cd libtheora-1.1.1
sudo ./configure --prefix="/usr/local/ffmpeg-source" --with-ogg="/usr/local/ffmpeg-source" --disable-examples --disable-shared --disable-sdltest --disable-vorbistest
sudo make -j12
sudo make install
sudo make distclean

# libvorbis
cd /usr/local/ffmpeg-source
sudo curl -O http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.3.tar.gz
sudo tar xzvf libvorbis-1.3.3.tar.gz
cd libvorbis-1.3.3
sudo ./configure --prefix="/usr/local/ffmpeg-source" --with-ogg="/usr/local/ffmpeg-source" --disable-shared
sudo make -j12
sudo make install
sudo make distclean

# vo-aacenc
cd /usr/local/ffmpeg-source
sudo wget http://downloads.sourceforge.net/opencore-amr/vo-aacenc-0.1.2.tar.gz
sudo tar xzf vo-aacenc-0.1.2.tar.gz
cd vo-aacenc-0.1.2
sudo ./configure --disable-shared
sudo make -j12 && sudo make install

# libvpx
cd /usr/local/ffmpeg-source
sudo git clone --depth 1 https://chromium.googlesource.com/webm/libvpx.git
cd libvpx
sudo ./configure --prefix="/usr/local/ffmpeg-source" --disable-examples
sudo make -j12
sudo make install
sudo make clean


# zlib
cd /usr/local/ffmpeg-source
sudo wget http://zlib.net/zlib-1.2.8.tar.gz
sudo tar xzf zlib-1.2.8.tar.gz
cd zlib-1.2.8
sudo ./configure
sudo make -j12 && sudo make install

# speex
cd /usr/local/ffmpeg-source
sudo wget http://downloads.xiph.org/releases/speex/speex-1.2rc1.tar.gz
sudo gzip -dc speex-1.2rc1.tar.gz | sudo tar -xf -


# FFmpeg itself
cd /usr/local/ffmpeg-source
sudo git clone --depth 1 git://source.ffmpeg.org/ffmpeg
cd ffmpeg
PKG_CONFIG_PATH="/usr/local/ffmpeg-source/lib/pkgconfig"
export PKG_CONFIG_PATH
sudo ./configure --prefix="/usr/local/ffmpeg-source" --extra-cflags="-I/usr/local/ffmpeg-source/include" --extra-ldflags="-L/usr/local/ffmpeg-source/lib" --bindir="/usr/local/bin" --extra-libs="-ldl" --enable-gpl --enable-nonfree --enable-libfdk_aac --enable-libmp3lame --enable-libvorbis --enable-libspeex --enable-libfreetype --enable-version3 --enable-libtheora --enable-libvo-aacenc --disable-yasm
sudo make -j12
sudo make install
sudo make distclean
hash -r




#Compilation Guide RHEL6 (used for RHEL5)
#http://ffmpeg.org/trac/ffmpeg/wiki/CentosCompilationGuide


# larger setup
## ./configure --enable-gpl --enable-libmp3lame --enable-libtheora --enable-libvo-aacenc --enable-libvorbis --enable-libvpx --enable-libx264 --enable-version3 --enable-pthreads --enable-libfaac --enable-libxvid --enable-nonfree   --disable-ffserver --disable-mmx  
