M = {}

M.gopls = function(capabilities, on_attach)
	require("lspconfig").gopls.setup({
		root_dir = require("lspconfig").util.root_pattern("package.json", ".git", "go.work", "go.mod"),
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		on_attach = on_attach,
		flags = { debounce_text_changes = 150 },
		capabilities = capabilities,
		settings = {
			gopls = {
				completeUnimported = true,
				usePlaceholders = true,
				analyses = {
					unusedparams = true,
				},
			},
		},
	})
end

return M
