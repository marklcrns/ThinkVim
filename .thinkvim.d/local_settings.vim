"--------------------------------------------------
" Kite Configs
"--------------------------------------------------

" set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P

" Enable autocompletion
let g:kite_auto_complete=1
let g:kite_tab_complete=1

set completeopt-=menu
set completeopt+=menuone   " Show the completions UI even with only 1 item
set completeopt-=longest   " Don't insert the longest common text
set completeopt-=preview   " Hide the documentation preview window
set completeopt+=noinsert  " Don't insert text automatically
set completeopt-=noselect  " Highlight the first completion automatically

" Enables placeholder jumping
let g:kite_previous_placeholder='<C-k>'
let g:kite_next_placeholder='<C-j>'

" Enables kite snippets
let g:kite_snippets=1

