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
table.insert(lua_library_files, resource_path .. '/lua-types')
local lua_plugin_paths = {}
table.insert(lua_plugin_paths, resource_path .. '/lua-plugin/plugin.lua')

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
        globals = { 'vim', 'quarto', 'pandoc', 'io', 'string', 'print', 'require', 'table' },
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


local lsp_flags = {
  allow_incremental_sync = true,
  debounce_text_changes = 150,
}


-- Add any servers here together with their settings
-- -@type lspconfig.options
local servers = {
  r_language_server = {
    flags = {
      debounce_text_changes = 250,
    }
  },
  bashls = {},
  clangd = {},
  cssls = {},
  tsserver = {},
  html = {},
  jsonls = {},
  pyright = {},
  yamlls = {},
  sumneko_lua = {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
        },
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  },
}

return servers
