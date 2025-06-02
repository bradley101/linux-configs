#!/bin/bash

subscription-manager register --username $SUBS_EMAIL --password $SUBS_PASSW
ret=$?
if [ $ret -ne 0 ] && [ $ret -ne 64 ] ; then
        echo "Subscription manager registeration failed" > /dev/stderr
        exit 1
fi

yum install cargo tmux vim tree -y
cargo install ripgrep

cat <<EOF >> ~/.myconfigrc
export PATH=\$PATH:\$HOME/.cargo/bin
alias less="less -N"
EOF

cat "source ~/.myconfigrc" >> ~/.bashrc
