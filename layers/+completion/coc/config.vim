" Don't load the defx-git plugin file, not needed
let b:defx_git_loaded = 1

" CoC config
let g:coc_status_error_sign = ''
let g:coc_status_warning_sign = ' '
let g:coc_global_extensions = [
      \ 'coc-actions',
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

augroup MyAutoCmd
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
augroup end

inoremap <silent><expr> <Tab>
     \ pumvisible() ? coc#_select_confirm() :
     \ "\<TAB>"

" Integration with delimitMate plugin. Also ignores completion.
inoremap <silent><expr> <CR>
     \ delimitMate#WithinEmptyPair() ?
     \ "\<C-R>=delimitMate#ExpandReturn()\<CR>" :
     \ pumvisible() ? "\<C-]>\<CR>" : "\<C-g>u\<CR>"

