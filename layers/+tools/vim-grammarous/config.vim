
let g:grammarous#use_location_list = 1

let g:grammarous#default_comments_only_filetypes = {
      \ '*' : 1,
      \ 'help' : 0,
      \ 'markdown' : 0,
      \ 'vimwiki' : 0,
      \ }

let g:grammarous#enabled_rules = {'*' : ['PASSIVE_VOICE']}

let g:grammarous#disabled_rules = {
            \ '*' : ['WHITESPACE_RULE', 'EN_QUOTES'],
            \ 'help' : ['WHITESPACE_RULE', 'EN_QUOTES', 'SENTENCE_WHITESPACE', 'UPPERCASE_SENTENCE_START'],
            \ }

let g:grammarous#disabled_categories = {
    \ 'help' : ['PUNCTUATION', 'TYPOGRAPHY'],
    \ }
