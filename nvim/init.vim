" NVim customizations
"
" Author: Nishant Sharma <'nishants1994' at gmail>

" ------------------------------------------------------------------------------
" Load / Install latest vim-plug plugin manager
" ------------------------------------------------------------------------------
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/general.vim
source ~/.config/nvim/keybindings.vim
source ~/.config/nvim/plugin_configs.vim
source ~/.config/nvim/coc.vim

