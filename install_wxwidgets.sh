#/bin/bash

# This will installs the latest stable release of wxWidgets library on your Linux system
# Don't run this script as root user, just enter your password when you be sked for it.

# Gets some dependencies
sudo apt-get install libgtk-3-dev build-essential checkinstall

cd ${HOME}

# Gets the latest stable release (sinse March 2017)
wget -O wxWidgets.tar.bz2 https://github.com/wxWidgets/wxWidgets/releases/download/v3.0.2/wxWidgets-3.0.2.tar.bz2
tar -jxvf wxWidgets.tar.bz2
cd wxWidgets-3.0.2/
mkdir -p my_build
cd my_build/

# Ready to build the wx library
../configure --disable-shared --enable-unicode
make

# Makes an auxiliary script
printf "#!/bin/bash\n\ncheckinstall\n\n">install_widgets.sh
chmod u+x install_widgets.sh

# Installation with checkinstall (this script automatically answer the questions)
DESCRIPTION="The wxWidgets Package"
PKGNAME="wxWidgets"
VERSION="3.0.2"
REQUIREMENTS="libgtk-3-dev build-essential"
MAINTAINER="wxwidgets.org (script by Julio Echeverri)"
LOCATION=${PWD}
PROVIDES="C++ GUI Framework developement"
printf "y\n${DESCRIPTION}\n\n0\n${MAINTAINER}\n2\n${PKGNAME}\n3\n${VERSION}\n8\n${LOCATION}\n13\n${PKGNAME}\nn\n"| sudo ./install_widgets.sh


# Clean all the things
cd ${HOME}
rm wxWidgets.tar.bz2

echo " "
echo " "
echo "******************************************************************************"
echo "Congratulations, you installed the wxWidgets library."
echo "You can now build a wxWidgets base application."
echo "At the end of the following web you can see an build an example to test this installation process"
echo " "
echo "https://julioecheverri.wordpress.com/2016/07/21/como-compilar-e-instalar-wxwidgets-en-debianubuntulinuxmint-y-derivados/"
echo " "
echo "******************************************************************************"


