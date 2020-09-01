
augroup user_plugin_filetype "{{{
  autocmd!
  " Reload vim config automatically
  autocmd BufWritePost $VIM_PATH/{*.vim,*.yaml,vimrc} nested
  \ source $MYVIMRC | redraw

  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

  autocmd Syntax * if 5000 < line('$') | syntax sync minlines=200 | endif

  " autocmd FileType css setlocal equalprg=csstidy\ -\ --silent=true
  " autocmd FileType css setlocal equalprg=css-beautify

  autocmd FileType json syntax match Comment +\/\/.\+$+

  " HTML (.gohtml and .tpl for server side)
  autocmd BufNewFile,BufRead *.html,*.htm,*.gohtml,*.tpl setf html
  autocmd BufNewFile,BufRead *.html,*.htm,*.gohtml,*.tpl setlocal nowrap

  " Magit
  autocmd User VimagitEnterCommit startinsert

  " Auto change project directory
  autocmd BufEnter * Rooter

  " https://webpack.github.io/docs/webpack-dev-server.html#working-with-editors-ides-supporting-safe-write
  autocmd FileType css,javascript,javascriptreact setlocal backupcopy=yes
augroup END "}}}
