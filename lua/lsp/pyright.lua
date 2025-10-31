-- lua/lsp/pyright.lua
vim.lsp.config('pyright', {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = 'basic', -- or 'strict'
        autoSearchPaths = true,
      },
    },
  },
  on_attach = function(client)
    -- disable completion provider
    client.server_capabilities.completionProvider = nil
  end,
})

