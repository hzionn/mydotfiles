-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- fix multiple lsp attach while using clangd, maybe
local cmp_nvim_lsp = require("cmp_nvim_lsp")
require("lspconfig").clangd.setup({
  on_attach = on_attach,
  capabilities = cmp_nvim_lsp.default_capabilities(),
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
})

-- use :echo &ft to show filetype
-- use different indentation for different filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "lua",
    "c",
    "html",
    "R",
  },
  command = "setlocal shiftwidth=2 tabstop=2",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "python",
    "rust",
    "javascript",
    "typescript",
    "cpp",
  },
  command = "setlocal shiftwidth=4 tabstop=4",
})

