
let g:delimitMate_expand_cr = 1
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_quotes = "\" ' `"
let delimitMate_nesting_quotes = ['"','`']
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1
let delimitMate_excluded_regions = "Comment,String"

au FileType html,htmldjango let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
au FileType md,vimwiki let b:delimitMate_quotes = "\" `"
au FileType python,javascript let b:delimitMate_nesting_quotes = ['"']
