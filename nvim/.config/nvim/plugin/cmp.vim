" For LSP together with nvim-cmp for fompletion

lua <<EOF
-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
    end
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-2),
    ['<C-f>'] = cmp.mapping.scroll_docs(2),
    ['<c-a>'] = cmp.mapping.complete(),
    ['<tab>'] = cmp.mapping.select_next_item(),
    ['<S-tab>'] = cmp.mapping.select_prev_item(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true })
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = require('lspkind').presets.default[vim_item.kind]
      return vim_item
    end
  },
  completion = {
    keyword_lenght = 2
  },
  sources = {
    { name = 'vsnip' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'spell' },
    { name = 'path' },
    { name = 'pandoc_references' },
    { name = 'nvim_lua' },
    { name = 'tmux' },
    { name = 'tags' },
    { name = 'treesitter' },
    { name = 'zsh' },
    { name = 'calc' },
  }
})
EOF

