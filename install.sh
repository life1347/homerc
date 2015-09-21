#!/bin/sh
cd `dirname $0`
now=`date "+%Y%m%d%H%M%S"`
pwd=`pwd`
change_file(){
    hrc=${HOME}/${rc}
    if [ -e ${hrc} ] ;then
        if [ -z "`diff -q ${rc} $hrc`"  ] ;then
            echo "[Keep]    ${hrc}"
            return
        fi
        echo "[Update]  ${hrc}"
        mv ${hrc} ${hrc}.${now}.bak
    else
        echo "[Create]  ${hrc}"
    fi
    cp ${pwd}/${rc} ${hrc}
}
for rc in .*rc .*profile ;
do
change_file ${rc}
done
# check fish shell is exist
fish_path=$(cat /etc/shells |grep fish)
if [ ! $fish_path ]; then
    test -e /etc/debian_version && DIST="Debian"
    grep Ubuntu /etc/lsb-release &> /dev/null && DIST="Ubuntu"
    if [ "$DIST" = "Ubuntu" ] || [ "$DIST" = "Debian" ]; then
        install='sudo apt-get -y install'
        remove='sudo apt-get -y remove'
        pkginst='sudo dpkg -i'
        $install screen vim fish
    fi
    if ! echo $DIST | egrep 'Ubuntu|Debian'; then
        echo '[WARNING]  Fish not installed'
        echo '[WARNING]  Install.sh currently only supports Ubuntu and Debian.'
        exit 1
    fi
    fish_path=$(cat /etc/shells |grep fish)
fi
chsh -s $fish_path
install -d ~/.ssh/config
cp -r .ssh/config ~/.ssh/config
install -d ~/.config
cp -r fish ~/.config
