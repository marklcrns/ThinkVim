
let g:vimwiki_folding = 'custom'
let g:vimwiki_table_mappings = 0
let g:vimwiki_list = [
\   { 'path': '~/Docs/wikidocs/wiki/',
\     'path_html': '~/Docs/wikidocs/wiki/html',
\     'diary_header': 'Diary',
\     'diary_link_fmt': '%Y-%m/%d',
\     'index': 'index',
\     'auto_tags': 1,
\     'auto_toc': 0,
\     'automatic_nested_syntaxes':1,
\     'syntax': 'markdown',
\     'ext': '.md',
\     'template_path': '~/.pandoc/templates/html5/github/',
\     'template_default': 'GitHub',
\     'template_ext':'.html5',
\     'custom_wiki2html': '~/bin/wiki2html.sh' },
\   { 'path': '~/Docs/wikidocs/school/',
\     'path_html': '~/Docs/wikidocs/school/html',
\     'index': 'index',
\     'auto_tags': 1,
\     'auto_toc': 0,
\     'automatic_nested_syntaxes':1,
\     'auto_export': 1,
\     'syntax': 'markdown',
\     'ext': '.md',
\     'template_path': '~/.pandoc/templates/html5/github/',
\     'template_default': 'GitHub',
\     'template_ext':'.html5',
\     'custom_wiki2html': '~/bin/wiki2html.sh' },
\   { 'path': '~/Docs/wikidocs/references/',
\     'path_html': '~/Docs/wikidocs/references/html',
\     'index': 'index',
\     'auto_tags': 1,
\     'auto_toc': 0,
\     'automatic_nested_syntaxes':1,
\     'auto_export': 1,
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

autocmd FileType vimwiki nmap <Leader>vH :VimwikiAll2HTML<CR>
autocmd FileType vimwiki nmap <Leader>vc :VimwikiTOC<CR>
autocmd FileType vimwiki nmap <Leader>vl :VimwikiGenerateLinks<CR>
autocmd FileType vimwiki setlocal textwidth=80
autocmd FileType vimwiki setlocal foldlevel=99

augroup SpellCheck
  autocmd FileType vimwiki
    \ autocmd! SpellCheck InsertEnter <buffer> setlocal spell
augroup END

" Toggle conceallevel on and after insert mode
autocmd FileType vimwiki
  \ autocmd InsertEnter <buffer> setlocal conceallevel=0
autocmd FileType vimwiki
  \ autocmd InsertLeave <buffer> setlocal conceallevel=2

" Auto-indent, select, and auto-wrap texts at textwidth 80 after pasting.
" Useful for long lines. Depends on `gp` nmap. For more info `:verbose nmap gp`
autocmd FileType vimwiki imap <A-p> <A-p><Esc>gp=gvgqgv0$
