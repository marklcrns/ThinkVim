
let g:vimwiki_list = [
      \   { 'path': '~/Docs/wiki/wiki/md/',
      \     'path_html': '~/Docs/wiki/wiki/html',
      \     'diary_header': 'Todo',
      \     'diary_link_fmt': '%Y-%m/%d',
      \     'index': 'index',
      \     'auto_tags': 1,
      \     'auto_toc': 0,
      \     'auto_export': 1,
      \     'automatic_nested_syntaxes':1,
      \     'syntax': 'markdown',
      \     'ext': '.md',
      \     'template_path': '~/Docs/wiki/templates/',
      \     'template_default': 'template',
      \     'template_ext':'.html',
      \     'custom_wiki2html': '$VIM_PATH/layers/+tools/vimwiki/wiki2html.sh' },
      \   { 'path': '~/Docs/wiki/docs/md/',
      \     'path_html': '~/Docs/wiki/docs/html',
      \     'index': 'index',
      \     'auto_tags': 1,
      \     'auto_toc': 0,
      \     'auto_export': 1,
      \     'automatic_nested_syntaxes':1,
      \     'syntax': 'markdown',
      \     'ext': '.md',
      \     'template_path': '~/Docs/wiki/templates/',
      \     'template_default': 'template',
      \     'template_ext':'.html',
      \     'custom_wiki2html': '$VIM_PATH/layers/+tools/vimwiki/wiki2html.sh' },
      \   { 'path': '~/Docs/wiki/school/md',
      \     'path_html': '~/Docs/wiki/school/html',
      \     'index': 'index',
      \     'auto_tags': 1,
      \     'auto_toc': 0,
      \     'auto_export': 1,
      \     'automatic_nested_syntaxes':1,
      \     'syntax': 'markdown',
      \     'ext': '.md',
      \     'template_path': '~/Docs/wiki/templates/',
      \     'template_default': 'template',
      \     'template_ext':'.html',
      \     'custom_wiki2html': '$VIM_PATH/layers/+tools/vimwiki/wiki2html.sh' },
      \ ]

" Custom link handler for external files
" Use Vim to open external files with the 'vfile:' scheme.  E.g.:
"   1) [[vfile:~/absolute_path/to/file/]]
"   2) [[vfile:./relative_path/to/file]]
" Use xdg-open to open external file with the 'file:' scheme. E.g:
"   1) [[file:~/absolute_path/to/file/]]
"   2) [[file:./relative_path/to/file]]
" For markdown syntax
"   Open with Vim
"   1) [Description](vfile:~/absolute_path/to/file)
"   2) [Description](vfile:./relative_path/to/file)
"   Open with xdg-open
"   1) [Description](file:~/absolute_path/to/file)
"   2) [Description](file:./relative_path/to/file)
function! VimwikiLinkHandler(link)
  let link = a:link
  if link =~# '^vfile:'
    let link_infos = vimwiki#base#resolve_link(link[1:])
  elseif link=~# '^file:'
    let link_infos = vimwiki#base#resolve_link(link)
  else
    return 0
  endif
  if link_infos.filename == ''
    echomsg 'Vimwiki Error: Unable to resolve link!'
    return 0
  elseif link =~# '^file:'
    try
      if vimwiki#u#is_windows()
        call s:win32_handler(link)
        return 1
      elseif vimwiki#u#is_macos()
        call s:macunix_handler(link)
        return 1
      else
        call s:linux_handler(link)
        return 1
      endif
    catch
      echo "Error while opening " . fnameescape(link_infos.filename)
    endtry
    return 0
  else
    exe 'vsplit ' . fnameescape(link_infos.filename)
    return 1
  endif
endfunction

" TODO: Check if reference header exists, if not make one
" TODO: Do not overwrite on existing list sublists
" Resources:
" Copy search match - https://vim.fandom.com/wiki/Copy_search_matches
" Undupe list - https://stackoverflow.com/a/6630950/11850077
" Extras:
" https://vim.fandom.com/wiki/Folding_with_Regular_Expression
" ----------
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  let unduphits=filter(copy(hits), 'index(hits, v:val, v:key+1)==-1')
  execute 'let @'.reg.' = "\n" . join(unduphits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

function! IndexResourcesLinks()
  exe 'g/\# Resources/'
  " TODO: Check not on last line
  " Ensures not on last line
  exe 'norm! o'
  " Delete exising links (only first paragraph after the header)
  exe 'norm V}kd'
  " Clear `x` register and copy all reference links
  exe 'let @x = ""'
  " Copy all in the file in this format (excluding back ticks) `[-*] [[^+].*](.*)`
  " Excludes links with description prepended with `+` and `↪' indicator
  exe 'g/.*[-*] \[[^+↪].*](.*)/y A'
  call CopyMatches('x')
  exe 'g/\# Resources/'
  " Paste all links to reference header
  exe 'norm "xp'
endfunction

" Deprecated by coc-spell-checker
" augroup SpellCheck
"   autocmd!
"   autocmd Filetype vimwiki
"        \ autocmd BufRead <buffer> setlocal spell
" augroup END

augroup VimwikiEditMode
  autocmd!
  autocmd FileType vimwiki setlocal textwidth=80
  autocmd FileType vimwiki setlocal foldlevel=99
  autocmd FileType vimwiki setlocal nowrap
  " Toggle conceallevel on and after insert mode
  autocmd FileType vimwiki
        \ autocmd InsertEnter <buffer> setlocal conceallevel=0
  autocmd FileType vimwiki
        \ autocmd InsertLeave <buffer> setlocal conceallevel=2
  " Auto-indent, select, and auto-wrap texts at textwidth 80 after pasting.
  " Useful for long lines. Depends on `gp` nmap. For more info `:verbose nmap gp`
  autocmd FileType vimwiki
        \ imap <expr><silent><buffer> <M-p> pumvisible() ? "\<C-e>\<Esc>:call SmartInsertPaste()\<CR>" : "\<Esc>:call SmartInsertPaste()\<CR>"
augroup END

function! SubstituteOddChars()
  " `e` flag silence errors, see `s_flags`
  " TODO: turn into independent function with visual and normal mode support,
  " and accepts arbitrary args for odd chars
  exe "norm! gv:s/“/\"/ge\<CR>"
  exe "norm! gv:s/”/\"/ge\<CR>"
  exe "norm! gv:s/’/'/ge\<CR>"
  exe "norm! gv:s/—/--/ge\<CR>"
  " Clear commandline prompt
  redraw
endfunction

function! SmartInsertPaste()
  " Paste and indent text
  exe "norm \<M-p>\<Esc>gp=gv"
  " Format pasted lines
  exe "norm gvgq"
  " Substitute odd chars
  call SubstituteOddChars()
  echo "Paste complete!"
  " Go to the end of the last selected texts, then insert mode with 'a'
  exe "norm `>a"
endfunction

" Vimwiki custom mappings
augroup VimwikiCustomMappings
  autocmd!
  " Integration with delimitMate, coc completion and Ultisnips
  autocmd FileType vimwiki inoremap <silent><buffer><expr> <TAB>
        \ pumvisible() ? coc#_select_confirm() :
        \ IsExpandable() ?
        \ "\<C-R>=UltiSnips#ExpandSnippet()\<CR>" :
        \ vimwiki#tbl#kbd_tab()
  autocmd Filetype vimwiki inoremap <silent><buffer><expr> <S-tab>
        \ vimwiki#tbl#kbd_shift_tab()
  autocmd Filetype vimwiki inoremap <silent><buffer><expr> <CR>
        \ delimitMate#WithinEmptyPair() ?
        \ "\<C-R>=delimitMate#ExpandReturn()\<CR>" :
        \ "\<ESC>:VimwikiReturn 1 5\<CR>"
  autocmd FileType vimwiki inoremap <silent><buffer> <CR>
              \ <C-]><Esc>:VimwikiReturn 1 5<CR>
  autocmd FileType vimwiki inoremap <silent><buffer> <S-CR>
              \ <Esc>:VimwikiReturn 4 1<CR>
  autocmd Filetype vimwiki nnoremap <buffer><LocalLeader>wL :call IndexResourcesLinks()<CR>
  " Dependent on `q` mapping to exec `bdelete`. Somehow <S-CR> on normal don't work
  autocmd Filetype vimwiki nmap <buffer><Leader><CR> :VimwikiFollowLink<CR>mZ<C-o>q`ZmZ
  autocmd Filetype vimwiki nmap <buffer><Leader><BS> :VimwikiGoBackLink<CR>mZ<C-o>q`ZmZ
augroup END

" Quick fix hack on <CR> and <S-CR> being remapped when comming back to a session
if !hasmapto('VimwikiReturn', 'i')
  if maparg('<CR>', 'i') !~? '<Esc>:VimwikiReturn'
    inoremap <silent><buffer><expr> <CR>
          \ delimitMate#WithinEmptyPair() ?
          \ "\<C-R>=delimitMate#ExpandReturn()\<CR>" :
          \ "\<ESC>:VimwikiReturn 1 5\<CR>"
  endif
  if maparg('<S-CR>', 'i') !~? '<Esc>:VimwikiReturn'
    inoremap <silent><buffer> <S-CR> <Esc>:VimwikiReturn 4 1<CR>
  endif
endif
