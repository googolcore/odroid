# Odroid hc1을 위한 커널 크로스 컴파일

## 준비물
* 리눅스 커널 소스 파일 (https://www.kernel.org/)
* 크로스 컴파일러
* 여기 올려 놓은 스크립트와 config 파일


## 사전 준비 단계

1. 크로스 컴파일러 다운로드
<pre>
# cd /opt/
# wget https://releases.linaro.org/components/toolchain/binaries/7.4-2019.02/arm-linux-gnueabihf/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf.tar.xz
</pre>
2. 압축 해제
<pre>
# xz -d gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf.tar.xz
# tar xvf gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf.tar
</pre>

## 사용법

1. 스크립트와 config 파일 다운로드
<pre>
# git clone https://github.com/googolcore/odroid.git
# cd odroid
</pre>
2. 리눅스 커널 소스 파일 다운로드 및 압축 해제
<pre>
# wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.1.2.tar.xz
# xz -d linux-5.1.2.tar.xz
# tar xvf linux-5.1.2.tar
</pre>
3. pre.sh 스크립트 실행
<pre>
# sh pre.sh linux-5.1.2
</pre>
4. 자동 컴파일 스크립트 실행
<pre>
# cd linux-5.1.2
# sh mk.sh
</pre>
5. 결과물 확인
<pre>
# cd ..
# ls *.tgz
odroid_5.1.2_20190516.tgz
</pre>


## 적용 방법
1. 생성된 파일을 odroid에 복사
2. 압축 해제
<pre>
# tar zxvf odroid_5.1.2_20190516.tgz
</pre>
3. 적용
<pre>
# cd target_20190516/
# sh update.sh
update-initramfs: Generating /boot/initrd.img-5.1.2
Image Name:   initrd.img-5.1.2
Created:      Thu May 16 16:37:23 2019
Image Type:   ARM Linux RAMDisk Image (gzip compressed)
Data Size:    8344383 Bytes = 8148.81 KiB = 7.96 MiB
Load Address: 00000000
Entry Point:  00000000
</pre>
4. 재부팅
<pre>
# reboot
</pre>
5. 확인
<pre>
# uname -a
Linux Venus 5.1.2 #1 SMP PREEMPT Thu May 16 16:21:17 KST 2019 armv7l armv7l armv7l GNU/Linux
</pre>
