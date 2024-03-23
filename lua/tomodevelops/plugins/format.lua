return {
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.phpcsfixer,
                    null_ls.builtins.diagnostics.eslint,
                    null_ls.builtins.diagnostics.phpcs,
                },
                vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {}),
                --[[
                -- format on save
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {

							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ async = false })
							end,
						})
					end
				end,
                ]]
                --
            })
        end,
    },
}
