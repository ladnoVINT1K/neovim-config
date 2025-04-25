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
        flavour = "frappe", -- 💡 здесь выбираем тему
        transparent_background = true,
        term_colors = true,  -- разрешаем изменения терминальных цветов
        --dim_inactive = true,  -- затемняем неактивные окна NOT WORKED
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  -- UI
  "nvim-lualine/lualine.nvim",
  --"nvim-tree/nvim-tree.lua",
  {
    'nvim-tree/nvim-tree.lua',   -- Плагин для дерева файлов
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Иконки для файлов
    config = function()
      -- Настройки nvim-tree
      require'nvim-tree'.setup {
        view = {
          width = 30,   -- Ширина панели
          side = 'left',  -- Слева
        },
        filters = {
          dotfiles = false,  -- Скрывать скрытые файлы
        },
        git = {
          enable = true,    -- Включить поддержку git
          ignore = false,   -- Игнорировать изменения?
        },
        actions = {
          open_file = {
            quit_on_open = false,  -- Не закрывать дерево при открытии файла
          },
        },
      }
    end
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
    vim.opt.termguicolors = true

      require("bufferline").setup{
        highlights = require("catppuccin.groups.integrations.bufferline").get(),
        options = {
          mode = "buffers", -- или "tabs", если хочешь по табам
          offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "center",
          }
        },
          diagnostics = "nvim_lsp",
          separator_style = "thin", -- или "thick", "thin", "padded_slant"
          show_buffer_close_icons = false,
          show_close_icon = false,
          always_show_bufferline = true,
        }
      }
    end
  },


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
  { 'jiangmiao/auto-pairs' },
  -- AI
  --  "github/copilot.vim", -- самый простой способ
  --  { "Exafunction/codeium.nvim", config = true },

  -- DAP
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "mfussenegger/nvim-dap-python",

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  
  -- restore 
  {
  "stevearc/resession.nvim",
  config = function()
    require("resession").setup {
      autosave = {
        enabled = true,
        interval = 60, -- автосейв каждые 60 секунд
        notify = false,
      },
    }

    -- Автовосстановление последней сессии при старте
    -- Автозагрузка последней сессии без запроса
    vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc(-1) == 0 then
            local success, _ = pcall(function()
              require("resession").load("last-session")
            end)
        if not success then
          print("No session found, starting fresh!")
        end
      end
    end
  })
  
  end
  }

})

local lualine = require('lualine')

lualine.setup({
  options = {
    theme = 'catppuccin',  -- Устанавливаем тему Catppuccin
    section_separators = { '', '' },
    component_separators = { '', '' },
    icons_enabled = true,  -- Включаем иконки
  },
  sections = {
    lualine_a = { 'mode' },  -- Показывает текущий режим
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
})

