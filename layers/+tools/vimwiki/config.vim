
let g:vimwiki_list = [
\   { 'diary_header': 'Diary',
\     'diary_link_fmt': '%Y-%m/%d',
\     'auto_toc': 1,
\     'path': '~/Docs/wiki/',
\     'syntax': 'markdown',
\     'ext': '.md' },
\   { 'path': '~/Docs/school/',
\     'path_html': '~/Docs/school/html',
\     'auto_export': 1,
\     'automatic_nested_syntaxes':1,
\     'template_path': '$HOME/Docs/wiki/template/',
\     'template_ext':'.html',
\     'syntax': 'markdown',
\     'ext': '.md',
\     'custom_wiki2html': '$HOME/bin/wiki2html.sh' },
\   { 'path': '~/Docs/references/',
\     'syntax': 'markdown',
\     'ext': '.md' },
\ ]

" Custom link handler for external files
function! VimwikiLinkHandler(link)
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
