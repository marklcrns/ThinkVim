" Enable true color
if has('termguicolors')
	set termguicolors
endif

set nobackup
set noswapfile
set autoread
set autowrite
set confirm
set splitbelow
set browsedir=buffer

if has('vim_starting')
	set encoding=UTF-8
	scriptencoding UTF-8
endif

set laststatus=2
set showtabline=2
set statusline=-        " hide file name in statusline
set fillchars+=vert:\|  " add a bar for vertical splits

if get(g:,'gruvbox_transp_bg',1)
    set fillchars=eob:\           " hide ~
endif

if has('mac')
    let g:clipboard = {
        \   'name': 'macOS-clipboard',
        \   'copy': {
        \      '+': 'pbcopy',
        \      '*': 'pbcopy',
        \    },
        \   'paste': {
        \      '+': 'pbpaste',
        \      '*': 'pbpaste',
        \   },
        \   'cache_enabled': 0,
        \ }
endif

" Set clipboard register
if has('clipboard')
    set clipboard& clipboard+=unnamedplus
endif

set history=5000
set number
set timeout ttimeout
set timeoutlen=500 " Time out on mappings
set updatetime=400 " Idle time to write swap and trigger CursorHold
set ttimeoutlen=10 " Time out on key codes
set cmdheight=2    " Height of the command line
set undofile
set undodir=~/.tmp/undo
set relativenumber
set backspace=2
set backspace=indent,eol,start
" Tabs and Indents {{{
" ----------------
                  " set textwidth=80    " Text width maximum chars before wrapping
set expandtab     " Don't expand tabs to spaces.
set tabstop=2     " The number of spaces a tab is
set softtabstop=2 " While performing editing operations
set shiftwidth=2  " Number of spaces to use in auto(indent)
set smarttab      " Tab insert blanks according to 'shiftwidth'
set autoindent    " Use same indenting on new lines
set smartindent   " Smart autoindenting on new lines
set shiftround    " Round indent to multiple of 'shiftwidth'
set nowrap
" }}}
set hidden
set shortmess=aFc
set signcolumn=yes:2
set completefunc=emoji#complete
set completeopt =longest,menu
set completeopt-=preview
set list
set listchars=tab:»·,nbsp:+,trail:·,extends:→,precedes:←

set colorcolumn=80
set mouse=a         " Enable mouse support
set scrolloff=5     " Keeps some screen visible while scrolling
set cursorline      " Highlights entire line of current cursor position"
set cursorcolumn    " Highlights column of current cursor position"
set ignorecase      " Search ignoring case
set smartcase       " Keep case when searching with *
set infercase       " Adjust case in insert completion mode
set incsearch       " Incremental search
set hlsearch        " Highlight search results
set wrapscan        " Searches wrap around the end of the file
set showmatch       " Jump to matching bracket
set matchpairs+=<:> " Add HTML brackets to pair matching
set matchtime=1     " Tenths of a second to show the matching paren
set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed
set grepprg=rg\ --vimgrep\ $*
set wildignore+=*.so,*~,*/.git/*,*/.svn/*,*/.DS_Store,*/tmp/*

if has('conceal')
	set conceallevel=2
  " set concealcursor=niv
endif

" Vim Directories {{{
" ---------------
set undofile swapfile nobackup
set directory=$DATA_PATH/swap//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set undodir=$DATA_PATH/undo//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set backupdir=$DATA_PATH/backup/,$DATA_PATH,~/tmp,/var/tmp,/tmp
set viewdir=$DATA_PATH/view/
set spellfile=$VIM_PATH/spell/en.utf-8.add

" Nvim specific settings
if !has('nvim')
    set ttymouse=sgr
    set cryptmethod=blowfish2
    set ttyfast
endif

" History saving
set history=1000
if has('nvim')
	set shada='1000,<50,@100,s10,h
else
	set viminfo='1000,<10,@50,h,n$DATA_PATH/viminfo
endif

" If sudo, disable vim swap/backup/undo/shada/viminfo writing
if $SUDO_USER !=# '' && $USER !=# $SUDO_USER
        \ && $HOME !=# expand('~'.$USER)
        \ && $HOME ==# expand('~'.$SUDO_USER)

    set noswapfile
    set nobackup
    set nowritebackup
    set noundofile
    if has('nvim')
        set shada="NONE"
    else
        set viminfo="NONE"
    endif
endif

" Secure sensitive information, disable backup files in temp directories
if exists('&backupskip')
    set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*
    set backupskip+=.vault.vim
endif

" Disable swap/undo/viminfo/shada files in temp directories or shm
augroup MyAutoCmd
    autocmd!
    silent! autocmd BufNewFile,BufReadPre
        \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim
        \ setlocal noswapfile noundofile nobackup nowritebackup viminfo= shada=
augroup END

if has('folding')
    set foldenable
    set foldmethod=syntax
    set foldlevelstart=99
endif

"--------------------------------------------------
" Autocommands:
"--------------------------------------------------

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" autoread file to check and update new changes in current buffer
autocmd FocusGained,BufEnter * :checktime

" Auto capitalization in start of sentences
" Ref: https://davidxmoody.com/2014/vim-auto-capitalisation/
" func! WordProcessorMode()
"   " Load Markdown syntax highlighting but with custom hashtag support
"   " set filetype=mkd
"   " syn match htmlBoldItalic "#[-_a-zA-Z0-9]\+"
"
"   " Other options
"   " set nonumber
"   " set wrap
"   " set linebreak
"   " set breakat=\ 
"   " set display=lastline
"   " set tabstop=4
"   " set softtabstop=4
"   " set shiftwidth=4
"   " set formatoptions=
"   " set spell spelllang=en_gb
"
"   " Auto-capitalize script
"   augroup SENTENCES
"     au!
"     autocmd InsertCharPre * if search('\v(%^|[.!?]\_s+|\_^\-\s|\_^title\:\s|\n\n)%#', 'bcnw') != 0 | let v:char = toupper(v:char) | endif
"   augroup END
" endfu
"
" com! WP call WordProcessorMode()
" au BufNewFile,BufRead *.mkd call WordProcessorMode()
" au BufNewFile,BufRead *.md call WordProcessorMode()
" au BufNewFile,BufRead *.txt call WordProcessorMode()
