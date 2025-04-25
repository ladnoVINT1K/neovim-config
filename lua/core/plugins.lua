-- ~/.config/nvim/lua/core/plugins.lua
local lazy = require("lazy")

lazy.setup({
  -- Тема
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- важно! чтобы тема загрузилась первой
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- 💡 здесь выбираем тему
        transparent_background = true,
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
--  { "catppuccin/nvim", name = "catppuccin" },

  -- UI
  "nvim-lualine/lualine.nvim",
  "nvim-tree/nvim-tree.lua",
  "nvim-telescope/telescope.nvim",
  "folke/which-key.nvim",
  "rcarriga/nvim-notify",
  "folke/noice.nvim",

  -- LSP и Mason
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  -- Автодополнение
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  -- AI
--  "github/copilot.vim", -- самый простой способ
--  { "Exafunction/codeium.nvim", config = true },

  -- DAP
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "mfussenegger/nvim-dap-python",

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
})
