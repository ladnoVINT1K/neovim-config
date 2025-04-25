return {
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
        separator_style = "slant", -- или "thick", "thin", "padded_slant"
        show_buffer_close_icons = false,
        show_close_icon = false,
        always_show_bufferline = true,
      }
    }
  end
}
