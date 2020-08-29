" Let coc.nvim coc-ultisnips plugin handle the expand trigger mapping
" See coc configs
let g:UltiSnipsExpandTrigger = "<NOP>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
let g:UltiSnipsSnippetDirectories = [
      \ $DATA_PATH . "/dein/repos/github.com/honza/vim-snippets/UltiSnips",
      \ $HOME . "/.vim/UltiSnips/"
      \ ]

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit = "vertical"

function! IsExpandable()
  return !(
        \ col('.') <= 1
        \ || !empty(matchstr(getline('.'), '\%' . (col('.') - 1) . 'c\s'))
        \ || empty(UltiSnips#SnippetsInCurrentScope())
        \ )
endfunction
