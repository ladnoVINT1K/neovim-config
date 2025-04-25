-- Инициализация менеджера плагинов
vim.opt.rtp:prepend("~/.config/nvim/lua/lazy")
require('core.plugins')
-- Установка темы
-- vim.cmd('')

-- Настройка параметров Neovim
require('core.options')
require('core.keymaps')

-- Инициализация плагинов
require('plugins.lsp')
require('plugins.cmp')
require('plugins.ai')
require('plugins.ui')
require('plugins.dap')

-- Устанавливаем прозрачность фона окна Neovim
vim.api.nvim_command("autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE") -- Оставляет фон прозрачным

