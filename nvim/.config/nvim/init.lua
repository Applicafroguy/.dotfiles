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
require 'plugin-config'

vim.cmd.colorscheme 'tokyonight'


-- custom
P = function(x)
  print(vim.inspect(x))
  return(x)
end

RELOAD = function(...)
  return require'plenary.reload'.reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

