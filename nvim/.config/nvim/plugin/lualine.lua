require('lualine').setup({
  options = {
    theme = 'nord',
    section_separators = '',
    component_separators = '',
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

