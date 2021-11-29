-- Setup nvim-cmp.
local cmp = require'cmp'
local luasnip = require'luasnip'
local lspkind = require "lspkind"

lspkind.init()

vim.o.completeopt = 'menuone,noinsert'

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<c-tab>'] = cmp.mapping.select_prev_item(),
    ['<tab>'] = cmp.mapping.select_next_item(),
    ['<c-a>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      select = true
    }),
    -- ['<tab>'] = cmp.mapping(function (fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif luasnip and luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's'}),
    -- ['<S-tab>'] = cmp.mapping(function (fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip and luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's'})
  },
  autocomplete = false,
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
        calc = "[calc]",
        -- zsh = "[zsh]",
        -- gh_issues = "[issues]",
      },
    },
  },
  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'buffer', keyword_length = 3, max_item_count = 8 },
    { name = "nvim_lua" },
    { name = 'path' },
    { name = 'spell' },
    { name = 'pandoc_references' },
    { name = 'tags' },
    { name = 'treesitter' },
    { name = 'calc' },
    -- { name = 'tmux' },
    -- { name = 'zsh' },
  },
  experimental = {
    native_menu = true,
    ghost_text = true,
  },
})
