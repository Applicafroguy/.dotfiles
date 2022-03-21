require('jmbuhrconfig.lualine')
require('jmbuhrconfig.cmp')
require('jmbuhrconfig.dap')
require('jmbuhrconfig.lsp')
require('jmbuhrconfig.telescope')
require('jmbuhrconfig.nerdtree')
require('jmbuhrconfig.treesitter')
require('jmbuhrconfig.which-key')

vim.cmd [[
  command! Jdev lua require'jmbuhrconfig.dev'.hello()
]]

vim.api.nvim_set_keymap('n', '<leader>de', [[<cmd>lua require'jmbuhrconfig.dev'.hello()<cr>]], {})

