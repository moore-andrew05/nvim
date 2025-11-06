vim.lsp.config("elixirls", {
  cmd = { "elixirls" },
  settings = {
    elixirLS = {
      dialyzerEnabled = true,
      fetchDeps = false,
    },
  },
  on_attach = function(client, bufnr)
    -- Disable formatting so it doesn't shift your code
    vim.bo[bufnr].formatexpr = ""
    -- Keep your preferred indentation
    vim.bo[bufnr].tabstop = 2
    vim.bo[bufnr].shiftwidth = 2
    vim.bo[bufnr].expandtab = true
  end,
})
