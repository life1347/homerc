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
if type "fish" > /dev/null; then
    if [ -e /usr/bin/fish ]; then
        chsh -s /usr/bin/fish
    fi
fi
cp -r .ssh/config ~/.ssh/config
cp -r fish ~/.config
