#/bin/bash

if [ -f /etc/os-release ]; then
    . /etc/os-release

    if [ "$ID" == "arch" ]; then
        pacman -Syu --noconfirm

        # oh-my-zsh
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime && sh ~/.vim_runtime/install_awesome_vimrc.sh
        cd /tmp/ && curl -O https://blackarch.org/strap.sh && chmod +x strap.sh && ./strap.sh && rm -rf /tmp/*
    fi
fi

cp ./.zprofile $HOME/.zprofile
cp ./.zshrc $HOME/.zshrc
cp ./.tmux.conf $HOME/.tmux.conf

sudo cp ./.zprofile /root/.zprofile
sudo cp ./.zshrc    /root/.zshrc
sudo cp ./.tmux.conf /root/.tmux.conf

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/scripts/install_plugins.sh
