let g:vista#renderer#enable_icon = 1
let g:vista_default_executive = 'ctags'
let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_vimwiki_executive = 'markdown'
let g:vista_fzf_preview = ['right:50%']

let g:vista_executive_for = {
  \ 'go': 'ctags',
  \ 'javascript': 'coc',
  \ 'javascript.jsx': 'coc',
  \ 'python': 'ctags',
  \ 'vimwiki': 'markdown',
  \ 'pandoc': 'markdown',
  \ 'markdown': 'toc',
  \ }
