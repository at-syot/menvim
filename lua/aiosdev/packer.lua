-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- color schemes
  use("savq/melange-nvim")
  use({"rose-pine/neovim", as = "rose-pine"})
  use({"f4z3r/gruvbox-material.nvim", as = "gruvbox"})
  use("RRethy/base16-nvim")
  use({ "atelierbram/Base2Tone-nvim" })

  use "HiPhish/nvim-ts-rainbow2"
  use('nvim-treesitter/nvim-treesitter', {
    run = ':TSUpdate',
  })
  use('mbbill/undotree')
  use('tpope/vim-fugitive')


  use({
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment these if you want to manage LSP servers from neovim
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      {'neovim/nvim-lspconfig'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      {'PaterJason/cmp-conjure'},
      {'L3MON4D3/LuaSnip'},
    }
  })

  use('sbdchd/neoformat')

  -- Clojure
  use({ 'Olical/conjure', ft = { "clojure", "fennel", "python" } })
  use('tpope/vim-dispatch')
  use('clojure-vim/vim-jack-in')
  use('radenling/vim-dispatch-neovim')


  -- auto paring
  use({
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  })
  use({
    'windwp/nvim-ts-autotag',
    config = function() require('nvim-ts-autotag').setup {} end
  })

  -- markdown-preview
  --install without yarn or npm 
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  })

  -- commentor
  use('numToStr/Comment.nvim')
  use('JoosepAlviste/nvim-ts-context-commentstring')
  --

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = false }
  }

  -- liveserver
  use({
    'barrett-ruth/live-server.nvim', 
    build = "npm install -g live-server",
    -- config = true,
  })
end)
