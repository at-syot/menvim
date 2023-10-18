local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})
  local opts = {buffer = bufnr}

  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, {})
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
end)

-- auto setup & install langs server
require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {
	  "tsserver", 
	  "gopls", 
	  "svelte",
	  "html",
	  "tailwindcss",
    "volar"
  },
  handlers = {
    lsp_zero.default_setup,
  }
})

-- format on save
lsp_zero.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		['lua'] = {'lua'},
    ['tsserver'] = {'javascript', 'typescript'},
		['svelte'] = {'svelte'},
    ['volar'] = {'vue'},
		['gopls'] = {'go'}
	}
})

local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format()

cmp.setup({
  sources = {
    {name = "nvim_lsp"},
    {name = "buffer"},
  },
  formatting = cmp_format,
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = true}),
    ['J'] = cmp.mapping.select_next_item(),
    ['K'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
  })
})

