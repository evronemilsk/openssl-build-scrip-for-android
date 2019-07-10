#see https://github.com/openssl/openssl/blob/master/NOTES.ANDROID

#供Configure命令用于生成对应的Makefile，./Configure LIST命令查看支持的系统
#_ANDROID_ARCH=android-arm
#_ANDROID_ARCH=android-arm64
#_ANDROID_ARCH=android-x86
_ANDROID_ARCH=android-x86_64
#openssl源码目录
_OPENSSL_ROOT=$HOME/my/openssl
#输出目录
_OUTPUT_DIR=$HOME/my/openssl-output
#android ndk根目录
#_ANDROID_NDK_ROOT=$HOME/my/my-toolchain-arm-16
#_ANDROID_NDK_ROOT=$HOME/my/my-toolchain-arm64-21
#_ANDROID_NDK_ROOT=$HOME/my/my-toolchain-x86-16
_ANDROID_NDK_ROOT=$HOME/my/my-toolchain-x86_64-21
#android api level
#_ANDROID_API=16
_ANDROID_API=21
#工具链
#_ANDROID_EABI=arm-linux-androideabi-4.9
#_ANDROID_EABI=aarch64-linux-android-4.9
#_ANDROID_EABI=x86-4.9
_ANDROID_EABI=x86_64-4.9



cd $_OPENSSL_ROOT
make clean
rm -rf $_OUTPUT_DIR/android-$_ANDROID_API/$_ANDROID_ARCH
mkdir -p $_OUTPUT_DIR/android-$_ANDROID_API/$_ANDROID_ARCH

export ANDROID_NDK=$_ANDROID_NDK_ROOT
export PATH=$ANDROID_NDK/bin:$PATH

./Configure $_ANDROID_ARCH -D__ANDROID_API__=$_ANDROID_API shared no-md2 no-md4 no-mdc2 no-des no-rc2 no-rc4 no-rc5 no-idea no-bf no-cast no-ec no-dsa no-ecdsa no-dh no-ecdh no-camellia no-ssl2 no-ssl3 no-ssl no-tls no-rfc3779 no-comp no-hw no-engine no-idea no-dtls no-dtls1 no-dso no-nextprotoneg no-psk no-srp no-ec2m no-weak-ssl-ciphers -DOPENSSL_USE_IPV6=0 --openssldir=$_OUTPUT_DIR/android-$_ANDROID_API/$_ANDROID_ARCH --prefix=$_OUTPUT_DIR/android-$_ANDROID_API/$_ANDROID_ARCH

read -s -n1 -p "按任意键继续 ... "

make && make install
