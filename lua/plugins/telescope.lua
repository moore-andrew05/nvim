return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			defaults = {
				layout_config = {
					horizontal = {
						preview_cutoff = 0,
						preview_width = 0.5,
					},
				},
			},
		},
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files <cr>", desc = "Telescope find files" },
			{ "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Telescope git file search" },
			{
				"<leader>fs",
				function()
					require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
				end,
				desc = "Telescope grep string",
			},
			{ "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Telesceop show diagnostics" },
		},
	},
}
