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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'shime/vim-livedown'
Plug 'edkolev/tmuxline.vim'
call plug#end()
" ------------------------------------------------------------------------------

" Use powerline symbols for airline
let g:airline_powerline_fonts = 1

" autosave files on focus change
:au FocusLost * :wa

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

" remove trailing whitespace before saving
autocmd BufWritePre * %s/\s\+$//e

set mouse=a

colorscheme apprentice
" ------------------------------------------------------------------------------
" expand tabs into spaces
" ------------------------------------------------------------------------------
set expandtab
" turn off expandtab for make,json files
autocmd FileType json setlocal noexpandtab
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

set splitbelow
set splitright

""Max out the height of the current split
"ctrl + w _
""Max out the width of the current split
"ctrl + w |
""Normalize all split sizes, which is very handy when resizing terminal
"ctrl + w =

""Swap top/bottom or left/right split
"Ctrl+W R
""Break out current window into a new tabview
"Ctrl+W T
""Close every window in the current tabview but the current one
"Ctrl+W o
" ------------------------------------------------------------------------------

" Always display the statusline in all windows
set laststatus=2
" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowmode
" ------------------------------------------------------------------------------

