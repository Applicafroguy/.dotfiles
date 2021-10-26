-- Setup nvim-cmp.
local cmp = require'cmp'
local luasnip = require'luasnip'
local lspkind = require "lspkind"

lspkind.init()

vim.o.completeopt = 'menu,menuone,noselect'

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<c-a>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true
    }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        luasnip = "[snip]",
        nvim_lsp = "[LSP]",
        buffer = "[buf]",
        nvim_lua = "[api]",
        path = "[path]",
        spell = "[spell]",
        pandoc_references = "[ref]",
        tags = "[tag]",
        treesitter = "[ts]",
        -- zsh = "[zsh]",
        calc = "[calc]",
        -- gh_issues = "[issues]",
      },
    },
  },
  sources = {
    -- { name = 'vsnip' },
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = "nvim_lua" },
    { name = 'path' },
    { name = 'spell' },
    { name = 'pandoc_references' },
    -- { name = 'tmux' },
    { name = 'tags' },
    { name = 'treesitter' },
    -- { name = 'zsh' },
    { name = 'calc' },
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
})
