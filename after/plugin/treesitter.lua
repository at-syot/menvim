require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
    "javascript",
    "typescript",
    "lua",
    "go",
    "elixir",
    "heex",
    "eex",
    "svelte",
    "clojure",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    disable = function (lang, buf)
      local allowed = { "clojure" }
      return not vim.tbl_contains(allowed, lang)
    end,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true, -- Enable the feature
    disable = function (lang, buf)
      local allowed = { "clojure" }
      return not vim.tbl_contains(allowed, lang)
    end,
    keymaps = {
      init_selection = "gnn", -- Start selection (normal mode)
      node_incremental = "ak", -- Increment selection (normal mode)
      scope_incremental = "grc", -- Increment to the scope (normal mode)
      node_decremental = "aj", -- Decrement selection (normal mode)
    },
  },
}
