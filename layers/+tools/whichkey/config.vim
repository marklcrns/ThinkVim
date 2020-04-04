let g:which_key_map =  {}
let g:which_key_map = {
    \ 'name' : '+leader-key',
       \ '-' : 'Choose window' ,
       \ '/' : {
             \ 'name' : '+commenter',
             \ '/' : 'Comment toggle',
             \ 'a' : 'Comment line/selected end',
             \ 'b' : 'Comment box',
             \ 'c' : 'Comment line/selected',
             \ 'j' : 'Jump next comment',
             \ 'k' : 'Jump Prev comment',
             \ 'i' : 'Comment line/selected beginning',
             \ 'w' : 'Comment wrap toggle',
             \ },
       \ '<Tab>' : 'Next buffer',
       \ '<S-Tab>' : 'Prev buffer',
       \ '1' : 'Buffer 1',
       \ '2' : 'Buffer 2',
       \ '3' : 'Buffer 3',
       \ '4' : 'Buffer 4',
       \ '5' : 'Buffer 5',
       \ '6' : 'Buffer 6',
       \ '7' : 'Buffer 7',
       \ '8' : 'Buffer 8',
       \ '9' : 'Buffer 9',
       \ '0' : 'Buffer 10',
    \ 'c' : {
          \ 'name' : '+coc',
             \ 'a' : 'Code action text object',
             \ 'c' : 'Code action current word',
             \ 'C' : 'Open coc config',
             \ 'e' : 'Open coc explorer',
             \ 'f' : 'Coc format',
             \ 'g' : {
                   \ 'name' : '+coc-git',
                   \ 'b' : 'Preview line in git browser',
                   \ 'c' : 'Coc git commit',
                   \ 'd' : 'Git diff cached',
                   \ 'f' : 'Toggle fold all except git chunks',
                   \ 'i' : 'Preview git chunk under cursor',
                   \ 's' : 'Stage git chunk under cursor',
                   \ 't' : 'Coc git status',
                   \ 'u' : 'Undo git chunk changes under cursor',
                  \ },
             \ 'j' : 'Coc list next',
             \ 'k' : 'Coc list prev',
             \ 'l' : {
                   \ 'name' : '+coc-list',
                     \ 'c' : 'Coc commands',
                     \ 'd' : 'Coc diagnostics',
                     \ 'e' : 'Coc extensions',
                     \ 'm' : 'Coc marketplace',
                     \ 'o' : 'File outline',
                     \ 'r' : 'Resume last coc list',
                     \ 's' : 'Search workspace symbols',
                     \ 'w' : 'Coc rgrep selected word or motion',
                     \ 'W' : 'Coc grep cursor word in buffer',
                   \ },
          \ 'n' : 'Coc rename variable under cursor',
          \ 'r' : 'Coc refactor word under cursor',
          \ 's' : 'Coc search {prompt}',
          \ 'S' : 'Coc search word match {prompt}',
          \ 't' : {
                \ 'name' : '+coc-toggles',
                \ 'g' : 'Toggle coc git gutter',
                \ 's' : 'Toggle coc spell checker',
                \ },
          \ 'm' : 'Coc template',
          \ 'q' : 'Coc autofix current line',
          \ 'x' : 'Coc cursors operate',
          \ },
    \ 'd' : {
          \ 'name' : '+denite',
             \ 'd' : 'Open denite',
          \ 'g' : {
                \ 'name' : '+denite-git',
                   \ 'b' : 'Git change branch',
                   \ 'l' : 'Git log all',
                \ },
          \ },
    \ 'e' : {
          \ 'name' : '+file-explorer',
             \ 'a' : 'Toggle explorer to current file',
             \ 'e' : 'Toggle explorer to current directory',
             \ 'r' : 'Toggle explorer resume directory',
          \ },
    \ 'f' : {
          \ 'name' : '+file-management',
          \ 'd' : {
                \ 'name' : '+file-finder',
                \ 'b' : 'Find on buffers',
                \ 'B' : 'Find on all buffers',
                \ 'c' : 'Find colorscheme',
                \ 'f' : 'Find files on directory',
                \ 'F' : 'Find files on directory (old)',
                \ 'g' : 'Files git status',
                \ 'G' : 'Git grep',
                \ 'l' : 'Find vimtex',
                \ 'k' : 'Find files with marks',
                \ 'm' : 'Find mru files',
                \ 'o' : 'Find old files',
                \ 'p' : 'Find on a project',
                \ 'P' : 'Find on a git project',
                \ 'r' : 'Search {word} in directory recursively',
                \ 'R' : 'Search word in directory recursively',
                \ 'v' : 'Find vista outline',
                \ },
             \ 'q' : 'Save all and quit',
             \ 'r' : 'Change working directory to file',
             \ 's' : 'Save buffer',
             \ 'S' : 'Save all buffers',
             \ 'y' : 'Yank relative path',
             \ 'Y' : 'Yank absolute path',
          \ },
    \ 'g' : {
          \ 'name' : '+git-operate',
             \ 'a' : 'Git add',
             \ 'A' : 'Git add all',
             \ 'b' : 'Git blame',
             \ 'B' : 'Gbrowse',
             \ 'c' : 'Gina commit',
             \ 'd' : {
                   \ 'name' : '+git-diff',
                   \ 'c' : 'Git diff cached',
                   \ 'd' : 'Git diff',
                   \ 't' : 'Git difftool',
                   \ 'h' : 'Git diffthis horizontal',
                   \ 'v' : 'Git diffthis vertical',
                   \ },
             \ 'F' : 'Git fetch',
             \ 'g' : 'Ggrep {word}',
             \ 'G' : 'Git log grep current file',
             \ 'l' : 'Git log quickfix',
             \ 'L' : 'Git log current file quickfix',
             \ 'm' : 'Magit status',
             \ 'o' : 'Gina log',
             \ 'p' : 'Git push',
             \ 'P' : 'Terminal git push',
             \ 's' : 'Gina status',
             \ 'v' : 'Git commit browser',
          \ },
    \ 'i' : {
          \ 'name' : '+interface',
          \ 'd' : {
                \ 'name' : '+diff',
                \ 'l' : {
                      \ 'name' : '+linediff',
                      \ 'a' : 'Linediff add',
                      \ 'A' : '[range(n,nth)]Linediff Add',
                      \ 'd' : 'Linediff',
                      \ 'l' : 'Linediff last add and show',
                      \ 'm' : 'Linediff merge conflict',
                      \ 'p' : 'Linediff pick merge conflict',
                      \ 'r' : 'Linediff reset',
                      \ 's' : 'Linediff show',
                      \ },
                \ },
          \ 'g' : 'Goyo toggle' ,
          \ 'h' : {
                \ 'name' : '+quick-highlight',
                \ 't' : 'Highlight this',
                \ 'r' : 'Highlight reset',
                \ 'w' : 'Highlight this whole word',
                \ },
          \ 'w' : {
                \ 'name' : '+wordy',
                \ 'p' : 'Prev wordy',
                \ 'n' : 'Next wordy',
                \ 'r' : 'Remove wordy',
                \ 'w' : 'Wordy',
                \ },
          \ },
    \ 'J' : 'Move line down',
    \ 'K' : 'Move line up',
    \ 'l' : {
          \ 'name' : '+language',
          \ 'j' : {
                \ 'name' : '+java',
                \ 'c' : 'Javac compile',
                \ 'j' : 'Save compile run',
                \ 'r' : 'Compile run in vim',
                \ },
          \ 'n' : {
                  \ 'name' : '+neomake/neoformat',
                    \ 'c' : 'Clean neomake',
                    \ 'f' : 'Neoformat',
                    \ 'm' : 'Neomake',
                  \ },
          \ 't' : {
                \ 'name' : '+tools',
                \ 'c' : {
                      \ 'name' : '+colors',
                      \ 'a' : 'Convert color to rgba rgba(0, 0, 0, 0.1)',
                      \ 'h' : 'Convert color to hsl hsl(200, 20%, 10%)',
                      \ 'H' : 'Convert color to hsla hsla(100, 20%, 30%, 0.1)',
                      \ 'r' : 'Convert color to rgb rgb(0, 0, 0)',
                      \ 'R' : 'Convert color to rgb float rgb(0.1, 0.1, 0.1)',
                      \ 'x' : 'Convert color to hex #001122',
                      \ 'X' : 'Convert color to hex #00112233',
                      \ 'p' : {
                            \ 'name' : '+color-picker',
                            \ 'a' : 'Open rgba color picker',
                            \ 'h' : 'Open hsl color picker',
                            \ 'r' : 'Open rgb color picker',
                            \ 'x' : 'Open hex color picker',
                            \ },
                      \ },
                \ },
          \ },
    \ 'm' : 'Mundotree toggle' ,
    \ 'o' : {
          \ 'name' : '+open',
             \ 'g' : 'Open file in google chrome',
             \ 'o' : 'Open file with xdg',
             \ 't' : 'Open floaterm',
          \ },
    \ 'q' : 'Quit nvim',
    \ 'r' : {
          \ 'name' : '+text-manipulate',
             \ 'a' : {
                   \ 'name' : '+easyalign',
                   \ 'a' : 'Start easyalign',
                   \ 'a<CR><Delim>' : 'Around 1st delimiter',
                   \ 'a<CR>3<Delim>' : 'Around 3rd delimiter',
                   \ 'a<CR>-<Delim>' : 'Around the last delimiter',
                   \ 'a<CR>-2<Delim>' : 'Around the 2nd last delimiter',
                   \ 'a<CR>*<Delim>' : 'Around all <Delim>',
                   \ 'a<CR>:' : 'Around 1st colon ( key: value )',
                   \ 'a<CR><Right>:' : 'Around 1st ( key : value )',
                   \ 'a<CR>**<Delim>' : 'Left-right alternating around <Delim>',
                   \ 'a<CR><CR>**<Delim>' : 'Right-left alternating around <Delim>',
                   \ 'a<CR><CR>Delim>' : 'Right alignment aroung 1st <Delim>',
                   \ },
             \ 'A' : {
                   \ 'name' : '+easyalign-live',
                   \ 'A' : 'Start easyalign-live',
                   \ 'A<CR><Delim>' : 'Around 1st delimiter',
                   \ 'A<CR>3<Delim>' : 'Around 3rd delimiter',
                   \ 'A<CR>-<Delim>' : 'Around the last delimiter',
                   \ 'A<CR>-2<Delim>' : 'Around the 2nd last delimiter',
                   \ 'A<CR>*<Delim>' : 'Around all <Delim>',
                   \ 'A<CR>:' : 'Around 1st colon ( key: value )',
                   \ 'A<CR><Right>:' : 'Around 1st ( key : value )',
                   \ 'A<CR>**<Delim>' : 'Left-right alternating around <Delim>',
                   \ 'A<CR><CR>**<Delim>' : 'Right-left alternating around <Delim>',
                   \ 'a<CR><CR>Delim>' : 'Right alignment aroung 1st <Delim>',
                   \ },
             \ 'b' : {
                   \ 'name' : '+abolish',
                          \ 'a' : 'Abolish [options] {abbrev} {replace}',
                          \ 's' : 'Subvert/{pattern}/{replace}/[flags] line',
                          \ 'S' : 'Subvert/{pattern}/{replace}/[flags] whole',
                          \ },
             \ 'c' : 'Lowercase entire file',
             \ 'C' : 'Capitalize entire file',
             \ 'e' : {
                   \ 'name' : '+register',
                     \ 'd' : 'display-register(+abjk)',
                     \ 'j' : 'Cycle forward',
                     \ 'J' : 'Paste cycle forward',
                     \ 'k' : 'Cycle backward',
                     \ 'K' : 'Paste cycle backward',
                   \ },
            \ 'E' : 'Enumerate entire file',
            \ 'f' : 'Search and replace confirmation last selected',
            \ 'i' : 'Fix indentation',
            \ 'l' : 'Wrap paragraph to textwidth',
            \ 'n' : 'Search forward and replace',
            \ 'N' : 'Search backward and replace',
            \ 'p' : 'Duplicate paragraph',
            \ 'r' : 'Search and replace',
            \ 'R' : 'Search and replace current line',
            \ 's' : 'Remove whitespaces',
            \ 't' : 'Thesaurus current word' ,
          \ },
    \ 's' : {
          \ 'name' : '+sessions',
          \ 'c' : 'Close session',
          \ 'd' : 'Delete session {prompt}',
          \ 'l' : 'Load session {prompt}',
          \ 'o' : 'Startify open',
          \ 's' : 'Save session {prompt}',
          \ },
    \ 't' : {
          \ 'name' : '+tab-operate',
             \ 'n' : 'New tab',
             \ 'e' : 'Edit tab',
             \ 'm' : 'Move tab',
          \ },
    \ 'v' : {
          \ 'name' : 'Vimux',
             \ 'c' : 'Vimux prompt command',
             \ 'l' : 'Vimux run last command',
             \ 'i' : 'Vimux inspect runner',
             \ 'f' : 'Vimux zoom runner',
             \ 'q' : 'Vimux close runner',
             \ 'x' : 'Vimux interrupt runner',
          \ },
    \ 'w' : {
          \ 'name' : '+window',
             \ 'd' : 'Delete buffer keep split',
             \ 'f' : 'Zoom split toggle',
             \ 'H' : 'Horizontal split',
             \ 'V' : 'Vertical split',
             \ 'h' : 'Vertical resize minus',
             \ 'l' : 'Vertical resize plus',
             \ 'j' : 'Horizontal resize minus',
             \ 'k' : 'Horizontal resize plus',
          \ },
    \ 'z' : {
          \ 'name' : '+folds',
             \ 'f' : 'Toggle fold',
             \ 'F' : 'Close all folds except current',
             \ 'j' : 'Next closed fold',
             \ 'k' : 'Prev closed fold',
             \ 'm' : 'Toggle fold all',
          \ },
    \ }

let g:which_key_map[' '] = {
      \ 'name' : '+easymotion',
         \ 'b' : 'Beginning of word backward',
         \ 'f' : 'Find {char} to the left',
         \ 'w' : 'Beginning of word forward',
      \ }

let g:which_key_localmap = {
      \ 'name' : '+local-leader-key'  ,
      \ 'c' : {
            \ 'name' : '+calendar',
               \ 'c' : 'Calendar default',
               \ 'd' : 'Calendar daily',
               \ 'h' : 'Calendar horizontal daily',
               \ 't' : 'Calendar clock',
               \ 'v' : 'Calendar vertical yearly',
               \ 'w' : 'Calendar weekly',
            \ },
      \ 'g' : {
            \ 'name' : '+golang-toolkit',
               \ 'c' : 'Go callees',
               \ 'C' : 'Go callers',
               \ 'd' : 'Go describe',
               \ 'i' : 'Go impl',
               \ 's' : 'Go callstack',
            \ },
      \ 'l'    : 'toggle-locationlist',
      \ 'm' : {
            \ 'name' : '+markdown',
               \ 'c' : 'Markdown preview stop',
               \ 'd' : 'Markdown preview toggle',
               \ 'o' : 'Markdown preview',
            \ 't' : {
                  \ 'name' : '+table-of-contents',
                     \ 'h' : 'Table of contents horizontal',
                     \ 't' : 'Table of contents',
                     \ 'v' : 'Table of contents vertical',
                  \ },
            \ },
      \ 'q'    : 'Toggle quickfix',
      \ 'r'    : 'Quick run',
      \ 's' : {
            \ 'name' : '+ui-toggles',
               \ 'c' : 'Color highlight toggle',
               \ 'e' : 'Conceal toggle',
               \ 'g' : 'Gutter toggle',
               \ 'i' : 'Indent guide toggle',
               \ 'p' : 'Rainbow pairs toggle',
               \ 's' : 'Spell checker toggle',
               \ 'w' : 'Text wrap toggle',
               \ 'l' : {
                     \ 'name' : '+cursor',
                     \ 'c' : 'Cursorcolumn toggle',
                     \ 'l' : 'Cursorline toggle',
                     \ },
            \ },
      \ 't' : {
            \ 'name' : '+taskwiki',
            \ 'b' : {
                  \ 'name' : '+taskwiki-burndown',
                  \ },
            \ 'c' : {
                  \ 'name' : '+taskwiki-choose',
                  \ },
            \ 'h' : {
                  \ 'name' : '+taskwiki-history',
                  \ },
            \ 'G' : {
                  \ 'name' : '+taskwiki-ghistory',
                  \ },
            \ 'W' : 'Open taskwarrior',
            \ },
      \ 'v' : {
            \ 'name' : '+vista',
               \ 'v' : 'Vista toggle',
               \ 'c' : 'Vista coc',
               \ 'o' : 'Vista open',
               \ 'x' : 'Vista close',
            \ },
      \ 'w' : {
            \ 'name' : '+vimwiki',
              \ 'd' : 'Vimwiki delete link',
              \ 'h' : 'Vimwiki to html',
              \ 'hh' : 'Vimwiki to html browse',
              \ 'H' : 'Vimwiki all to html',
              \ 'i' : 'Vimwiki diary index',
              \ 'l' : 'Vimwiki generate links',
              \ 'r' : 'Vimwiki rename link',
              \ 's' : 'Vimwiki UI select',
              \ 't' : 'Vimwiki index new tab',
              \ 'w' : 'Vimwiki index',
              \ ' ' : {
                    \ 'name' : '+diary',
                    \ 'i' : 'Vimwiki diary generate link',
                    \ 'm' : 'Vimwiki diary tomorrow',
                    \ 't' : 'Vimwiki diary today',
                    \ 'w' : 'Vimwiki diary note',
                    \ 'y' : 'Vimwiki diary yesterday',
                    \ },
              \ },
      \ 'W' : {
            \ 'name' : '+vimwiki-init',
            \ 'W' : 'Vimwiki index',
            \ 'I' : 'Vimwiki diary index',
            \ },
      \ '<Tab>' : 'Wipe current buffer',
      \ '<S-Tab>' : 'Wipe all except current buffer',
      \ }

let g:which_key_lsbgmap = {
      \ 'name' : '+left-square-brackets',
         \ '[' : 'Prev function beginning',
         \ ']' : 'Prev function end',
         \ '=' : 'Marker any prev',
         \ '-' : 'Marker same prev',
         \ "'" : 'Marker unique prev',
         \ '"' : 'Comment prev',
         \ 'b' : 'Buffer prev',
         \ 'B' : 'Buffer first',
         \ 'c' : 'Diff jump prev',
         \ 'd' : 'Coc diagnostic prev',
         \ 'g' : 'Git prev chunk',
         \ 'l' : 'Locationlist prev',
         \ 'L' : 'Locationlist first',
         \ 't' : 'Tab prev',
         \ 'T' : 'Tab first',
         \ 'q' : 'Quickfix prev',
         \ 'Q' : 'Quickfix first',
      \ }

let g:which_key_rsbgmap = {
      \ 'name' : '+right-square-brackets',
         \ ']' : 'Next function beginning',
         \ '[' : 'Next function end',
         \ '=' : 'Marker any next',
         \ '-' : 'Marker same next',
         \ "'" : 'Marker unique next',
         \ '"' : 'Comment next',
         \ 'b' : 'Buffer next',
         \ 'B' : 'Buffer last',
         \ 'c' : 'Diff jump next',
         \ 'd' : 'Coc diagnostic next',
         \ 'g' : 'Git next chunk',
         \ 'l' : 'Locationlist next',
         \ 'L' : 'Locationlist last',
         \ 't' : 'Tab next',
         \ 'T' : 'Tab last',
         \ 'q' : 'Quickfix next',
         \ 'Q' : 'Quickfix last',
      \ }

let g:which_key_dmap = {
      \ 'name' : '+d-key',
      \ }

let g:which_key_gmap = {
      \ 'name' : '+g-key',
      \ 'd' : 'Go to definition',
      \ 'i' : 'Go to implementation',
      \ 'p' : 'Select last pasted',
      \ 'r' : 'Go to reference',
      \ 's' : {
            \ 'name' : '+case-convert',
            \ },
      \ 'y' : 'Go to type definition',
      \ }

let g:which_key_smap = {
      \ 'name' : '+s-key',
      \ 'j' : 'Split join',
      \ 'k' : 'Join split',
      \ }

let s:current_colorscheme = get(g:,"colors_name","")
if  s:current_colorscheme == "base16-default-dark"
    highlight WhichKeySeperator guibg=NONE ctermbg=NONE guifg=#a1b56c ctermfg=02
endif

let g:which_key_timeout = 200
let g:which_key_exit = ["\<C-[>", "\<C-c>", "\<C-g>"]

let g:which_key_display_names = {
      \       ' ': 'SPC',
      \   '<C-H>': 'BS',
      \   '<C-I>': 'TAB',
      \   '<TAB>': 'TAB',
      \ '<S-TAB>': 'S-TAB',
      \    '<CR>': 'ENTER',
      \ }

