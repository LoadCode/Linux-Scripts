#/bin/bash
# Author: Julio César Echeverri Marulanda  <julio.em7@gmail.com>
#
# This script will install the latest stable release of wxWidgets library on your Linux system
# Don't run this script as root user, just enter your password when you be sked for it.

# Gets some dependencies
sudo apt-get install libgtk-3-dev build-essential checkinstall zip unzip

cd ${HOME}

# Gets the latest stable release (until June 2017)
wget -O wxWidgets.zip https://github.com/wxWidgets/wxWidgets/archive/v3.0.3.1.zip
unzip wxWidgets.zip
cd wxWidgets-*/
mkdir -p my_build
cd my_build/

# Makes an auxiliary script
printf "#!/bin/bash\n\ncheckinstall\n\n">install_widgets.sh
chmod u+x install_widgets.sh

# Ready to build the wx library
../configure --disable-shared --enable-unicode
make


# Installation with checkinstall (this script automatically answer the questions)
DESCRIPTION="The wxWidgets Package"
PKGNAME="wxWidgets"
VERSION="3.0.3.1"
REQUIREMENTS="libgtk-3-dev build-essential"
MAINTAINER="wxwidgets.org (script by Julio Echeverri)"
LOCATION=${PWD}
PROVIDES="C++ GUI Framework developement"

printf "y\n${DESCRIPTION}\n\n0\n${MAINTAINER}\n2\n${PKGNAME}\n3\n${VERSION}\n8\n${LOCATION}\n13\n${PKGNAME}\nn\n"| sudo ./install_widgets.sh


# Clean all the things
cd ${HOME}
rm wxWidgets.zip
rm -rf wxWidgets-*/

echo " "
echo " "
echo " "
echo " "
echo " "
echo "***************************************************************************************************************************"
echo "Congratulations, you installed the wxWidgets library."
echo "You can now build a wxWidgets based application."
echo "At the end of the following web you can see and build an example to test the success of this installation process"
echo " "
echo "https://julioecheverri.wordpress.com/2016/07/21/como-compilar-e-instalar-wxwidgets-en-debianubuntulinuxmint-y-derivados/"
echo " "
echo "***************************************************************************************************************************"


