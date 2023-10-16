local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function() 
	builtin.grep_string({ search = vim.fn.input('Grep > ') })
end)

vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
 
-- telescope lsp
vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols, {})
