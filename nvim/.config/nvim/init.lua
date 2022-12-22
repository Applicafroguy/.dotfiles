require 'global'
require 'load-plugins'
require 'config.lsp'
require 'config.autocommands'
require 'keymap'

vim.cmd.colorscheme 'catppuccin'
local colors = require('catppuccin.palettes.mocha')
vim.cmd.highlight { 'Tabline', 'guifg=' .. colors.green, 'guibg=' .. colors.mantle }
