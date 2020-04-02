
let g:vimwiki_list = [
      \   { 'path': '~/Docs/wiki/wiki/md/',
      \     'path_html': '~/Docs/wiki/wiki/html',
      \     'diary_header': 'Diary',
      \     'diary_link_fmt': '%Y-%m/%d',
      \     'index': 'index',
      \     'auto_tags': 1,
      \     'auto_toc': 0,
      \     'auto_export': 1,
      \     'automatic_nested_syntaxes':1,
      \     'syntax': 'markdown',
      \     'ext': '.md',
      \     'template_path': '~/.pandoc/templates/html5/github/',
      \     'template_default': 'GitHub',
      \     'template_ext':'.html5',
      \     'custom_wiki2html': '~/bin/wiki2html.sh' },
      \   { 'path': '~/Docs/wiki/school/md',
      \     'path_html': '~/Docs/wiki/school/html',
      \     'index': 'index',
      \     'auto_tags': 1,
      \     'auto_toc': 0,
      \     'auto_export': 1,
      \     'automatic_nested_syntaxes':1,
      \     'syntax': 'markdown',
      \     'ext': '.md',
      \     'template_path': '~/.pandoc/templates/html5/github/',
      \     'template_default': 'GitHub',
      \     'template_ext':'.html5',
      \     'custom_wiki2html': '~/bin/wiki2html.sh' },
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
    exe 'tabnew ' . fnameescape(link_infos.filename)
    return 1
  endif
endfunction


augroup SpellCheck
  autocmd!
  " Toggle spell check
  if &spell
    let b:activate_spellcheck = 1
  else
    let b:activate_spellcheck = 0
  endif
  function! ToggleSpellCheck()
    if b:activate_spellcheck == 1
      let b:activate_spellcheck = 0
      echom 'Spellchecker deactivated'
    else
      let b:activate_spellcheck = 1
      echom 'Spellchecker activated'
    end
  endfunction
  autocmd Filetype vimwiki nnoremap <silent> <LocalLeader>ss :call ToggleSpellCheck()<CR>
  autocmd Filetype vimwiki
        \ autocmd BufRead <buffer> setlocal spell
  autocmd Filetype vimwiki let b:activate_spellcheck = 1
  autocmd FileType vimwiki
        \ autocmd InsertEnter <buffer>
              \ if b:activate_spellcheck == 1
              \ | setlocal spell
              \ | endif
  autocmd FileType vimwiki
        \ autocmd InsertLeave <buffer> setlocal nospell
augroup END


augroup VimwikiEditMode
  autocmd!
  autocmd FileType vimwiki setlocal textwidth=80
  autocmd FileType vimwiki setlocal foldlevel=99
  " Toggle conceallevel on and after insert mode
  autocmd FileType vimwiki
        \ autocmd InsertEnter <buffer> setlocal conceallevel=0
  autocmd FileType vimwiki
        \ autocmd InsertLeave <buffer> setlocal conceallevel=2
  " Auto-indent, select, and auto-wrap texts at textwidth 80 after pasting.
  " Useful for long lines. Depends on `gp` nmap. For more info `:verbose nmap gp`
  autocmd FileType vimwiki imap <silent><buffer> <A-p> <A-p><Esc>gp=gvgq0A
  " autocmd FileType vimwiki imap <A-p> <A-p><Esc>gp=gvgqgv0$
augroup END


" Vimwiki custom mappings
augroup VimwikiCustomMappings
  autocmd!
  " Integration with delimitMate and coc-snippet
  autocmd FileType vimwiki inoremap <silent><buffer><expr> <TAB>
        \ pumvisible() ? coc#_select_confirm() :
        \ coc#expandableOrJumpable()  ?
        \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ vimwiki#tbl#kbd_tab()

  autocmd Filetype vimwiki inoremap <silent><buffer><expr> <S-tab>
        \ vimwiki#tbl#kbd_shift_tab()

  autocmd Filetype vimwiki inoremap <silent><buffer><expr> <CR>
        \ delimitMate#WithinEmptyPair() ?
        \ "\<C-R>=delimitMate#ExpandReturn()\<CR>" :
        \ "\<ESC>:VimwikiReturn 1 5\<CR>"

  autocmd Filetype vimwiki inoremap <silent><buffer><S-CR> :VimwikiReturn 4 1<CR>
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
