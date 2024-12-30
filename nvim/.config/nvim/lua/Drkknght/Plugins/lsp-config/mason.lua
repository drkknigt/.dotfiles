-- setup mason and install lsp servers
M = {}

M.mason_setup = function(servers)
	local ok, lsp_installer = pcall(require, "mason")
	local ok_2, mason_config = pcall(require, "mason-lspconfig")

	lsp_installer.setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})

	mason_config.setup({ ensure_installed = servers, automatic_installation = true })
end
return M
