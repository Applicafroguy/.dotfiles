return {
  { 'tpope/vim-repeat' },
  { 'tpope/vim-surround' },
  -- enhanced f t motions
  { 'ggandor/flit.nvim',
    dependencies = { 'ggandor/leap.nvim' },
    config = function()
      require('flit').setup {
        keys = { f = 'f', F = 'F', t = 't', T = 'T' },
        labeled_modes = 'nv',
        multiline = true,
        opts = {}
      }
    end
  },
  -- commenting with e.g. `gcc` or `gcip`
  -- respects TS, so it works in quarto documents
  { 'numToStr/Comment.nvim', config = function()
    require('Comment').setup {}
  end
  },
}
