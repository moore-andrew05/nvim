return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = {
                "c",
                "lua",
                "python",
                "vim",
                "vimdoc",
                "query",
                "markdown",
                "markdown_inline",
                "elixir",
                "eex",
                "heex",
            },

            sync_install = false,
            auto_install = true,

            highlight = {
                enable = true,
                disable = { "csv" },
                additional_vim_regex_highlighting = false,
            },

            indent = {
                enable = true,
            },
        })
    end,
}
