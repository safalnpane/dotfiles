local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)


require("lazy").setup({
  -- {
  --   "craftzdog/solarized-osaka.nvim",
  --   lazy=false,
  --   priority=1000,
  --   opts={},
  -- },
  {
     "ellisonleao/gruvbox.nvim",
    priority = 1000
  },
  {
    "catppuccin/nvim", name = "catppuccin", priority = 1000
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
  },
  {
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
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


-- gruvbox
require("gruvbox").setup({})
