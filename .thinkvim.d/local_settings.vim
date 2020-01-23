"======================================================================
" Global Configurations
"======================================================================

"--------------------------------------------------
" Basic Configuration:
"--------------------------------------------------

if has('folding')
	set foldenable
	set foldmethod=syntax
	set foldlevelstart=99
endif

" Tabsize
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab smarttab

set nowrap

set colorcolumn=80
set cursorline
set scrolloff=5

"--------------------------------------------------
" Basic Mappings:
"--------------------------------------------------

" Quit withou saving
nnoremap q :confirm q!<CR>

" Write all buffers and exit
" If there are buffers without a name, or that are readonly, bring up a confirm prompt
nnoremap <leader>W :confirm wqall<CR>

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
imap jw <Esc>`^
imap wj <Esc>`^
vmap <C-l> <Esc>
cmap <C-l> <C-c>

" Closing pop-up auto-completion before inserting new line
inoremap <expr> <C-L> (pumvisible() <bar><bar> &insertmode) ? '<C-e><Esc>`^' : '<Esc>`^'
inoremap <expr> <A-o> (pumvisible() <bar><bar> &insertmode) ? '<C-e><A-o>' : '<A-o>'

" Drag current line/s vertically and auto-indent
nnoremap <Leader>j :m+<CR>
nnoremap <Leader>k :m-2<CR>
vnoremap <Leader>k :m'<-2<CR>gv=gv
vnoremap <Leader>j :m'>+<CR>gv=gv

" Makes Relative Number jumps work with text wrap
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Splits
noremap <Leader><C-h> :split<CR>
noremap <Leader><C-v> :vsplit<CR>

" Resize splits vertically
nmap <Leader>[ :vertical resize -3<CR>
nmap <Leader>] :vertical resize +3<CR>
" Resize splites horizontally
nmap <Leader>{ :resize -3<CR>
nmap <Leader>} :resize +3<CR>

" C-r: Easier search and replace visual/select mode
xnoremap <C-r> :<C-u>call <SID>get_selection('/')<CR>:%s/\V<C-R>=@/<CR>//gc<Left><Left><Left>

" Returns visually selected text
function! s:get_selection(cmdtype) "{{{
	let temp = @s
	normal! gv"sy
	let @/ = substitute(escape(@s, '\'.a:cmdtype), '\n', '\\n', 'g')
	let @s = temp
endfunction "}}}

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
nnoremap <Leader>rg gqap
xnoremap <Leader>rg gqa

" Duplicate paragraph
nnoremap <leader>rp yap<S-}>p

" Allow <Esc> to exit terminal-mode back to normal:
tnoremap <Esc> <C-\><C-n>

" Toggle text wrap
nmap <LocalLeader>sw :set wrap!<CR>

" Toggle spell check.
map <Localleader>ss :setlocal spell!<CR>

" Toggle fold
nnoremap <CR> za

" Focus the current fold by closing all others
nnoremap <Leader><CR> zMzvzt

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
let g:spaceline_colorscheme = 'base16_dark'
" }}}

" Vim tmux navigator {{{
if dein#tap('vim-tmux-navigator')
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
	nnoremap <silent> <Leader>vw :<C-u>VimwikiIndex<CR>
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

