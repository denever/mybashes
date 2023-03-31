#!/bin/bash

ln -sf $PWD/mybashrc $HOME/.mybashrc
ln -sf $PWD/bash_aliases $HOME/.bash_aliases

ln -sf $PWD/vs $HOME/bin
ln -sf $PWD/startprj $HOME/bin


# installing include in .bashrc
cat >> ~/.bashrc <<EOF

# Include custom bashrc from mybashes
if [ -f ~/.mybashrc ]; then
    . ~/.mybashrc
fi
EOF
