-- Handle and navigate splits with ease.

local keymap = vim.keymap

-- Keymaps
keymap.set("n", "ss", ":split<CR>")
keymap.set("n", "sv", ":vsplit<CR>")

keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sl", "<C-w>l")
