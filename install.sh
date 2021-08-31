#!/bin/sh

################################################################################################
#-------------------------------------- LSPs --------------------------------------------------#
################################################################################################

install_lsps() {
    npm i -g bash-language-server -y
    npm i -g diagnostic-languageserver -y
    npm i -g dockerfile-language-server-nodejs -y
    npm i -g graphql-language-service-cli -y
    npm i -g vscode-langservers-extracted -y
    npm i -g typescript typescript-language-server -y
    npm i -g @prisma/language-server -y
    npm i -g yaml-language-server -y

    luarocks install --dev teal-language-server
}

################################################################################################
#-------------------------------------- NEOVIM ------------------------------------------------#
################################################################################################

install_nvim() {
    sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip -y

    cd ~/ || return
    git clone https://github.com/neovim/neovim
    cd neovim && make -j4
    sudo make install
}

################################################################################################
#----------------------------------------------------------------------------------------------#
################################################################################################

if [ "$1" = 'a' ]; then
    install_lsps
    install_nvim
fi

if [ "$1" = 'l' ]; then
    install_lsps
fi

if [ "$1" = 'n' ]; then
    install_nvim
fi
