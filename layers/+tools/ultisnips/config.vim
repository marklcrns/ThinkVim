let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
let g:UltiSnipsSnippetDirectories = [
      \ "~/.vim/UltiSnips/"
      \ ]

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit = "vertical"

" let g:ulti_expand_or_jump_res = 0 "default value, just set once
" function! Ulti_ExpandOrJump_and_getRes()
"   call UltiSnips#ExpandSnippetOrJump()
"   return g:ulti_expand_or_jump_res
" endfunction
"
" inoremap <expr> <Tab> (g:Ulti_ExpandOrJump_and_getRes() > 0) ? "" : "IMAP_Jumpfunc('', 0)<CR>"

