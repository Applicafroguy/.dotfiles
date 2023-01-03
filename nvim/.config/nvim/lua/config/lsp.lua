-- treesitter
require 'nvim-treesitter.configs'.setup {
  ensure_installed = {'r', 'python', 'markdown', 'markdown_inline', 'julia', 'yaml', 'lua', 'vim', 'query' }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        -- [']]'] = '@class.outer',
        [']]'] = '@codechunk',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        -- ['[['] = '@class.outer',
        ['[['] = '@codechunk',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}




-- LSP
local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local configs = require 'lspconfig.configs'
local util = require("lspconfig.util")

require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = true
})

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gD', '<cmd>Telescope lsp_type_definitions<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>ll', '<cmd>lua vim.lsp.codelens.run()<cr>', opts)
  client.server_capabilities.document_formatting = true
end


local lsp_flags = {
  allow_incremental_sync = true,
  debounce_text_changes = 150,
}

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = require'style'.border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = require'style'.border })


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.r_language_server.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 250,
  }
}


-- lspconfig.diagnosticls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "python" },
--   init_options = {
--     formatters = {
--       black = {
--         command = "black",
--         args = { "--quiet", "-" },
--         rootPatterns = { ".git", "pyproject.toml", "setup.py", "tox." },
--       },
--       formatFiletypes = {
--         python = { "black" }
--       }
--     }
--   }
-- }


if not lspconfig.emmet_ls then
  configs.emmet_ls = {
    default_config = {
      cmd = { 'emmet-ls', '--stdio' };
      filetypes = { 'html', 'css', 'blade', 'jsx', 'xml', 'scss' };
      root_dir = function(fname)
        return vim.loop.cwd()
      end;
      settings = {};
    };
  }
end
lspconfig.emmet_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}


lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.hls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- local ht = require('haskell-tools')
-- ht.setup {
--   hls = {
--     on_attach = on_attach
--   },
-- }


local function strsplit(s, delimiter)
  local result = {}
  for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
    table.insert(result, match)
  end
  return result
end

local function get_quarto_resource_path()
  local f = assert(io.popen('quarto --paths', 'r'))
  local s = assert(f:read('*a'))
  f:close()
  return strsplit(s, '\n')[2]
end

local lua_library_files = vim.api.nvim_get_runtime_file("", true)
local resource_path = get_quarto_resource_path()
table.insert(lua_library_files, resource_path..'/lua-types')
local lua_plugin_paths = {}
table.insert(lua_plugin_paths, resource_path..'/lua-plugin/plugin.lua')

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        plugin = lua_plugin_paths[1],
      },
      diagnostics = {
        globals = {'vim', 'quarto', 'pandoc', 'io', 'string', 'print', 'require', 'table' },
      },
      workspace = {
        library = lua_library_files,
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 250,
  },
  root_dir = function(fname)
    return util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt")(fname) or
    util.path.dirname(fname)
  end
}

lspconfig.julials.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 250,
  },
}

-- require'lspconfig'.grammarly.setup{}

-- require'lspconfig'.pylsp.setup{
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   settings = {
    --     pylsp = {
      --       plugins = {
        --         pycodestyle = {
          --           ignore = {'W391', 'E265'},
          --           maxLineLength = 100
          --         }
          --       }
          --     }
          --   }
          -- }

          -- require'lspconfig'.jedi_language_server.setup{
            --   on_attach = on_attach,
            --   capabilities = capabilities,
            -- }




local dap = require('dap')
local dapPython = require'dap-python'


dap.adapters.python = {
  type = 'executable';
  command = 'python';
  args = { '-m', 'debugpy.adapter' };
}


vim.fn.sign_define('DapBreakpoint', {text='🦦', texthl='', linehl='', numhl=''})

-- vim.cmd [[
-- au FileType dap-repl lua require('dap.ext.autocompl').attach()
-- ]]

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        -- return '/usr/bin/python'
        return 'python'
      end
    end;
  },
}

require('dap.ext.vscode').load_launchjs("launch.json")

dapPython.setup()
dapPython.test_runner = 'pytest'


--neotest
require("neotest").setup({
  adapters = {
    require("neotest-python")
  }
})


require("dapui").setup()


