-- completion
-- Setup nvim-cmp.
local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspkind = require "lspkind"
require("copilot_cmp").setup{ }


lspkind.init()


local border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

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
    ['<C-n>'] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
        fallback()
      end
    end, { "i", "s" }),
    ['<C-p>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<c-a>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
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
        spell = "[spell]",
        pandoc_references = "[ref]",
        tags = "[tag]",
        treesitter = "[TS]",
        calc = "[calc]",
        latex_symbols = "[tex]",
        emoji = "[emoji]",
        Copilot = "[cop]",
        quarto = "[qmd]"
        -- zsh = "[zsh]",
        -- gh_issues = "[issues]",
      },
    },
  },
  sources = {
    { name = "copilot", group_index = 2 },
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'luasnip', keyword_length = 3, max_item_count = 3 },
    { name = 'pandoc_references' },
    { name = 'buffer', keyword_length = 5, max_item_count = 3 },
    { name = 'spell' },
    { name = 'treesitter', keyword_length = 5, max_item_count = 3 },
    { name = 'calc' },
    { name = 'latex_symbols' },
    { name = 'emoji' },
    { name = 'quarto' },
  },
  view = {
    entries = "native",
  },
  window = {
    documentation = {
      border = border,
    },
  },
})

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6CC644"})

-- for friendly snippets
require("luasnip.loaders.from_vscode").lazy_load()
-- for custom snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snips" } })

