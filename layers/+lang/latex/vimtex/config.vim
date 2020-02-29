
" Basic Configs
let g:vimtex_enabled=1
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_fold_enabled =1
"autocmd BufEnter *.tex set foldmethod=expr
"autocmd BufEnter *.tex set foldexpr=vimtex#fold#level(v:lnum)
"autocmd BufEnter *.tex set foldtext=vimtex#fold#text()

let g:vimtex_compiler_latexmk = {
      \ 'backend' : 'nvim',
      \ 'background' : 1,
      \ 'build_dir' : 'build',
      \ 'callback' : 1,
      \ 'continuous' : 1,
      \ 'executable' : 'latexmk',
      \ 'options' : [
      \   '-shell-escape',
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ],
      \}

" TOC settings
let g:vimtex_toc_config = {
      \ 'name' : 'TOC',
      \ 'layers' : ['content', 'todo', 'include'],
      \ 'resize' : 1,
      \ 'split_width' : 50,
      \ 'todo_sorted' : 0,
      \ 'show_help' : 1,
      \ 'show_numbers' : 1,
      \ 'mode' : 2,
      \}
