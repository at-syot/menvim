require("aiosdev")

vim.opt.fileencoding = 'utf-8'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2
vim.opt.smartindent = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.updatetime = 50
vim.opt.background = 'dark'

-- vim.opt.listchars =  { 
--   tab = '  ', 
--   eol = "↲",
--   trail = '·',
--   -- lead = '|',
--   extends = '»',
--   precedes = '«'
-- }
-- -- vim.opt.listchars =  { tab = ".", eol = "↲"}
-- vim.o.list = true

-- perfomance
vim.opt.redrawtime = 1500
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 50
vim.opt.updatetime = 50

-- statusline
vim.opt.laststatus = 3

vim.g.mapleader = " "

