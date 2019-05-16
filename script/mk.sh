export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
export PATH=/opt/toolchains/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/bin/:$PATH

make odroidxu4_defconfig
make clean
make -j 8

NOW=$(date +"%Y%m%d")
rm -rf target_$NOW
mkdir target_$NOW
mkdir target_$NOW/boot/
make modules_install ARCH=arm INSTALL_MOD_PATH=./target_$NOW
cp -f arch/arm/boot/zImage target_$NOW/boot
cp -f arch/arm/boot/dts/exynos5422-odroidxu3.dtb target_$NOW/boot/
cp -f arch/arm/boot/dts/exynos5422-odroidxu4.dtb target_$NOW/boot
cp -f arch/arm/boot/dts/exynos5422-odroidxu3-lite.dtb target_$NOW/boot
cp -f arch/arm/boot/dts/exynos5422-odroidhc1.dtb target_$NOW/boot

kver=`make kernelrelease`

rm -rf target_${NOW}/lib/modules/${kver}/build
rm -rf target_${NOW}/lib/modules/${kver}/source

echo kver=${kver} | cat - update.sh > target_${NOW}/update.sh

tar zcvf ../odroid_${kver}_${NOW}.tgz target_${NOW}/

