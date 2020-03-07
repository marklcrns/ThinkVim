
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsListSnippets = "<C-Tab>"
let g:UltiSnipsJumpForwardTrigger = "<CR>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit = "vertical"

let g:ulti_expand_or_jump_res = 0 "default value, just set once
function! Ulti_ExpandOrJump_and_getRes()
  call UltiSnips#ExpandSnippetOrJump()
  return g:ulti_expand_or_jump_res
endfunction

inoremap <expr> <Tab> (g:Ulti_ExpandOrJump_and_getRes() > 0) ? "" : "IMAP_Jumpfunc('', 0)<CR>"
