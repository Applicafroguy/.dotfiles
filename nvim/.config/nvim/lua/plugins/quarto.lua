return {
  { 'quarto-dev/quarto-nvim',
    dev = true,
    dependencies = {
      { 'jmbuhr/otter.nvim',
        dev = true,
      },
      'neovim/nvim-lspconfig'
    },
    config = function()
      require 'quarto'.setup {
        lspFeatures = {
          enabled = true,
          languages = { 'r', 'python', 'julia', 'haskell', 'lua' },
          diagnostics = {
            enabled = true,
            triggers = { "BufWrite" }
          },
          completion = {
            enabled = true
          }
        }
      }
    end
  },
  -- send code from python/r/qmd docuemts to the terminal
  -- thanks to tmux can be used for any repl
  -- like ipython, R, bash
  { 'jpalardy/vim-slime' },
  -- paste an image to markdown from the clipboard
  -- :PasteImg,
  'ekickx/clipboard-image.nvim',
}
