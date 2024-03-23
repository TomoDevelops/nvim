return {
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
                transparent = true,
                italic_comments = true,
                hide_fillchars = true,
                borderless_telescope = true,
                --[[
                ]]
				--
			})
			vim.cmd("colorscheme cyberdream")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local cyberdream = require("lualine.themes.cyberdream")
			require("lualine").setup({
				options = {
					theme = cyberdream,
				},
			})
		end,
	},
}
