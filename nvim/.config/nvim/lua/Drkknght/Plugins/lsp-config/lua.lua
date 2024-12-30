-- lua_ls setup
M = {}

current_wd = vim.fn.getcwd()
if current_wd == vim.fn.expand("~") then
	current_wd = "nil"
end
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
-- table.insert(runtime_path, current_wd)
M.lua_ls = function(capabilities, on_attach)
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
end
return M
