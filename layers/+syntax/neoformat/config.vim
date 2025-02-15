
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_try_formatprg = 1
let g:jsx_ext_required = 0
let g:neoformat_enabled_javascript=['eslint_d', 'prettier', 'js_beautify']
let g:neoformat_enabled_html=['html-beautify', 'prettier']
let g:neoformat_enabled_htmldjango=['html-beautify', 'prettier']
let g:neoformat_enabled_css=['prettier', 'stylelint']
let g:neoformat_enabled_python = ['autopep8', 'yapf', 'black']

" Format on save
" augroup fmt
"   autocmd!
"   " undojoin lets redo 'u' revert changes with neoformat as well
"   " autocmd BufWritePre * undojoin | Neoformat
"   autocmd BufWritePre * Neoformat
" augroup END
