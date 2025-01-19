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
  rainbow = {
    enable = true,
    extended_mode = true,
    strategy = {
      require("ts-rainbow").strategy["global"]
    },
    disable = function (lang, buf)
      -- local filetypes = {"clojure"}
      -- return not vim.tbl_contains(filetypes, lang)
      return lang ~= "clojure"

      -- local allowed = { "clojure" }
      -- local should_disable = not vim.tbl_contains(allowed, lang)

      -- Debugging: Print the current language and status
      -- print("Checking lang:", lang, " -> Disabled:", should_disable)
      -- return should_disable
    end
  },
  incremental_selection = {
    enable = true, -- Enable the feature
    disable = function (lang, buf)
      local allowed = { "clojure" }
      return not vim.tbl_contains(allowed, lang)
    end,
    keymaps = {
      init_selection = "gnn", -- Start selection (normal mode)
      node_incremental = "<c-J>", -- Increment selection (normal mode)
      scope_incremental = "grc", -- Increment to the scope (normal mode)
      node_decremental = "<c-K>", -- Decrement selection (normal mode)
    },
  },
}
