" Dynamically switch color scheme and have things respect it
function SwitchColorScheme(name)
  let g:VIM_COLOR_SCHEME = a:name
  call ColorScheme()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

function! ColorScheme()
  if g:VIM_COLOR_SCHEME ==# 'palenight'
    let g:palenight_terminal_italics=1
    colorscheme palenight
    let g:lightline = {}
    let g:lightline.colorscheme = 'palenight_alter'
  endif

  if g:VIM_COLOR_SCHEME ==# 'night-owl'
    colorscheme night-owl
    let g:lightline = {}
    let g:lightline.colorscheme = 'challenger_deep'
    hi SignColumn guifg=NONE ctermfg=NONE guibg=#011627 ctermbg=236 gui=NONE cterm=NONE
    highlight clear ALEErrorSign
    highlight ALEWarningSign guifg=yellow
    highlight ALEVirtualTextWarning guifg=yellow
    hi CtrlPMatch guibg=cyan guifg=black
    hi CtrlPMode1 guibg=cyan guifg=black
  endif

  if g:VIM_COLOR_SCHEME ==# 'embark'
    colorscheme embark
    hi Cursor guibg=#F48FB1 guifg=white
    let g:lightline = {}
    let g:lightline.colorscheme = 'embark'
    hi CtrlPMatch guifg=#F48FB1 guibg=#1e1c31
    hi CtrlPMode1 guibg=#aaffe4 guifg=black
    if has("gui_vimr")
    else
      hi Normal guibg=NONE ctermbg=NONE
      hi LineNr guibg=NONE ctermbg=NONE
    endif
  endif

  if g:VIM_COLOR_SCHEME ==# 'challenger-deep'
    colorscheme challenger_deep
    let g:challenger_deep_terminal_italics=1
    let g:lightline = {}
    let g:lightline.colorscheme = 'challenger_deep'
    hi Normal guibg=NONE ctermbg=NONE
    hi LineNr guibg=NONE ctermbg=NONE
    highlight clear ALEErrorSign
    highlight ALEWarningSign guifg=yellow
    highlight ALEVirtualTextWarning guifg=yellow
    hi Search guibg=#ffb378 guifg=#100e23
    hi PMenu guibg=#100e23 guifg=#a6b3cc
    hi PmenuSel guibg=#1E1C30 guifg=#63f2f1
    hi CtrlPMatch guifg=#ffe9aa guibg=#1e1c31
    hi CtrlPMode1 guibg=#aaffe4 guifg=black
    hi LineNr guibg=#1e1c31
    " Fix challengers horrible git diffs
    hi DiffAdd guibg=#62d196 guifg=black
    hi DiffDelete guibg=#ff5458 guifg=black
    hi DiffChange guibg=#ffb378 guifg=black
    hi DiffText guibg=#ffe9aa guifg=black
  endif

  if g:VIM_COLOR_SCHEME ==# 'nord'
    let g:nord_underline = 1
    let g:nord_italic_comments = 1
    let g:nord_italic = 1
    let g:nord_cursor_line_number_background = 1
    colorscheme nord
    let g:lightline = {}
    let g:lightline.colorscheme = 'nord'
  endif

  if g:VIM_COLOR_SCHEME ==# 'material'
    packadd material.vim
    let g:material_theme_style = 'default'
    let g:material_terminal_italics = 1
    colorscheme material
  endif

  if g:VIM_COLOR_SCHEME ==# 'material-palenight'
    Plug 'kaicataldo/material.vim'
    let g:material_theme_style = 'palenight'
    let g:material_terminal_italics = 1
    colorscheme material
  endif

  if g:VIM_COLOR_SCHEME ==# 'dracula'
    packadd dracula
    set background=dark
    colorscheme dracula
    let g:lightline = {}
    let g:lightline.colorscheme = 'dracula'
  endif

  if g:VIM_COLOR_SCHEME ==# 'ayu-light'
    packadd ayu
    let g:ayucolor="light"
    set background=light
    colorscheme ayu
    let g:lightline = {}
    let g:lightline.colorscheme = 'ayu_light'
  endif

  if g:VIM_COLOR_SCHEME ==# 'ayu-mirage'
    packadd ayu
    set background=dark
    let g:ayucolor="mirage"
    colorscheme ayu
    let g:lightline = {}
    let g:lightline.colorscheme = 'ayu_mirage'
  endif

  if g:VIM_COLOR_SCHEME ==# 'gruvbox'
    set background=dark
    colorscheme gruvbox-material
    let g:lightline = {}
    let g:lightline.colorscheme = 'gruvbox_material'
  endif
endfunction

" The Defaults
:call SwitchColorScheme('challenger-deep')

