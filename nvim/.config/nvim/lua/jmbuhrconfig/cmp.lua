-- Setup nvim-cmp.
local cmp = require'cmp'
local luasnip = require'luasnip'
local lspkind = require "lspkind"

lspkind.init()

vim.opt.completeopt = 'menuone,noinsert'

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-f>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-p>'] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
        fallback()
      end
    end, { "i", "s" }),
    ['<C-n>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    -- ['<C-CR>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     fallback()
    --   else
    --     fallback()
    --   end
    -- end, { "i", "s" }),
    ['<c-a>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      select = true
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  autocomplete = false,
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        luasnip = "[snip]",
        nvim_lsp = "[LSP]",
        buffer = "[buf]",
        path = "[path]",
        nvim_lua = "[api]",
        spell = "[spell]",
        pandoc_references = "[ref]",
        tags = "[tag]",
        treesitter = "[TS]",
        calc = "[calc]",
        latex_symbols = "[tex]",
        emoji = "[emoji]",
        -- zsh = "[zsh]",
        -- gh_issues = "[issues]",
      },
    },
  },
  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'pandoc_references' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 3, max_item_count = 8 },
    { name = "nvim_lua" },
    { name = 'spell' },
    { name = 'tags' },
    { name = 'treesitter' },
    { name = 'calc' },
    { name = 'latex_symbols' },
    { name = 'emoji' },
    -- { name = 'tmux' },
    -- { name = 'zsh' },
  },
  view = {
    entries = "native",

  },
  experimental = {
    ghost_text = true,
  },
})

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

ls.snippets = {
  all = {
    s("lorem ipsum", {
      t("Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit"),
    })
  },
  r = {
    s("p", {
      t("%>%")
    })
  }
}
require("luasnip.loaders.from_vscode").lazy_load() -- for friendly snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snips" } })

