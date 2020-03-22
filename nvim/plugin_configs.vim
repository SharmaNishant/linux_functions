" ================ colorscheme ========================
" colorscheme apprentice
" colorscheme darcula

let g:gruvbox_italic=1
colorscheme gruvbox


" Use powerline symbols for airline
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline_powerline_fonts = 1


" auto clang format a file on save
let g:clang_format#command = '/usr/bin/clang-format-9'
let g:clang_format#auto_format = 1
let g:clang_format#detect_style_file = 1
