-- Fun LSP stuff

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local on_attach = function()
    vim.keymap.set('n', "K", vim.lsp.buf.hover, {buffer = 0})
    vim.keymap.set('n', "gd", vim.lsp.buf.definition, {buffer = 0})
    vim.keymap.set('n', "gt", vim.lsp.buf.type_definition, {buffer = 0})
    vim.keymap.set('n', "gi", vim.lsp.buf.implementation, {buffer = 0})
    vim.keymap.set('n', "<Leader>r", vim.lsp.buf.rename, {buffer = 0})
end

-- Setup for languages

nvim_lsp.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.pyright.setup {
  on_attach =  on_attach,
  capabilities = capabilities,
}

nvim_lsp.eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
