
" Don't load the defx-git plugin file, not needed
let b:defx_git_loaded = 1

"CoC configlet
let g:coc_status_error_sign = ''
let g:coc_status_warning_sign = ' '
let g:coc_global_extensions =[
      \ 'coc-actions',
      \ 'coc-css',
      \ 'coc-eslint',
      \ 'coc-emmet',
      \ 'coc-emoji',
      \ 'coc-html',
      \ 'coc-git',
      \ 'coc-gitignore',
      \ 'coc-floaterm',
      \ 'coc-json',
      \ 'coc-java',
      \ 'coc-kite',
      \ 'coc-lists',
      \ 'coc-marketplace',
      \ 'coc-post',
      \ 'coc-prettier',
      \ 'coc-python',
      \ 'coc-tabnine',
      \ 'coc-template',
      \ 'coc-todolist',
      \ 'coc-tsserver',
      \ 'coc-snippets',
      \ 'coc-spell-checker',
      \ 'coc-stylelint',
      \ 'coc-vetur',
      \ 'coc-vimlsp',
      \ 'coc-vimtex',
      \ 'coc-yaml',
      \ 'coc-yank']

augroup MyAutoCmd
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
augroup end

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Snippets jump
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

" Use <TAB> for select text for visual placeholder of snippet.
" Visual mode and other Ultisnips tricks tutorial blog
" https://yufanlu.net/2016/10/30/ultisnips/
vmap <TAB> <Plug>(coc-snippets-select)

inoremap <silent><expr> <Tab>
    \ pumvisible() ? coc#_select_confirm() :
    \ coc#expandableOrJumpable()  ?
    \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

" Integration with delimitMate plugin. Also ignores completion.
inoremap <silent><expr> <CR>
    \ delimitMate#WithinEmptyPair() ?
    \ "\<C-R>=delimitMate#ExpandReturn()\<CR>" :
    \ pumvisible() ? "\<C-]>\<CR>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
