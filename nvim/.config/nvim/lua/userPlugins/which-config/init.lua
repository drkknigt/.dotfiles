local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
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
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
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

local mappings = {
	["a"] = { "<cmd>:ISwap<cr>", "swap" },
	["w"] = { "<cmd>w<cr>", "save file" },
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	-- ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },

	p = {
		name = "Lazy-nvim",
		z = { "<cmd>e ~/.config/nvim/lua/lazy-nvim/init.lua<cr>", "Install" },
		s = { "<cmd>luafile %<cr>", "source lua file" },
		i = { "<cmd>Lazy install<cr>", "Lazy run install clean and update" },
		u = { "<cmd>Lazy update<cr>", "Lazy Update" },
		c = { "<cmd>Lazy clean<cr>", "Lazy-clean" },
		p = { "<cmd>Lazy home<cr>", "open lazy-nvim" },
	},

	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		a = { "<cmd>lua require 'gitsigns'.setqflist()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
	},
	q = {
		name = "Lists",
		w = {
			":exe 'silent grep! <cword> %' | exe 'copen'<cr>",
			"find word under the cursor",
		},
		q = { "<cmd>copen<cr>", "Quickfix open" },
		e = { "<cmd>cclose<cr>", "Quickfix close" },
		l = { "<cmd>lopen<cr>", "LocationList open" },
		f = { "yiw<bar><cmd>FzfLua lines<cr><bar><ESC>pi", "LocationList open" },
		o = { "<cmd>lclose<cr>", "LocationList close" },
	},
	-- k = {
	--     name = "session",
	--     l = {"<cmd>SessionManager load_last_session<cr>","load last session"},
	--     a = {"<cmd>SessionManager load_session<cr>","load sessions"},
	--     d = {"<cmd>SessionManager delete_session<cr>","delete session"},
	--     s = {"<cmd>SessionManager save_current_session<cr>","save session"},
	-- },
	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = {
			"<cmd>lua vim.diagnostic.setloclist()<cr>",
			"Document Diagnostics",
		},

		c = { "<cmd>Codeium Enable<cr>", "enable codeium" },
		b = { "<cmd>Codeium Disable<cr>", "disable codeium" },
		x = { "<cmd>!chmod +x %<cr>", "make current file executable" },
		w = {
			"<cmd>lua vim.diagnostic.setqflist()<cr>",
			"Workspace Diagnostics",
		},
		-- f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>Mason<cr>", "Installer Info" },
		j = {
			"<cmd>lua vim.diagnostic.goto_next({scope='line',float={border='single'}})<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.diagnostic.goto_prev({scope='line',float={border='single'}})<cr>",
			"Prev Diagnostic",
		},
		p = { "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", "goto-preview" },
		f = { "<cmd>LspStart<CR>", "goto last open file" },
		l = { "<cmd>lua vim.lsp.buf.references()<cr>", "document references" },
		-- r = { "<cmd>Lspsaga rename<cr>", "Rename" },
		q = { "<cmd>Lspsaga lsp_finder<cr>", "lsp finder" },
		s = { "<cmd>lua vim.lsp.buf.document_symbol()<cr>", "Document Symbols" },
		e = { "<cmd>lua vim.diagnostic.open_float(0,{scope='line',border='single'})<cr>", "document errors" },
		S = { "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", "Document Symbols" },
		-- S = {
		--   "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
		--   "Workspace Symbols",
		-- },
	},
	s = {
		name = "Search",
		t = { "<cmd>SymbolsOutline<cr>", "Symbols outline" },
		-- d = { "<cmd>Telescope file_browser<cr>", "File Browser" },
		d = {
			"<cmd>lua require'telescope'.extensions.file_browser.file_browser({cwd='$HOME'})<cr>",
			"file-browser-current",
		},
		-- h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		m = { "<cmd>Telescope help_tags<cr>", "help pages" },
		o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		f = { "<cmd>Telescope find_files<cr>", "find files" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		r = { "<cmd>Telescope resume<cr>", "Resume" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		c = { "<cmd>Telescope commands<cr>", "Commands" },
		p = { '<cmd>lua require("telescope").extensions.project.project{display_type = "full"}<cr>', "Projects" },
		q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
		i = { "<cmd>Telescope bookmarks<cr>", "Bookmarks" },
		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
		e = {
			"<cmd>lua require'telescope'.extensions.file_browser.file_browser({files=true,grouped=true,depth=1,hidden=true})<cr>",
			"file-browser-current",
		},
		s = { "<cmd>Telescope live_grep<cr>", "Grep" },
		E = { "<cmd>Telescope env<cr>", "Env" },
		l = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer lines" },
		h = { "<cmd>lua require('userPlugins/_telescope-setting').search_dotfiles()<cr>", "dotfiles" },
		-- d = {"<cmd>lua require('plugins/telescope-config').search_dir()<cr>","dotfiles"},
	},
	-- n = { "<cmd>lua require('userPlugins/_telescope-setting').search_nvim()<cr>", "nvim files" },
	f = {
		name = "fzf",
		f = { "<cmd>FzfLua files<cr>", "find files fzf" },
		s = { "<cmd>FzfLua live_grep<cr>", "grep fzf" },
		c = { "<cmd>FzfLua colorschemes<cr>", "colorschemes" },
		b = { "<cmd>FzfLua blines<cr>", "fzf lines buffers" },
		l = { "<cmd>FzfLua lines<cr>", "fzf lines" },
		r = { "<cmd>FzfLua resume<cr>", "fzf resume" },
		h = { ":lua require('fzf-lua').files({cwd = '~'})<CR>", "find files fzf" },
	},

	t = {
		name = "Terminal",
		n = { ":lua _NODE_TOGGLE()<cr>", "Node" },
		u = { ":lua _NCDU_TOGGLE()<cr>", "NCDU" },
		t = { ":lua _HTOP_TOGGLE()<cr>", "Htop" },
		p = { ":lua _PYTHON_TOGGLE()<cr>", "Python" },
		g = { ":lua _LAZYGIT_TOGGLE()<cr>", "Python" },
		l = { ":lua _LUA_TOGGLE()<cr>", "Python" },
		f = { ":ToggleTerm direction=float<cr>", "Float" },
		h = { ":ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { ":ToggleTerm size=60 direction=vertical<cr>", "Vertical" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
