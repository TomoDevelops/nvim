return {
	--[[ {
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
                transparent = true,
                italic_comments = true,
                hide_fillchars = true,
                borderless_telescope = true,
			})
			vim.cmd("colorscheme cyberdream")
		end,
	} ,]]
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
		config = function()
			require("catppuccin").setup({
                flavour = "macchiato",
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    harpoon = true,
                    treesitter = true,
                    mason = true
                }
			})
			vim.cmd("colorscheme catppuccin")
		end,
    },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin",
				},
			})
		end,
	},
}
