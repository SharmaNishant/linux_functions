" ------------------------------------------------------------------------------
if &term =~ '^screen'
   " tmux will send xterm-style keys when its xterm-keys option is on
   execute "set <xUp>=\e[1;*A"
   execute "set <xDown>=\e[1;*B"
   execute "set <xRight>=\e[1;*C"
   execute "set <xLeft>=\e[1;*D"
endif
" ------------------------------------------------------------------------------

" ================ Split navigations ========================
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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


