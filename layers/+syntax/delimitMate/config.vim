
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_jump_expansion = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_excluded_ft = 'mail,txt'

augroup user_plugin_delimitMate
  au!
  au FileType html,htmldjango let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
  au FileType markdown,vimwiki let b:delimitMate_quotes = "\" `"
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END
