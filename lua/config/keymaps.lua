-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Delete unused ketmaps
vim.keymap.del("n", "<leader>bd")
vim.keymap.del({ "n", "x" }, "<leader>cf")
vim.keymap.del({ "n", "t" }, "<C-/>")
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>gs")
vim.keymap.del("n", "<leader>dr");

-- Custom keymaps
vim.keymap.set("n", "<A-q>", "<CMD>bdelete<CR>", { desc = "Close the current buffer" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from system clipboard" })
vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<cr>", { desc = "Open neogit" });
vim.keymap.set("n", "<leader>dr", "<cmd>Dotnet run<CR>", { desc = "Run the current dotnet project" })

vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })

vim.keymap.set("n", "<A-i>", function()
    Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Opens a terminal" })

vim.keymap.set("n", "<leader>e", function()
    require("mini.files").open(vim.uv.cwd(), true)
end, { desc = "Open mini.files" })

vim.keymap.set("n", "<leader>f", function()
    LazyVim.format({ force = true })
end, { desc = "Format the current file" })
