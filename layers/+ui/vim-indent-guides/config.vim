
let g:indent_guides_color_change_percent = 3
let g:indent_guides_autocmds_enabled = 0
let g:indent_guides_default_mapping = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_indent_levels = 25
let g:indent_exclude = [ 'help', 'denite', 'codi', 'vista', 'coc' ]
let g:indent_guides_exclude_filetypes =
    \ [ 'help', 'terminal', 'defx', 'denite', 'nerdtree',
    \ 'startify', 'tagbar', 'vista_kind', 'vista', 'fzf',
    \ 'codi', 'which_key', 'calendar', 'coc' ]
augroup user_plugin_indentguides
  autocmd!
  autocmd BufEnter *
  \ if ! empty(&l:filetype) && index(g:indent_exclude, &l:filetype) == -1
  \|   if g:indent_guides_autocmds_enabled == 0 && &l:expandtab
  \|     IndentGuidesEnable
  \|   elseif g:indent_guides_autocmds_enabled == 1 && ! &l:expandtab
  \|     IndentGuidesDisable
  \|   endif
  \| endif
augroup END
if ! has('vim_starting')
  doautocmd <nomodeline> user_plugin_indentguides BufEnter
endif

