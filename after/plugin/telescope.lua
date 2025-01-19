local telescope = require('telescope')
telescope.setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git",
      ".clj-kondo",
      ".idea"
    },
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        preview_height = 0.6,
        height = 0.8,
        preview_cutoff = 0,
        prompt_position = "bottom",
        width = 0.8
      }
    },
  },
  -- pickers = {
  --   find_files = {
  --     theme = "dropdown"
  --   },
  --   grep_string = {
  --     theme = "dropdown"
  --   }
  -- }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', function() builtin.find_files({ hidden = true }) end, {})
vim.keymap.set('n', '<leader>pl', function() builtin.live_grep() end, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function() 
	builtin.grep_string({ search = vim.fn.input('Grep > ') })
end)

vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fd', function() builtin.diagnostics({bufnr=0}) end, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
 
-- telescope lsp
vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols, {})
