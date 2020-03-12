" ================ General Config ====================
set number                          " Line numbers are good
set paste                           " Paste a test of stream

set cursorline                      " Highlight the line the cursor is on
" hi CursorLine term=bold cterm=bold guibg=Gray20
set colorcolumn=80                  " Highlight the character limit
autocmd FileType c set colorcolumn=100
autocmd FileType cpp set colorcolumn=100
autocmd FileType h set colorcolumn=100
autocmd FileType hpp set colorcolumn=100
autocmd FileType bzl set colorcolumn=100
autocmd FileType vim set colorcolumn=100
highlight ColorColumn ctermbg=238

set backspace=indent,eol,start      " Allow backspace in insert mode
set history=1000                    " Store lots of :cmdline history
set showcmd                         " Show incomplete cmds down the bottom
set gcr=a:blinkon0                  " Disable cursor blink
set visualbell                      " No sounds
set autoread                        " Reload files changed outside vim
set laststatus=2                    " Enabling statusline at all times
if &encoding != 'utf-8'
  set encoding=utf-8                " Necessary to show Unicode glyphs
endif
set spell                           " Spell checking
hi clear SpellBad                   " Don't highlight bad spellings
hi SpellBad cterm=underline         " Underline bad spellings
set noshowmode                      " Don't show the mode (airline is handling this)
set mouse=a                         " Mouse in terminal
set inccommand=nosplit              " use incremental replace
set diffopt+=vertical               " prefer vertical diffs
" set shortmess=OtI                   " disable start message
:au FocusLost * :wa                 " autosave files on focus change
syntax enable
set nowrap                          " Don't wrap lines
set linebreak                       " Wrap lines at convenient points
set ruler


" Display tabs and trailing spaces visually
set list listchars=trail:·,tab:┊\ ,extends:>,precedes:<,nbsp:·

" remove trailing whitespace before saving
autocmd BufWritePre * %s/\s\+$//e

filetype plugin on
filetype indent on


" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set expandtab

""" turn off expandtab for make,json files
autocmd FileType json setlocal noexpandtab
autocmd FileType make setlocal noexpandtab
autocmd BufRead *Makefile setlocal noexpandtab

set tabstop=4               " number of visual spaces per TAB
set softtabstop=4           " number of spaces in tab when editing
set shiftwidth=4            " when using the >> or << commands, shift lines by 4 spaces


" ================ Search Settings  =================

set hlsearch
set ignorecase
set smartcase
set incsearch        "Find the next match as we type the search
set viminfo='100,f1  "Save up to 100 marks, enable capital marks


" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile


