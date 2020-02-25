"Plugin key settings

if dein#tap('coc.nvim')
  " Using CocList
  " Show all diagnostics
  nnoremap <silent> <leader>cd  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <leader>cx  :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
  " Resume latest coc list
  nnoremap <silent> <leader>cr  :<C-u>CocListResume<CR>
  " Use `[c` and `]c` for navigate diagnostics
  nmap <silent> ]c <Plug>(coc-diagnostic-prev)
  nmap <silent> [c <Plug>(coc-diagnostic-next)
  " Remap for rename current word
  nmap <leader>cn <Plug>(coc-rename)
  " Remap for format selected region
  vmap <leader>cf  <Plug>(coc-format-selected)
  nmap <leader>cf  <Plug>(coc-format-selected)
  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
  endfunction
  xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
  nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
  " xmap <leader>a  <Plug>(coc-codeaction-selected)
  " nmap <leader>a  <Plug>(coc-codeaction-selected)
  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>cq  <Plug>(coc-fix-current)
  " Insert current filetype template on cursor
  nmap <leader>ct <Plug>(coc-template)
  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K for show documentation in float window
  " nnoremap <silent> K :call CocActionAsync('doHover')<CR>

  " Use K to show documentation in preview for vim window and float for nvim
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      let l:found = CocAction('doHover')
    endif
  endfunction

  " use <c-space> for trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()
  nmap [g <Plug>(coc-git-prevchunk)
  nmap ]g <Plug>(coc-git-nextchunk)
  " show chunk diff at current position
  nmap gs <Plug>(coc-git-chunkinfo)
  " show commit contains current position
  nmap gm <Plug>(coc-git-commit)
  nnoremap <silent> <leader>cg  :<C-u>CocList --normal gstatus<CR>
  " float window scroll
  nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
  nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
  " multiple cursors
  nmap <silent> <C-c> <Plug>(coc-cursors-position)
  xmap <silent> <C-c> <Plug>(coc-cursors-range)
  nmap <expr> <silent> <C-s> <SID>select_current_word()

  function! s:select_current_word()
    if !get(g:, 'coc_cursors_activated', 0)
      return "\<Plug>(coc-cursors-word)"
    endif
    return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
  endfunc

  nnoremap <silent> <leader>cm ::CocSearch -w
  nnoremap <silent> <leader>cw ::CocSearch
  " use normal command like `<leader>xi(`
  nmap <leader>x  <Plug>(coc-cursors-operator)
  " coc-explorer
  noremap <silent> <leader>ce :execute 'CocCommand explorer' .
        \ ' --toggle' .
        \ ' --sources=buffer+,file+' .
        \ ' --file-columns=git,selection,icon,clip,indent,filename,size ' . expand('%:p:h')<CR>

  " Movement within 'ins-completion-menu'
  imap <expr><C-j> pumvisible() ? "\<Down>" : "\<C-j>"
  imap <expr><C-k> pumvisible() ? "\<Up>" : "\<C-k>"

  " Scroll pages in menu
  inoremap <expr><C-f> pumvisible() ? "\<PageDown>" : "\<Right>"
  inoremap <expr><C-b> pumvisible() ? "\<PageUp>" : "\<Left>"
  imap     <expr><C-d> pumvisible() ? "\<PageDown>" : "\<C-d>"
  imap     <expr><C-u> pumvisible() ? "\<PageUp>" : "\<C-u>"

  nnoremap <expr><C-n> coc#util#has_float() ?
        \ coc#util#float_scrollable() ?
        \ coc#util#float_scroll(1)
        \ : ""
        \ : "\<C-n>"
  nnoremap <expr><C-p> coc#util#has_float() ?
        \ coc#util#float_scrollable() ?
        \ coc#util#float_scroll(0)
        \ : ""
        \ : "\<C-p>"
endif

if dein#tap('denite.nvim')
  nnoremap <silent><LocalLeader>d :<C-u>Denite menu<CR>
  noremap zl :<C-u>call <SID>my_denite_outline(&filetype)<CR>
  noremap zL :<C-u>call <SID>my_denite_decls(&filetype)<CR>
  noremap zT :<C-u>call <SID>my_denite_file_rec_goroot()<CR>

  nnoremap <silent> <Leader>dgl :<C-u>Denite gitlog:all<CR>
  nnoremap <silent> <Leader>dgh :<C-u>Denite gitbranch<CR>
  function! s:my_denite_outline(filetype) abort
    execute 'Denite' a:filetype ==# 'go' ? "decls:'%:p'" : 'outline'
  endfunction
  function! s:my_denite_decls(filetype) abort
    if a:filetype ==# 'go'
      Denite decls
    else
      call denite#util#print_error('decls does not support filetypes except go')
    endif
  endfunction
  function! s:my_denite_file_rec_goroot() abort
    if !executable('go')
      call denite#util#print_error('`go` executable not found')
      return
    endif
    let out = system('go env | grep ''^GOROOT='' | cut -d\" -f2')
    let goroot = substitute(out, '\n', '', '')
    call denite#start(
          \ [{'name': 'file/rec', 'args': [goroot]}],
          \ {'input': '.go'})
  endfunction
endif

if dein#tap('vim-buffet')
  nmap <leader>1 <Plug>BuffetSwitch(1)
  nmap <leader>2 <Plug>BuffetSwitch(2)
  nmap <leader>3 <Plug>BuffetSwitch(3)
  nmap <leader>4 <Plug>BuffetSwitch(4)
  nmap <leader>5 <Plug>BuffetSwitch(5)
  nmap <leader>6 <Plug>BuffetSwitch(6)
  nmap <leader>7 <Plug>BuffetSwitch(7)
  nmap <leader>8 <Plug>BuffetSwitch(8)
  nmap <leader>9 <Plug>BuffetSwitch(9)
  nmap <leader>0 <Plug>BuffetSwitch(10)
endif

if dein#tap('fzf.vim')
  nnoremap <silent> <leader>ff :call Fzf_dev()<CR>
  nnoremap <silent> <leader>fr :Rg<CR>
  nnoremap <silent> <leader>fg :GGrep<CR>
  nnoremap <silent> <leader>fc :Colors<CR>
  nnoremap <silent> <leader>fb :Buffers<CR>
  nnoremap <silent> <leader>fw :Rg <C-R><C-W><CR>
endif

if dein#tap('vim-easy-align')
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap <Leader>ra <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap <Leader>ra <Plug>(EasyAlign)
endif


if dein#tap('vim-go')
  nnoremap <silent> <LocalLeader>gi :GoImpl<CR>
  nnoremap <silent> <LocalLeader>gd :GoDescribe<CR>
  nnoremap <silent> <LocalLeader>gc :GoCallees<CR>
  nnoremap <silent> <LocalLeader>gC :GoCallers<CR>
  nnoremap <silent> <LocalLeader>gs :GoCallstack<CR>
endif

if dein#tap('vim-easygit')
  nnoremap <Leader>gd :Gdiff<CR>
  nnoremap <Leader>gc :Gcommit<CR>
  nnoremap <Leader>gb :Gblame<CR>
  nnoremap <Leader>gB :Gbrowse<CR>
  nnoremap <Leader>gp :Gpush<CR>
  " nnoremap <Leader>gs :Gstatus<CR>
endif

if dein#tap('magit.vim')
  nnoremap <silent> <LocalLeader>mg :Magit<CR>
endif

if dein#tap('gina.vim')
  nnoremap <Leader>ga :Gina add .<CR>
  nnoremap <Leader>gs :Gina status<CR>
  nnoremap <Leader>Gl :Gina log<CR>
  " nnoremap <Leader>gp :Gina push<CR>
endif

if dein#tap('vim-mundo')
  nnoremap <silent> <leader>mm :MundoToggle<CR>
endif

if dein#tap('vim-choosewin')
  nmap -         <Plug>(choosewin)
  nmap <Leader>- :<C-u>ChooseWinSwapStay<CR>
endif

if dein#tap('caw.vim')
  function! InitCaw() abort
    if ! &l:modifiable
      silent! nunmap <buffer> <Leader>V
      silent! xunmap <buffer> <Leader>V
      silent! nunmap <buffer> <Leader>v
      silent! xunmap <buffer> <Leader>v
      silent! nunmap <buffer> gc
      silent! xunmap <buffer> gc
      silent! nunmap <buffer> gcc
      silent! xunmap <buffer> gcc
    else
      xmap <buffer> <Leader>VV <Plug>(caw:wrap:toggle)
      nmap <buffer> <Leader>VV <Plug>(caw:wrap:toggle)
      xmap <buffer> <Leader>vv <Plug>(caw:hatpos:toggle)
      nmap <buffer> <Leader>vv <Plug>(caw:hatpos:toggle)
      nmap <buffer> gc <Plug>(caw:prefix)
      xmap <buffer> gc <Plug>(caw:prefix)
      nmap <buffer> gcc <Plug>(caw:hatpos:toggle)
      xmap <buffer> gcc <Plug>(caw:hatpos:toggle)
    endif
  endfunction
  autocmd FileType * call InitCaw()
  call InitCaw()
endif

if dein#tap('comfortable-motion.vim')
  nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
  nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
  nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
  nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>
endif

if dein#tap('python_match.vim')
  nmap <buffer> {{ [%
  nmap <buffer> }} ]%
endif

if dein#tap('goyo.vim')
  nnoremap <Leader>G :Goyo 100<CR>
endif

if dein#tap('defx.nvim')
  nnoremap <silent> <Leader>ee
        \ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
  nnoremap <silent> <Leader>ea
        \ :<C-u>Defx -resume -toggle -search=`expand('%:p')` `getcwd()`<CR>
endif

if dein#tap('vim-startify')
  nnoremap <silent> <leader>s :Startify<CR>
endif

if dein#tap('vim-quickrun')
  nnoremap <silent> <localleader>r :QuickRun<CR>
endif

if dein#tap('vim-expand-region')
  xmap v <Plug>(expand_region_expand)
  xmap V <Plug>(expand_region_shrink)
endif

if dein#tap('splitjoin.vim')
  let g:splitjoin_join_mapping = ''
  let g:splitjoin_split_mapping = ''
  nmap sj :SplitjoinJoin<CR>
  nmap sk :SplitjoinSplit<CR>
endif

if dein#tap('vista.vim')
  nnoremap <silent><localleader>vv :Vista!!<CR>
  nnoremap <silent><localleader>vc :Vista coc<CR>
  nnoremap <silent><localleader>vx :Vista!<CR>
  nnoremap <silent><localleader>vo :Vista<CR>
  nnoremap <silent><leader>fv     :Vista finder coc<CR>
endif

if dein#tap('ale')
  nmap [a <Plug>(ale_next_wrap)
  nmap ]a <Plug>(ale_previous_wrap)
endif

if dein#tap('vim-easymotion')
  nmap <Leader><Leader>w <Plug>(easymotion-w)
  nmap <Leader><Leader>f <Plug>(easymotion-f)
  nmap <Leader><Leader>b <Plug>(easymotion-b)
endif

if dein#tap('vim-which-key')
  nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
  nnoremap <silent> <localleader> :<c-u>WhichKey  ';'<CR>
  nnoremap <silent>[              :<c-u>WhichKey  '['<CR>
  nnoremap <silent>]              :<c-u>WhichKey  ']'<CR>
endif

if dein#tap('vim-smartchr')
  inoremap <expr> , smartchr#one_of(',', ',')
  autocmd FileType go inoremap <buffer><expr> ;
        \ smartchr#loop(':=',';')
  autocmd FileType go inoremap <buffer> <expr> .
        \ smartchr#loop('.', '<-', '->','...')
endif

if dein#tap('vim-niceblock')
  xmap I  <Plug>(niceblock-I)
  xmap A  <Plug>(niceblock-A)
endif

if dein#tap('vim-sandwich')
  nmap <silent> sa <Plug>(operator-sandwich-add)
  xmap <silent> sa <Plug>(operator-sandwich-add)
  omap <silent> sa <Plug>(operator-sandwich-g@)
  nmap <silent> sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
  xmap <silent> sd <Plug>(operator-sandwich-delete)
  nmap <silent> sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
  xmap <silent> sr <Plug>(operator-sandwich-replace)
  nmap <silent> sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
  nmap <silent> srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
  omap ib <Plug>(textobj-sandwich-auto-i)
  xmap ib <Plug>(textobj-sandwich-auto-i)
  omap ab <Plug>(textobj-sandwich-auto-a)
  xmap ab <Plug>(textobj-sandwich-auto-a)
  omap is <Plug>(textobj-sandwich-query-i)
  xmap is <Plug>(textobj-sandwich-query-i)
  omap as <Plug>(textobj-sandwich-query-a)
  xmap as <Plug>(textobj-sandwich-query-a)
endif

if dein#tap('vim-operator-replace')
  xmap p <Plug>(operator-replace)
endif

if dein#tap('vim-textobj-multiblock')
  omap <silent> ab <Plug>(textobj-multiblock-a)
  omap <silent> ib <Plug>(textobj-multiblock-i)
  xmap <silent> ab <Plug>(textobj-multiblock-a)
  xmap <silent> ib <Plug>(textobj-multiblock-i)
endif

if dein#tap('vim-zoom')
  nmap sf <Plug>(zoom-toggle)
endif

if dein#tap('rainbow')
  nmap <LocalLeader>sp :RainbowToggle<CR>
endif

if dein#tap('markdown-preview.nvim')
  nmap <LocalLeader>md <Plug>MarkdownPreviewToggle
  nmap <LocalLeader>mo <Plug>MarkdownPreview
  nmap <LocalLeader>mc <Plug>MarkdownPreviewStop
endif

if dein#tap('vim-markdown')
  nmap <LocalLeader>mtt :Toc<CR>
  nmap <LocalLeader>mtv :Tocv<CR>
  nmap <LocalLeader>mth :Toch<CR>
endif

if dein#tap('vimtex')
  nnoremap <Leader>fl :call vimtex#fzf#run()<cr>
endif

if dein#tap('accelerated-jk')
  " conservative deceleration
  let g:accelerated_jk_enable_deceleration = 1
  " if default key-repeat interval check(150 ms) is too short
  let g:accelerated_jk_acceleration_limit = 250

  " Time-driven acceleration
  "nmap j <Plug>(accelerated_jk_gj)
  "nmap k <Plug>(accelerated_jk_gk)

  " Position-driven acceleration
  nmap j <Plug>(accelerated_jk_gj_position)
  nmap k <Plug>(accelerated_jk_gk_position)
endif

if dein#tap('vimwiki')
  nnoremap <silent> <Leader>DW :<C-u>VimwikiIndex<CR>
  nnoremap <silent> <Leader>DI :<C-u>VimwikiDiaryIndex<CR>
endif

if dein#tap('vimux')
  " Prompt for a command to run
  map <Leader>vc :VimuxPromptCommand<CR>

  " Run last command executed by VimuxRunCommand
  map <Leader>vl :VimuxRunLastCommand<CR>

  " Inspect runner pane
  map <Leader>vi :VimuxInspectRunner<CR>

  " Close vim tmux runner opened by VimuxRunCommand
  map <Leader>vq :VimuxCloseRunner<CR>

  " Interrupt any command running in the runner pane
  map <Leader>vx :VimuxInterruptRunner<CR>

  " Zoom the runner pane (use <bind-key> z to restore runner pane)
  map <Leader>vf :VimuxZoomRunner<CR>
endif

if dein#tap('vim-wordy')
  if !&wildcharm | set wildcharm=<C-z> | endif
  execute 'nnoremap <leader>rw :Wordy<space>'.nr2char(&wildcharm)

  nnoremap <leader>rwn :NextWordy<CR>
  nnoremap <leader>rwp :PrevWordy<CR>
  nnoremap <leader>rwo :NoWordy<CR>
endif

if dein#tap('vim-quickhl')
  nmap <Leader>ht <Plug>(quickhl-manual-this)
  xmap <Leader>ht <Plug>(quickhl-manual-this)

  nmap <Leader>hw <Plug>(quickhl-manual-this-whole-word)
  xmap <Leader>hw <Plug>(quickhl-manual-this-whole-word)

  nmap <Leader>hr <Plug>(quickhl-manual-reset)
  xmap <Leader>hr <Plug>(quickhl-manual-reset)
endif

if dein#tap('thesaurus_query.vim')
  nnoremap <silent> <Leader>K :<C-u>ThesaurusQueryReplaceCurrentWord<CR>
endif

if dein#tap('neoformat')
  nmap <LocalLeader>nf :Neoformat<CR>
endif

if dein#tap('neomake')
  nmap <LocalLeader>nm :Neomake<CR>
  nmap <LocalLeader>nx :NeomakeClean<CR>
endif

if dein#tap('vim-fugitive')
  " Ref http://vimcasts.org/episodes/fugitive-vim-exploring-the-history-of-a-git-repository/
  nnoremap <Leader>gl :Glog<CR>
  vnoremap <Leader>gl :Glog<CR>
  nnoremap <Leader>gL :Glog -- %<CR>
  nnoremap <Leader>gg :Ggrep<Space>
  nnoremap <Leader>gG :Glog --grep= -- %<Left><Left><Left><Left><Left>
endif

if dein#tap('calendar.vim')
  nnoremap <LocalLeader>ct :Calendar -view=clock<CR>
  nnoremap <LocalLeader>cc :Calendar -first_day=monday<CR>
  nnoremap <LocalLeader>cd :Calendar -view=day<CR>
  nnoremap <LocalLeader>cw :Calendar -view=week<CR>
  nnoremap <LocalLeader>cf :Calendar -view=year -first_day=monday<CR>
  nnoremap <LocalLeader>cv :Calendar -view=year -split=vertical -width=27 -first_day=monday<CR>
  nnoremap <LocalLeader>ch :Calendar -view=day -split=horizontal -position=below -height=12<CR>
endif

if dein#tap('vim-rooter')
  " Change directory for the current window only
  let g:rooter_use_lcd = 1
  " Resolve symbolic link
  let g:rooter_resolve_links = 1
  " Stop echoing project directory
  let g:rooter_silent_chdir = 1
  " Change to current file's directory for non-project files
  let g:rooter_change_directory_for_non_project_files = 'current'
  " Disables automatic directory change
  let g:rooter_manual_only = 1

  nmap <LocalLeader>R :Rooter<CR>
endif



" Commented plugins too old, or found much better
" ==================================================
" if dein#tap('spaceline.vim')
"   let g:spaceline_colorscheme = 'solarized_dark'
"   let g:spaceline_seperate_mode = 1
"   let g:spaceline_homemode_right = ''
"   let g:spaceline_filename_left  = ''
"   let g:spaceline_filesize_right = ''
"   let g:spaceline_gitinfo_left   = ''
"   let g:spaceline_gitinfo_right  = ''
"   let g:spaceline_cocexts_right  = ''
"   let g:spaceline_lineformat_right = ''
"   let g:spaceline_seperate_endseperate = ''
"   let g:spaceline_seperate_emptyseperate = ''
" endif

" if dein#tap('dash.vim')
"   nnoremap <silent><leader>d :Dash<CR>
" endif
