#!/bin/bash

DEFCONFIG=odroidxu4_defconfig

if [ $# -ne 1 ]; then
    exit
fi


cp script/*.sh $1/
cp script/${DEFCONFIG} $1/arch/arm/configs/
