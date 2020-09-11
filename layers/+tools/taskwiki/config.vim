let g:taskwiki_markup_syntax = 'markdown'
let g:taskwiki_dont_preserve_folds = 'yes'
let g:taskwiki_disable_concealcursor = 'yes'
let g:taskwiki_suppress_mappings = 'yes'

function! TaskWikiReload()
  exe "TaskWikiBufferSave"
  silent !task sync
  exe "TaskWikiBufferLoad"
  echom "Taskwiki Reloaded!"
endfunction

augroup taskwiki
  autocmd!
  autocmd Filetype vimwiki
    \ autocmd BufWritePre <buffer> call TaskWikiReload()
augroup END
