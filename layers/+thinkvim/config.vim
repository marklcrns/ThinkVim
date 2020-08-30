" Plugin key settings

if dein#tap('any-jump.vim')
  nnoremap <silent> <leader>ab :AnyJumpBack<CR>
  nnoremap <silent> <Leader>aj :AnyJump<CR>
  xnoremap <silent> <Leader>aj :AnyJumpVisual<CR>
  nnoremap <silent> <leader>al :AnyJumpLastResults<CR>
endif

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
  vmap <leader>cF  <Plug>(coc-format-selected)
  nmap <leader>cF  <Plug>(coc-format-selected)
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
  nnoremap <Leader>cgB :CocCommand git.copyUrl<CR>
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
  " use normal command like `<leader>xi(`
  nmap <leader>cx <Plug>(coc-cursors-operator)

  nmap <expr> <silent> <C-s> <SID>select_current_word()
  function! s:select_current_word()
    if !get(g:, 'coc_cursors_activated', 0)
      return "\<Plug>(coc-cursors-word)"
    endif
    " Adjusted for vim-asterisk plugin
    return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
  endfunc

  nnoremap <silent> <leader>cs :<C-u>CocSearch<Space>
  nnoremap <silent> <leader>cS :<C-u>CocSearch -w<Space>

  nmap <leader>cr <Plug>(coc-refactor)

  " coc-explorer
  noremap <silent> <leader>ec :execute 'CocCommand explorer' .
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

if dein#tap('denite-git')
  nnoremap <silent> <Leader>dgb :<C-u>Denite gitbranch<CR>
  nnoremap <silent> <Leader>dgc :<C-u>Denite gitchanged<CR>
  nnoremap <silent> <Leader>dgl :<C-u>Denite gitlog:all<CR>
  nnoremap <silent> <Leader>dgf :<C-u>Denite gitfiles<CR>
  nnoremap <silent> <Leader>dgs :<C-u>Denite gitstatus<CR>
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

if dein#tap('vim-clap')
  nnoremap <silent> <Leader>fdc :<C-u>Clap colors<CR>
  nnoremap <silent> <Leader>fdb :<C-u>Clap buffers<CR>
  nnoremap <silent> <Leader>fdr :<C-u>Clap grep2<CR>
  nnoremap <silent> <Leader>fdm :<C-u>Clap marks<CR>
  "like emacs counsel-find-file
  nnoremap <silent> <C-x><C-f> :<C-u>Clap filer<CR>
  nnoremap <silent> <Leader>fdF :<C-u>Clap files ++finder=rg --hidden --files<cr>
  nnoremap <silent> <Leader>fdf :<C-u>Clap files ++finder=rg --files<cr>
  nnoremap <silent> <Leader>fdg :<C-u>Clap gfiles<CR>
  nnoremap <silent> <Leader>fdw :<C-u>Clap grep ++query=<cword><cr>
  nnoremap <silent> <Leader>fdh :<C-u>Clap history<CR>
  nnoremap <silent> <Leader>fdW :<C-u>Clap windows<CR>
  nnoremap <silent> <Leader>fdl :<C-u>Clap loclist<CR>
  nnoremap <silent> <Leader>fdu :<C-u>Clap git_diff_files<CR>
  nnoremap <silent> <Leader>fdv :<C-u>Clap grep ++query=@visual<CR>
  nnoremap <silent> <Leader>fdp :<C-u>Clap personalconf<CR>
endif

if dein#tap('coc-clap')
  nnoremap <silent> <Leader>cfa :<C-u>Clap coc_actions<Cr>
  nnoremap <silent> <Leader>cfc :<C-u>Clap coc_commands<Cr>
  nnoremap <silent> <Leader>cfd :<C-u>Clap coc_diagnostics<Cr>
  nnoremap <silent> <Leader>cfe :<C-u>Clap coc_extensions<Cr>
  nnoremap <silent> <Leader>cfl :<C-u>Clap coc_location<Cr>
  nnoremap <silent> <Leader>cfo :<C-u>Clap coc_outline<Cr>
  nnoremap <silent> <Leader>cfs :<C-u>Clap coc_symbols<Cr>
  nnoremap <silent> <Leader>cfv :<C-u>Clap coc_services<Cr>
endif

if dein#tap('dashboard-nvim')
  nmap <Leader>sS :<C-u>SessionSave<CR>
  nmap <Leader>sL :<C-u>SessionLoad<CR>
  nnoremap <silent> <Leader>sO  :<C-u>Dashboard<CR>
endif

if dein#tap('unite.vim')
  nnoremap <Leader>fua :<C-u>Unite file buffer<CR>
  nnoremap <Leader>fub :<C-u>Unite buffer<CR>
  nnoremap <Leader>fud :<C-u>Unite file_rec<CR>
  nnoremap <Leader>fuf :<C-u>Unite file<CR>
  nnoremap <Leader>fuu :<C-u>Unite<Space>
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
  nmap <Leader>- <Plug>(choosewin)
  nmap <Leader>_ :<C-u>ChooseWinSwapStay<CR>
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
      xmap <buffer> <Leader>// <Plug>(caw:hatpos:toggle)
      nmap <buffer> <Leader>// <Plug>(caw:hatpos:toggle)
      xmap <buffer> <Leader>/a <Plug>(caw:dollarpos:comment)
      nmap <buffer> <Leader>/a <Plug>(caw:dollarpos:comment)
      xmap <buffer> <Leader>/b <Plug>(caw:box:comment)
      nmap <buffer> <Leader>/b <Plug>(caw:box:comment)
      xmap <buffer> <Leader>/c <Plug>(caw:hatpos:comment)
      nmap <buffer> <Leader>/c <Plug>(caw:hatpos:comment)
      xmap <buffer> <Leader>/j <Plug>(caw:jump:comment-next)
      nmap <buffer> <Leader>/j <Plug>(caw:jump:comment-next)
      xmap <buffer> <Leader>/k <Plug>(caw:jump:comment-prev)
      nmap <buffer> <Leader>/k <Plug>(caw:jump:comment-prev)
      xmap <buffer> <Leader>/i <Plug>(caw:zeropos:comment)
      nmap <buffer> <Leader>/i <Plug>(caw:zeropos:comment)
      xmap <buffer> <Leader>/w <Plug>(caw:wrap:toggle)
      nmap <buffer> <Leader>/w <Plug>(caw:wrap:toggle)
      nmap <buffer> gc <Plug>(caw:prefix)
      xmap <buffer> gc <Plug>(caw:prefix)
      nmap <buffer> gcc <Plug>(caw:hatpos:toggle)
      xmap <buffer> gcc <Plug>(caw:hatpos:toggle)
    endif
  endfunction
  autocmd FileType * call InitCaw()
  call InitCaw()
endif

if dein#tap('vim-smoothie')
  nnoremap <silent> <C-f> :<C-U>call smoothie#forwards()<CR>
  nnoremap <silent> <C-b> :<C-U>call smoothie#backwards()<CR>
  nnoremap <silent> <C-d> :<C-U>call smoothie#downwards()<CR>
  nnoremap <silent> <C-u> :<C-U>call smoothie#upwards()<CR>
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
  nnoremap <silent> <Localleader>r :QuickRun -mode n<CR>
  vnoremap <silent> <LocalLeader>r :QuickRun -mode v<CR>
  nnoremap <silent> <localLeader><CR> :<C-u>set opfunc=quickrun#operator<CR>g@ip
endif

" if dein#tap('vim-asterisk')
"   map *  <Plug>(asterisk-z*)
"   map #  <Plug>(asterisk-z#)
"   map g* <Plug>(asterisk-gz*)
"   map g# <Plug>(asterisk-gz#)
" endif

if dein#tap('vim-floaterm')
  nnoremap <silent> <Leader>ota :Clap floaterm<CR>
  tnoremap <silent> <Leader>ota <C-\><C-n>:Clap floaterm<CR>
  nnoremap <silent> <Leader>otb :FloatermUpdate --wintype=normal --position=bottom<CR>
  tnoremap <silent> <Leader>otb <C-\><C-n>:FloatermUpdate --wintype=normal --position=bottom<CR>
  nnoremap <silent> <Leader>oth :FloatermHide<CR>
  tnoremap <silent> <Leader>oth <C-\><C-n>:FloatermHide<CR>
  nnoremap <silent> <Leader>otn :FloatermNext<CR>
  tnoremap <silent> <Leader>otn <C-\><C-n>:FloatermNext<CR>
  nnoremap <silent> <Leader>oto :FloatermNew<CR>
  tnoremap <silent> <Leader>oto <C-\><C-n>:FloatermNew<CR>
  nnoremap <silent> <Leader>otp :FloatermPrev<CR>
  tnoremap <silent> <Leader>otp <C-\><C-n>:FloatermPrev<CR>
  nnoremap <silent> <Leader>otq :FloatermKill<CR>
  tnoremap <silent> <Leader>otq <C-\><C-n>:FloatermKill<CR>
  nnoremap <silent> <Leader>otQ :FloatermKill!<CR>
  tnoremap <silent> <Leader>otQ <C-\><C-n>:FloatermKill!<CR>
  nnoremap <silent> <Leader>otr :FloatermNew ranger<CR>
  tnoremap <silent> <Leader>otr <C-\><C-n>:FloatermNew ranger<CR>
  nnoremap <silent> <Leader>ots :FloatermShow<CR>
  tnoremap <silent> <Leader>ots <C-\><C-n>:FloatermShow<CR>
  nnoremap <silent> <Leader>otS :FloatermSend<CR>
  nnoremap <silent> <Leader>ott :FloatermToggle<CR>
  tnoremap <silent> <Leader>ott <C-\><C-n>:FloatermToggle<CR>
  nnoremap <silent> <Leader>otu :FloatermUpdate<CR>
  tnoremap <silent> <Leader>otu <C-\><C-n>:FloatermUpdate<CR>
  tnoremap <silent> <Leader>otv <C-\><C-n>:FloatermUpdate --wintype=normal --position=right<CR>
  nnoremap <silent> <Leader>otv :FloatermUpdate --wintype=normal --position=right<CR>
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
  nnoremap <silent><localleader>vf :Vista focus<CR>
  nnoremap <silent><localleader>vo :Vista<CR>
  nnoremap <silent><localleader>vq :Vista!<CR>
endif

if dein#tap('vim-easymotion')
  nmap <Leader><Leader>s <Plug>(easymotion-overwin-f2)
  nmap <Leader><Leader>w <Plug>(easymotion-w)
  nmap <Leader><Leader>f <Plug>(easymotion-f)
  nmap <Leader><Leader>b <Plug>(easymotion-b)
  map <Leader><Leader>l <Plug>(easymotion-sl)
  map <Leader><Leader>j <Plug>(easymotion-j)
  map <Leader><Leader>k <Plug>(easymotion-k)
  map <Leader><Leader>h <Plug>(easymotion-linebackward)
  map  / <Plug>(easymotion-sn)
  omap / <Plug>(easymotion-tn)
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
  " inoremap <expr> ; smartchr#one_of(';', '.', ',')
  " autocmd FileType go inoremap <buffer><expr> ;
  "      \ smartchr#loop(':=',';')
  " autocmd FileType go inoremap <buffer> <expr> .
  "      \ smartchr#loop('.', '<-', '->','...')
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


" if dein#tap('vim-operator-replace')
"   xmap p <Plug>(operator-replace)
" endif

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
  " Disable mappings
  map <Plug> <Plug>Markdown_MoveToCurHeader
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
  " Setup vim for vimwiki diary note taking
  function! DToday()
    exec "VimwikiMakeDiaryNote"
    setlocal laststatus=0 showtabline=0 colorcolumn=0
  endfunction
  nmap <LocalLeader>wT :<C-u>call DToday()<CR>
endif

if dein#tap('taskwarrior.vim')
  nnoremap <LocalLeader>tW :<C-u>TW<CR>
endif

if dein#tap('taskwiki')
  " Normal mode task commands
  nnoremap <LocalLeader>ta :TaskWikiAnnotate<CR>
  nnoremap <LocalLeader>tcp :TaskWikiChooseProject<CR>
  nnoremap <LocalLeader>tct :TaskWikiChooseTag<CR>
  nnoremap <LocalLeader>td :TaskWikiDone<CR>
  nnoremap <LocalLeader>tD :TaskWikiDelete<CR>
  nnoremap <LocalLeader>te :TaskWikiEdit<CR>
  nnoremap <LocalLeader>tg :TaskWikiGrid<CR>
  nnoremap <LocalLeader>ti :TaskWikiInfo<CR>
  nnoremap <LocalLeader>tl :TaskWikiLink<CR>
  nnoremap <LocalLeader>tm :TaskWikiMod<CR>
  nnoremap <LocalLeader>t+ :TaskWikiStart<CR>
  nnoremap <LocalLeader>t- :TaskWikiStop<CR>
  " Visual mode counter part task commands
  vnoremap <LocalLeader>ta :TaskWikiAnnotate<CR>
  vnoremap <LocalLeader>tcp :TaskWikiChooseProject<CR>
  vnoremap <LocalLeader>tct :TaskWikiChooseTag<CR>
  vnoremap <LocalLeader>td :TaskWikiDone<CR>
  vnoremap <LocalLeader>tD :TaskWikiDelete<CR>
  vnoremap <LocalLeader>te :TaskWikiEdit<CR>
  vnoremap <LocalLeader>tg :TaskWikiGrid<CR>
  vnoremap <LocalLeader>ti :TaskWikiInfo<CR>
  vnoremap <LocalLeader>tl :TaskWikiLink<CR>
  vnoremap <LocalLeader>tm :TaskWikiMod<CR>
  vnoremap <LocalLeader>t+ :TaskWikiStart<CR>
  vnoremap <LocalLeader>t- :TaskWikiStop<CR>

  " Other normal mode commands
  nnoremap <LocalLeader>tbd :TaskWikiBurndownDaily<CR>
  nnoremap <LocalLeader>tbw :TaskWikiBurndownWeekly<CR>
  nnoremap <LocalLeader>tbm :TaskWikiBurndownMonthly<CR>
  nnoremap <LocalLeader>tC :TaskWikiCalendar<CR>
  nnoremap <LocalLeader>tGm :TaskWikiGhistoryMonthly<CR>
  nnoremap <LocalLeader>tGa :TaskWikiGhistoryAnnual<CR>
  nnoremap <LocalLeader>thm :TaskWikiHistoryMonthly<CR>
  nnoremap <LocalLeader>tha :TaskWikiHistoryAnnual<CR>
  nnoremap <LocalLeader>tp :TaskWikiProjects<CR>
  nnoremap <LocalLeader>ts :TaskWikiProjectsSummary<CR>
  nnoremap <LocalLeader>tS :TaskWikiStats<CR>
  nnoremap <LocalLeader>tt :TaskWikiTags<CR>
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

if dein#tap('vim-indent-guides')
  nmap <silent> <LocalLeader>si <Plug>IndentGuidesToggle
endif

if dein#tap('vim-signature')
  let g:SignatureIncludeMarks = 'abcdefghijkloqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
  let g:SignatureMap = {
    \ 'Leader':            'm',
    \ 'ListBufferMarks':   'm/',
    \ 'ListBufferMarkers': 'm?',
    \ 'PlaceNextMark':     'm,',
    \ 'ToggleMarkAtLine':  'mm',
    \ 'PurgeMarksAtLine':  'm-',
    \ 'DeleteMark':        'dm',
    \ 'PurgeMarks':        'm<Space>',
    \ 'PurgeMarkers':      'm<BS>',
    \ 'GotoNextLineAlpha': "']",
    \ 'GotoPrevLineAlpha': "'[",
    \ 'GotoNextSpotAlpha': '`]',
    \ 'GotoPrevSpotAlpha': '`[',
    \ 'GotoNextLineByPos': "]'",
    \ 'GotoPrevLineByPos': "['",
    \ 'GotoNextSpotByPos': 'mn',
    \ 'GotoPrevSpotByPos': 'mp',
    \ 'GotoNextMarker':    ']-',
    \ 'GotoPrevMarker':    '[-',
    \ 'GotoNextMarkerAny': ']=',
    \ 'GotoPrevMarkerAny': '[=',
    \ }
endif

if dein#tap('vim-wordy')
  " auto wildcharm trigger
  if !&wildcharm | set wildcharm=<C-z> | endif
  execute 'nnoremap <leader>lgww :Wordy<space>'.nr2char(&wildcharm)

  nnoremap <leader>lgwn :NextWordy<CR>
  nnoremap <leader>lgwp :PrevWordy<CR>
  nnoremap <leader>lgwr :NoWordy<CR>
endif

if dein#tap('vim-grammarous')
  nnoremap <Leader>lgg :GrammarousCheck<CR>
  vnoremap <Leader>lgg :GrammarousCheck<CR>
  nnoremap <Leader>lgc :GrammarousCheck --comments-only<CR>
  vnoremap <Leader>lgc :GrammarousCheck --comments-only<CR>
  nnoremap <Leader>lgu :Unite grammarous<CR>
  nnoremap <Leader>lgd :Denite grammarous<CR>

  nmap <Leader>lgG <Plug>(operator-grammarous)
  nmap <Leader>lgm <Plug>(grammarous-move-to-info-window)
  nmap <Leader>lgo <Plug>(grammarous-open-info-window)
  nmap <Leader>lgq <Plug>(grammarous-reset)
  nmap <Leader>lgf <Plug>(grammarous-fixit)
  nmap <Leader>lgF <Plug>(grammarous-fixall)
  nmap <Leader>lgr <Plug>(grammarous-remove-error)

  let g:grammarous#hooks = {}
  function! g:grammarous#hooks.on_check(errs) abort
      nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
      nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
  endfunction

  function! g:grammarous#hooks.on_reset(errs) abort
      nunmap <buffer><C-n>
      nunmap <buffer><C-p>
  endfunction
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
  nnoremap <Leader>gb :<C-u>Git blame<CR>
  nnoremap <Leader>gdc :<C-u>Gdiff --cached<CR>
  nnoremap <Leader>gdd :<C-u>Gdiff<Space>
  nnoremap <Leader>gdt :<C-u>Git difftool<CR>
  nnoremap <Leader>gds :<C-u>Gdiffsplit!<CR>
  nnoremap <Leader>gdh :<C-u>Ghdiffsplit<CR>
  nnoremap <Leader>gdv :<C-u>Gvdiffsplit<CR>
  nnoremap <Leader>gl :<C-u>Glog<CR>
  nnoremap <Leader>gL :<C-u>0Glog<CR>
  nnoremap <Leader>gF :<C-u>Gfetch<CR>
  nnoremap <Leader>gg :<C-u>Ggrep<Space>
  nnoremap <Leader>gG :<C-u>Glog --grep= -- %<Left><Left><Left><Left><Left>
  nnoremap <Leader>gr :<C-u>Git reset<CR>
  nnoremap <Leader>gs :<C-u>Gstatus<CR>
endif

if dein#tap('gv.vim')
  nmap <Leader>gv :GV! --all<cr>
  vmap <Leader>gv :GV! --all<cr>
endif

if dein#tap('gina.vim')
  nnoremap <Leader>ga :<C-u>Gina add %:p<CR>
  nnoremap <Leader>gA :<C-u>Gina add .<CR>
  nnoremap <Leader>gB :<C-u>Gina blame<CR>
  nnoremap <Leader>gc :<C-u>Gina commit<CR>
  nnoremap <Leader>go :<C-u>Gina log<CR>
  nnoremap <Leader>gp :<C-u>Gina push<CR>
endif

if dein#tap('calendar.vim')
  nnoremap <LocalLeader>cc :Calendar -view=year -first_day=sunday<CR>
  nnoremap <LocalLeader>cd :Calendar -view=day<CR>
  nnoremap <LocalLeader>ch :Calendar -view=day -split=horizontal -position=below -height=12<CR>
  nnoremap <LocalLeader>cm :Calendar -view=monthly<CR>
  nnoremap <LocalLeader>ct :Calendar -view=clock<CR>
  nnoremap <LocalLeader>cv :Calendar -view=year -split=vertical -width=27 -first_day=sunday<CR>
  nnoremap <LocalLeader>cw :Calendar -view=week<CR>
endif

if dein#tap('vim-rooter')
  nnoremap <Leader>frr :Rooter<CR>
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
  " Duplicate line and subvert. Uses "x register for yanking and pasting
  nnoremap <M-y> "xyy"xpV:Subvert//g<bar>norm`.$
        \ <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
  inoremap <M-y> <ESC>"xyy"xpV:Subvert//g<bar>norm`.$
    \ <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
endif

if dein#tap('far.vim')
  nnoremap <silent> <Leader>rfd  :Fardo<cr>
  nnoremap <silent> <Leader>rff  :Farf<cr>
  vnoremap <silent> <Leader>rff  :Farf<cr>
  nnoremap <silent> <Leader>rfr  :Refar<cr>
  vnoremap <silent> <Leader>rfr  :Refar<cr>
  nnoremap <silent> <Leader>rfs  :Farr<cr>
  vnoremap <silent> <Leader>rfs  :Farr<cr>
  nnoremap <silent> <Leader>rfu  :Farundo<cr>
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
