-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local discipline = require("safalnpane.discipline")
discipline.cowboy()

require("safalnpane.explorer")

local keymap = vim.keymap

-- Use Explorer
keymap.set("n", "<Leader>e", ":Explore<CR>")

-- New Tab
keymap.set("n", "te", ":tabedit<CR>")

-- Next Tab
keymap.set("n", "<c-tab>", ":tabnext<CR>")

-- Prev Tab
keymap.set("n", "<s-tab>", ":tabprev<CR>")

-- splits
keymap.set("n", "ss", ":split<CR>")
keymap.set("n", "sv", ":vsplit<CR>")

keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sl", "<C-w>l")
