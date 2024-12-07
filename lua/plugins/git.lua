return {
	-- Git related plugins
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gg", ":Git<CR>", { desc = "[g]it (fu[g]itive)" })

			require("which-key").add({
				{ "<leader>g", group = "[g]it", mode = { "n", "v" } },
			})
		end,
	},

	-- Here is a more advanced example where we pass configuration
	-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
	--    require('gitsigns').setup({ ... })
	--
	-- See `:help gitsigns` to understand what the configuration keys do
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { desc = "Jump to next git [c]hange" })

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { desc = "Jump to previous git [c]hange" })

				-- Actions
				-- visual mode
				map("v", "<leader>gs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "[g]it [s]tage hunk" })
				map("v", "<leader>gr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "[g]it [r]eset hunk" })
				-- normal mode
				map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "[g]it [s]tage hunk" })
				map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "[g]it [S]tage buffer" })
				map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "[g]it [r]eset hunk" })
				map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "[g]it [R]eset buffer" })
				map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "[g]it [u]ndo stage hunk" })
				map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "[g]it [p]review hunk" })
				map("n", "<leader>gb", gitsigns.blame_line, { desc = "[g]it [b]lame line" })
				map("n", "<leader>gd", gitsigns.diffthis, { desc = "[g]it [d]iff against index" })
				map("n", "<leader>gD", function()
					gitsigns.diffthis("@")
				end, { desc = "[g]it [D]iff against last commit" })
				-- Toggles
				map(
					"n",
					"<leader>tgb",
					gitsigns.toggle_current_line_blame,
					{ desc = "[t]oggle [g]it show [b]lame line" }
				)
				map("n", "<leader>tgD", gitsigns.toggle_deleted, { desc = "[t]oggle [g]it show [D]eleted" })

				require("which-key").add({
					{ "<leader>tg", group = "[t]oggle [g]it" },
				})
			end,
		},
	},

	-- Working with git worktrees in nvim
	-- {
	--   "ThePrimeagen/git-worktree.nvim",
	--   dependencies = {
	--     "nvim-telescope/telescope.nvim",
	--   },
	--   keys = {
	--     {
	--       "<leader>gwa",
	--       "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
	--       desc = "[g]it [w]orktree [a]dd",
	--     },
	--     {
	--       "<leader>gws",
	--       "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
	--       desc = "[g]it [w]orktree [s]witch",
	--     },
	--   },
	-- },
}
-- vim: ts=2 sts=2 sw=2 et
