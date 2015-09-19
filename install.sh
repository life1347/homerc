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
if [[ $fish_path ]]; then
    chsh -s $fish_path
else
    echo '[WARNING]  Fish not installed'
fi
cp -r .ssh/config ~/.ssh/config
cp -r fish ~/.config
