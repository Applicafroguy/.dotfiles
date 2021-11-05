require('lualine').setup({
  options = {
    theme = 'nord'
  },
  sections = {
    lualine_a = {'filename'},
    lualine_b = {'branch'},
    lualine_c = {'filetype' },
    lualine_x = {'quickfix', 'fugitive', 'nvim-tree'},
    lualine_y = {'progress'},
    lualine_z = {'location'},
    },
  extenstions = {'fugitive', 'nvim-tree', 'quickfix'}
})


vim.cmd[[
  set guioptions-=e " Use showtabline in gui vim
  set sessionoptions+=tabpages,globals " store tabpages and globals in session
]]
