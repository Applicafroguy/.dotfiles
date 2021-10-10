
" Vim Script
let g:nvim_tree_respect_buf_cwd = 1

lua << EOF
require("project_nvim").setup{}
EOF
