require 'config'

local packer_bootstrap= require('plugins')
if packer_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '         '
  print '       To later upadate plugins'
  print '       Type :PackerSync'
  print '=================================='
  return
end

require 'keymap'
vim.cmd 'colorscheme nord'
require 'plugin-config'
require 'custom'
