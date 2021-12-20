require('lualine').setup({
  options = {
    -- theme = 'nord',
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_a = {'filename'},
    lualine_b = {'branch'},
    lualine_c = {'filetype', 'lsp_progress' },
    lualine_x = {'quickfix', 'fugitive', 'nvim-tree'},
    lualine_y = {'progress'},
    lualine_z = {'location'},
    },
  extensions = {'fugitive', 'nvim-tree', 'quickfix'}
})



