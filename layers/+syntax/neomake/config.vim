
" Neomake
" ---------
" augroup neomakeConfig
"   autocmd!
"   " Run Neomake automatically on buffer save
"   autocmd BufEnter * Neomake
"   autocmd BufWritePost * Neomake
" augroup END

" Run NeoMake on write operations
let g:neomake_open_list = 0
let g:neomake_list_height = 5
let g:neomake_virtualtext_current_error = 0

" Python
if ! empty(g:python3_host_prog)
	let g:neomake_python_python_exe = g:python3_host_prog
endif
" Ref: https://vi.stackexchange.com/a/9136
" Added E501 to ignore 80 char per line limit
let g:neomake_python_flake8_maker = {
    \ 'args': ['--ignore=E501',  '--format=default'],
    \ 'errorformat':
        \ '%E%f:%l: could not compile,%-Z%p^,' .
        \ '%A%f:%l:%c: %t%n %m,' .
        \ '%A%f:%l: %t%n %m,' .
        \ '%-G%.%#',
    \ }
let g:neomake_python_enabled_makers = ['flake8', 'pylint']

" YAML / ANSIBLE
let g:neomake_yaml_enabled_makers = ['yamllint']
let g:neomake_ansible_enabled_makers = ['yamllint']
let g:neomake_ansible_yamllint_maker = neomake#makers#ft#yaml#yamllint()

" augroup user_plugin_neomake
" 	autocmd!
" 	autocmd BufWritePre *.js call s:set_javascript_exe()
" augroup END

" JAVASCRIPT / JSX
function! s:set_javascript_exe()
	" Set buffer makers to ESLint or Flow, if executables exist.
	let g:neomake_javascript_enabled_makers = []
	for item in ['eslint', 'flow']
		let l:exe = s:find_node_executable(item)
		if ! empty(l:exe)
			call add(g:neomake_javascript_enabled_makers, item)
			let b:neomake_javascript_{item}_exe = l:exe
		endif
	endfor
	let g:neomake_jsx_enabled_makers = g:neomake_javascript_enabled_makers
endfunction

function! s:find_node_executable(cmd)
	" Find locally-installed NodeJS executable.
	" Credits: https://github.com/jaawerth/nrun.vim
	let l:cwd = expand('%:p:h')
	let l:rp = fnamemodify('/', ':p')
	let l:hp = fnamemodify('~/', ':p')
	while l:cwd != l:hp && l:cwd != l:rp
		if filereadable(resolve(l:cwd . '/package.json'))
			let l:execPath = fnamemodify(l:cwd . '/node_modules/.bin/' . a:cmd, ':p')
			if executable(l:execPath)
				return l:execPath
			endif
		endif
		let l:cwd = resolve(l:cwd . '/..')
	endwhile
	return ''
	endfunction

" HTML
let g:neomake_html_enabled_makers = ['tidy']

" UI
let g:neomake_error_sign = {'text': '⚠', 'texthl': 'ErrorMsg'}
let g:neomake_warning_sign = {'text': '⌁', 'texthl': 'WarningSyntax'}
let g:neomake_message_sign = {'text': '⌂', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign = {'text': '⊹', 'texthl': 'NeomakeInfoSign'}
highlight! WarningSyntax ctermfg=58 guifg=#7d7629

" vim: set ts=2 sw=2 tw=80 noet :
