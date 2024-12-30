M = {}
M.clangd = function(capabilities, on_attach)
	require("lspconfig").clangd.setup({
		on_attach = on_attach,
		flags = { debounce_text_changes = 150 },
		capabilities = capabilities,
	})
end
return M
