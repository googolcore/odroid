# Odroid hc1을 위한 커널 크로스 컴파일

## 사전 준비물
* 리눅스 커널 소스 파일 (https://www.kernel.org/)
* 크로스 컴파일러
* 여기 올려 놓은 스크립트와 config 파일

***
## 사전 준비 단계

1. 크로스 컴파일러 다운로드 및 설치

***
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

***
## 적용 방법
1. 추후 작성
