#!/bin/bash

# Script that download and installs the AVR-GCC Toolchain
# Run this script without root privileges.
# Copyright: Julio C. Echeverri M. 2017

cd ${HOME}
wget http://www.atmel.com/images/avr8-gnu-toolchain-3.5.4.1709-linux.any.x86_64.tar.gz
tar -xvf avr8-gnu-toolchain-3.5.4.1709-linux.any.x86_64.tar.gz
rm avr8-gnu-toolchain-3.5.4.1709-linux.any.x86_64.tar.gz

# Modify the PATH evironment variable to link avr-gcc tools
echo 'PATH=$PATH:~/avr8-gnu-toolchain-linux_x86_64/bin/' >> ~/.bashrc
echo 'export PATH' >> ~/.bashrc

