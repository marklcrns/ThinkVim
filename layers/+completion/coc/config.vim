
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
let g:coc_snippet_next = '<CR>'
let g:coc_snippet_prev = '<S-Tab>'

inoremap <silent><expr> <Tab>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable()  ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

" Integration with delimitMate plugin
" inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() :
"  \ delimitMate#WithinEmptyPair() ? "\<C-R>=delimitMate#ExpandReturn()\<CR>" :
"  \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <CR>
  \ coc#jumpable()  ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ delimitMate#WithinEmptyPair() ? "\<C-R>=delimitMate#ExpandReturn()\<CR>" :
  \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-Space> coc#refresh()

" Movement within 'ins-completion-menu'
imap <expr><C-j>   pumvisible() ? "\<Down>" : "\<C-j>"
imap <expr><C-k>   pumvisible() ? "\<Up>" : "\<C-k>"

" Scroll pages in menu
inoremap <expr><C-f> pumvisible() ? "\<PageDown>" : "\<Right>"
inoremap <expr><C-b> pumvisible() ? "\<PageUp>" : "\<Left>"
imap     <expr><C-d> pumvisible() ? "\<PageDown>" : "\<C-d>"
imap     <expr><C-u> pumvisible() ? "\<PageUp>" : "\<C-u>"

nnoremap <expr><C-n> coc#util#has_float() ?
      \ coc#util#float_scrollable() ?
      \ coc#util#float_scroll(1)
      \ : ""
      \ : "\<C-n>"
nnoremap <expr><C-p> coc#util#has_float() ?
      \ coc#util#float_scrollable() ?
      \ coc#util#float_scroll(0)
      \ : ""
      \ : "\<C-p>"
