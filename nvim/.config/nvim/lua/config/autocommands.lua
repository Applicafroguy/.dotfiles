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

vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  group = 'filetypedetect',
  pattern = { "*.inp" },
  command = "setf cp2k"
}
)

