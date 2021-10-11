require('lualine').setup({
  options = {
    theme = 'nord'
  },
  sections = {
    lualine_a = {'filename'},
    lualine_b = {'branch'},
    lualine_c = {'filetype'},
    lualine_x = {'quickfix', 'fugitive', 'nvim-tree'},
    lualine_y = {'progress'},
    lualine_z = {'location'},
    }
})
