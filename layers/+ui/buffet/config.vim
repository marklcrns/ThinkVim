
let g:buffet_always_show_tabline = 0
let g:buffet_use_devicons = 1
let g:buffet_show_index = 1
" let g:buffet_separator = ""
" let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"

function! g:BuffetSetCustomColors()
    hi! BuffetCurrentBuffer cterm=NONE ctermbg=106 ctermfg=8 guibg=#b8bb26 guifg=#000000
    hi! BuffetTrunc cterm=bold ctermbg=10 ctermfg=8 guibg=##999999 guifg=#000000
    hi! BuffetBuffer cterm=NONE ctermbg=239 ctermfg=8 guibg=#504945 guifg=#000000
    hi! BuffetTab cterm=NONE ctermbg=66 ctermfg=8 guibg=#458588 guifg=#000000
    hi! BuffetActiveBuffer cterm=NONE ctermbg=10 ctermfg=239 guibg=#504945 guifg=#000000
endfunction
