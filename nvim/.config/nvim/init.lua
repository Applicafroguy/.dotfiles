
require("config.options")
require("config.lazy")
require("config.autocmds")
require("config.keymaps")

vim.cmd.colorscheme 'catppuccin'
local colors = require('catppuccin.palettes.mocha')
vim.cmd.highlight { 'Tabline', 'guifg=' .. colors.green, 'guibg=' .. colors.mantle }
