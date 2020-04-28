" ------------------------------------------------------------------------------
" Plugins will be downloaded under the specified directory.
" ------------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" FZF
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Colorschemes
Plug 'romainl/Apprentice'
Plug 'morhetz/gruvbox'
Plug 'blueshirts/darcula'

"

Plug 'rhysd/vim-clang-format'
" Plug 'taketwo/vim-ros'

Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'shime/vim-livedown'
"Plug 'edkolev/tmuxline.vim'

" " Autocompletion
Plug 'w0rp/ale'
" " Plug 'zxqfl/tabnine-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-rls', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
"
" " Syntax and language integration
Plug 'octol/vim-cpp-enhanced-highlight'
"
" " Interface
" Plug 'tpope/vim-vinegar'
" Plug 'simnalamburt/vim-mundo'
" Plug 'majutsushi/tagbar'
" Plug 'itchyny/lightline.vim'
" Plug 'maximbaz/lightline-ale'
" Plug 'kshenoy/vim-signature'
" Plug 'kassio/neoterm'
" Plug 'rbong/galvanize.vim'
" Plug 'Valloric/ListToggle'
" Plug 'equalsraf/neovim-gui-shim'

call plug#end()
" ------------------------------------------------------------------------------
