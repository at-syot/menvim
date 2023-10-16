vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- buffers
vim.keymap.set("n", "<leader>b[", vim.cmd.bprev)
vim.keymap.set("n", "<leader>b]", vim.cmd.bnext)
vim.keymap.set("n", "<leader>bd", vim.cmd.bdelete)

-- tab
vim.keymap.set("n", "<leader>tt", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>tq", vim.cmd.tabclose)
vim.keymap.set("n", "<leader>t[", vim.cmd.tabprev)
vim.keymap.set("n", "<leader>t]", vim.cmd.tabnext)
