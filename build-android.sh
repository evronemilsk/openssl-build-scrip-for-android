#see https://github.com/openssl/openssl/blob/master/NOTES.ANDROID

#openssl源码目录
_OPENSSL_ROOT=$HOME/openssl
#输出目录
_OUTPUT_DIR=$HOME/openssl-output
#android ndk根目录
_ANDROID_NDK_ROOT=$HOME/android-ndk-r16b
#android api level
_ANDROID_API=27
#工具链
_ANDROID_EABI=arm-linux-androideabi-4.9
#供Configure命令用于生成对应的Makefile，./Configure LIST命令查看支持的系统
_ANDROID_ARCH=android-arm

cd $_OPENSSL_ROOT
make clean
rm -rf $_OUTPUT_DIR/android-$_ANDROID_API
mkdir -p $_OUTPUT_DIR/android-$_ANDROID_API

export ANDROID_NDK=$_ANDROID_NDK_ROOT
export PATH=$ANDROID_NDK/toolchains/$_ANDROID_EABI/prebuilt/linux-x86_64/bin:$PATH
./Configure $_TARGET_OS -D__ANDROID_API__=$_ANDROID_API --openssldir=$_OUTPUT_DIR/android-$_ANDROID_API/android-$_ANDROID_ARCH
make && make install
