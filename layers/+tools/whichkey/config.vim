let g:which_key_map =  {}
let g:which_key_map = {
    \ 'name' : '+Leader-Key',
       \ '-' : 'choose-window' ,
       \ '1' : 'buffer-1',
       \ '2' : 'buffer-2',
       \ '3' : 'buffer-3',
       \ '4' : 'buffer-4',
       \ '5' : 'buffer-5',
       \ '6' : 'buffer-6',
       \ '7' : 'buffer-7',
       \ '8' : 'buffer-8',
       \ '9' : 'buffer-9',
       \ '0' : 'buffer-10',
    \ 'c' : {
          \ 'name' : '+Coc',
             \ 'a' : 'code-action-text-object',
             \ 'c' : 'code-action-current word',
             \ 'f' : 'coc-format',
             \ 'g' : 'coc-git-status',
             \ 'j' : 'coc-next-item',
             \ 'k' : 'coc-prev-item',
          \ 'l' : {
                \ 'name' : '+CocList',
                   \ 'c' : 'coc-commands',
                   \ 'd' : 'coc-diagnostics',
                   \ 'e' : 'coc-extensions',
                   \ 'o' : 'file-outline',
                   \ 'r' : 'resume-last-coc-list',
                   \ 's' : 'search-workspace-symbols',
                \ },
          \ 'n' : 'coc-rename',
          \ 's' : 'coc-search-{prompt}',
          \ 't' : 'coc-template',
          \ 'q' : 'coc-autofix-current-line',
          \ 'w' : 'coc-search-word-match-{prompt}',
          \ },
    \ 'd' : {
          \ 'name' : '+Denite',
             \ 'd' : 'open-denite',
          \ 'g' : {
                \ 'name' : '+Denite-git',
                   \ 'b' : 'denite-gitlog-all',
                   \ 'l' : 'denite-gitlog-all',
                \ }
          \ },
    \ 'e' : {
          \ 'name' : '+file-explorer',
             \ 'a' : 'explorer-to-current-file-directory',
             \ 'd' : 'vertical-diffsplit',
             \ 'e' : 'explorer-to-current-directory',
             \ 's' : 'startify-open',
          \ },
    \ 'f' : {
          \ 'name' : '+File-management',
          \ 'd' : {
                \ 'name' : '+File-finder',
                \ 'b' : 'find-on-buffers',
                \ 'B' : 'find-on-all-buffers',
                \ 'c' : 'find-colorscheme',
                \ 'f' : 'find-files-on-directory',
                \ 'g' : 'files-git-status',
                \ 'G' : 'git-grep',
                \ 'l' : 'find-vimtex',
                \ 'k' : 'find-files-with-marks',
                \ 'm' : 'find-mru-files',
                \ 'o' : 'find-old-files',
                \ 'p' : 'find-on-a-project',
                \ 'P' : 'find-on-a-git-project',
                \ 'r' : 'search-{word}-on-project',
                \ 'R' : 'search-on-files',
                \ 'v' : 'find-vista-outline',
                \ },
             \ 'q' : 'quit-file',
             \ 'Q' : 'quit-all',
             \ 'r' : 'change-working-directory-to-file',
             \ 'w' : 'save-file',
             \ 'W' : 'save-and-quit-all',
             \ 'y' : 'yank-relative-path',
             \ 'Y' : 'yank-absolute-path',
          \ },
    \ 'g' : {
          \ 'name' : '+Git-operate',
             \ 'a' : 'git-add-all',
             \ 'b' : 'git-blame',
             \ 'B' : 'gbrowse',
             \ 'c' : 'gina-commit',
             \ 'd' : {
                   \ 'name' : '+Git-diff',
                   \ 'c' : 'git-diff-cached',
                   \ 'd' : 'git-diff',
                   \ 't' : 'git-difftool',
                   \ 'h' : 'git-diffthis-horizontal',
                   \ 'v' : 'git-diffthis-vertical',
                   \ },
             \ 'f' : 'git-fetch',
             \ 'g' : 'ggrep-{word}',
             \ 'G' : 'git-log-grep-current-file',
             \ 'l' : 'git-log-quickfix',
             \ 'L' : 'git-log-current-file-quickfix',
             \ 'm' : 'magit-status',
             \ 'o' : 'gina-log',
             \ 'p' : 'git-push',
             \ 's' : 'gina-status',
          \ },
    \ 'G' : 'goyo-toggle' ,
    \ 'h' : {
          \ 'name' : '+Quick-highlight',
             \ 't' : 'highlight-this',
             \ 'r' : 'highlight-reset',
             \ 'w' : 'highlight-this-whole-word',
          \ },
    \ 'j' : {
          \ 'name' : '+Java',
             \ 'c' : 'javac-compile',
             \ 'j' : 'save-compile-run',
             \ 'r' : 'compile-run-in-vim',
          \ },
    \ 'K' : 'thesaurus-current-word' ,
    \ 'm' : 'mundotree-toggle' ,
    \ 'n' : {
            \ 'name' : '+Neomake/Neoformat',
               \ 'c' : 'clean-neomake',
               \ 'f' : 'neoformat',
               \ 'm' : 'neomake',
            \ },
    \ 'o' : {
          \ 'name' : '+Open-with',
             \ 'g' : 'google-open-file',
             \ 'o' : 'xdg-open-file'
          \ },
    \ 'r' : {
          \ 'name' : '+Text-operate',
             \ 'a' : ['<Plug>(EasyAlign)', 'easyalign'],
             \ 'A' : ['<Plug>(LiveEasyAlign)', 'easyalign-live'],
             \ 'c' : 'lowercase-entire-file',
             \ 'C' : 'capitalize-entire-file',
          \ 'e' : {
                \ 'name' : '+Register',
                   \ 'd' : 'display-register-+abjk',
                   \ 'j' : 'cycle-forward',
                   \ 'J' : 'paste-cycle-forward',
                   \ 'k' : 'cycle-backward',
                   \ 'K' : 'paste-cycle-backward',
                \ },
          \ 'E' : 'enumerate-entire-file',
          \ 'i' : 'fix-indentation',
          \ 'l' : 'wrap-paragraph-to-textwidth',
          \ 'n' : 'search-forward-and-replace',
          \ 'N' : 'search-backward-and-replace',
          \ 'p' : 'duplicate-paragraph',
          \ 'r' : 'search-and-replace',
          \ 'R' : 'search-and-replace-current-line',
          \ 's' : 'remove-whitespaces',
          \ 'w' : {
                \ 'name' : '+Wordy',
                   \ 'n' : 'next-wordy',
                   \ 'p' : 'prev-wordy',
                   \ 'r' : 'remove-wordy',
                   \ 'w' : 'wordy',
                \ }
          \ },
    \ 's' : {
          \ 'name' : '+Splits',
             \ '[' : 'vertical-resize-minus',
             \ ']' : 'vertical-resize-plus',
             \ '{' : 'horizontal-resize-minus',
             \ '}' : 'horizontal-resize-plus',
             \ 'd' : 'delete-buffer-keep-split',
             \ 'f' : 'zoom-split-toggle',
             \ 'h' : 'horizontal-split',
             \ 'v' : 'vertical-split',
          \ },
    \ 't' : {
          \ 'name' : '+Tab-operate',
             \ 'n' : 'new-tab',
             \ 'e' : 'edit-tab',
             \ 'm' : 'move-tab',
          \ },
    \ 'v' : {
          \ 'name' : '+Comment/vimux',
             \ 'c' : 'vimux-prompt-command',
             \ 'l' : 'vimux-run-last-command',
             \ 'i' : 'vimux-inspect-runner',
             \ 'f' : 'vimux-zoom-runner',
             \ 'q' : 'vimux-close-runner',
             \ 'v' : 'comment-hatpos-toggle',
             \ 'V' : 'comment-wrap-toggle',
             \ 'x' : 'vimux-interrupt-runner',
          \ },
    \ 'w' : {
          \ 'name' : '+Vimwiki',
             \ 'h' : 'vimwiki-to-html',
            \ 'hh' : 'vimwiki-to-html-browse',
             \ 'H' : 'vimwiki-all-to-html',
             \ 'i' : '{int}vimwiki-diary-index',
             \ 'l' : 'vimwiki-generate-links',
             \ 's' : 'vimwiki-ui-select',
             \ 'w' : '{int}vimwiki-index',
          \ '<SPC>' : {
                    \ 'name' : '+Diary',
                       \ 'm' : 'mark-diary-tomorrow',
                       \ 't' : 'mark-diary-today',
                       \ 'w' : 'mark-diary-note',
                       \ 'y' : 'mark-diary-yesterday',
                    \ },
          \ },
    \ 'x' : 'coc-cursors-operate',
    \ 'z' : {
          \ 'name' : '+Folds',
             \ 'f' : 'toggle-fold',
             \ 'F' : 'close-all-folds-except-current',
             \ 'j' : 'next-closed-fold',
             \ 'k' : 'prev-closed-fold',
             \ 'm' : 'toggle-fold-all',
          \ },
    \ }

let g:which_key_map[' '] = {
      \ 'name' : '+Easymotion',
         \ 'b' : 'beginning-of-word-backward',
         \ 'f' : 'find-{char}-to-the-left',
         \ 'w' : 'beginning-of-word-forward',
      \ }

let g:which_key_localmap = {
      \ 'name' : '+LocalLeader-Key'  ,
      \ 'c' : {
            \ 'name' : '+Calendar',
               \ 'c' : 'calendar-default',
               \ 'd' : 'calendar-daily',
               \ 'h' : 'calendar-horizontal-daily',
               \ 't' : 'calendar-clock',
               \ 'v' : 'calendar-vertical-yearly',
               \ 'w' : 'calendar-weekly',
            \ },
      \ 'g' : {
            \ 'name' : '+Golang-toolkit',
               \ 'c' : 'go-callees',
               \ 'C' : 'go-callers',
               \ 'd' : 'go-describe',
               \ 'i' : 'go-impl',
               \ 's' : 'go-callstack',
            \ },
      \ 'l'    : 'toggle-locationlist',
      \ 'm' : {
            \ 'name' : '+Markdown',
               \ 'c' : 'markdown-preview-stop',
               \ 'd' : 'markdown-preview-toggle',
               \ 'o' : 'markdown-preview',
            \ 't' : {
                  \ 'name' : '+Toc',
                     \ 'h' : 'table-of-contents-horizontal',
                     \ 't' : 'table-of-contents',
                     \ 'v' : 'table-of-contents-vertical',
                  \ },
            \ },
      \ 'q'    : 'toggle-quickfix',
      \ 'r'    : 'quick-run',
      \ 's' : {
            \ 'name' : '+Text-UI-toggles',
               \ 'c' : 'conceal-toggle',
               \ 'g' : 'gutter-toggle',
               \ 'p' : 'rainbow-pairs-toggle',
               \ 's' : 'spell-checker-toggle',
               \ 'w' : 'text-wrap-toggle',
            \ },
      \ 'v' : {
            \ 'name' : '+Vista',
               \ 'v' : 'vista-toggle',
               \ 'c' : 'vista-coc',
               \ 'o' : 'vista-open',
               \ 'x' : 'vista-close',
            \ },
      \ '<Tab>' : 'wipe-current-buffer',
      \ '<S-Tab>' : 'wipe-all-except-current-buffer',
      \ }

let g:which_key_lsbgmap = {
      \ 'name' : '+LeftSquarebrackets',
         \ '[' : 'prev-function-beginning',
         \ ']' : 'prev-function-end',
         \ '=' : 'marker-any-prev',
         \ '-' : 'marker-same-prev',
         \ "'" : 'marker-unique-prev',
         \ '"' : 'comment-prev',
         \ 'b' : 'buffer-prev',
         \ 'B' : 'buffer-first',
         \ 'd' : 'coc-diagnostic-prev',
         \ 'g' : 'git-prev-chunk',
         \ 'l' : 'locationlist-prev',
         \ 'L' : 'locationlist-first',
         \ 't' : 'tab-prev',
         \ 'T' : 'tab-first',
         \ 'q' : 'quickfix-prev',
         \ 'Q' : 'quickfix-first',
      \ }

let g:which_key_rsbgmap = {
      \ 'name' : '+RightSquarebrackets',
         \ ']' : 'next-function-beginning',
         \ '[' : 'next-function-end',
         \ '=' : 'marker-any-next',
         \ '-' : 'marker-same-next',
         \ "'" : 'marker-unique-next',
         \ '"' : 'comment-next',
         \ 'b' : 'buffer-next',
         \ 'B' : 'buffer-last',
         \ 'd' : 'coc-diagnostic-next',
         \ 'g' : 'git-next-chunk',
         \ 'l' : 'locationlist-next',
         \ 'L' : 'locationlist-last',
         \ 't' : 'tab-next',
         \ 'T' : 'tab-last',
         \ 'q' : 'quickfix-next',
         \ 'Q' : 'quickfix-last',
      \ }

let s:current_colorscheme = get(g:,"colors_name","")
if  s:current_colorscheme == "base16-default-dark"
    highlight WhichKeySeperator guibg=NONE ctermbg=NONE guifg=#a1b56c ctermfg=02
endif

let g:which_key_timeout = 300
let g:which_key_exit = ["\<C-[>", "\<C-c>"]

let g:which_key_display_names = {
      \       ' ': 'SPC',
      \   '<C-H>': 'BS',
      \   '<C-I>': 'TAB',
      \   '<TAB>': 'TAB',
      \ '<S-TAB>': 'S-TAB',
      \    '<CR>': 'CR',
      \ }
