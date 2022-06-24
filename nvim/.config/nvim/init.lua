require('globals')

plugins = require('plugins')
if plugins.is_bootstrap() then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

require('autocmd')
require('jmbuhrconfig')
require('colors')

vim.cmd('autocmd FileType markdown set autowriteall')

