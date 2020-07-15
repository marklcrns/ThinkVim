let s:user_bashrc                = expand($HOME . '/.bashrc')
let s:user_bash_aliases          = expand($HOME . '/.bash_aliases')
let s:user_zshrc                 = expand($HOME . '/.zshrc')
let s:user_tmux_conf             = expand($HOME . '/.tmux.conf')
let s:user_nvim_core_mappings    = expand($VIM_PATH . '/core/mappings.vim')
let s:user_nvim_core_general     = expand($VIM_PATH . '/core/general.vim')
let s:user_nvim_coc_settings     = expand($VIM_PATH . '/coc-settings.json')
let s:user_nvim_plugins          = expand($VIM_PATH . '/core/dein/plugins.yaml')
let s:user_nvim_plugins_mappings = expand($VIM_PATH . '/layers/+thinkvim/config.vim')
let s:user_nvim_whichkey         = expand($VIM_PATH . '/layers/+tools/whichkey/config.vim')

let g:clap_cache_directory = $DATA_PATH . '/clap'
let g:clap_theme = 'material_design_dark'
let g:clap_current_selection_sign= { 'text': '➤', 'texthl': "ClapCurrentSelectionSign", "linehl": "ClapCurrentSelection"}
let g:clap_layout = { 'relative': 'editor' }
let g:clap_enable_icon = 1
let g:clap_search_box_border_style = 'curve'
let g:clap_provider_grep_enable_icon = 1
let g:clap_prompt_format = '%spinner%%forerunner_status% %provider_id%:'

let g:clap_provider_personalconf = {
      \ 'source': [
      \ s:user_bashrc,
      \ s:user_bash_aliases,
      \ s:user_zshrc,
      \ s:user_tmux_conf,
      \ s:user_nvim_core_mappings,
      \ s:user_nvim_core_general,
      \ s:user_nvim_coc_settings,
      \ s:user_nvim_plugins,
      \ s:user_nvim_plugins_mappings,
      \ s:user_nvim_whichkey,
      \ ],
      \ 'sink': 'e',
      \ }

" A funtion to config highlight of ClapSymbol
" when the background color is opactiy
function! s:ClapSymbolHL() abort
    let s:current_bgcolor = synIDattr(hlID("Normal"), "bg")
    if s:current_bgcolor == ''
        hi ClapSymbol guibg=NONE ctermbg=NONE
    endif
endfunction

autocmd User ClapOnEnter call s:ClapSymbolHL()
