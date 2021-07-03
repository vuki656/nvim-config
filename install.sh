#!/bin/sh

################################################################################################
#-------------------------------------- LSPs --------------------------------------------------#
################################################################################################ 

install_lsps() {
    npm i -g vscode-css-languageserver-bin
    npm i -g bash-language-server
    npm i -g diagnostic-languageserver
    npm i -g dockerfile-language-server-nodejs
    npm i -g graphql-language-service-cli
    npm i -g vscode-html-languageserver-bin
    npm i -g vscode-json-languageserver
    npm i -g typescript typescript-language-server
    npm i -g vim-language-server
    npm i -g yaml-language-server
}

################################################################################################
#-------------------------------------- NEOVIM ------------------------------------------------#
################################################################################################ 

install_nvim() {
    sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip -y

    cd ~/
    git clone https://github.com/neovim/neovim
    cd neovim && make -j4
    sudo make install
}

################################################################################################
#----------------------------------------------------------------------------------------------#
################################################################################################ 

if [ $1 == 'a' ]
then
    install_lsps
    install_nvim
fi

if [ $1 == 'l' ]
then
    install_lsps
fi

if [ $1 == 'n' ]
then
    install_nvim
fi
