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
    source ${hrc}
    echo ${hrc}
}
for rc in .*rc .*profile ;
do
change_file ${rc}
done
#source ~/.bashrc
rm -rf ~/.oh-my-zsh
cp -r ./.oh-my-zsh ~/.oh-my-zsh
chsh -s /bin/zsh
