" Delete buffer
nnoremap q :bd<CR>

" Remaps macro record key since q has been remapped
nnoremap Q q

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" Yank to end
nnoremap Y y$

" Duplicate current line then enter line substitution
inoremap <C-y> <ESC>yypV:s//g<Left><Left>

fun! AutoIndentPaste()
  " Don't apply on these filetypes
  if &filetype =~ 'markdown\|vimwiki\|text|\snippets\|tex'
    return
  endif
  " Format and indent pasted text automatically. Also select pasted texts after
  nnoremap <buffer> p p=`]
  nnoremap <buffer> P P=`]
endfun

autocmd BufWritePre * call AutoIndentPaste()

" Select last paste
nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" Yank buffer's absolute path to clipboard
nnoremap <Leader>fy :let @+=expand("%:~:.")<CR>:echo 'Yanked relative path'<CR>
nnoremap <Leader>fY :let @+=expand("%:p")<CR>:echo 'Yanked absolute path'<CR>

" Write buffer (save)
nnoremap <leader>fw :w<CR>
vnoremap <leader>fw :<Esc>w<CR>
" Write all buffer
nnoremap <leader>fW :wa<CR>
vnoremap <leader>fW :<Esc>wa<CR>
" imap <C-S> <esc>:w<CR>
imap <C-Q> <esc>:wq<CR>

" Quit without saving
nnoremap <Leader>fq :q!<CR>
nnoremap <Leader>fQ :qa!<CR>

" Save all and exit
nnoremap <leader>fs :confirm wqa!<CR>

" Moves curser to the right after exiting insert mode
inoremap <Esc> <Esc>`^

" Esc from insert, visual and command mode shortcuts (also moves cursor to the right)
imap fd <Esc>`^
imap kj <Esc>`^
smap fd <Esc>`^
smap kj <Esc>`^
vmap fd <Esc>

vmap <C-l> <Esc>
cmap <C-l> <C-c>

" Keep selection while indenting
vnoremap <silent> > ><cr>gv
vnoremap <silent> < <<cr>gv

" Select blocks after indenting in visual/select mode
xnoremap < <gv
xnoremap > >gv|

" Select last inserted characters
inoremap <C-v> <ESC>v`[

" insert keymap like emacs
imap <C-w> <C-[>diwa
imap <C-h> <BS>
imap <C-d> <Del>
imap <C-k> <ESC>d$a
imap <C-u> <C-G>u<C-U>
imap <C-a> <Home>
imap <expr><C-e> pumvisible() ? "\<C-e>" : "\<End>"
" Cursor navigation
imap <C-b> <Left>
imap <C-f> <Right>
imap <expr><C-n> pumvisible() ? "\<C-n>" : "\<Down>"
imap <expr><C-p> pumvisible() ? "\<C-p>" : "\<Up>"
" move between sentences
imap <M-a> <C-[>(i
imap <M-e> <C-[>)i

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
nnoremap <silent> ]T :tablast<CR>
nnoremap <silent> [T :tabfirst<CR>

" Move between buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> [B :bfirst<CR>

" Move through the loclist
nnoremap <silent> [l :lprevious<CR>
nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [L :lfirst<CR>
nnoremap <silent> ]L :llast<CR>

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
nnoremap <silent> [Q :cfirst<CR>
nnoremap <silent> ]Q :clast<CR>

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

" Cycle through vim register +abjkx.
" Register `+` as the system clipboard and `x` as temp holder
" `rj` cycles forward, `rk` cycles backward
nnoremap <Leader>rej :let @x=@k \| let @k=@j \| let @j=@b \| let @b=@a \| let @a=@+ \| let @+=@x \| reg +abjk<CR>
nnoremap <Leader>rek :let @x=@+ \| let @+=@a \| let @a=@b \| let @b=@j \| let @j=@k \| let @k=@x \| reg +abjk<CR>
" Paste register `+` then cycle through registers
nnoremap <Leader>reJ p:let @x=@k \| let @k=@j \| let @j=@b \| let @b=@a \| let @a=@+ \| let @+=@x \| reg +abjk<CR>
nnoremap <Leader>reK p:let @x=@+ \| let @+=@a \| let @a=@b \| let @b=@j \| let @j=@k \| let @k=@x \| reg +abjk<CR>
" Copy selected then cycle through registers
vnoremap <Leader>rej y<ESC>:let @x=@k \| let @k=@j \| let @j=@b \| let @b=@a \| let @a=@+ \| let @+=@x \| reg +abjk<CR>
vnoremap <Leader>rek y<ESC>:let @x=@+ \| let @+=@a \| let @a=@b \| let @b=@j \| let @j=@k \| let @k=@x \| reg +abjk<CR>
" Display register +abjk
nnoremap <Leader>reg :reg +abjk<CR>

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

" Wrap paragraph to textwidth
nnoremap <Leader>rl gqap
xnoremap <Leader>rl gqa

" Duplicate paragraph
nnoremap <leader>rp yap<S-}>p

" Duplicate selected line
" Ref: https://stackoverflow.com/a/3806683/11850077
vnoremap <Leader>rp y`]p

" Change current word in a repeatable manner
nnoremap <leader>rn *``cgn
nnoremap <leader>rN *``cgN
" Change selected word in a repeatable manner
vnoremap <expr> <leader>rn "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgn"
vnoremap <expr> <leader>rN "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgN"

" Search and replace
" Ref: https://vim.fandom.com/wiki/Search_and_replace
nnoremap <Leader>rr :%s///g<Left><Left>
nnoremap <Leader>rR :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>rr :s///g<Left><Left>
xnoremap <Leader>rR :s///gc<Left><Left><Left>

" <C-r>: Easier search and replace in visual mode
xnoremap <Leader>rf :<C-u>call <SID>get_selection('/')<CR>:%s/\V<C-R>=@/<CR>//gc<Left><Left><Left>

" Ref: https://vi.stackexchange.com/a/690
nmap <Leader>rE :%s/^/\=line('.').". "<CR>
" To enumerate lines with macro: https://stackoverflow.com/a/32053439/11850077
" To enumerate lines with few commands: https://stackoverflow.com/a/48408001/11850077

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
" Lowercase each word of current entire file
nnoremap <Leader>rc :%s/\<./\l&/g<CR>

" Splits
noremap <Leader>sh :split<CR>
noremap <Leader>sv :vsplit<CR>
noremap <Leader>sc :close<CR>
" Deletes buffer but keeps the split
" Ref: https://stackoverflow.com/a/19619038/11850077
noremap <Leader>sd :b#<bar>bd#<CR>

" Resize splits vertically
nmap <Leader>s[ :vertical resize -3<CR>
nmap <Leader>s] :vertical resize +3<CR>
" Resize splites horizontally
nmap <Leader>s{ :resize -3<CR>
nmap <Leader>s} :resize +3<CR>

" Toggle text wrap
nmap <LocalLeader>sw :set wrap!<CR>

" Toggle spell check.
nmap <Localleader>ss :setlocal spell!<CR>

" Toggle conceallevel
function! ToggleConcealLevel()
  if &conceallevel
    set conceallevel=0
  else
    set conceallevel=2
  end
endfunction
nmap <LocalLeader>sc :call ToggleConcealLevel()<CR>

" Toggle gutter
function! ToggleGutter()
  if &signcolumn == 'yes'
    set signcolumn=no
  else
    set signcolumn=yes
  endif
endfunction
nmap <LocalLeader>sg :call ToggleGutter()<CR>

" Toggle curosrcolumn and cursorline function
if &cursorline
  let g:activate_cursorline = 1
else
  let g:activate_cursorline = 0
endif
if &cursorcolumn
  let g:activate_cursorcolumn = 1
else
  let g:activate_cursorcolumn = 0
endif
function! ToggleCursorline()
  if &cursorline
    set nocursorline
    let g:activate_cursorline = 0
  else
    set cursorline
    let g:activate_cursorline = 1
  endif
endfunction
nmap <silent> <LocalLeader>sll :<C-u>call ToggleCursorline()<CR>

function! ToggleCursorcolumn()
  if &cursorcolumn
    set nocursorcolumn
    let g:activate_cursorcolumn = 0
  else
    set cursorcolumn
    let g:activate_cursorcolumn = 1
  endif
endfunction
nmap <silent> <LocalLeader>slc :<C-u>call ToggleCursorcolumn()<CR>

" Jumps to previously misspelled word and fixes it with the first in the
" suggestion
" Ref: https://castel.dev/post/lecture-notes-1/
inoremap <C-s> <c-g>u<Esc>[s1z=`]a<c-g>u

" Drag current line/s vertically and auto-indent
nnoremap gj :m+<CR>
nnoremap gk :m-2<CR>
vnoremap gk :m'<-2<CR>gv=gv
vnoremap gj :m'>+<CR>gv=gv

" Set working directory to current file location for all windows
" nmap <LocalLeader>cd :cd %:p:h<CR>:pwd<CR>
" Set working directory to current file location only for the current window
" nmap <LocalLeader>lcd :lcd %:p:h<CR>:pwd<CR>

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
nnoremap dq :cquit<CR>

nnoremap <Leader>ed :vert diffsplit $HOME/

" Fixes `[c` and `]c` not working
nnoremap [c [c
nnoremap ]c ]c

" Allow <Esc> to exit terminal-mode back to normal:
tnoremap <Esc> <C-\><C-n>

" Toggle fold
nnoremap <Leader>zf za
" Focus the current fold by closing all others
nnoremap <Leader>zF zMzvzt
" Toggle fold all
nnoremap <expr> <Leader>zm &foldlevel ? 'zM' :'zR'
" Jumping to next closed fold
" Ref: https://stackoverflow.com/a/9407015/11850077
nnoremap <silent> <leader>zj :call NextClosedFold('j')<cr>
nnoremap <silent> <leader>zk :call NextClosedFold('k')<cr>
function! NextClosedFold(dir)
  let cmd = 'norm!z' . a:dir
  let view = winsaveview()
  let [l0, l, open] = [0, view.lnum, 1]
  while l != l0 && open
    exe cmd
    let [l0, l] = [l, line('.')]
    let open = foldclosed(l) < 0
  endwhile
  if open
    call winrestview(view)
  endif
endfunction

" Improve scroll, credits: https://github.com/Shougo
nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ?
      \ 'zt' : (winline() == 1) ? 'zb' : 'zz'
noremap <expr> <C-f> max([winheight(0) - 2, 1])
      \ ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
noremap <expr> <C-b> max([winheight(0) - 2, 1])
      \ ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
noremap <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
noremap <expr> <C-y> (line("w0") <= 1         ? "k" : "3\<C-y>")

" Compile current java file
autocmd FileType java nnoremap <buffer><silent><Leader>jc :!javac %<CR>
" Save, complie, and run java file in current buffer <C-c> to exit program
autocmd FileType java nnoremap <buffer><silent><Leader>jr :w<CR>:!javac % && java %:r<CR>
" Autocompile Java and run last Vimux command
autocmd FileType java nnoremap <buffer><silent><Leader>jj :call JavaCompile()<CR>
function! JavaCompile()
  exec '!javac %'
  exec 'VimuxInterruptRunner'
  exec 'VimuxRunLastCommand'
endfunction
