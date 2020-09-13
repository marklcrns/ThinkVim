" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

let g:fern#renderer = "nerdfont"
let g:fern_git_status#disable_ignored = 1
let g:fern_git_status#disable_untracked = 1
let g:fern_git_status#disable_submodules = 1


function! s:init_fern() abort
  " Use 'select' instead of 'edit' for default 'open' action
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
  nmap <buffer> ^ <Plug>(fern-action-project-top:reveal)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
  " Startup workaround
  autocmd FileType fern call fern_git_status#init()
augroup END

augroup MyGlyphPalette
  autocmd! *
  autocmd FileType fern,startify call glyph_palette#apply()
augroup END

