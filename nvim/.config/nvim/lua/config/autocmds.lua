local api = vim.api

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd("FocusGained", { command = "checktime" })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})


-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    vim.cmd([[silent! normal! g`"]])
  end,
})


-- close some filetypes with <q>
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})


vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = { "*" },
  command = "checktime",
}
)

vim.api.nvim_create_autocmd({ "TermOpen" }, {
  pattern = { "*" },
  command = "setlocal nonumber",
}
)


api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.qmd" },
  callback = function()
    vim.keymap.set('n', '<leader>k', function()
      local otter = require'otter'
      local main_nr = api.nvim_get_current_buf()
      otter.send_request(main_nr, "textDocument/codeAction", function(response)
        return response
      end
      )
    end, { silent = true, buffer = 0 })
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>k', ":lua require'quarto'.quartoHover()<cr>", { silent = true })
  end
})
