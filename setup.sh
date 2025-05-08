
#
# 1. network setup
#
# $ edit /etc/netplan/50-cloud-init.yaml
#
# network:
#   ethernets:
#    enp0s3:
#     dhcp4: true
#   enp0s8:
#     dhcp4: false
#     addresses: [192.168.56.3/24]
# version: 2

# 2. nettool, vim
sudo apt-get install vim
sudo apt-get install net-tools
sudo apt-get install git

# 3. VIM Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 4. NVM
$curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash$nvm install --lts


# 5. Virtualenv
$sudo apt install python3-pip
$python3 -m pip install --user --upgrade virtualenv
$python3 -m pip install --user --upgrade virtualenvwrapper

# 6. vim compile
# ./configure \
#   vim_cv_timer_create=no \
#   --with-features=huge \
#   --enable-multibyte \
#   --enable-pythoninterp=yes \
#   --enable-python3interp=yes \
#   --prefix=$HOME/.local \

