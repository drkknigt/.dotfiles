--------------------------------------------- null-ls -------------------------------------------

local null_ls = require("null-ls")

-- sources for diagnostics and formatting
sources = {
	null_ls.builtins.formatting.black.with({ extra_args = { "--fast", "--skip-string-normalization" } }),
	null_ls.builtins.diagnostics.flake8.with({
		method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
	}),
	-- null_ls.builtins.diagnostics.mypy,
	null_ls.builtins.formatting.isort,
	-- require("Plugins.null-config.builtins.formatting.jsbeautify"),
	-- null_ls.builtins.diagnostics.eslint_d.with({
	-- 	method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
	-- }),
	null_ls.builtins.diagnostics.shellcheck.with({
		method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
	}),
	null_ls.builtins.code_actions.shellcheck,
	null_ls.builtins.formatting.prettierd,
	null_ls.builtins.diagnostics.luacheck.with({
		method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
	}),
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.gofmt,
	null_ls.builtins.formatting.goimports,
	null_ls.builtins.formatting.golines,
	-- null_ls.builtins.code_actions.gitsigns,
	-- null_ls.builtins.formatting.clang_format,
	-- null_ls.builtins.diagnostics.pylint.with({
	--     filetypes = {"python"},
	--     command = "pylint",
	--     args = {"--from-stdin","$FILENAME","-f","json"},
	-- }),
}

-- require("lspconfig")["null-ls"].setup({
-- 	on_attach = function()
-- 		vim.cmd([[ autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting() ]])
-- 	end,
-- })
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
	sources = sources,
	debug = false,
	debounce = 3950,
})
