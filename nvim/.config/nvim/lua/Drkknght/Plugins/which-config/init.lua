------------------------------------ which-key ------------------------------------------

-- setup which key
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

-- whcich key opts
local setup = {
	preset = "modern",
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	win = {
		-- don't allow the popup to overlap with the cursor
		no_overlap = true,
		-- width = 1,
		-- height = { min = 4, max = 25 },
		-- col = 0,
		-- row = math.huge,
		-- border = "none",
		padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
		title = true,
		title_pos = "center",
		zindex = 1000,
		-- Additional vim.wo and vim.bo options
		bo = {},
		wo = {
			-- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
		},
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	show_help = true, -- show help message on the command line when the popup is visible
	show_keys = true, -- show currently pressed key and its label
	triggers = { { "<auto>", mode = "nxsot" } }, -- automatic triggers setup
	-- triggers = {"<leader>"} -- or specify a list manually
	-- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
	disable = {
		bt = {},
		ft = {},
	},
}

local opts = {
	mode = "c",
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

-- which key mappings
local mappings = {
	-- miscillaneous mappings
	require("Drkknght.Plugins.which-config.misc-mappings"),

	-- lazy package manager mappings
	require("Drkknght.Plugins.which-config.lazy-mappings"),

	-- git mappings
	require("Drkknght.Plugins.which-config.git-mappings"),

	-- quickfix mappings
	require("Drkknght.Plugins.which-config.quickfix-mappings"),

	-- lsp mappings
	require("Drkknght.Plugins.which-config.lsp-mappings"),

	-- telescope mappings
	require("Drkknght.Plugins.which-config.telescope-mappings"),

	-- fzf mappings
	require("Drkknght.Plugins.which-config.fzf-mappings"),

	-- terminal mappings
	require("Drkknght.Plugins.which-config.terminal-mappings"),

	-- debugging mappings
	require("Drkknght.Plugins.which-config.debugger-mappings"),

	-- buffer mappings
	require("Drkknght.Plugins.which-config.buffer-mappings"),
}

-- call which key
which_key.setup(setup)
which_key.add(mappings)
