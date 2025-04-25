vim.g.mapleader = " "


vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>s", ":w<CR>", { noremap = true, silent = true})

vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer", silent = true })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer", silent = true })

vim.keymap.set("n", "<leader>e", function()
  local view = require("nvim-tree.view")
  if view.is_visible() then
    vim.cmd.wincmd("p")
  else
    require("nvim-tree.api").tree.open()
  end
end, { desc = "Toggle NvimTree or switch back", silent = true })
vim.keymap.set("n", "<leader>c", ":bp | bd #<CR>", { desc = "Close buffer", silent = true })
vim.keymap.set("n", "<leader>qq", function()
  require("resession").save("last-session")
  vim.cmd("qa")
end, { desc = "Save session and quit", silent = true })

