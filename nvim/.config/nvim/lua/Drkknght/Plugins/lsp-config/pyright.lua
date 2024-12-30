M = {}
M.pyright = function(capabilities, on_attach)
	require("lspconfig").pyright.setup({
		settings = {
			python = {
				analysis = {
					autoSearchPaths = false,
					diagnosticMode = "openFilesOnly",
					useLibraryCodeForTypes = true,
					typeCheckingMode = "strict",
					-- loglevel = { "Error" },
					extraPaths = { "$HOME/.local/lib/python3.10/site-packages/" },
				},
			},
		},
		single_file_support = true,
		on_attach = on_attach,
		flags = { debounce_text_changes = 500 },
		capabilities = capabilities,
	})
end
return M
