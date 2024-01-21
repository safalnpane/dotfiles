local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)


require("lazy").setup({
  {
    "craftzdog/solarized-osaka.nvim",
    lazy=false,
    priority=1000,
    opts={},
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  { "f-person/git-blame.nvim" },
  { "numToStr/Comment.nvim", lazy=false},
  { "ThePrimeagen/harpoon" },
  { "github/copilot.vim" },
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  {
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'L3MON4D3/LuaSnip',
  }
})


-- lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
  }
}


-- Treesitter
require('nvim-treesitter.configs').setup({
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "python",},
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true }
})


-- Comment
require('Comment').setup()


-- Mason
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})


-- Lsp
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "pyright", "tsserver", "html", "cssls", "jsonls", "dockerls", "yamlls", "bashls", "vimls", "clangd", "rust_analyzer", "gopls" },
  automatic_installation = true,
}


require("cmp").setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  sources = require("cmp").config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip'},
    { name = 'buffer' },
    { name = 'path' },
  })
})


-- Keymaps
vim.keymap.set('n', "K", vim.lsp.buf.hover, {buffer = 0})
vim.keymap.set('n', "gd", vim.lsp.buf.definition, {buffer = 0})
vim.keymap.set('n', "gt", vim.lsp.buf.type_definition, {buffer = 0})
vim.keymap.set('n', "gi", vim.lsp.buf.implementation, {buffer = 0})
vim.keymap.set('n', "<Leader>r", vim.lsp.buf.rename, {buffer = 0})
