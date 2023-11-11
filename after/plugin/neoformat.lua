-- Try project-local version of Prettier
vim.g.neoformat_try_node_exe = 1

-- Enable alignment
vim.g.neoformat_basic_format_align = 1

-- Enable tab to spaces conversion
vim.g.neoformat_basic_format_retab = 0

-- Enable trimmming of trailing whitespace
vim.g.neoformat_basic_format_trim = 1

vim.g.neoformat_enabled_js = { "prettier" }
vim.g.neoformat_enabled_json = vim.g.neoformat_enabled_js
vim.g.neoformat_enabled_ts = vim.g.neoformat_enabled_js
vim.g.neoformat_enabled_jsx = vim.g.neoformat_enabled_js
vim.g.neoformat_enabled_tsx = vim.g.neoformat_enabled_js
vim.g.neoformat_enabled_typescript = vim.g.neoformat_enabled_js
vim.g.neoformat_enabled_javascript = vim.g.neoformat_enabled_js

vim.cmd [[
  autocmd BufWritePre *.js,*.ts,*.vue,*.svelte,*.tsx,*.jsx,*.md,*.yml,*.yaml Neoformat
]]
