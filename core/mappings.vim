
" Ref: https://stackoverflow.com/a/29236158
" TODO: Fix behavior not closing readonly buffer split
function! SmartBufClose()
  let curBuf = bufnr('%')
  let curBufName = bufname('%')
  let curTab = tabpagenr()
  exe 'bnext'

  " Quit window/split if buffer is empty ([No Name] buffer)
  if (curBufName == '' || !&modifiable || &readonly)
      exe 'q!'
      return
  else
    " If in last buffer, create empty buffer
    if curBuf == bufnr('%')
        exe 'enew'
    endif

    " Loop through tabs
    for i in range(tabpagenr('$'))
        " Go to tab (is there a way with inactive tabs?)
        exe 'tabnext ' . (i + 1)
        " Store active window nr to restore later
        let curWin = winnr()
        " Loop through windows pointing to buffer
        let winnr = bufwinnr(curBuf)
        while (winnr >= 0)
            " Go to window and switch to next buffer
            exe winnr . 'wincmd w | bnext'
            " Restore active window
            exe curWin . 'wincmd w'
            let winnr = bufwinnr(curBuf)
        endwhile
      echo 'Exited ' . curBufName
    endfor

    " Close buffer, restore active tab
    exe 'bd' . curBuf
    exe 'tabnext ' . curTab
  endif
endfunction
noremap <silent> q :call SmartBufClose()<cr>

" Delete buffer without
noremap q :bd<CR>

" Remaps macro record key since q has been remapped
nnoremap Q q

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" Yank to end
nnoremap Y y$

" Yank and paste line immediatly below
nnoremap <C-y> yyp$
inoremap <C-y> <Esc>yyp`.A

" Duplicate current line then enter line substitution
" inoremap <C-y> <ESC>yypV:s//g<Left><Left>  " Deprecated by vim-abolish

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

" Resources: https://vim.fandom.com/wiki/Get_the_name_of_the_current_file
" Yank buffer's relative path without file extension to '+' clipboard
nnoremap <Leader>fye :let @+=expand("%:r")<bar>echo 'Yanked relative file path without extension'<CR>
" Yank buffer's absolute path without file extension to '+' clipboard
nnoremap <Leader>fyE :let @+=expand("%:p:r")<bar>echo 'Yanked absolute file path without extension'<CR>
" Yank buffer's relative file path to '+' register
nnoremap <Leader>fyp :let @+=expand("%:~:.")<bar>echo 'Yanked relative file path'<CR>
" Yank buffer's absolute file path to '+' register
nnoremap <Leader>fyP :let @+=expand("%:p")<bar>echo 'Yanked absolute file path'<CR>
" Yank buffer file name to '+' register
nnoremap <Leader>fyf :let @+=expand("%:t")<bar>echo 'Yanked file name'<CR>
" Yank buffer file name without extension to '+' register
nnoremap <Leader>fyF :let @+=expand("%:t:r")<bar>echo 'Yanked file name without extension'<CR>
" Yank buffer's relative directory path to '+' register
nnoremap <Leader>fyd :let @+=expand("%:p:h:t")<bar>echo 'Yanked relative directory path'<CR>
" Yank buffer's absolut directory path to '+' register
nnoremap <Leader>fyD :let @+=expand("%:p:h")<bar>echo 'Yanked absolute directory path'<CR>
" Yank buffer's file extension only to '+' clipboard
nnoremap <Leader>fyx :let @+=expand("%:e")<bar>echo 'Yanked file extension'<CR>
" :edit file path from clipboard register
nnoremap <Leader>fyo :execute "e " . getreg('+')<bar>echo 'Opened ' . expand("%:p")<CR>

" Write/Save buffer
nnoremap <leader>fs :w<CR>
vnoremap <leader>fs :<Esc>w<CR>

" Write/Save all buffer
nnoremap <leader>fS :wa<CR>
vnoremap <leader>fS :<Esc>wa<CR>

" Quit without saving
nnoremap <Leader>q :q!<CR>
vnoremap <Leader>q :<Esc>q!<CR>

" Quit all without saving
nnoremap <Leader>Q :qa!<CR>
vnoremap <Leader>Q :<Esc>qa!<CR>

" Save and quit
nnoremap <leader>fq :wq!<CR>
vnoremap <leader>fq :<Esc>wq!<CR>

" SAve all and quit
nnoremap <leader>fQ :confirm wqa!<CR>
vnoremap <leader>fQ :<Esc>confirm wqa!<CR>

" Moves curser to the right after exiting insert mode
inoremap <Esc> <Esc>`^
" Esc from insert, visual and command mode shortcuts (also moves cursor to the
" right)
cnoremap <C-g> <C-c>
inoremap fd <Esc>`^
snoremap fd <Esc>`^
vnoremap fd <Esc>`>
vnoremap df <Esc>`>
inoremap kj <Esc>`^
snoremap kj <Esc>`^

" Keep selection while indenting
vnoremap <silent> > ><cr>gv
vnoremap <silent> < <<cr>gv

" Select blocks after indenting in visual/select mode
xnoremap < <gv
xnoremap > >gv|

" Select last inserted characters.
inoremap <M-v> <ESC>v`[

" Insert keymap like emacs (Adjusted for new <Esc>`^ remapping above)
" delete word before cursor (prioritize words over punctualtions and
" delimiters)
" imap <C-w> <C-[>bcaw
" no longer needed. Ref: https://vim.fandom.com/wiki/Recover_from_accidental_Ctrl-U
" imap <C-u> <C-G>u<C-U>
imap <C-h> <BS>
imap <C-l> <Del>
imap <C-k> <C-[>Da
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
" print insert buffer file directory path
cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>
" Easy wildcharm navigation
cnoremap <expr><C-j> pumvisible() ? "\<C-n>" : nr4char(&wildcharm)
cnoremap <expr><C-k> pumvisible() ? "\<C-p>" : nr3char(&wildcharm)
cnoremap <expr><Tab> pumvisible() ? "\<C-e>".nr2char(&wildcharm) : nr2char(&wildcharm)

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
" `j` cycles forward, `k` cycles backward
nnoremap <Leader>rej :let @x=@k \| let @k=@j \| let @j=@b \| let @b=@a \| let @a=@+ \| let @+=@x \| reg +abjk<CR>
nnoremap <Leader>rek :let @x=@+ \| let @+=@a \| let @a=@b \| let @b=@j \| let @j=@k \| let @k=@x \| reg +abjk<CR>

" Paste register `+` then cycle through registers
nnoremap <Leader>reJ p:let @x=@k \| let @k=@j \| let @j=@b \| let @b=@a \| let @a=@+ \| let @+=@x \| reg +abjk<CR>
nnoremap <Leader>reK p:let @x=@+ \| let @+=@a \| let @a=@b \| let @b=@j \| let @j=@k \| let @k=@x \| reg +abjk<CR>
vnoremap <Leader>reJ p:let @x=@k \| let @k=@j \| let @j=@b \| let @b=@a \| let @a=@+ \| let @+=@x \| reg +abjk<CR>
vnoremap <Leader>reK p:let @x=@+ \| let @+=@a \| let @a=@b \| let @b=@j \| let @j=@k \| let @k=@x \| reg +abjk<CR>

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
" Use "." to repeat changes with next occurence
nnoremap <leader>rn *``cgn
nnoremap <leader>rN *``cgN
" Change selected word in a repeatable manner
vnoremap <expr> <leader>rn "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgn"
vnoremap <expr> <leader>rN "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgN"

" Search and replace whole buffer
nnoremap <Leader>rr :%s//gc<Left><Left><Left>
" Search and replace current line only
nnoremap <Leader>rR :s//gc<Left><Left><Left>
" Search and replace within visually selected only
xnoremap <Leader>rr :s//gc<Left><Left><Left>

" Search and replace last selected with confirmation
nnoremap <Leader>rf :<C-u>call <SID>get_selection('/')<CR>:%s/\V<C-R>=@/<CR>//gc<Left><Left><Left>
xnoremap <Leader>rf :<C-u>call <SID>get_selection('/')<CR>:%s/\V<C-R>=@/<CR>//gc<Left><Left><Left>

" Ref: https://vi.stackexchange.com/a/690
nmap <Leader>rE :%s/^/\=line('.').". "<CR>
" To enumerate lines with macro: https://stackoverflow.com/a/32053439/11850077
" To enumerate lines with few commands: https://stackoverflow.com/a/48408001/11850077

" Fix indentation of while buffer
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

" Yank everything from current file
nnoremap <Leader>rya ggVGy

" Splits
noremap <Leader>wH :split<CR>
noremap <Leader>wV :vsplit<CR>
noremap <Leader>wc :close<CR>
" Deletes buffer but keeps the split
" Ref: https://stackoverflow.com/a/19619038/11850077
noremap <Leader>wd :b#<bar>bd#<CR>

" Resize splits vertically
nmap <Leader>wh :vertical resize -3<CR>
nmap <Leader>wl :vertical resize +3<CR>
nmap <Left> :vertical resize -3<CR>
nmap <Right> :vertical resize +3<CR>
" Resize splits horizontally
nmap <Leader>wk :resize -3<CR>
nmap <Leader>wj :resize +3<CR>
nmap <Up> :resize -3<CR>
nmap <Down> :resize +3<CR>

" Toggle conceallevel
function! ToggleConcealLevel()
  if &conceallevel
    set conceallevel=0
  else
    set conceallevel=2
  end
endfunction
nmap <LocalLeader>se :call ToggleConcealLevel()<CR>

" Toggle gutter
function! ToggleGutter()
  if &signcolumn == 'yes'
    set signcolumn=no
    echom 'Sign gutter deactivated'
  else
    set signcolumn=yes
    echom 'Sign gutter activated'
  endif
endfunction
nmap <silent> <LocalLeader>sg :call ToggleGutter()<CR>

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
  if g:activate_cursorline == 1
    set nocursorline
    let g:activate_cursorline = 0
    echom 'Cursorline deactivated'
  else
    set cursorline
    let g:activate_cursorline = 1
    echom 'Cursorline activated'
  endif
endfunction

function! ToggleCursorcolumn()
  if g:activate_cursorcolumn == 1
    set nocursorcolumn
    let g:activate_cursorcolumn = 0
    echom 'Cursorcolumn deactivated'
  else
    set cursorcolumn
    let g:activate_cursorcolumn = 1
    echom 'Cursorcolumn activated'
  endif
endfunction

function! ToggleCrosshair()
  if (&cursorline || &cursorcolumn)
    set nocursorline nocursorcolumn
    let g:activate_cursorline = 0
    let g:activate_cursorcolumn = 0
  else
    set cursorline cursorcolumn
    let g:activate_cursorline = 1
    let g:activate_cursorcolumn = 1
  endif
endfunction

nmap <silent> <LocalLeader>sll :<C-u>call ToggleCursorline()<CR>
nmap <silent> <LocalLeader>slc :<C-u>call ToggleCursorcolumn()<CR>
nmap <silent> <LocalLeader>slx :<C-u>call ToggleCrosshair()<CR>

" Toggle spell check
nmap <LocalLeader>ss :set spell!<CR>

" Toggle virtualedit mode
nmap <LocalLeader>sv :<C-u>call ToggleVirtualedit()<CR>

function! ToggleVirtualedit()
  if &virtualedit == ''
    set virtualedit=all
  else
    set virtualedit=""
  endif
endfunction

" Toggle text wrap
nmap <LocalLeader>sw :set wrap!<CR>

" Jumps to previously misspelled word and fixes it with the first in the
" suggestion
" Update: also echo changes and line and col number
" Ref: https://castle.Dev/post/lecture-notes-1/
inoremap <C-s> <Esc>:set spell<bar>norm i<C-g>u<Esc>[s"syiW1z="tyiW:let @l=line('.')<bar>let @c=virtcol('.')<CR>``a<C-g>u<Esc>:set nospell<bar>:echo getreg('l') . ":" . getreg('c') . " spell fixed (" . getreg('s') . " -> " . getreg('t') . ")"<CR>la

" Drag current line(s) vertically and auto-indent
nnoremap <Leader>J :m+<CR>
nnoremap <Leader>K :m-2<CR>
vnoremap J :m'>+<CR>gv=gv
vnoremap K :m'<-2<CR>gv=gv

" Set working directory to current file location for all windows
nnoremap <Leader>frc :cd %:p:h<CR>:pwd<CR>
" Set working directory to current file location only for the current window
nnoremap <Leader>frl :lcd %:p:h<CR>:pwd<CR>

" Closing pop-up auto-completion before inserting new line
inoremap <expr> <M-o> (pumvisible() <bar><bar> &insertmode) ? '<C-e><M-o>' : '<M-o>'
inoremap <expr> <M-O> (pumvisible() <bar><bar> &insertmode) ? '<C-e><M-O>' : '<M-O>'

" Open current file with xdg-open
nmap <silent><Leader>oo :!xdg-open "%:p"<CR>
" Open current file in google chrome
nmap <silent><Leader>og :!google-chrome "%:p"<CR>

" Diff split with a file (auto wildcharm trigger)
if !&wildcharm | set wildcharm=<C-z> | endif
execute 'nnoremap <Leader>idv :vert diffsplit '.expand("%:p:h").'/'.nr2char(&wildcharm)
execute 'nnoremap <Leader>idh :diffsplit '.expand("%:p:h").'/'.nr2char(&wildcharm)
execute 'nnoremap <Leader>idV :vert diffsplit $HOME/'.nr2char(&wildcharm)
execute 'nnoremap <Leader>idH :diffsplit $HOME/'.nr2char(&wildcharm)

" Git mappings for mergetools or diff mode
nnoremap dor :diffget RE<CR>
nnoremap dob :diffget BA<CR>
nnoremap dol :diffget LO<CR>
" Quit nvim with an error code. Useful when aborting git mergetool or git commit
nnoremap dq :cquit<CR>

" Fixes `[c` and `]c` not working
nnoremap [c [c
nnoremap ]c ]c

" Allow <Esc> to exit terminal-mode back to normal:
tnoremap <Esc> <C-\><C-n>

" Toggle fold
nnoremap <LocalLeader>zf za
" Focus the current fold by closing all others
nnoremap <LocalLeader>zF zMzvzt
" Toggle fold all
nnoremap <expr> <LocalLeader>zm &foldlevel ? 'zM' :'zR'
" Jumping to next closed fold
" Ref: https://stackoverflow.com/a/9407015/11850077
nnoremap <silent> <LocalLeader>zj :call NextClosedFold('j')<cr>
nnoremap <silent> <LocalLeader>zk :call NextClosedFold('k')<cr>
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
map <expr> zz (winline() == (winheight(0)+1) / 2) ?
      \ 'zt' : (winline() == 1) ? 'zb' : 'zz'
map <expr> <C-f> max([winheight(0) - 2, 1])
      \ ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
map <expr> <C-b> max([winheight(0) - 2, 1])
      \ ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
map <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
" map <expr> <C-y> (line("w0") <= 1         ? "k" : "3\<C-y>")

function! JavaCompile()
  exec '!javac %'
  exec 'VimuxInterruptRunner'
  exec 'VimuxRunLastCommand'
endfunction
" Autocompile Java and run last Vimux command
autocmd FileType java nnoremap <buffer><silent><Leader>ljj :call JavaCompile()<CR>
" Compile current java file
autocmd FileType java nnoremap <buffer><silent><Leader>ljc :!javac %<CR>
" Save, complie, and run java file in current buffer <C-c> to exit program
autocmd FileType java nnoremap <buffer><silent><Leader>ljr :w<CR>:!javac % && java %:r<CR>

function! AddSubtract(char, back)
  let pattern = &nrformats =~ 'alpha' ? '[[:alpha:][:digit:]]' : '[[:digit:]]'
  call search(pattern, 'cw' . a:back)
  execute 'normal! ' . v:count1 . a:char
  silent! call repeat#set(":\<C-u>call AddSubtract('" .a:char. "', '" .a:back. "')\<CR>")
endfunction
" Increment/Decrement next searcheable number by one. Wraps at end of file.
nnoremap <silent> <M-a> :<C-u>call AddSubtract("\<C-a>", '')<CR>
nnoremap <silent> <M-x> :<C-u>call AddSubtract("\<C-x>", '')<CR>
" Increment/Decrement previous searcheable number by one. Wraps at start of file.
" nnoremap <silent> <Leader><M-a> :<C-u>call AddSubtract("\<C-a>", 'b')<CR>
" nnoremap <silent> <Leader><M-x> :<C-u>call AddSubtract("\<C-x>", 'b')<CR>

" Load all TODO's from all files of the same extension as the current buffer
" within project directory.
" Ref: https://stackoverflow.com/a/4106211/11850077
nnoremap <Leader>T :execute "noautocmd vimgrep /TODO/j **/*." . expand("%:e")<bar>cw<CR>

" ========== Custom single purpose functions and mappings ==========



" Append '.md' to clipboard register yanked file path and :edit from current directory
nnoremap <Leader>;wm :cd %:h<bar>execute "e " . expand("%:p:h") . '/' . getreg('+') . '.md'<bar>echo 'Opened ' . expand("%:p")<CR>

" Creates a wiki link based from the relative path of the source file to be
" imported, then copy its content. Close the source file buffer after and goes
" back to target index file or start point.
" Requirements:
" 1. Source references to import has to start from 2nd buffer
" 2. Target index has to be the last buffer
" 3. Start cursor should be at the line above the target line.
" 4. MkNonExDir() from https://stackoverflow.com/a/4294176/11850077
" 5. vim-buffet plugin
" Insert date ref: https://vim.fandom.com/wiki/Insert_current_date_or_time
function! VimConvertImportFiles(repeat)
  " loop through nth times with repeat arg
  let i = 0
  while i < a:repeat
    " mark 'A' to index file and reference import file
    exec "norm! mA"
    exec "norm \<plug>BuffetSwitch(2)"
    " copy relative file path without extension
    exec "let @+=expand('%:r')"
    " mark 'B' to reference file first line
    exec "norm! ggmB"
    " go back to index and create a new link for the reference file
    exec "norm 'AA\<cr>\<esc>p\<cr>"

    " Open new wiki link relative to current working directory and mark to 'C'
    exec "cd %:h"
    exec 'e ' . expand('%:p:h') . '/' . getreg('+') . '.md'
    exec 'norm! mC'
    " go to reference file and yank all contents
    exec "norm! 'BVGy"
    " go to new wiki link and paste all
    exec "norm! 'Cp"

    " copy filename wihtout extension
    exec "let @+=expand('%:t:r')"
    " add markdown title and author meta data, filename as title.
    exec "norm! ggO---"
    exec "put='title: ' . getreg('+')"
    exec "put='author: Mark Lucernas'"
    " add markdown date meta
    exec "pu='date: ' . strftime('%Y-%m-%d')"
    exec "pu='---'"

    " save and delete reference and new wiki buffers, then go back to index
    exec "w!"
    exec "norm! \<c-^>"
    exec "bd"
    exec "redraw!"
    exec "norm! 'Aj"

    let i += 1
  endwhile
endfunction
nmap <Leader>;wi :call VimConvertImportFiles()<Left>

