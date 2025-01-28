-- vim.g.neoformat_run_all_formatters = 1

-- Try project-local version of Prettier
-- vim.g.neoformat_try_node_exe = 1
--
-- -- Enable alignment
-- vim.g.neoformat_basic_format_align = 1
--
-- -- Enable tab to spaces conversion
-- vim.g.neoformat_basic_format_retab = 0
--
-- -- Enable trimmming of trailing whitespace
-- vim.g.neoformat_basic_format_trim = 1
--
-- vim.g.neoformat_enabled_js = { "prettier" }
-- vim.g.neoformat_enabled_json = vim.g.neoformat_enabled_js
-- vim.g.neoformat_enabled_ts = vim.g.neoformat_enabled_js
-- vim.g.neoformat_enabled_jsx = vim.g.neoformat_enabled_js
-- vim.g.neoformat_enabled_tsx = vim.g.neoformat_enabled_js
-- vim.g.neoformat_enabled_typescript = vim.g.neoformat_enabled_js
-- vim.g.neoformat_enabled_javascript = vim.g.neoformat_enabled_js
--
-- vim.g.neoformat_enabled_go = {'goimports', 'gofumpt'}
-- vim.g.neoformat_enabled_rust = {'rustfmt'};
--
-- vim.cmd [[
--   autocmd BufWritePre *.js,*.ts,*.vue,*.svelte,*.tsx,*.jsx,*.md,*.yml,*.yaml,*.go,*.rs Neoformat
-- ]]

----------- NEW -----------------
----- ~/.config/nvim/lua/plugins/formatting.lua

local M = {}

function M.setup()
  -- General formatting configuration
  vim.g.neoformat = {
    basic = {
      align = 1,
      retab = 0,
      trim = 1,
    },
    run_all_formatters = 1,
    try_node_exe = 1,
  }

  -- Filetype-specific formatters
  local formatters = {
    javascript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescript = { 'prettier' },
    typescriptreact = { 'prettier' },
    json = { 'prettier' },
    vue = { 'prettier' },
    svelte = { 'prettier' },
    markdown = { 'prettier' },
    yaml = { 'prettier' },
    go = { 'goimports', 'gofumpt' },
    rust = { 'rustfmt' },
    lua = { 'stylua' }, -- Added example for Lua
    clojure = { 'cljfmt' },
    clojurescript = { 'cljfmt' }
  }

  -- Set formatters for each filetype
  for ft, fmt in pairs(formatters) do
    vim.g['neoformat_enabled_' .. ft] = fmt
  end
  vim.g.neoformat_enabled_clojure = {'cljfmt'}
  vim.g.neoformat_clj_cljfmt = {
    exe = 'cljfmt',
    args = {'fix'},
    replace = 1,
    stdin = 1
  }


  -- Auto-format on save
  vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = function()
      local ft = vim.bo.filetype
      if ft == 'clojure' then
        vim.lsp.buf.format()
        return 
      end

      if formatters[ft] then
        vim.cmd('silent! Neoformat')
      end
    end,
    group = vim.api.nvim_create_augroup('NeoformatAuto', { clear = true }),
  })

  -- Manual formatting keymap
  vim.keymap.set('n', '<leader>cc', function ()
    local ft = vim.bo.filetype
    local buf_path = vim.api.nvim_buf_get_name(0)
    if ft == 'clojure' then
      vim.cmd('!cljfmt fix ' .. buf_path)
    end
  end, { desc = '[C]ode [F]ormat', silent = true })

  -- with lsp formating
  -- vim.keymap.set('n', '<leader>cf', function()
  --   if vim.lsp.buf.format then
  --     vim.lsp.buf.format()
  --   else
  --     vim.cmd('Neoformat')
  --   end
  -- end, { desc = 'Format code' })
end

-- Optional: Add error handling for missing formatters
local ok, _ = pcall(M.setup)
if not ok then
  vim.notify('Error loading Neoformat config', vim.log.levels.ERROR)
end

return M
