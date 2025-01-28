return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "storm", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
				light_style = "day", -- The theme is used when the background is set to light
				transparent = true,
				day_brightness = 0.2, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
				dim_inactive = false, -- dims inactive windows
				lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
			})
			vim.cmd([[ colorscheme tokyonight]])
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
