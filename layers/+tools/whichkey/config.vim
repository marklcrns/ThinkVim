let g:which_key_map =  {}
let g:which_key_map = {
    \ 'name' : '+leader-key',
       \ '-' : 'Choose window' ,
       \ '_' : 'Choose window to swap with' ,
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
       \ ' ' : {
             \ 'name' : '+easymotion',
             \ 'b' : 'Beginning of word backward',
             \ 'f' : 'Find {char} to the left',
             \ 'w' : 'Beginning of word forward',
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
       \ ';' : {
             \ 'name' : '+single-purpose',
             \ 'w' : {
                   \ 'name' : '+vimwiki',
                   \ 'm' : 'Open clipboard register relative path as markdown',
                   \ 'i' : 'Import file to vimwiki (see reqs in mappings.vim)',
                   \ },
             \ },
    \ 'a' : {
          \ 'name' : '+any-jump',
          \ 'b' : 'Open previously opened file',
          \ 'l' : 'Open last jump to definition result',
          \ 'j' : 'Open jump to definition window',
          \ },
    \ 'c' : {
          \ 'name' : '+coc',
             \ 'a' : 'Code action text object',
             \ 'c' : 'Code action current word',
             \ 'C' : 'Open coc config',
             \ 'f' : {
                   \ 'name' : '+coc-clap',
                   \ 'a' : 'Coc actions',
                   \ 'c' : 'Coc commands',
                   \ 'd' : 'Coc diagnostics',
                   \ 'e' : 'Coc extensions',
                   \ 'l' : 'Coc location',
                   \ 'o' : 'Coc outline',
                   \ 's' : 'Coc symbols',
                   \ 'v' : 'Coc services',
                  \ },
             \ 'F' : 'Coc format',
             \ 'g' : {
                   \ 'name' : '+coc-git',
                   \ 'b' : 'Preview line in git browser',
                   \ 'B' : 'Copy line git url to clipboard',
                   \ 'c' : 'Coc show last commit of current line',
                   \ 'd' : 'Git diff cached',
                   \ 'f' : 'Toggle fold all except git chunks',
                   \ 'i' : 'Preview git chunk under cursor',
                   \ 's' : 'Coc list status changes',
                   \ 't' : 'Stage git chunk under cursor',
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
                     \ 'y' : 'Coc yank list',
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
                      \ 'b' : 'Denite git change branch',
                      \ 'c' : 'Denite git changed',
                      \ 'f' : 'Denite git files',
                      \ 'l' : 'Denite git log all',
                      \ 's' : 'Denite git status',
                   \ },
          \ },
    \ 'e' : {
          \ 'name' : '+file-explorer',
             \ 'a' : 'Toggle explorer to current file',
             \ 'c' : 'Toggle coc explorer',
             \ 'e' : 'Toggle explorer to current directory',
             \ 'r' : 'Toggle explorer resume directory',
          \ },
    \ 'f' : {
          \ 'name' : '+file-management',
          \ 'D' : "Delete current file",
          \ 'd' : {
                \ 'name' : '+file-finder',
                \ 'b' : 'Find on buffers',
                \ 'c' : 'Find colorscheme',
                \ 'f' : 'Find files on directory',
                \ 'F' : 'Find files on directory (includes hidden files)',
                \ 'g' : 'Find git files',
                \ 'h' : 'Find on history',
                \ 'l' : 'Find on locationlist',
                \ 'm' : 'Find files with marks',
                \ 'o' : 'Find old files',
                \ 'p' : 'Find personal configurations',
                \ 'r' : 'Find word with Grep2',
                \ 'u' : 'Find git diff files',
                \ 'v' : 'Find last visual selection with Grep',
                \ 'w' : 'Find word undercursor with Grep',
                \ },
          \ 'g' : 'Vimgrep (project-wide) and load into quickfix',
          \ 'q' : 'Save and quit',
          \ 'Q' : 'Save all and quit',
          \ 'r' : {
                \ 'name' : '+change-directory',
                \ 'r' : 'Change working directory to root',
                \ 'c' : 'Change working directory to current file',
                \ 'l' : 'Change working directory to current file (window only)',
                \ },
          \ 's' : 'Save buffer',
          \ 'S' : 'Save all buffers',
          \ 'w' : 'Wipe buffer',
          \ 'y' : {
                \ 'name' : '+yank-path',
                  \ 'e' : 'Yank relative file path without extension',
                  \ 'E' : 'Yank absolute file path without extension',
                  \ 'p' : 'Yank relative file path',
                  \ 'P' : 'Yank absolute file path',
                  \ 'f' : 'Yank file name',
                  \ 'F' : 'Yank file name without extension',
                  \ 'd' : 'Yank relative directory path',
                  \ 'D' : 'Yank absolute directory path',
                  \ 'o' : 'Open/Create file from yanked path',
                  \ 'x' : 'Yank file extension only',
                \ },
          \ },
    \ 'g' : {
          \ 'name' : '+git-operate',
             \ 'a' : 'Git add',
             \ 'A' : 'Git add all',
             \ 'b' : 'Git blame',
             \ 'B' : 'Gina blame',
             \ 'c' : 'Gina commit',
             \ 'd' : {
                   \ 'name' : '+git-diff',
                   \ 'c' : 'Git diff cached',
                   \ 'd' : 'Git diff',
                   \ 's' : 'Git diffsplit',
                   \ 't' : 'Git difftool',
                   \ 'h' : 'Git diffsplit horizontal',
                   \ 'v' : 'Git diffsplit vertical',
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
             \ 's' : 'Git status',
             \ 'v' : 'Git commit browser',
          \ },
    \ 'G' : 'Grep operator',
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
                \ 'h' : 'Horizontal file diff split from current directory',
                \ 'H' : 'Horizontal file diff split from $HOME',
                \ 'v' : 'Vertical file diff split from current directory',
                \ 'V' : 'Vertical file diff split from $HOME',
                \ },
          \ 'g' : 'Goyo toggle' ,
          \ 'h' : {
                \ 'name' : '+quick-highlight',
                \ 't' : 'Highlight this',
                \ 'r' : 'Highlight reset',
                \ 'w' : 'Highlight this whole word',
                \ },
          \ },
    \ 'J' : 'Move line down',
    \ 'K' : 'Move line up',
    \ 'l' : {
          \ 'name' : '+languages',
          \ 'j' : {
                \ 'name' : '+java',
                \ 'c' : 'Javac compile',
                \ 'C' : 'Javac compile all from directory',
                \ 'j' : 'Save compile and run in next tmux pane',
                \ 'r' : 'Save compile and run Java in vim terminal',
                \ },
          \ 'g' : {
                  \ 'name' : '+grammar',
                  \ 'c' : 'Activate Grammarous check (comments only)',
                  \ 'd' : 'Open Denite and load grammarous',
                  \ 'f' : 'Fix error under cursor',
                  \ 'F' : 'Fix all errors in buffer',
                  \ 'g' : 'Grammarous check',
                  \ 'G' : 'Grammarous check (operator)',
                  \ 'm' : 'Move to info window',
                  \ 'o' : 'Open info window',
                  \ 'q' : 'Close (Reset) Grammarous',
                  \ 'r' : 'Remove error under cursor',
                  \ 'u' : 'Open Unite and load grammarous',
                  \ 'w' : {
                        \ 'name' : '+wordy',
                        \ 'p' : 'Prev wordy',
                        \ 'n' : 'Next wordy',
                        \ 'r' : 'Remove wordy',
                        \ 'w' : 'Wordy select',
                        \ },
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
             \ 't' : {
             \ 'name' : '+Floaterm',
                \ 'a' : 'List all running floaterms',
                \ 'b' : 'Position horizontally floaterm to the bottom',
                \ 'h' : 'Hide floaterm',
                \ 'n' : 'Next floaterm',
                \ 'o' : 'Open new floaterm',
                \ 'p' : 'Previous floaterm',
                \ 'q' : 'Kill floaterm',
                \ 'Q' : 'Kill all floaterm',
                \ 'r' : 'Open ranger in floaterm',
                \ 's' : 'Show floaterm',
                \ 'S' : 'Send current line to floaterm',
                \ 't' : 'Toggle floaterm',
                \ 'u' : 'Update floaterm',
                \ 'v' : 'Position floaterm vertically to the right',
             \ },
          \ },
    \ 'q' : 'Adaptive buffer quit',
    \ 'Q' : 'Quit neovim',
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
             \ 'c' : 'Lowercase entire file (or selected lines)',
             \ 'C' : 'Capitalize entire file (or selected lines)',
             \ 'e' : {
                   \ 'name' : '+register',
                     \ 'g' : 'display-register(+abjk)',
                     \ 'j' : 'Cycle forward (copy selected if visual)',
                     \ 'J' : 'Paste cycle forward',
                     \ 'k' : 'Cycle backward (copy selected if visual)',
                     \ 'K' : 'Paste cycle backward',
                   \ },
            \ 'f' : {
                  \ 'name' : '+far',
                    \ 'f' : 'Find',
                    \ 'r' : 'Find and replace',
                    \ 'd' : 'Apply find and replace',
                    \ 'u' : 'Undo find and replace',
                  \ },
            \ 'F' : 'Search and replace confirmation last selected',
            \ 'i' : 'Fix indentation',
            \ 'l' : 'Enumerat selected lines (visual)',
            \ 'L' : 'Enumerate entire file',
            \ 'n' : 'Search forward and replace',
            \ 'N' : 'Search backward and replace',
            \ 'p' : 'Duplicate paragraph',
            \ 'r' : 'Search and replace',
            \ 'R' : 'Search and replace current line',
            \ 's' : 'Remove whitespaces',
            \ 't' : 'Thesaurus current word' ,
            \ 'w' : 'Wrap paragraph to textwidth',
            \ 'y' : {
                  \ 'name' : '+yank-text',
                  \ 'a' : 'Yank all buffer content',
                  \ },
          \ },
    \ 's' : {
          \ 'name' : '+startup',
          \ 'c' : 'Close session (Startify)',
          \ 'd' : 'Delete session (Startify)',
          \ 'l' : 'Load session (Startify)',
          \ 'L' : 'Load session (Dashboard)',
          \ 'o' : 'Startify open',
          \ 'O' : 'Dashboard open',
          \ 's' : 'Save session (Startify)',
          \ 'S' : 'Save session (Dashboard)',
          \ },
    \ 't' : {
          \ 'name' : '+tab-operate',
             \ 'n' : 'New tab',
             \ 'e' : 'Tab edit ',
             \ 'm' : 'Move tab',
             \ 'q' : 'Close current tab',
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
             \ 'h' : 'Vertical resize minus',
             \ 'j' : 'Horizontal resize minus',
             \ 'k' : 'Horizontal resize plus',
             \ 'l' : 'Vertical resize plus',
             \ 'V' : 'Vertical split',
             \ 'q' : 'Close split',
          \ },
    \ }

let g:which_key_localmap = {
      \ 'name' : '+local-leader-key'  ,
      \ 'c' : {
            \ 'name' : '+calendar',
               \ 'c' : 'Calendar default',
               \ 'd' : 'Calendar daily',
               \ 'h' : 'Calendar horizontal daily',
               \ 'm' : 'Calendar monthly',
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
               \ 'v' : 'Virtualedit mode toggle',
               \ 'w' : 'Text wrap toggle',
               \ 'l' : {
                     \ 'name' : '+cursor',
                     \ 'c' : 'Cursorcolumn toggle',
                     \ 'l' : 'Cursorline toggle',
                     \ 'x' : 'Crosshair toggle',
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
               \ 'f' : 'Vista focus back and forth',
               \ 'o' : 'Vista open',
               \ 'q' : 'Vista close',
            \ },
      \ 'w' : {
            \ 'name' : '+vimwiki',
              \ 'd' : 'Vimwiki delete current page',
              \ 'h' : 'Vimwiki to html',
              \ 'hh' : 'Vimwiki to html browse',
              \ 'H' : 'Vimwiki all to html',
              \ 'i' : 'Vimwiki diary index',
              \ 'l' : 'Vimwiki generate links',
              \ 'L' : 'Vimwiki custom generate resources links',
              \ 'n' : 'Vimwiki go to',
              \ 'r' : 'Vimwiki rename link',
              \ 's' : 'Vimwiki UI select',
              \ 't' : 'Vimwiki index new tab',
              \ 'T' : 'Vimwiki create new diary for today',
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
      \ 'z' : {
            \ 'name' : '+folds',
              \ 'f' : 'Toggle fold',
              \ 'F' : 'Close all folds except current',
              \ 'j' : 'Next closed fold',
              \ 'k' : 'Prev closed fold',
              \ 'm' : 'Toggle fold all',
            \ },
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

