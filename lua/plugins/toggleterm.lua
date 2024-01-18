return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 15,
				autochdir = false,
				shading_factor = -1,
				direction = "float",
			})
			vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Terminal (root dir)" })
			vim.keymap.set("t", "<leader>t", "<cmd>close<cr>", { desc = "Hide Terminal" })
			vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
		end,
	},
}
