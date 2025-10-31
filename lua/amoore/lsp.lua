vim.lsp.config('*', {
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      },
      completion = {
        completionItem = {
          snippetSupport = true, 
        },
      },
    },
  },
  root_markers = { '.git' },
})

require("lsp.pylsp")
require("lsp.pyright")
