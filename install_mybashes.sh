#!/bin/bash

ln -sf $PWD/bashrc $HOME/.mybashrc
ln -sf $PWD/bash_aliases $HOME/.bash_aliases
ln -sf $PWD/bash_functions $HOME/.bash_functions

ln -sf $PWD/vs $HOME/bin

# installing include in .bashrc
cat >> ~/.bashrc <<EOF

# Include custom bashrc from mybashes
if [ -f ~/.mybashrc ]; then
    . ~/.mybashrc
fi
EOF
