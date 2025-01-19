vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- buffers
vim.keymap.set("n", "<leader>b[", vim.cmd.bprev)
vim.keymap.set("n", "<leader>b]", vim.cmd.bnext)
vim.keymap.set("n", "<leader>bd", vim.cmd.bdelete)

-- tab
vim.keymap.set("n", "<leader>tt", function() vim.cmd.tabnew('%') end)
vim.keymap.set("n", "<leader>tq", vim.cmd.tabclose)
vim.keymap.set("n", "<leader>t[", vim.cmd.tabprev)
vim.keymap.set("n", "<leader>t]", vim.cmd.tabnext)

-- window resize
vim.keymap.set("n", "<leader>k", function() vim.cmd.resize("+2") end)
vim.keymap.set("n", "<leader>j", function() vim.cmd.resize("-2") end) 
vim.keymap.set("n", "<leader>h", function() vim.cmd [[ vertical resize -2 ]] end) 
vim.keymap.set("n", "<leader>l", function() vim.cmd [[ vertical resize +2 ]] end) 

-- conjure mapping
vim.g.maplocalleader = ","
