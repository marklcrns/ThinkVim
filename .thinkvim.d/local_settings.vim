"======================================================================
" Global Configurations
"======================================================================

"--------------------------------------------------
" Basic Configuration:
"--------------------------------------------------

" Tabsize
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab smarttab

set nowrap
set colorcolumn=80
set cursorline
set scrolloff=5
set mouse=a

if has('folding')
	set foldenable
	set foldmethod=syntax
	set foldlevelstart=99
endif

" Nvim specific settings
if !has('nvim')
  set ttymouse=sgr
  set cryptmethod=blowfish2
  set ttyfast
endif

"--------------------------------------------------
" Basic Mappings:
"--------------------------------------------------

" Delete buffer
nnoremap q :bd<CR>

" Quit without saving
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>Q :qa!<CR>
" Write
nnoremap <leader>w :w<CR>
nnoremap <leader>W :wa<CR>
" Save all and exit
nnoremap <leader>S :confirm wqa!<CR>

" Remaps macro record key since q has been remapped
nnoremap Q q

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" Select last paste
nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'

" Keep selection while indenting
vnoremap <silent> > ><cr>gv
vnoremap <silent> < <<cr>gv

" Select blocks after indenting in visual/select mode
xnoremap < <gv
xnoremap > >gv|

" Fix indentation
nmap <Leader>ri gg=G

" Ref: https://vi.stackexchange.com/a/690
nmap <Leader>rE :%s/^/\=line('.').". "<CR>
" To enumerate lines with macro: https://stackoverflow.com/a/32053439/11850077

" Use backspace key for matchit.vim
nmap <BS> %
xmap <BS> %

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" Yank buffer's absolute path to clipboard
nnoremap <Leader>y :let @+=expand("%:~:.")<CR>:echo 'Yanked relative path'<CR>
nnoremap <Leader>Y :let @+=expand("%:p")<CR>:echo 'Yanked absolute path'<CR>

" Moves curser to the right after exiting insert mode
inoremap <Esc> <Esc>`^

" Esc from insert, visual and command mode shortcuts (also moves cursor to the right)
imap jj <Esc>`^
imap kk <Esc>`^
vmap <C-l> <Esc>
cmap <C-l> <C-c>

" Closing pop-up auto-completion before inserting new line
inoremap <expr> <C-L> (pumvisible() <bar><bar> &insertmode) ? '<C-e><Esc>`^' : '<Esc>`^'
inoremap <expr> <A-o> (pumvisible() <bar><bar> &insertmode) ? '<C-e><A-o>' : '<A-o>'

" Drag current line/s vertically and auto-indent
nnoremap <Leader><Leader>j :m+<CR>
nnoremap <Leader><Leader>k :m-2<CR>
vnoremap <Leader><Leader>k :m'<-2<CR>gv=gv
vnoremap <Leader><Leader>j :m'>+<CR>gv=gv

" Makes Relative Number jumps work with text wrap
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Move between tabs
nnoremap <silent> [t :tabprevious<CR>
nnoremap <silent> ]t :tabnext<CR>
nnoremap <silent> ]]t :tablast<CR>
nnoremap <silent> [[t :tabfirst<CR>

" Move between buffers
nnoremap <silent> [b :bnext<CR>
nnoremap <silent> ]b :bprevious<CR>
nnoremap <silent> ]]b :blast<CR>
nnoremap <silent> [[b :bfirst<CR>

" Move through the loclist
nnoremap <silent> [l :lprevious<CR>
nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [[l :lfirst<CR>
nnoremap <silent> ]]l :llast<CR>

" Toggle Locationlist
nnoremap <LocalLeader>l :call LocationlistToggle()<CR>

function! LocationlistToggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'locationlist'
            lclose
            return
        endif
    endfor

    lopen
endfunction

" Move through the quickfix list
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [[q :cfirst<CR>
nnoremap <silent> ]]q :clast<CR>

" Toggle Quickfix
nnoremap <LocalLeader>q :call QuickfixToggle()<CR>

function! QuickfixToggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

    copen
endfunction

" Splits
noremap <Leader><C-h> :split<CR>
noremap <Leader><C-v> :vsplit<CR>
noremap <C-x> :close<CR>

" Resize splits vertically
nmap <Leader>[ :vertical resize -3<CR>
nmap <Leader>] :vertical resize +3<CR>
" Resize splites horizontally
nmap <Leader>{ :resize -3<CR>
nmap <Leader>} :resize +3<CR>

" Set working directory to current file location for all windows
nmap <LocalLeader>cd :cd %:p:h<CR>:pwd<CR>
" Set working directory to current file location only for the current window
nmap <LocalLeader>lcd :lcd %:p:h<CR>:pwd<CR>

" C-r: Easier search and replace visual/select mode
xnoremap <C-r> :<C-u>call <SID>get_selection('/')<CR>:%s/\V<C-R>=@/<CR>//gc<Left><Left><Left>

" Returns visually selected text
function! s:get_selection(cmdtype) "{{{
	let temp = @s
	normal! gv"sy
	let @/ = substitute(escape(@s, '\'.a:cmdtype), '\n', '\\n', 'g')
	let @s = temp
endfunction "}}}

" Open current file with xdg-open
nmap <silent><Leader>oo :!xdg-open "%:p"<CR>
" Open current file in google chrome
nmap <silent><Leader>og :!google-chrome "%:p"<CR>

" Change current word in a repeatable manner
nnoremap <leader>rn *``cgn
nnoremap <leader>rN *``cgN

" Change selected word in a repeatable manner
vnoremap <expr> <leader>rn "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgn"
vnoremap <expr> <leader>rN "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgN"

" Refactoring texts
nnoremap <Leader>rr :%s///g<Left><Left>
nnoremap <Leader>rR :%s///gc<Left><Left><Left>
xnoremap <Leader>rr :s///g<Left><Left>
xnoremap <Leader>rR :s///gc<Left><Left><Left>

" Format paragraph (selected or not) to 80 character lines.
nnoremap <Leader>rl gqap
xnoremap <Leader>rl gqa

" Duplicate paragraph
nnoremap <leader>rp yap<S-}>p

" Allow <Esc> to exit terminal-mode back to normal:
tnoremap <Esc> <C-\><C-n>

" Toggle text wrap
nmap <LocalLeader>sw :set wrap!<CR>

" Toggle spell check.
nmap <Localleader>ss :setlocal spell!<CR>

" Toggle Conceallevel
nmap <LocalLeader>sc :call ToggleConcealLevel()<CR>
function! ToggleConcealLevel()
  if &conceallevel
    set conceallevel=0
  else
    set conceallevel=2
  end
endfunction

" Toggle fold
nnoremap <Leader><CR> za
" Focus the current fold by closing all others
nnoremap <Leader><Leader><CR> zMzvzt
" Toggle fold all
nnoremap <expr> <Leader><Leader><Leader><CR> &foldlevel ? 'zM' :'zR'

" Navigate Through buffers
noremap <Leader><Tab> :bn<CR>
noremap <Leader><S-Tab> :bp<CR>

" Wipe current buffer
noremap <LocalLeader><Tab> :Bw<CR>
" Wipe all buffer except current
noremap <LocalLeader><S-Tab> :Bonly<CR>

" Git mappings
nnoremap dor :diffget RE<CR>
nnoremap dob :diffget BA<CR>
nnoremap dol :diffget LO<CR>
" Quit nvim with an error code. Useful when aborting git mergetool or git commit
nnoremap <Leader><Leader>q :cquit<CR>

"--------------------------------------------------
" Autocommands:
"--------------------------------------------------

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

"======================================================================
" Dein Plugins Configurations
"======================================================================

" Spaceline {{{
if dein#tap('spaceline.vim')
    let g:spaceline_colorscheme = 'solarized_dark'
    let g:spaceline_seperate_mode = 1
    let g:spaceline_homemode_right = ''
    let g:spaceline_filename_left  = ''
    let g:spaceline_filesize_right = ''
    let g:spaceline_gitinfo_left   = ''
    let g:spaceline_gitinfo_right  = ''
    let g:spaceline_cocexts_right  = ''
    let g:spaceline_lineformat_right = ''
    let g:spaceline_seperate_endseperate = ''
    let g:spaceline_seperate_emptyseperate = ''
endif
" }}}

" Vim tmux navigator {{{
if dein#tap('vim-tmux-navigator')
    " Solution 1: https://github.com/RobbieClarken/dotfiles/commit/c1a8e28e46e4b0d26f6778e11fec3cea16e526e1
    " Solution 2: https://gist.github.com/akselsjogren/35aec0af39e53319e12a3e1432da4d4e
    " Make sure to add permission to the bash script with 'chmod +x ~/bin/workaround.sh'
    let g:tmux_navigator_disable_when_zoomed = 1
endif
" }}}

" Vim zoom {{{
if dein#tap('vim-zoom')
    nmap <Leader><C-f> <Plug>(zoom-toggle)
endif
" }}}

" Rainbow {{{
if dein#tap('rainbow')
    nmap <LocalLeader>sp :RainbowToggle<CR>
endif
" }}}

" Markdown Preview Config {{{
if dein#tap('markdown-preview.nvim')
    nmap <LocalLeader>md <Plug>MarkdownPreviewToggle
    nmap <LocalLeader>mo <Plug>MarkdownPreview
    nmap <LocalLeader>mc <Plug>MarkdownPreviewStop
endif
" }}}

" Vim Markdown Config {{{
if dein#tap('markdown-preview.nvim')
    nmap <LocalLeader>mtt :Toc<CR>
    nmap <LocalLeader>mtv :Tocv<CR>
    nmap <LocalLeader>mth :Toch<CR>
endif
" }}}

" Accelerated-jk Config {{{
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

" Vimwiki {{{
if dein#tap('vimwiki')
	nnoremap <silent> <LocalLeader>vw :<C-u>VimwikiIndex<CR>
	nnoremap <silent> <LocalLeader>vi :<C-u>VimwikiDiaryIndex<CR>
endif
" }}}

" Wordy {{{
if dein#tap('vim-wordy')
  if !&wildcharm | set wildcharm=<C-z> | endif
  execute 'nnoremap <leader>rw :Wordy<space>'.nr2char(&wildcharm)

  nnoremap <leader>rwn :NextWordy<CR>
  nnoremap <leader>rwp :PrevWordy<CR>
  nnoremap <leader>rwo :NoWordy<CR>

endif
" }}}

if dein#tap('vim-quickhl')
	nmap <Leader>mt <Plug>(quickhl-manual-this)
	xmap <Leader>mt <Plug>(quickhl-manual-this)

  nmap <Leader>mw <Plug>(quickhl-manual-this-whole-word)
  xmap <Leader>mw <Plug>(quickhl-manual-this-whole-word)

  nmap <Leader>mr <Plug>(quickhl-manual-reset)
  xmap <Leader>mr <Plug>(quickhl-manual-reset)
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
	nnoremap <silent> <Leader>gl :Glog<CR>
	vnoremap <silent> <Leader>gl :Glog<CR>
	nnoremap <silent> <Leader>gL :Glog -- %<CR>
	nnoremap <silent> <Leader>gg :Ggrep<Space>
	nnoremap <silent> <Leader>gG :Glog --grep= -- %<Left><Left><Left><Left><Left>
endif

if dein#tap('calendar.vim')
  nnoremap <LocalLeader>cc :Calendar -first_day=monday<CR>
  nnoremap <LocalLeader>ct :Calendar -view=clock<CR>
  nnoremap <LocalLeader>cf :Calendar -view=year -first_day=monday<CR>
  nnoremap <LocalLeader>cv :Calendar -view=year -split=vertical -width=27 -first_day=monday<CR>
  nnoremap <LocalLeader>ch :Calendar -view=year -split=horizontal -position=below -height=12 -first_day=monday<CR>
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

"--------------------------------------------------
" Kite Configs
"--------------------------------------------------

" Kite status line
set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P

" Enable autocompletion
let g:kite_auto_complete=1
let g:kite_tab_complete=1

set completeopt-=menu
set completeopt+=menuone   " Show the completions UI even with only 1 item
set completeopt-=longest   " Don't insert the longest common text
set completeopt-=preview   " Hide the documentation preview window
set completeopt+=noinsert  " Don't insert text automatically
set completeopt-=noselect  " Highlight the first completion automatically

" Enables placeholder jumping
let g:kite_previous_placeholder='<C-k>'
let g:kite_next_placeholder='<C-j>'

" Enables kite snippets
let g:kite_snippets=1

