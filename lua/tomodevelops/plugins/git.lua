return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
            vim.keymap.set("n", "<leader>gd", ":Git diff<CR>", {})
            vim.keymap.set("n", "<leader>ga", ":Git add .<CR>", {})
            vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", {})
            vim.keymap.set("n", "<leader>gp", ":Git push<CR>", {})
            vim.keymap.set("n", "<leader>gg", ":Git pull<CR>", {})
		end,
	},
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
            vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
        end,
    }
}
