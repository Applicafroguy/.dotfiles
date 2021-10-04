
let g:slime_target = "tmux"
let g:slime_python_ipython = 1

let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"}

xmap <c-c><c-c> <Plug>SlimeRegionSend
map <c-c><c-c> <Plug>SlimeParagraphSend
map <c-c>v     <Plug>SlimeConfig
map <leader><space> <Plug>SlimeParagraphSend

