let g:codi#interpreters = {
    \ 'python': {
        \ 'bin': 'python3',
        \ 'prompt': '^\(>>>\|\.\.\.\) ',
        \ },
    \ 'javascript': {
        \ 'bin': 'node',
        \ 'prompt': '^\(>\|\.\.\.\+\) ',
        \ 'preprocess': function('s:pp_js'),
        \ 'rephrase': function('s:rp_js'),
        \ },
    \ }
