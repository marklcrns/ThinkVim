" Plugin key settings

if dein#tap('coc.nvim')
  nnoremap <silent> <leader>cC :<C-u>CocConfig<Cr>
  " Using CocList
  " Show commands
  nnoremap <silent> <leader>clc  :<C-u>CocList commands<cr>
  " Show all diagnostics
  nnoremap <silent> <leader>cld  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <leader>cle  :<C-u>CocList extensions<cr>
  " Marketplace list
  nnoremap <silent> <leader>clm  :<C-u>CocList marketplace<cr>
  " Find symbol of current document
  nnoremap <silent> <leader>clo  :<C-u>CocList outline<cr>
  " Resume latest coc list
  nnoremap <silent> <leader>clr  :<C-u>CocListResume<CR>
  " Search workspace symbols
  nnoremap <silent> <leader>cls  :<C-u>CocList -I symbols<cr>
  " Show yank list (coc-yank)
  nnoremap <silent> <leader>cly  :<C-u>CocList -A --normal yank<cr>

  " Rgrep selected or by motion
  nnoremap <leader>clw :<C-u>set operatorfunc=<SID>GrepFromSelected<CR>g@
  vnoremap <leader>clw :<C-u>call <SID>GrepFromSelected(visualmode())<CR>

  function! s:GrepFromSelected(type)
    let saved_unnamed_register = @@
    if a:type ==# 'v'
      normal! `<v`>y
    elseif a:type ==# 'char'
      normal! `[v`]y
    else
      return
    endif
    let word = substitute(@@, '\n$', '', 'g')
    let word = escape(word, '| ')
    let @@ = saved_unnamed_register
    execute 'CocList grep '.word
  endfunction

  " Grep in current buffer under cursor
  nnoremap <silent> <Leader>clW  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>

  " Do default action for next item.
  nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
  " Use `[d` and `]d` for navigate diagnostics
  nmap <silent> [d <Plug>(coc-diagnostic-prev)
  nmap <silent> ]d <Plug>(coc-diagnostic-next)
  " Remap for rename current word
  nmap <leader>cn <Plug>(coc-rename)
  " Remap for format selected region
  vmap <leader>cf  <Plug>(coc-format-selected)
  nmap <leader>cf  <Plug>(coc-format-selected)
  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
  endfunction
  xmap <silent> <leader>ca :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
  nmap <silent> <leader>ca :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
  " xmap <leader>a  <Plug>(coc-codeaction-selected)
  " nmap <leader>a  <Plug>(coc-codeaction-selected)
  " Remap for do codeAction of current line
  nmap <leader>cc <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>cq <Plug>(coc-fix-current)
  " Insert current filetype template on cursor
  nmap <leader>cm <Plug>(coc-template)
  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " coc-git
  nmap [g <Plug>(coc-git-prevchunk)
  nmap ]g <Plug>(coc-git-nextchunk)
  " show commit contains current position
  nmap <Leader>cgc <Plug>(coc-git-commit)
  " show chunk diff at current position
  nmap <Leader>cgi <Plug>(coc-git-chunkinfo)
  " show git status
  nnoremap <silent> <leader>cgs  :<C-u>CocList --normal gstatus<CR>
  nnoremap <Leader>cgb :CocCommand git.browserOpen<CR>
  nnoremap <Leader>cgd :CocCommand git.diffCached<CR>
  nnoremap <Leader>cgf :CocCommand git.foldUnchanged<CR>
  nnoremap <Leader>cgt :CocCommand git.chunkStage<CR>
  nnoremap <Leader>cgu :CocCommand git.chunkUndo<CR>

  " Coc toggles
  nnoremap <Leader>ctg :<C-u>CocCommand git.toggleGutters<Cr>
  nnoremap <Leader>cts :<C-u>CocCommand cSpell.toggleEnableSpellChecker<Cr>

  " Use K for show documentation in float window
  " nnoremap <silent> K :call CocActionAsync('doHover')<CR>

  " Use K to show documentation in preview for vim window and float for nvim
  nnoremap <silent> K :call <SID>show_documentation()<CR>
  vnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      let l:found = CocAction('doHover')
    endif
  endfunction

  " use <c-space> for trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " float window scroll
  nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-f>"
  nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
  " multiple cursors
  nmap <silent> <C-c> <Plug>(coc-cursors-position)
  nmap <expr> <silent> <C-s> <SID>select_current_word()
  xmap <silent> <C-s> <Plug>(coc-cursors-range)
  " use normal command like `<leader>xi(`
  nmap <leader>cx <Plug>(coc-cursors-operator)

  nmap <leader>cr <Plug>(coc-refactor)

  function! s:select_current_word()
    if !get(g:, 'coc_cursors_activated', 0)
      return "\<Plug>(coc-cursors-word)"
    endif
    return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
  endfunc

  nnoremap <silent> <leader>cs :<C-u>CocSearch<Space>
  nnoremap <silent> <leader>cS :<C-u>CocSearch -w<Space>

  " Open floaterm
  nnoremap <silent> <leader>ot :<C-u>CocCommand floaterm.new<cr>

  " coc-explorer
  noremap <silent> <leader>ce :execute 'CocCommand explorer' .
        \ ' --toggle' .
        \ ' --position=floating' .
        \ ' --sources=file+'<CR>

  " Movement within 'ins-completion-menu'
  imap <expr><C-j> pumvisible() ? "\<Down>" : "\<C-j>"
  imap <expr><C-k> pumvisible() ? "\<Up>" : "\<ESC>d$a"

  " Scroll pages in menu
  " inoremap <expr><C-f> pumvisible() ? "\<PageDown>" : "\<Right>" a
  " inoremap <expr><C-b> pumvisible() ? "\<PageUp>" : "\<Left>"
  " imap     <expr><C-d> pumvisible() ? "\<PageDown>" : "\<C-d>"
  " imap     <expr><C-u> pumvisible() ? "\<PageUp>" : "\<C-u>"

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
  nnoremap <silent><Leader>dd :<C-u>Denite menu<CR>
  noremap zl :<C-u>call <SID>my_denite_outline(&filetype)<CR>
  noremap zL :<C-u>call <SID>my_denite_decls(&filetype)<CR>
  noremap zT :<C-u>call <SID>my_denite_file_rec_goroot()<CR>

  nnoremap <silent> <Leader>dgl :<C-u>Denite gitlog:all<CR>
  nnoremap <silent> <Leader>dgb :<C-u>Denite gitbranch<CR>
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
  nnoremap <silent> <leader>fdc :<C-u>Colors<CR>
  nnoremap <silent> <leader>fdb :<C-u>FzfPreviewBuffers -processors=g:fzf_preview_buffer_delete_processors<CR>
  nnoremap <silent> <leader>fdB :<C-u>FzfPreviewAllBuffers -processors=g:fzf_preview_buffer_delete_processors<CR>
  nnoremap <silent> <leader>fdf :<C-u>FzfPreviewDirectoryFiles<CR>
  nnoremap <silent> <leader>fdF :<C-u>call Fzf_dev()<CR>
  nnoremap <silent> <Leader>fdg :<C-u>FzfPreviewGitStatus -processors=g:fzf_preview_gina_processors<CR>
  nnoremap <silent> <Leader>fdG :<C-u>GGrep<CR>
  nnoremap <silent> <leader>fdk :<C-u>FzfPreviewMarks<CR>
  nnoremap <silent> <leader>fdm :<C-u>FzfPreviewMruFiles<CR>
  nnoremap <silent> <leader>fdo :<C-u>FzfPreviewOldFiles<CR>
  nnoremap <silent> <leader>fdp :<C-u>FzfPreviewProjectFiles<CR>
  nnoremap <silent> <leader>fdP :<C-u>FzfPreviewFromResources project_mru git<CR>
  nnoremap <silent> <leader>fdr :<C-u>Rg<CR>
  nnoremap          <leader>fdR :<C-u>FzfPreviewProjectGrep <C-r>=expand('<cword>')<CR><CR>
  xnoremap          <leader>fdR "sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
endif

if dein#tap('vim-easy-align')
  " Start interactive EasyAlign in visual mode
  xmap <Leader>raa <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object
  nmap <Leader>raa <Plug>(EasyAlign)
  " Start Live-interactive EasyAlign in visual mode
  xmap <Leader>rAA <Plug>(LiveEasyAlign)
  " Start Live-interactive EasyAlign for a motion/text object
  nmap <Leader>rAA <Plug>(LiveEasyAlign)
endif


if dein#tap('vim-go')
  nnoremap <silent> <LocalLeader>gi :GoImpl<CR>
  nnoremap <silent> <LocalLeader>gd :GoDescribe<CR>
  nnoremap <silent> <LocalLeader>gc :GoCallees<CR>
  nnoremap <silent> <LocalLeader>gC :GoCallers<CR>
  nnoremap <silent> <LocalLeader>gs :GoCallstack<CR>
endif

if dein#tap('vimagit')
  nnoremap <silent> <Leader>gm :Magit<CR>
endif

if dein#tap('vim-mundo')
  nnoremap <silent> <leader>m :MundoToggle<CR>
endif

if dein#tap('vim-choosewin')
  nmap - <Plug>(choosewin)
  nmap <Leader>- :<C-u>ChooseWinSwapStay<CR>
endif

if dein#tap('caw.vim')
  function! InitCaw() abort
    if ! (&l:modifiable && &buftype ==# '')
      silent! nunmap <buffer> <Leader>V
      silent! xunmap <buffer> <Leader>V
      silent! nunmap <buffer> <Leader>v
      silent! xunmap <buffer> <Leader>v
      silent! nunmap <buffer> gc
      silent! xunmap <buffer> gc
      silent! nunmap <buffer> gcc
      silent! xunmap <buffer> gcc
    else
      xmap <buffer> <Leader>/a <Plug>(caw:dollarpos:comment)
      nmap <buffer> <Leader>/a <Plug>(caw:dollarpos:comment)
      xmap <buffer> <Leader>/b <Plug>(caw:box:comment)
      nmap <buffer> <Leader>/b <Plug>(caw:box:comment)
      xmap <buffer> <Leader>/j <Plug>(caw:jump:comment-next)
      nmap <buffer> <Leader>/j <Plug>(caw:jump:comment-next)
      xmap <buffer> <Leader>/k <Plug>(caw:jump:comment-prev)
      nmap <buffer> <Leader>/k <Plug>(caw:jump:comment-prev)
      xmap <buffer> <Leader>/i <Plug>(caw:zeropos:comment)
      nmap <buffer> <Leader>/i <Plug>(caw:zeropos:comment)
      xmap <buffer> <Leader>/w <Plug>(caw:wrap:toggle)
      nmap <buffer> <Leader>/w <Plug>(caw:wrap:toggle)
      xmap <buffer> <Leader>/t <Plug>(caw:hatpos:toggle)
      nmap <buffer> <Leader>/t <Plug>(caw:hatpos:toggle)
      xmap <buffer> <Leader>// <Plug>(caw:hatpos:comment)
      nmap <buffer> <Leader>// <Plug>(caw:hatpos:comment)
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
  autocmd FileType python
        \ nmap <buffer> {{ [%
        \ | nmap <buffer> }} ]%
endif

if dein#tap('goyo.vim')
  nnoremap <Leader>ig :Goyo<CR>
endif

if dein#tap('defx.nvim')
  nnoremap <silent> <Leader>ee
        \ :<C-u>Defx -toggle -buffer-name=tab`tabpagenr()`<CR>
  nnoremap <silent> <Leader>er
        \ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
  nnoremap <silent> <Leader>ea
        \ :<C-u>Defx -resume -toggle -search=`expand('%:p')` `getcwd()`<CR>
endif

if dein#tap('vim-startify')
  nnoremap <silent> <leader>so :<C-u>Startify<CR>
  nnoremap <silent> <leader>sc :<C-u>SClose<CR>
  nnoremap <silent> <leader>ss :<C-u>SSave<CR>
  nnoremap <silent> <leader>sl :<C-u>SLoad<CR>
  nnoremap <silent> <leader>sd :<C-u>SDelete<CR>
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
  nnoremap <silent><leader>fdv     :Vista finder coc<CR>
endif

if dein#tap('vim-easymotion')
  nmap <Leader><Leader>w <Plug>(easymotion-w)
  nmap <Leader><Leader>f <Plug>(easymotion-f)
  nmap <Leader><Leader>b <Plug>(easymotion-b)
endif

if dein#tap('vim-which-key')
  nnoremap <silent> <Leader>      :<c-u>WhichKey '<Space>'<CR>
  vnoremap <silent> <leader>      :<c-u>WhichKeyVisual '<Space>'<CR>
  nnoremap <silent> <localleader> :<c-u>WhichKey ';'<CR>
  vnoremap <silent> <localleader> :<c-u>WhichKeyVisual ';'<CR>
  nnoremap <silent> [             :<c-u>WhichKey '['<CR>
  nnoremap <silent> ]             :<c-u>WhichKey ']'<CR>
  nnoremap <silent> ?s            :<c-u>WhichKey 's'<CR>
  vnoremap <silent> ?s            :<c-u>WhichKeyVisual 's'<CR>
  nnoremap <silent> ?d            :<c-u>WhichKey 'd'<CR>
  vnoremap <silent> ?d            :<c-u>WhichKeyVisual 'd'<CR>
  nnoremap <silent> ?g            :<c-u>WhichKey 'g'<CR>
  vnoremap <silent> ?g            :<c-u>WhichKeyVisual 'g'<CR>
endif

if dein#tap('vim-smartchr')
  inoremap <expr> , smartchr#one_of(',', ',')
  autocmd FileType go inoremap <buffer><expr> ;
        \ smartchr#loop(':=',';')
  autocmd FileType go inoremap <buffer> <expr> .
        \ smartchr#loop('.', '<-', '->','...')
endif

if dein#tap('vim-niceblock')
  silent! xmap I  <Plug>(niceblock-I)
  silent! xmap gI <Plug>(niceblock-gI)
  silent! xmap A  <Plug>(niceblock-A)
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

if dein#tap('linediff.vim')
  nmap <silent> <leader>idla :<C-u>LinediffAdd<CR>
  vmap <silent> <leader>idla :LinediffAdd<CR>
  nmap <silent> <leader>idlA :<C-u>LinediffAdd<C-a>
  nmap <silent> <leader>idld :<C-u>Linediff<CR>
  vmap <silent> <leader>idld :Linediff<CR>
  nmap <silent> <leader>idll :<C-u>LinediffLast<CR>
  vmap <silent> <leader>idll :LinediffLast<CR>
  nmap <silent> <leader>idlm :<C-u>LinediffMerge<CR>
  nmap <silent> <leader>idlp :<C-u>LinediffPick<CR>
  nmap <silent> <leader>idlr :<C-u>LinediffReset<CR>
  nmap <silent> <leader>idls :<C-u>LinediffShow<CR>
  " resets linediff with q when active
  autocmd User LinediffBufferReady nnoremap <buffer> q :LinediffReset<cr>
endif

if dein#tap('vim-zoom')
  nmap <Leader>wf <Plug>(zoom-toggle)
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
  nmap <LocalLeader>mtt :<C-u>Toc<CR>
  nmap <LocalLeader>mtv :<C-u>Tocv<CR>
  nmap <LocalLeader>mth :<C-u>Toch<CR>
endif

if dein#tap('vimtex')
  nnoremap <Leader>fdl :call vimtex#fzf#run()<cr>
endif

if dein#tap('accelerated-jk')
  " conservative deceleration
  let g:accelerated_jk_enable_deceleration = 1
  " if default key-repeat interval check(150 ms) is too short
  let g:accelerated_jk_acceleration_limit = 300

  " Time-driven acceleration
  nmap j <Plug>(accelerated_jk_gj_position)
  nmap k <Plug>(accelerated_jk_gk_position)
endif

if dein#tap('vimwiki')
  nmap <LocalLeader>WW :<C-u>VimwikiIndex<CR>
  nmap <LocalLeader>WI :<C-u>VimwikiDiaryIndex<CR>
  nmap <LocalLeader>wh :<C-u>Vimwiki2HTML<CR>
  nmap <LocalLeader>whh :<C-u>Vimwiki2HTMLBrowse<CR>
  nmap <LocalLeader>wH :<C-u>VimwikiAll2HTML<CR>
  nmap <LocalLeader>wl :<C-u>VimwikiGenerateLinks<CR>
endif

if dein#tap('taskwarrior.vim')
  nnoremap <LocalLeader>tW :<C-u>TW<Space>
endif

if dein#tap('vimux')
  " Prompt for a command to run
  nnoremap <Leader>vc :VimuxPromptCommand<CR>
  " Run last command executed by VimuxRunCommand
  nnoremap <Leader>vl :VimuxRunLastCommand<CR>
  " Inspect runner pane
  nnoremap <Leader>vi :VimuxInspectRunner<CR>
  " Close vim tmux runner opened by VimuxRunCommand
  nnoremap <Leader>vq :VimuxCloseRunner<CR>
  " Interrupt any command running in the runner pane
  nnoremap <Leader>vx :VimuxInterruptRunner<CR>
  " Zoom the runner pane (use <bind-key> z to restore runner pane)
  nnoremap <Leader>vf :VimuxZoomRunner<CR>
endif

if dein#tap('vim-wordy')
  if !&wildcharm | set wildcharm=<C-z> | endif
  execute 'nnoremap <leader>iww :Wordy<space>'.nr2char(&wildcharm)

  nnoremap <leader>iwn :NextWordy<CR>
  nnoremap <leader>iwp :PrevWordy<CR>
  nnoremap <leader>iwr :NoWordy<CR>
endif

if dein#tap('vim-quickhl')
  nmap <Leader>iht <Plug>(quickhl-manual-this)
  xmap <Leader>iht <Plug>(quickhl-manual-this)

  nmap <Leader>ihw <Plug>(quickhl-manual-this-whole-word)
  xmap <Leader>ihw <Plug>(quickhl-manual-this-whole-word)

  nmap <Leader>ihr <Plug>(quickhl-manual-reset)
  xmap <Leader>ihr <Plug>(quickhl-manual-reset)
endif

if dein#tap('thesaurus_query.vim')
  nnoremap <silent> <Leader>rt :<C-u>ThesaurusQueryReplaceCurrentWord<CR>
  vnoremap <silent> <Leader>rt y:ThesaurusQueryReplace <C-r>"<CR>
endif

if dein#tap('neoformat')
  nmap <Leader>lnf :Neoformat<CR>
endif

if dein#tap('neomake')
  nmap <Leader>lnm :Neomake<CR>
  nmap <Leader>lnc :NeomakeClean<CR>
endif

if dein#tap('vim-fugitive')
  " Ref http://vimcasts.org/episodes/fugitive-vim-exploring-the-history-of-a-git-repository/
  nnoremap <Leader>ga :<C-u>Git add %:p<CR>
  nnoremap <Leader>gA :<C-u>Git add .<CR>
  nnoremap <Leader>gb :<C-u>Git blame<CR>
  nnoremap <Leader>gdc :<C-u>Git diff --cached<CR>
  nnoremap <Leader>gdd :<C-u>Git diff<CR>
  nnoremap <Leader>gdt :<C-u>Git difftool<CR>
  nnoremap <Leader>gdh :<C-u>Ghdiffsplit<CR>
  nnoremap <Leader>gdv :<C-u>Gvdiffsplit<CR>
  nnoremap <Leader>gl :<C-u>Glog<CR>
  nnoremap <Leader>gL :<C-u>0Glog<CR>
  nnoremap <Leader>gF :<C-u>Gfetch<CR>
  nnoremap <Leader>gg :<C-u>Ggrep<Space>
  nnoremap <Leader>gG :<C-u>Glog --grep= -- %<Left><Left><Left><Left><Left>
  nnoremap <Leader>gP :<C-u>terminal git push<CR>
  nnoremap <Leader>gr :<C-u>Git reset<CR>
  nnoremap <Leader>gs :<C-u>Gstatus<CR>
endif

if dein#tap('gv.vim')
  nmap <Leader>gv :GV! --all<cr>
  vmap <Leader>gv :GV! --all<cr>
endif

if dein#tap('gina.vim')
  nnoremap <Leader>gc :<C-u>Gina commit<CR>
  nnoremap <Leader>go :<C-u>Gina log<CR>
  nnoremap <Leader>gp :<C-u>Gina push<CR>
endif


if dein#tap('calendar.vim')
  nnoremap <LocalLeader>ct :Calendar -view=clock<CR>
  nnoremap <LocalLeader>cc :Calendar -view=year -first_day=sunday<CR>
  nnoremap <LocalLeader>cd :Calendar -view=day<CR>
  nnoremap <LocalLeader>cw :Calendar -view=week<CR>
  nnoremap <LocalLeader>cv :Calendar -view=year -split=vertical -width=27 -first_day=sunday<CR>
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

  nnoremap <Leader>fr :Rooter<CR>
endif

if dein#tap('nvim-colorizer.lua')
  nnoremap <LocalLeader>sc :<C-u>ColorizerToggle<CR>
endif

if dein#tap('vCoolor.vim')
  nnoremap <silent> <Leader>ltcpa :<C-u>VCoolIns ra<CR>
  nnoremap <silent> <Leader>ltcph :<C-u>VCoolIns h<CR>
  nnoremap <silent> <Leader>ltcpr :<C-u>VCoolIns r<CR>
  nnoremap <silent> <Leader>ltcpx :<C-u>VCoolor<CR>
endif

if dein#tap('vim-convert-color-to')
  " Normal mode
  nnoremap <Leader>ltca :<C-u>ConvertColorTo rgba<CR>
  nnoremap <Leader>ltch :<C-u>ConvertColorTo hsl<CR>
  nnoremap <Leader>ltcH :<C-u>ConvertColorTo hsla<CR>
  nnoremap <Leader>ltcr :<C-u>ConvertColorTo rgb_int<CR>
  nnoremap <Leader>ltcR :<C-u>ConvertColorTo rgb_float<CR>
  nnoremap <Leader>ltcx :<C-u>ConvertColorTo hex<CR>
  nnoremap <Leader>ltcX :<C-u>ConvertColorTo hexa<CR>
  " Visual mode
  vnoremap <Leader>ltca :ConvertColorTo rgba<CR>
  vnoremap <Leader>ltch :ConvertColorTo hsl<CR>
  vnoremap <Leader>ltcH :ConvertColorTo hsla<CR>
  vnoremap <Leader>ltcr :ConvertColorTo rgb_int<CR>
  vnoremap <Leader>ltcR :ConvertColorTo rgb_float<CR>
  vnoremap <Leader>ltcx :ConvertColorTo hex<CR>
  vnoremap <Leader>ltcX :ConvertColorTo hexa<CR>
endif

if dein#tap('vim-abolish')
  nnoremap <Leader>rbs :<C-u>Subvert//g<Left><Left>
  vnoremap <Leader>rbs :Subvert//g<Left><Left>
  nnoremap <Leader>rbS :<C-u>%Subvert//g<Left><Left>
  nnoremap <Leader>rba :<C-u>Abolish<Space>
  vnoremap <Leader>rba :Abolish<Space>
  " Duplicate line and subvert
  inoremap <C-y> <ESC>yypV:Subvert//g<Left><Left>
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
