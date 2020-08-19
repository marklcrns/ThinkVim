
" Vim Colors
" ---------------------------------------------------------
highlight Whitespace ctermfg=238 guifg=#424450 guibg=NONE ctermbg=NONE
highlight VertSplit  ctermfg=Black  guifg=Black guibg=NONE ctermbg=NONE
"highlight Normal guibg=NONE ctermbg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight SignColumn ctermfg=187 ctermbg=NONE guifg=#ebdbb2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
highlight! link pythonSpaceError  NONE
highlight! link pythonIndentError NONE
" highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#93a1a1 guibg=#002931

" Pmenu Colors
" ---------------------------------------------------------
" highlight PMenuSel ctermfg=252 ctermbg=106 guifg=#d0d0d0 guibg=#ba8baf guisp=#ba8baf cterm=NONE gui=NONE
" highlight Pmenu ctermfg=103 ctermbg=236 guifg=#9a9aba guibg=#34323e guisp=NONE cterm=NONE gui=NONE
" highlight PmenuSbar ctermfg=NONE ctermbg=234 guifg=NONE guibg=#212026 guisp=NONE cterm=NONE gui=NONE
" highlight PmenuSel ctermfg=NONE ctermbg=60 guifg=NONE guibg=#5e5079 guisp=NONE cterm=NONE gui=NONE
" highlight PmenuThumb ctermfg=NONE ctermbg=60 guifg=NONE guibg=#5d4d7a guisp=NONE cterm=NONE gui=NONE


"coc setting
" ---------------------------------------------------------
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2
hi default CocHighlightText  guibg=#725972 ctermbg=96
hi CocWarningSign  ctermfg=32 ctermbg=NONE guifg=#0087d7 guibg=NONE

" coc-yank highlight
highlight HighlightedyankRegion term=bold ctermbg=0 guibg=#d0d0d0

"GitGutter
" ---------------------------------------------------------
highlight GitGutterAdd ctermfg=22 guifg=#006000 ctermbg=NONE guibg=NONE
highlight GitGutterChange ctermfg=58 guifg=#5F6000 ctermbg=NONE guibg=NONE
highlight GitGutterDelete ctermfg=52 guifg=#600000 ctermbg=NONE guibg=NONE
highlight GitGutterChangeDelete ctermfg=52 guifg=#600000 ctermbg=NONE guibg=NONE

" Defx Highlight
" ---------------------------------------------------------
highlight Defx_filename_3_Modified  ctermfg=1  guifg=#D370A3
highlight Defx_filename_3_Staged    ctermfg=10 guifg=#A3D572
highlight Defx_filename_3_Ignored   ctermfg=8  guifg=#404660
highlight def link Defx_filename_3_Untracked Comment
highlight def link Defx_filename_3_Unknown Comment
highlight def link Defx_filename_3_Renamed Title
highlight def link Defx_filename_3_Unmerged Label
" highlight Defx_git_Deleted   ctermfg=13 guifg=#b294bb

" buftabline highlight
" ---------------------------------------------------------
highlight BufTabLineCurrent ctermbg=96 guibg=#5d4d7a

" magit highlight
" ---------------------------------------------------------
highlight  gitInfoRepotitle    guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitInfoHeadtitle   guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitInfoUpstreamtitle  guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitInfoPushtitle   guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitCommitModetitle  guibg=NONE guisp=NONE gui=bold cterm=bold

highlight  gitSectionsStaged guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitSectionsUnstaged guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitSectionsCommitMsg guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitSectionsCommitStash  guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitSectionsRecentCommit guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold

" tsx highlight
" ---------------------------------------------------------
" dark red
highlight tsxTagName guifg=#E06C75

" orange
highlight tsxCloseString guifg=#F99575
highlight tsxCloseTag guifg=#F99575
highlight tsxAttributeBraces guifg=#F99575
highlight tsxEqual guifg=#F99575
" light-grey
highlight tsxTypeBraces guifg=#999999
" dark-grey
highlight tsxTypes guifg=#666666
highlight ReactState guifg=#C176A7
highlight ReactProps guifg=#D19A66
highlight ApolloGraphQL guifg=#CB886B
highlight Events ctermfg=204 guifg=#56B6C2
highlight ReduxKeywords ctermfg=204 guifg=#C678DD
highlight ReduxHooksKeywords ctermfg=204 guifg=#C176A7
highlight WebBrowser ctermfg=204 guifg=#56B6C2
highlight ReactLifeCycleMethods ctermfg=204 guifg=#D19A66
" yellow
highlight tsxAttrib guifg=#F8BD7F cterm=italic

"GetColorSynatxGroup
" ---------------------------------------------------------
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Janah Color Scheme
" ---------------------------------------------------------
" Repo: https://github.com/mhinz/vim-janah
highlight Comment guifg=#585858 ctermfg=240 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

" Plugin: vim-indent-guides {{{
" Ref: https://github.com/rafi/vim-config/blob/master/themes/rafi-2016.vim
" ---------------------------------------------------------
highlight IndentGuidesOdd  guibg=#262626 ctermbg=235
highlight IndentGuidesEven guibg=#303030 ctermbg=236

" Conceal
hi Conceal guifg=#ebdbb2 guibg=NONE guisp=NONE gui=NONE cterm=NONE

" Bracket match color
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
" }}}
