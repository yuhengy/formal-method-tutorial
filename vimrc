" ------------- Vundle Begin -------------
" Execute git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim first

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'whonore/Coqtail'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Run :PluginInstall
" ------------- Vundle End -------------

nnoremap <C-j> :CoqNext<CR>
nnoremap <C-k> :CoqUndo<CR>

