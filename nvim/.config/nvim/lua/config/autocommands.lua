local api = vim.api

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
