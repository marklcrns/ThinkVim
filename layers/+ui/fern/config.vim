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

" Custom settings and mappings.
let g:fern#disable_default_mappings = 1


function! s:init_fern() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )

  nmap <buffer><expr>
        \ <Plug>(fern-my-expand-or-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-collapse)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )

  nmap <buffer> N <Plug>(fern-action-new-path)
  nmap <buffer> dd <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> R <Plug>(fern-action-rename)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> s <Plug>(fern-action-open:split)
  nmap <buffer> gs <Plug>(fern-action-open:split)<C-w>p
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer> gv <Plug>(fern-action-open:vsplit)<C-w>p
  nmap <buffer> - <Plug>(fern-action-mark:toggle)j
  nmap <buffer> , <Plug>(fern-action-hidden:toggle)
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer><nowait> h <Plug>(fern-action-collapse)
  nmap <buffer><nowait> l <Plug>(fern-my-expand-or-collapse)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)

  " Note: Requires lambdalisue/fern-mapping-project-top.vim
  nmap <buffer> ^ <Plug>(fern-action-project-top:reveal)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
  " Startup workaround
  autocmd FileType fern call fern_git_status#init()
augroup END

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern,startify call glyph_palette#apply()
augroup END

