
" Don't load the defx-git plugin file, not needed
let b:defx_git_loaded = 1

"CoC configlet
let g:coc_status_error_sign = '•'
let g:coc_status_warning_sign = '•'
let g:coc_global_extensions =[
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-vetur',
      \ 'coc-snippets',
      \ 'coc-prettier',
      \ 'coc-eslint',
      \ 'coc-emmet',
      \ 'coc-tsserver',
      \ 'coc-json',
      \ 'coc-java',
      \ 'coc-python',
      \ 'coc-highlight',
      \ 'coc-git',
      \ 'coc-lists',
      \ 'coc-post',
      \ 'coc-stylelint',
      \ 'coc-yaml',
      \ 'coc-template',
      \ 'coc-tabnine',
      \ 'coc-marketplace',
      \ 'coc-gitignore',
      \ 'coc-emoji',
      \ 'coc-yank',
      \ 'coc-template',
      \ 'coc-kite',
      \ 'coc-todolist',
      \ 'coc-spell-checker',
      \ 'coc-actions',
      \ 'coc-vimtex',
      \ 'coc-go']

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

" Integration with delimitMate plugin
inoremap <silent><expr> <CR>
    \ delimitMate#WithinEmptyPair() ?
    \ "\<C-R>=delimitMate#ExpandReturn()\<CR>" :
    \ "\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
