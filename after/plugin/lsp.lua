local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})
  local opts = {buffer = bufnr}

  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, {})
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
end)


lsp_zero.configure('clojure_lsp', {
  on_attach = function (client, bufnr)
    vim.diagnostic.disable(bufnr)
  end
})

-- auto setup & install langs server
require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {
	  -- "tsserver",
	  "gopls",
	  "svelte",
	  "html",
    "cssls",
	  "tailwindcss",
    "volar",
    "graphql",
    "lua_ls",
    "elixirls"
  },
  handlers = {
    lsp_zero.default_setup,
  }
})

vim.api.nvim_create_user_command("LSPToggleInlayHint", function ()
   local ft = vim.bo.filetype
   local enabled = vim.lsp.inlay_hint.is_enabled()
   if ft ~= "rust" then return end

   if enabled then
     enabled = false
   else
     enabled = true
   end
   vim.lsp.inlay_hint.enable(enabled)
   print("inlay_hint now -- " .. tostring(enabled))
end, {})

vim.keymap.set('n', '<leader>rt', function() vim.cmd('LSPToggleInlayHint') end, {})


-- format on save
lsp_zero.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		['lua'] = {'lua'},
    -- ['tsserver'] = {'javascript', 'typescript'},
		-- ['svelte'] = {'svelte'},
    -- ['volar'] = {'vue'},
		['gopls'] = {'go'},
    ['elixirls'] = {'elixir', 'ex'},
	}
})

local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format()

cmp.setup({
  sources = {
    {name = "nvim_lsp"},
    {name = "buffer"},
  },
  -- formatting = cmp_format, 
  formatting = {
    -- changing the order of fields so the icon is the first
    fields = {'menu', 'abbr', 'kind'},

    -- here is where the change happens
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
        nvim_lua = 'Π',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = true}),
    ['J'] = cmp.mapping.select_next_item(),
    ['K'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  }
})

