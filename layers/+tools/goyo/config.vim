let g:goyo_width=100 "(default: 80)
let g:goyo_height=100 "(default: 85%)
let g:goyo_linenr=1 "(default: 0)

function! s:goyo_enter()
  if has('gui_running')
    " Gui fullscreen
    set fullscreen
    set linespace=7
  elseif exists('$TMUX')
    " Hide tmux statusline and go fullscreen
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  " Backup and disable some settings
  let b:signcolumn_goyo_bak=&signcolumn
  let b:scrolloff_goyo_bak=&scrolloff
  set signcolumn=no
  set scrolloff=999
  if &showmode
    let b:showmode_goyo_bak=1
    set noshowmode
  else
    let b:showmode_goyo_bak=0
  endif
  if &showcmd
    let b:showcmd_goyo_bak=1
    set noshowcmd
  else
    let b:showcmd_goyo_bak=0
  endif
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
    " Show tmux status and exit fullscreen
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  " Restore backed up settings
  execute "set signcolumn=" . b:signcolumn_goyo_bak
  execute "set scrolloff=" . b:scrolloff_goyo_bak
  if b:showmode_goyo_bak
    set showmode
  endif
  if b:showcmd_goyo_bak
    set showcmd
  endif
  " Source custom colors
  source $VIM_PATH/core/color.vim
  " De-activate Limelight
  Limelight!
endfunction

augroup user_plugin_goyo
  autocmd!
  autocmd! User GoyoEnter
  autocmd! User GoyoLeave
  autocmd  User GoyoEnter nested call <SID>goyo_enter()
  autocmd  User GoyoLeave nested call <SID>goyo_leave()
  " Auto resize goyo width and height when resized or toggled fullscreen
  autocmd VimResized * if exists('#goyo') | exe "normal \<c-w>=" | endif
augroup END

