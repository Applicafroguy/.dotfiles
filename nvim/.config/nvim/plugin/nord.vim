
augroup nord-theme-overrides
  autocmd!
  " Test:
  " Use 'nord7' as foreground color for Vim comments
  " autocmd ColorScheme nord highlight vimComment ctermfg=6
augroup END

colorscheme nord

let g:nord_cursor_line_number_background = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_italic = 1
let g:nord_bold = 1
let g:nord_underline = 1

highlight NvimTreeFolderIcon guibg=blue

