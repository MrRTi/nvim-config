return {
	{
		"Tsuzat/NeoSolarized.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd([[ colorscheme NeoSolarized ]])
			require("lualine").setup({
				options = {
					theme = "NeoSolarized",
				},
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					component_separators = { left = " | ", right = " | " },
					section_separators = { left = " ", right = " " },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						"branch",
						"diff",
						"diagnostics",
						{
							"filename",
							file_status = true,
							newfile_status = false,
							path = 1,
							shorting_target = 80,
						},
					},
					lualine_c = {},
					lualine_x = { "encoding", "filetype" },
					lualine_y = {},
					lualine_z = { "location", "progress" },
				},
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
