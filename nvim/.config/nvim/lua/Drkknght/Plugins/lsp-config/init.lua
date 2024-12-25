--------------------------------------------- lsp-config ----------------------------------------

-- setup mason and install lsp servers
local ok, lsp_installer = pcall(require, "mason")
local servers = {
	"emmet_ls",
	"html", -- "pyright",
	-- "jedi_language_server",
	"pyright",
	"clangd",
	"cssls",
	"ts_ls",
	"ansiblels",
	"vimls",
	"lua_ls",
	"bashls",
	"gopls",
	"yamlls",
}
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

-- setup lsp-config

local nvim_lsp = require("lspconfig")
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
	signs = true,
	underline = false,
	show_diagnostic_autocmds = { "BufWritePost" },
}, vim.lsp.handlers.hover, { focusable = false })
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "double" })

vim.cmd([[ 
    sign define DiagnosticSignError text=✖ linehl= texthl=DiagnosticSignError numhl=
    sign define DiagnosticSignWarn text=☢ linehl= texthl=DiagnosticSignWarn numhl=
    sign define DiagnosticSignInfo text= linehl= texthl=DiagnosticSignInfo numhl=
    sign define DiagnosticSignHint text= linehl= texthl=DiagnosticSignHint numhl=
]])

local function documentHighlight(client, bufnr)
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

local lsp_config = require("lspconfig")
function lsp_config.common_on_attach(client, bufnr)
	documentHighlight(client, bufnr)
end

pcall(require, "modules.lsp.handlers")

local on_attach = function(client, bufnr)
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
	-- vim.lsp.buf.formatting() -- asynchronous formatting
	-- vim.lsp.buf.formatting_sync() -- synchronous formatting, bet,oter to avoid desync problems
	-- vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
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

capabilities = require("cmp_nvim_lsp").default_capabilities()

-- LSP Server specific settings

local lsp_settings = {}
lsp_settings["pyright"] = {
	python = {
		analysis = {
			autoSearchPaths = true,
			useLibraryCodeForTypes = true,
			typeCheckingMode = "basic",
			loglevel = { "Error", "Warning", "Information", "Trace" },
		},
	},
}
lsp_settings["html"] = {
	root_dir = require("lspconfig").util.root_pattern("package.json"),
}

nvim_lsp.emmet_ls.setup({
	-- on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
	root_dir = require("lspconfig").util.root_pattern("package.json"),
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	},
})

-- lua_ls setup
current_wd = vim.fn.getcwd()
if current_wd == vim.fn.expand("~") then
	current_wd = "nil"
end
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
-- table.insert(runtime_path, current_wd)
require("lspconfig").lua_ls.setup({
	-- cmd = { "lua-language-server" },
	-- root_dir = root_pattern(".luarc.json", ".git", "init.lua"),
	root_dir = function(fname)
		return require("lspconfig").util.root_pattern(".git")(fname)
	end,
	single_file_support = true,
	settings = {
		-- cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
		Lua = {
			completion = { enable = true, callSnippet = "Replace" },
			runtime = {
				--   -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				--   -- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			hint = { enable = true },
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim")] = true,
					-- [vim.fn.stdpath("config") .. "/lua"] = true,
					-- [vim.fn.expand("~/bin")] = true,
					[current_wd] = true,
				},
				maxPreload = 1000,
				preloadFileSize = 150,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = { enable = false },
		},
	},

	-- flags = {
	-- 	debounce_text_changes = 150,
	-- },

	on_attach = on_attach,
	flags = { debounce_text_changes = 150 },
	capabilities = capabilities,
})

for _, lsp in pairs(servers) do
	if lsp ~= "lua_ls" and lsp ~= "emmet_ls" then
		require("lspconfig")[lsp].setup({
			settings = lsp_settings[lsp],
			on_attach = on_attach,
			flags = { debounce_text_changes = 150 },
			capabilities = capabilities,
		})
	end
end
require("lspconfig").ts_ls.setup({
	root_dir = require("lspconfig").util.root_pattern("package.json"),
	on_attach = on_attach,
	flags = { debounce_text_changes = 150 },
	capabilities = capabilities,
})
require("lspconfig").html.setup({
	root_dir = require("lspconfig").util.root_pattern("package.json"),
	on_attach = on_attach,
	flags = { debounce_text_changes = 150 },
	capabilities = capabilities,
})

home_dir = vim.fn.expand("~")
extraPathsPython = home_dir .. "/.local/lib/python3.10/site-packages/"

-- require("lspconfig").jedi_language_server.setup({
-- 	init_options = {
-- 		workspace = {
-- 			extraPaths = { extraPathsPython },
-- 			symbols = {
-- 				ignoreFolders = { "__pycache__", ".pytest_cache" },
-- 			},
-- 		},
-- 	},
-- 	root_dir = require("lspconfig").util.root_pattern("package.json"),
-- 	single_file_support = true,
-- 	on_attach = on_attach,
-- 	flags = { debounce_text_changes = 150 },
-- 	capabilities = capabilities,
-- })
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
})

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
