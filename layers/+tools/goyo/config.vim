let g:goyo_width=100 "(default: 80)
let g:goyo_height=100 "(default: 85%)
let g:goyo_linenr=1 "(default: 0)

" Disable visual candy in Goyo mode
function! s:goyo_enter()
	if has('gui_running')
		" Gui fullscreen
		set fullscreen
		set background=light
		set linespace=7
	elseif exists('$TMUX')
		" Hide tmux status
		silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
	endif

	set signcolumn=no
	set noshowmode
	set noshowcmd
	set scrolloff=999
	" Activate Limelight
	Limelight
endfunction

" Enable visuals when leaving Goyo mode
function! s:goyo_leave()
	if has('gui_running')
		" Gui exit fullscreen
		set nofullscreen
		set linespace=0
	elseif exists('$TMUX')
		" Show tmux status
		silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
	endif

	set signcolumn=yes:2
	set showmode
	set showcmd
	set scrolloff=5
	" De-activate Limelight
	Limelight!
endfunction

autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd  User GoyoEnter nested call <SID>goyo_enter()
autocmd  User GoyoLeave nested call <SID>goyo_leave()

