#/bin/bash

if [ -f /etc/os-release ]; then
    . /etc/os-release

    if [ "$ID" == "arch" ]; then
        pacman -Syy --noconfirm && \
        pacman -S --noconfirm --disable-download-timeout --verbose \
        aws-cli \
        ca-certificates \
        cifs-utils \
        curl \
        dnsutils \
        file \
        freerdp \
        git \
        gnupg \
        grep \
        htop \
        iputils \
        jq \
        openldap \
        net-tools \
        gnu-netcat \
        nfs-utils \
        openssl \
        proxychains \
        python3 \
        python-pip \
        smbclient \
        openssh \
        git \
        which \
        tmux \
        tree \
        tzdata \
        unzip \
        vim \
        whois \
        xclip \
        go \
        zip \
        nmap \
        zsh

        # oh-my-zsh
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime && sh ~/.vim_runtime/install_awesome_vimrc.sh
        cd /tmp/ && curl -O https://blackarch.org/strap.sh && chmod +x strap.sh && ./strap.sh && rm -rf /tmp/*

        useradd -m -G wheel -s /bin/bash t1d3nio
        sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers



    fi
fi

curl -o $HOME/.zprofile https://raw.githubusercontent.com/x90skysn3k/dotfiles/main/.zprofile
curl -o $HOME/.zshrc https://raw.githubusercontent.com/x90skysn3k/dotfiles/main/.zshrc

chsh -s $(which zsh)
