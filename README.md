# openssl-build-scrip-for-android

Shell script for compile openssl source code for android platform.

Tools:   
Openssl v1.1.1  
linux-x86_64  
android-ndk-r16b  
   
Use:
1.Download openssl source code
2.Download android ndk
3.Make standlone build toolchain by make-standalone-toolchain.sh in <ndk>/build/tools directory
4.Modify build-android.sh, set correct configure params
5.Run build-android.sh script on linux sys.

. ./build-android.sh  

GNU GENERAL PUBLIC LICENSE
                       Version 3, 29 June 2007

 Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.
