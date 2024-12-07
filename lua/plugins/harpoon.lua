-- https://github.com/ThePrimeagen/harpoon/tree/harpoon2

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "[h]arpoon [a]dd" })

		vim.keymap.set("n", "<leader>hl", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "[h]arpoon [l]ist" })

		require("which-key").add({
			{ "<leader>h", group = "[h]arpoon" },
		})
	end,
}
