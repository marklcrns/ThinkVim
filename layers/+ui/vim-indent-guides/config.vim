
let g:indent_guides_tab_guides = 0
let g:indent_guides_color_change_percent = 3
let g:indent_guides_default_mapping = 0
let g:indent_guides_guide_size = 1
let g:indent_exclude =
    \ [ 'help', 'denite', 'codi', 'vista', 'coc', 'fzf' ]
let g:indent_guides_exclude_filetypes =
    \ [ 'help', 'terminal', 'defx', 'denite', 'nerdtree',
    \ 'startify', 'tagbar', 'vista_kind', 'vista', 'fzf',
    \ 'codi', 'which_key', 'calendar', 'coc', 'floaterm',
    \ 'any-jump', 'anyjump', 'coc-explorer' ]

" Manual auto disable if exclude does not work
" autocmd Filetype any-jump
"    \ autocmd BufWinEnter <buffer> IndentGuidesDisable
" autocmd Filetype any-jump
"    \ autocmd BufWinLeave <buffer> IndentGuidesEnable
" 
" au BufEnter any-jump.* IndentGuidesDisable
" au BufLeave any-jump.* IndentGuidesEnable
