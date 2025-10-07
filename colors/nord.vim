" Nord colorscheme with automatic light/dark detection
" Based on 'background' setting

if &background == 'light'
  lua require('frisch').load('light')
else
  lua require('frisch').load('dark')
endif
