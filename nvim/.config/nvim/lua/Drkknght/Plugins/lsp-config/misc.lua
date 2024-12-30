M = {}
M.ansible = function(capabilities, on_attach)
	require("lspconfig").ansiblels.setup({

		settings = {
			ansible = {
				ansible = {
					path = "ansible",
				},
				executionEnvironment = {
					enabled = false,
				},
				python = {
					interpreterPath = "python",
				},
				validation = {
					enabled = true,
					lint = {
						enabled = true,
						path = "ansible-lint",
					},
				},
			},
		},
		single_file_support = true,
		capabilities = capabilities,
		on_attach = on_attach,
		flags = { debounce_text_changes = 150 },
	})
end

M.vimls = function(capabilities, on_attach)
	require("lspconfig").vimls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		flags = { debounce_text_changes = 150 },
	})
end

M.bashls = function(capabilities, on_attach)
	require("lspconfig").bashls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		flags = { debounce_text_changes = 150 },
	})
end

M.yamlls = function(capabilities, on_attach)
	require("lspconfig").yamlls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		flags = { debounce_text_changes = 150 },
	})
end

return M
