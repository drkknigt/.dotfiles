local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
local servers = {
	"emmet_ls",
	"html",
	"pyright",
	"jedi_language_server",
	"clangd",
	"cssls",
	"tsserver",
	"vimls",
	"sumneko_lua",
	"bashls",
	"yamlls",
}
lsp_installer.setup({
	automatic_installation = true,
	ensure_installed = servers,
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})
local nvim_lsp = require("lspconfig")
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
	signs = true,
	underline = false,
	show_diagnostic_autocmds = { "BufWritePost" },
}, vim.lsp.handlers.hover, { focusable = false })
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "double",
})

vim.cmd([[ 
    sign define DiagnosticSignError text=✖ linehl= texthl=DiagnosticSignError numhl=
    sign define DiagnosticSignWarn text=☢ linehl= texthl=DiagnosticSignWarn numhl=
    sign define DiagnosticSignInfo text= linehl= texthl=DiagnosticSignInfo numhl=
    sign define DiagnosticSignHint text= linehl= texthl=DiagnosticSignHint numhl=
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

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer

pcall(require, "modules.lsp.handlers")
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
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
	buf_set_keymap("n", "Z", '<cmd>lua vim.lsp.buf.signature_help({border = "double"})<CR>', opts)
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
	local server_table = { ["tsserver"] = 1, ["pyright"] = 1, ["html"] = 1, ["sumneko_lua"] = 1 }
	-- vim.lsp.buf.formatting() -- asynchronous formatting
	-- vim.lsp.buf.formatting_sync() -- synchronous formatting, bet,oter to avoid desync problems
	-- vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
	if server_table[client.name] ~= nil then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.document_range_formatting = false
	else
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
	end

	if client.name == "pyright" then
		client.server_capabilities.hoverProvider = false
		client.server_capabilities.signatureHelpProvider = false
		client.server_capabilities.completionProvider = false
		client.server_capabilities.definitionProvider = false
	end
	--- In lsp attach function
	vim.diagnostic.config({
		virtual_text = false,
		severity_sort = true,
		underline = false,
	})
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Provide settings first!
-- emmet_ls
require("lspconfig/configs").emmet_ls = {
	default_config = {
		cmd = { "emmet_ls", "--stdio" },
		filetypes = { "html", "css" }, -- Add the languages you use, see language support
		root_dir = function(_)
			return vim.loop.cwd()
		end,
		settings = {},
	},
}

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
-- local runtime_path = vim.split(package.path, ";")
-- lsp_settings["sumneko_lua"] = {
-- 	lua = {
--         cmd = {"lua-language-server"},
-- 		runtime = {
-- 			version = "Lua 5.3",
-- 			path = runtime_path,
-- 		},
-- 		diagnostics = {
-- 			-- Get the language server to recognize the `vim` global
-- 			enable = true,
-- 			globals = { "vim", "print" },
-- 		},
-- 		workspace = {
-- 			maxPreload = 0,
-- 			preloadFileSize = 0,
-- 		},
-- 	},
-- }

-- local runtime_path = vim.split(package.path, ";")
-- 	Lua = {
-- lsp_settings["sumneko_lua"] = {
-- 		completion = { enable = false, callSnippet = "Both" },
-- 		runtime = {
-- 			--   -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
-- 			version = "Lua 5.3",
-- 			path = runtime_path,
-- 			--   -- Setup your lua path
-- 			-- path = {
-- 			-- 	"?.lua",
-- 			-- 	"?/init.lua",
-- 			-- 	vim.fn.expand("~/.luarocks/share/lua/5.3/?.lua"),
-- 			-- 	vim.fn.expand("~/.luarocks/share/lua/5.3/?/init.lua"),
-- 			-- 	"/usr/share/5.3/?.lua",
-- 			-- 	"/usr/share/lua/5.3/?/init.lua",
-- 			-- },
-- 		},
-- 		diagnostics = {
-- 			-- Get the language server to recognize the `vim` global
-- 			globals = { "vim" },
-- 		},
-- 		workspace = {
-- 			-- Make the server aware of Neovim runtime files
-- 			library = {
-- 				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
-- 				[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
-- 				[vim.fn.stdpath("config") .. "/lua"] = true,
-- 			},
-- 			maxPreload = 10000,
-- 		},
-- 		-- Do not send telemetry data containing a randomized but unique identifier
-- 		telemetry = {
-- 			enable = false,
-- 		},
-- 	},

current_wd = vim.fn.getcwd()
if current_wd == vim.fn.expand("~") then
	current_wd = "nil"
end
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
-- table.insert(runtime_path, current_wd)
require("lspconfig").sumneko_lua.setup({
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
			telemetry = {
				enable = false,
			},
		},
	},

	-- flags = {
	-- 	debounce_text_changes = 150,
	-- },

	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
	},
	capabilities = capabilities,
})

-- local lsp_installer = require("nvim-lsp-installer")
-- lsp_installer.on_server_ready(function(server)
--     local opts = {
--         --settings = lsp_settings[server.name],
--         settings = lsp_settings[server.name],
--         on_attach = on_attach,
--
--         flags = {
--             debounce_text_changes = 250,
--         },
--         capabilities = capabilities,
--     }
--
--     server:setup(opts)
-- end)
for _, lsp in pairs(servers) do
	if lsp ~= "sumneko_lua" then
		require("lspconfig")[lsp].setup({
			settings = lsp_settings[lsp],
			on_attach = on_attach,
			flags = {
				debounce_text_changes = 150,
			},
			capabilities = capabilities,
		})
	end
end

local status_ok, signature = pcall(require, "lsp_signature")
if not status_ok then
	return
end

local cfg = {
	debug = false, -- set to true to enable debug logging
	log_path = "debug_log_file_path", -- debug log path
	verbose = false, -- show debug line number

	bind = true, -- This is mandatory, otherwise border config won't get registered.
	-- If you want to hook lspsaga or other signature handler, pls set to false
	doc_lines = 5, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
	-- set to 0 if you DO NOT want any API comments be shown
	-- This setting only take effect in insert mode, it does not affect signature help in normal
	-- mode, 10 by default

	floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
	floating_window_above_cur_line = false, -- try to place the floating above the current line when possible Note:
	-- will set to true when fully tested, set to false will use whichever side has more space
	-- this setting will be helpful if you do not want the PUM and floating win overlap
	fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
	hint_enable = false, -- virtual hint enable
	hint_prefix = "  ", -- Panda for parameter
	hint_scheme = "Comment",
	use_lspsaga = true, -- set to true if you want to use lspsaga popup
	hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
	max_height = 7, -- max height of signature floating_window, if content is more than max_height, you can scroll down
	-- to view the hiding contents
	max_width = 52, -- max_width of signature floating_window, line will be wrapped if exceed max_width
	handler_opts = {
		border = "rounded", -- double, rounded, single, shadow, none
	},

	always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

	auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
	extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
	-- zindex = 50, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

	padding = " ", -- character to pad on left and right of signature can be ' ', or '|'  etc

	transparency = nil, -- disabled by default, allow floating win transparent value 1~100
	shadow_blend = 36, -- if you using shadow as border use this set the opacity
	shadow_guibg = "Black", -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
	timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
	toggle_key = "<C-y>", -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
}

-- recommanded:
signature.setup(cfg) -- no need to specify bufnr if you don't use toggle_key
local ok, var = pcall(vim.api.nvim_command, "e!")
-- You can also do this inside lsp on_attach
-- note: on_attach deprecated
-- require("lsp_signature").on_attach(cfg, bufnr) -- no need to specify bufnr if you don't use toggle_key
-- signature.on_attach(cfg) -- no need to specify bufnr if you don't use toggle_key
