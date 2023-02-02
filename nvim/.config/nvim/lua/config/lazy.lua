--  bootstrap lazy package manager
--  <https://github.com/folke/lazy.nvim>
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)


local function hostname()
    local f = io.popen ("/bin/hostname")
    local hostname = f:read("*a") or ""
    f:close()
    hostname =string.gsub(hostname, "\n$", "")
    return hostname
end

local dev_settings = nil
if hostname() == 'pop-desktop' then
  dev_settings = {
    path = "~/projects",
    patterns = { "jmbuhr", "quarto-dev" },
  }
end

require("lazy").setup("plugins", {
  defaults = {
    version = "*",
  },
  dev = dev_settings,
  install = { colorscheme = { "catppuccin", "habamax" } },
  -- checker = { enabled = true },
  rtp = {
    disabled_plugins = {
      "gzip",
      "matchit",
      "matchparen",
      "netrwPlugin",
      "tarPlugin",
      "tohtml",
      "tutor",
      "zipPlugin",
    },
  },
})
