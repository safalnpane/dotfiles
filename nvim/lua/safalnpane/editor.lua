-- Look & feel + colorscheme

-- Leader
vim.g.mapleader = ","

--  Solarized-Osaka is the way to go.
vim.cmd[[colorscheme solarized-osaka]]
vim.opt.background = "dark"

-- cursorline
vim.opt.cursorline = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- tabs and spaces (I mean only spaces)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Backspace
vim.opt.backspace = { 'start', 'eol', 'indent' }

-- highlight search
vim.opt.hlsearch = true

-- no swapfile
vim.opt.swapfile = false

-- Listchars
vim.opt.list = true
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "space:⋅"
