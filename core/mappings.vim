" Delete buffer
nnoremap q :bd<CR>

" Remaps macro record key since q has been remapped
nnoremap Q q

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

"yank to end
nnoremap Y y$

" Format and indent pasted text automatically
nnoremap p p=`]
nnoremap P P=`]

" Select last paste
nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" Yank buffer's absolute path to clipboard
nnoremap <Leader>y :let @+=expand("%:~:.")<CR>:echo 'Yanked relative path'<CR>
nnoremap <Leader>Y :let @+=expand("%:p")<CR>:echo 'Yanked absolute path'<CR>

" Write buffer (save)
nnoremap <leader>w :w<CR>
nnoremap <leader>W :wa<CR>
imap <C-S> <esc>:w<CR>
imap <C-Q> <esc>:wq<CR>

" Quit without saving
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>Q :qa!<CR>

" Save all and exit
nnoremap <leader>S :confirm wqa!<CR>

" Moves curser to the right after exiting insert mode
inoremap <Esc> <Esc>`^

" Esc from insert, visual and command mode shortcuts (also moves cursor to the right)
imap jj <Esc>`^
imap kk <Esc>`^
imap jk <Esc>`^
imap kj <Esc>`^
vmap <C-l> <Esc>
cmap <C-l> <C-c>

" Keep selection while indenting
vnoremap <silent> > ><cr>gv
vnoremap <silent> < <<cr>gv

" Select blocks after indenting in visual/select mode
xnoremap < <gv
xnoremap > >gv|

" insert keymap like emacs
inoremap <C-w> <C-[>diwa
inoremap <C-h> <BS>
inoremap <C-d> <Del>
" inoremap <C-k>  <ESC>d$a
inoremap <C-u> <C-G>u<C-U>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <expr><C-e> pumvisible() ? "\<C-e>" : "\<End>"

" command line alias
"cnoremap w!! w !sudo tee % >/dev/null
cnoremap <C-p> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>

" Move between tabs
nnoremap <silent> [t :tabprevious<CR>
nnoremap <silent> ]t :tabnext<CR>
nnoremap <silent> ]]t :tablast<CR>
nnoremap <silent> [[t :tabfirst<CR>

" Move between buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
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

"Switch window
"Deprecated by vim-tmux-navigator
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k

"smart move
" nnoremap j gj
" nnoremap k gk
" vnoremap j gj
" vnoremap k gk

" Makes Relative Number jumps work with text wrap
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
vnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
vnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

"tabline operation
noremap <leader>tn :tabnew<cr>
noremap <leader>te :tabedit
noremap <leader>tm :tabmove

" Navigate Through buffers
noremap <Leader><Tab> :bn<CR>
noremap <Leader><S-Tab> :bp<CR>

" Wipe current buffer
noremap <LocalLeader><Tab> :Bw<CR>
" Wipe all buffer except current
noremap <LocalLeader><S-Tab> :Bonly<CR>

" Use backspace key for matchit.vim
nmap <BS> %
xmap <BS> %

" Remove spaces at the end of lines
nnoremap <silent><Leader>rs :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>
vnoremap <silent><Leader>rs :<C-u>silent! keeppatterns substitute/\s\+$//e<CR>

" Format paragraph (selected or not) to 80 character lines.
nnoremap <Leader>rl gqap
xnoremap <Leader>rl gqa

" Duplicate paragraph
nnoremap <leader>rp yap<S-}>p

" Change current word in a repeatable manner
nnoremap <leader>rn *``cgn
nnoremap <leader>rN *``cgN

" Change selected word in a repeatable manner
vnoremap <expr> <leader>rn "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgn"
vnoremap <expr> <leader>rN "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgN"

" Refactoring texts
nnoremap <Leader>rr :%s///g<Left><Left>
nnoremap <Leader>rR :%s///gc<Left><Left><Left>

" <C-r>: Easier search and replace in visual mode
xnoremap <Leader>rr :<C-u>call <SID>get_selection('/')<CR>:%s/\V<C-R>=@/<CR>//gc<Left><Left><Left>

" Ref: https://vi.stackexchange.com/a/690
nmap <Leader>rE :%s/^/\=line('.').". "<CR>
" To enumerate lines with macro: https://stackoverflow.com/a/32053439/11850077

" Fix indentation
nmap <Leader>ri gg=G

" Returns visually selected text
function! s:get_selection(cmdtype) "{{{
	let temp = @s
	normal! gv"sy
	let @/ = substitute(escape(@s, '\'.a:cmdtype), '\n', '\\n', 'g')
	let @s = temp
endfunction "}}}

" Ref: https://stackoverflow.com/a/17440797/11850077
" Capitaliz each word of the selected
vnoremap <Leader>rC :s/\<./\u&/g<CR>
" Capitalize each word of current entire file
nnoremap <Leader>rC :%s/\<./\u&/g<CR>
" Lowercase each word of the selected
vnoremap <Leader>rc :s/\<./\l&/g<CR>
" Capitalize each word of current entire file
nnoremap <Leader>rc :%s/\<./\l&/g<CR>

" Splits
noremap sh :split<CR>
noremap sv :vsplit<CR>
noremap sx :close<CR>

" Resize splits vertically
nmap s[ :vertical resize -3<CR>
nmap s] :vertical resize +3<CR>
" Resize splites horizontally
nmap s{ :resize -3<CR>
nmap s} :resize +3<CR>

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

" Drag current line/s vertically and auto-indent
nnoremap <Leader><Leader>j :m+<CR>
nnoremap <Leader><Leader>k :m-2<CR>
vnoremap <Leader><Leader>k :m'<-2<CR>gv=gv
vnoremap <Leader><Leader>j :m'>+<CR>gv=gv

" Set working directory to current file location for all windows
nmap <LocalLeader>cd :cd %:p:h<CR>:pwd<CR>
" Set working directory to current file location only for the current window
nmap <LocalLeader>lcd :lcd %:p:h<CR>:pwd<CR>

" Closing pop-up auto-completion before inserting new line
inoremap <expr> <C-L> (pumvisible() <bar><bar> &insertmode) ? '<C-e><Esc>`^' : '<Esc>`^'
inoremap <expr> <A-o> (pumvisible() <bar><bar> &insertmode) ? '<C-e><A-o>' : '<A-o>'

" Open current file with xdg-open
nmap <silent><Leader>oo :!xdg-open "%:p"<CR>
" Open current file in google chrome
nmap <silent><Leader>og :!google-chrome "%:p"<CR>

" Git mappings for mergetools or diff mode
nnoremap dor :diffget RE<CR>
nnoremap dob :diffget BA<CR>
nnoremap dol :diffget LO<CR>
" Quit nvim with an error code. Useful when aborting git mergetool or git commit
nnoremap <Leader><Leader>q :cquit<CR>

" Allow <Esc> to exit terminal-mode back to normal:
tnoremap <Esc> <C-\><C-n>

" Toggle fold
nnoremap <Leader><CR> za
" Focus the current fold by closing all others
nnoremap <Leader><Leader><CR> zMzvzt
" Toggle fold all
nnoremap <expr> <Leader><Leader><Leader><CR> &foldlevel ? 'zM' :'zR'

" Improve scroll, credits: https://github.com/Shougo
nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ?
	\ 'zt' : (winline() == 1) ? 'zb' : 'zz'
noremap <expr> <C-f> max([winheight(0) - 2, 1])
	\ ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
noremap <expr> <C-b> max([winheight(0) - 2, 1])
	\ ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
noremap <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
noremap <expr> <C-y> (line("w0") <= 1         ? "k" : "3\<C-y>")

