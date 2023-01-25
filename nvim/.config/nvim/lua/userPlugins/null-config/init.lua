local null_ls = require("null-ls")
sources = {
	null_ls.builtins.formatting.black.with({ extra_args = { "--fast", "--skip-string-normalization" } }),
	null_ls.builtins.diagnostics.flake8,
	-- null_ls.builtins.diagnostics.mypy,
	null_ls.builtins.formatting.isort,
	require("userPlugins.null-config.builtins.formatting.jsbeautify"),
	null_ls.builtins.diagnostics.eslint_d,
	null_ls.builtins.diagnostics.shellcheck,
	null_ls.builtins.code_actions.shellcheck,
	null_ls.builtins.formatting.prettierd,
	null_ls.builtins.diagnostics.luacheck,
	null_ls.builtins.formatting.stylua,
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

null_ls.setup({
	on_attach = function()
		vim.cmd([[ autocmd BufWritePre <buffer> lua vim.lsp.buf.format() ]])
	end,
	sources = sources,
	debug = false,
	debounce = 150,
})
