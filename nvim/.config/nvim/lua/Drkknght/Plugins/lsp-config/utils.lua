M = {}

M.attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", '<cmd>lua require("navigator.definition").definition_preview()<CR>', opts)
	--  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	-- buf_set_keymap('n', 'Dk', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	-- buf_set_keymap('n', '<leader>l', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
	-- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap("n", "K", '<cmd>lua vim.lsp.buf.hover({border = "single"})<CR>', opts)
	-- buf_set_keymap("n", "Z", '<cmd>lua vim.lsp.buf.signature_help({border = "double"})<CR>', opts)
	-- buf_set_keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
	-- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	-- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	-- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	-- buf_set_keymap('n', 'gA', '<cmd>lua require"lspsaga.provider".lsp_finder()<CR>', opts)
	-- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({scope="line",float={border="single"}})<CR>', opts)
	buf_set_keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({scope="line",float={border="single"}})<CR>', opts)
	-- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	local server_table = {
		["ts_ls"] = 1,
		["pyright"] = 1,
		["html"] = 1,
		["lua_ls"] = 1,
		["bashls"] = 1,
		["yamlls"] = 1,
	}
	if server_table[client.name] ~= nil then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.document_range_formatting = false
	else
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
	end

	-- if client.name == "pyright" then
	-- 	client.server_capabilities.hoverProvider = false
	-- 	client.server_capabilities.signatureHelpProvider = false
	-- 	client.server_capabilities.completionProvider = false
	-- 	client.server_capabilities.definitionProvider = false
	-- end
	if client.name == "jedi_language_server" then
		client.server_capabilities.codeActionProvider = false
	end

	--- In lsp attach function
	vim.diagnostic.config({
		virtual_text = false,
		severity_sort = true,
		underline = false,
	})
end

M.set_handlers = function()
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = true,
		show_diagnostic_autocmds = { "BufWritePost" },
	}, vim.lsp.handlers.hover, { focusable = false })
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "double" })

	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signature_help, { border = "double" })
end

M.documentHighlight = function(client, bufnr)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_exec(
			[[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        audocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()
      augroup END
    ]],
			false
		)
	end
end

return M
