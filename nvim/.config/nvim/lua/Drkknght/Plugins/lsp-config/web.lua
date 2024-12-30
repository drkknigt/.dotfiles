M = {}

-- typescript

M.typescript = function(capabilities, on_attach)
	require("lspconfig").ts_ls.setup({
		root_dir = require("lspconfig").util.root_pattern("package.json"),
		on_attach = on_attach,
		flags = { debounce_text_changes = 150 },
		capabilities = capabilities,
	})
end

-- html
M.html = function(capabilities, on_attach)
	require("lspconfig").html.setup({
		root_dir = require("lspconfig").util.root_pattern("package.json"),
		on_attach = on_attach,
		flags = { debounce_text_changes = 150 },
		capabilities = capabilities,
	})
end

-- emmet
M.emmet = function(capabilities, on_attach)
	require("lspconfig").emmet_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
		root_dir = require("lspconfig").util.root_pattern("package.json"),
		flags = { debounce_text_changes = 150 },
		init_options = {
			html = {
				options = {
					-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
					["bem.enabled"] = true,
				},
			},
		},
	})
end

-- emmet
M.cssls = function(capabilities, on_attach)
	require("lspconfig").cssls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		flags = { debounce_text_changes = 150 },
	})
end

return M
