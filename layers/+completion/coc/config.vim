" Don't load the defx-git plugin file, not needed
let b:defx_git_loaded = 1

" CoC config
let g:coc_status_error_sign = ''
let g:coc_status_warning_sign = ' '
let g:coc_global_extensions = [
      \ 'coc-clangd',
      \ 'coc-css',
      \ 'coc-dictionary',
      \ 'coc-emmet',
      \ 'coc-emoji',
      \ 'coc-eslint',
      \ 'coc-explorer',
      \ 'coc-floaterm',
      \ 'coc-git',
      \ 'coc-gitignore',
      \ 'coc-html',
      \ 'coc-java',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-markdownlint',
      \ 'coc-marketplace',
      \ 'coc-post',
      \ 'coc-prettier',
      \ 'coc-python',
      \ 'coc-ultisnips',
      \ 'coc-sh',
      \ 'coc-spell-checker',
      \ 'coc-stylelint',
      \ 'coc-tag',
      \ 'coc-template',
      \ 'coc-tsserver',
      \ 'coc-vetur',
      \ 'coc-vimlsp',
      \ 'coc-vimtex',
      \ 'coc-word',
      \ 'coc-xml',
      \ 'coc-yaml',
      \ 'coc-yank',
      \ ]
      "\ 'coc-tabnine',

augroup CocAutoCmd
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
augroup end


" Ref: https://stackoverflow.com/a/61275100/11850077
"      https://github.com/vim/vim/issues/2004#issuecomment-324357529
function! IntegratedCocTab() abort
  " First, try to expand or jump on UltiSnips.
  let snippet = UltiSnips#ExpandSnippet()
  if g:ulti_expand_res > 0
    return snippet
  endif
  " Then, check if we're in a completion menu
  if pumvisible()
    return coc#_select_confirm()
  endif
  " Finally, do regular tab if no trigger
  return "\<Tab>"
endfunction

" Integration with delimitMate and Ultisnips
autocmd FileType * inoremap <silent> <Tab>
      \ <C-R>=IntegratedCocTab()<CR>
" Integration with delimitMate plugin. Also ignores completion.
inoremap <silent><expr> <CR>
      \ delimitMate#WithinEmptyPair() ?
      \ "\<C-R>=delimitMate#ExpandReturn()\<CR>" :
      \ pumvisible() ? "\<C-]>\<CR>" : "\<C-g>u\<CR>"

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold   :call CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR     :call CocAction('runCommand', 'editor.action.organizeImport')
