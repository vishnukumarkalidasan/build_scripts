#!/bin/bash

wget https://github.com/graalvm/labs-openjdk-17/releases/download/jvmci-22.3-b08/labsjdk-ce-17.0.5+8-jvmci-22.3-b08-debug-linux-aarch64.tar.gz

mkdir labsjdk-lib && tar xf labsjdk-ce-17.0.5+8-jvmci-22.3-b08-debug-linux-aarch64.tar.gz -C labsjdk-lib --strip-components 1

export JAVA_HOME=$(pwd)/labsjdk-lib
export PATH=$JAVA_HOME/bin:$PATH

git clone https://github.com/vishnukumarkalidasan/graal_labs-openjdk-17.git -b jdk_x86

source ./envv

cd graal_labs-openjdk-17
export JVMCI_VERSION=jvmci-22.3-b08

sudo apt-get update
sudo apt-get install libx11-dev libxext-dev libxrender-dev libxrandr-dev libxtst-dev libxt-dev -y
sudo apt-get install libcups2-dev -y
sudo apt-get install libfontconfig1-dev -y
sudo apt-get install libasound2-dev -y
sudo apt-get install libffi-dev -y

sh configure --with-conf-name=labsjdk     --with-version-opt=$JVMCI_VERSION     --with-version-pre=     '--with-vendor-name=GraalVM Community'     --with-vendor-url=https://www.graalvm.org/     --with-vendor-bug-url=https://github.com/oracle/graal/issues     --with-vendor-vm-bug-url=https://github.com/oracle/graal/issues

make CONF_NAME=labsjdk JOB=8 > /dev/null

cp ../hsdis-amd64.so build/labsjdk/jdk/lib
cp ../hsdis-aarch64.so build/labsjdk/jdk/lib

echo "jdk libs at path:"
echo $(pwd)/build/labsjdk/jdk

echo "export env before running HelloWorld using below commands"
echo "$ export JAVA_HOME="$(pwd)/build/labsjdk/jdk
echo "$ export PATH=\$JAVA_HOME/bin:\$PATH"

