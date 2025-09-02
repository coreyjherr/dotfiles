if ! command -v cargo >/dev/null 2>&1
then
    echo "cargo could not be found, installing now"
    curl https://sh.rustup.rs -sSf | sh
fi

# check if fd is installed, install with cargo if not
if ! command -v fd >/dev/null 2>&1
then
    echo "fd could not be found, installing now"
    cargo install fd-find
fi

# check if ripgrep is installed, install with cargo if not
if ! command -v rg >/dev/null 2>&1
then
    echo "ripgrep could not be found, installing now"
    cargo install ripgrep
fi

# install fzf
if ! command -v fzf >/dev/null 2>&1
then
    echo "fzf could not be found, installing now"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.local/fzf
    ~/.local/fzf/install
fi

# install zoxide
if ! command -v zoxide >/dev/null 2>&1
then
    echo  "zoxide could not be found, installing now"
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

if ! command -v atuin >/dev/null 2>&1
then
    echo  "atuin could not be found, installing now"
    curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
    atuin import auto
fi

# install neovim
if ! command -v nvim >/dev/null 2>&1
then
    echo  "nvim could not be found, installing now"
    wget https://github.com/neovim/neovim/releases/download/v0.11.3/nvim-linux-x86_64.tar.gz
    tar xzvf ./nvim-linux-x86_64.tar.gz
    mv ./nvim-linux-x86_64 ~/.local/nvim
    rm ./nvim-linux-x86_64.tar.gz
fi

# install starship
if ! command -v starship >/dev/null 2>&1
then
    curl -sS https://starship.rs/install.sh | sh -s -- -b ~/.local/bin -f 
fi

# install nvm and node
if ! command -v nvm >/dev/null 2>&1
then
    echo "nvm could not be found, installing now"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
    nvm install node
fi

source ~/.bashrc
