" Vim customizations (version: 8.0) 
"
" Author: Nishant Sharma <'nishants1994' at gmail>

" ------------------------------------------------------------------------------
" FIXS
" ------------------------------------------------------------------------------
" Fix terminal brackted mode after exiting vim
" Link: https://unix.stackexchange.com/a/400717/172903
set t_BE=
set term=xterm-256color
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Load / Install latest vim-plug plugin manager
" ------------------------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ------------------------------------------------------------------------------
" Plugins will be downloaded under the specified directory.
" ------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/bash-support.vim'
Plug 'tpope/vim-fugitive'
Plug 'romainl/Apprentice'
Plug 'rhysd/vim-clang-format'
Plug 'taketwo/vim-ros'
call plug#end()
" ------------------------------------------------------------------------------

" set relativenumber
set number
set paste
syntax enable

set hlsearch
set ignorecase
set smartcase

" set cursorline
" hi CursorLine term=bold cterm=bold guibg=Gray20

set spell
hi clear SpellBad
hi SpellBad cterm=underline

set colorcolumn=80
autocmd FileType c,cpp,h,hpp set colorcolumn=100
highlight ColorColumn ctermbg=238

set list
set listchars=trail:·,tab:▸\ 

set mouse=a

colorscheme apprentice
" ------------------------------------------------------------------------------
" expand tabs into spaces
" ------------------------------------------------------------------------------
set expandtab
" turn off expandtab for make files
autocmd FileType make setlocal noexpandtab
autocmd BufRead *Makefile setlocal noexpandtab
" number of visual spaces per TAB
set tabstop=4
" number of spaces in tab when editing
set softtabstop=4
" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
if &term =~ '^screen'
   " tmux will send xterm-style keys when its xterm-keys option is on
   execute "set <xUp>=\e[1;*A"
   execute "set <xDown>=\e[1;*B"
   execute "set <xRight>=\e[1;*C"
   execute "set <xLeft>=\e[1;*D"
endif
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"split navigations
" ------------------------------------------------------------------------------
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Powerline related settings
" ------------------------------------------------------------------------------
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Always display the statusline in all windows
set laststatus=2
" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowmode
" ------------------------------------------------------------------------------
