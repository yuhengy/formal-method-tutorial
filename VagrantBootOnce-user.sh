#!/usr/bin/env bash


# STEP coq
opam init --yes --shell-setup && opam pin add coq 8.15.0 --yes


# STEP frap
git clone https://github.com/achlipala/frap.git
cd frap
git checkout 172716c8ef4a30011399dfc837c3936b28ff1fcc
make -j4 lib


# STEP vimrc
git clone https://github.com/VundleVim/Vundle.vim.git /home/vagrant/.vim/bundle/Vundle.vim
cp /vagrant/vimrc /home/vagrant/.vimrc
vim +PluginInstall +qa


