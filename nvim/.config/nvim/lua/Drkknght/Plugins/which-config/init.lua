------------------------------------ which-key ------------------------------------------

-- setup which key
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

-- whcich key opts
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
	operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	motions = {
		count = true,
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
		zindex = 1000,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^call", "^lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	show_keys = true, -- show currently pressed key and its label
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	-- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
	triggers_nowait = {
		-- marks
		"`",
		"'",
		"g`",
		"g'",
		-- registers
		'"',
		"<c-r>",
		-- spelling
		"z=",
	},
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
	disable = {
		buftypes = { "nofile" },
		filetypes = {},
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
	["a"] = { "<cmd>:ISwap<cr>", "swap variables in list or array or tables" }, -- swap variables in list or array
	["e"] = { require("Drkknght.core.userFunctions").toggle_oil, "Explorer" }, -- open file explorer
	["r"] = { "<cmd>Jaq<cr>", "run code" }, -- run code

	["o"] = {
		"<cmd>lua require('telescope.builtin').buffers({ layout_strategy = 'vertical', layout_config = { width = 0.4, height = 0.5, anchor = 'SE' }, })<cr>",
		"search Buffers",
	},

	-- ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },,

	-- lazy-nvim
	p = {
		name = "Lazy-nvim",
		z = {
			"<cmd>n ~/.config/nvim/lua/Drkknght/core/lazy-nvim/plugins.lua<cr>",
			"open plugin configs",
		},
		s = { "<cmd>luafile %<cr>", "source lua file" },
		i = { "<cmd>Lazy install<cr>", "Lazy run install clean and update" },
		u = { "<cmd>Lazy update<cr>", "Lazy Update" },
		c = { "<cmd>Lazy clean<cr>", "Lazy-clean" },
		p = { "<cmd>Lazy home<cr>", "open lazy-nvim" },
		t = { "<cmd>StartupTime<cr>", "see startuptime for neovim" },
		r = { require("Drkknght.core.userFunctions").backup_lazy, "backup lazy lock and restore lazy" },
	},

	-- git
	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		w = { "<cmd>lua require 'gitsigns'.setqflist('all')<cr>", "list all changes in the current repo" },
		a = { "<cmd>lua require 'gitsigns'.setqflist()<cr>", "list all changes in the current file" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "list git-Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		f = { "<cmd>lua require 'gitsigns'.stage_buffer()<cr>", "Stage buffer" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		i = { "<cmd>Git<cr>", "see git status in telescope" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout and list git branch in telescope" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit in telescope" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"use git-Diff",
		},
		q = {
			require("Drkknght.core.userFunctions").open_git_telescope,
			"open directory in oil via telescope",
		},
	},

	-- quickfix list
	q = {
		name = "Lists",
		w = {
			":exe 'silent grep! <cword> %' | exe 'copen'<cr>",
			"find word under the cursor and list in quickfix list",
		},
		q = { "<cmd>copen<cr>", "Quickfix open" },
		e = { "<cmd>cclose<cr>", "Quickfix close" },
		l = { "<cmd>lopen<cr>", "LocationList open" },
		f = { "yiw<bar><cmd>FzfLua lines<cr><bar><ESC>pi", "see current word under cursor in fzf buffer" },
		o = { "<cmd>lclose<cr>", "LocationList close" },
	},

	-- lsp
	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = {
			"<cmd>lua vim.diagnostic.setloclist()<cr>",
			"list Document Diagnostics in quickfix list",
		},

		-- c = { "<cmd>Codeium Enable<cr>", "enable codeium" },
		-- b = { "<cmd>Codeium Disable<cr>", "disable codeium" },
		x = { "<cmd>silent !chmod +x %<cr>", "make current file executable" },
		w = {
			"<cmd>lua vim.diagnostic.setqflist()<cr>",
			"list Workspace Diagnostics in quickfix list",
		},
		-- f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "lsp Info" },
		I = { "<cmd>Mason<cr>", "Mason-Installer Info" },
		-- j = {
		-- "<cmd>lua vim.diagnostic.goto_next({scope='line',float={border='single'}})<CR>",
		-- "Next Diagnostic",
		-- },
		k = { "<cmd>pwd<cr>", "current directory name" },
		h = { "<cmd>cd $PROJECT_ROOT<cr>", "change director to root directory of tmux session" },
		-- },
		p = { "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", "goto-preview" },
		l = { "<cmd>LspStart<CR>", "Start lsp" },
		q = { "<cmd>LspStop<CR>", "Stop lsp" },
		r = { "<cmd>lua vim.lsp.buf.references()<cr>", "document references" },
		g = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "document implementation" },
		-- r = { "<cmd>Lspsaga rename<cr>", "Rename" },
		-- f = { "<cmd>Lspsaga lsp_finder<cr>", "lsp finder" },
		s = { "<cmd>lua vim.lsp.buf.document_symbol()<cr>", "list Document Symbols in quickfix list" },
		e = {
			"<cmd>lua vim.diagnostic.open_float(0,{scope='line',border='single'})<cr>",
			"list document errors in quickfix list",
		},
		S = { "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", "list workspace Symbols in quickfix list" },
		u = { "<cmd>UndotreeToggle<cr>", "show undo tree log" },
		-- S = {
		--   "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
		--   "Workspace Symbols",
		-- },
	},

	-- Telescope
	s = {
		name = "Search",
		t = { "<cmd>Telescope lsp_document_symbols<cr>", "Symbols outline" },
		m = { "<cmd>Telescope help_tags<cr>", "Symbols outline" },
		-- d = { "<cmd>Telescope file_browser<cr>", "File Browser" },
		d = {
			require("Drkknght.core.userFunctions").open_dir_telescope,
			"open directory in oil via telescope",
		},
		-- h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		-- m = { "<cmd>Telescope help_tags<cr>", "help pages" },
		o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		f = { "<cmd>Telescope find_files<cr>", "find files" },
		-- R = { "<cmd>Telescope registers<cr>", "Registers" },
		R = { "<cmd>Telescope resume<cr>", "Resume" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		c = { "<cmd>Telescope commands<cr>", "Commands" },
		-- P = { '<cmd>lua require("telescope").extensions.project.project{display_type = "full"}<cr>', "Projects" },
		p = {
			"<cmd>lua require'telescope.builtin'.find_files({cwd = '$PROJECT_ROOT',hidden=true})<cr>",
			"Search files from Tmux project root",
		},
		g = {
			"<cmd>lua require'telescope.builtin'.live_grep({cwd = '$PROJECT_ROOT',hidden=true})<cr>",
			"live grep from Tmux project root",
		},
		r = {
			"<cmd>lua require'telescope'.extensions.file_browser.file_browser({files=true,grouped=true,depth=1,hidden=true,cwd = '$PROJECT_ROOT'})<cr>",
			"Open tmux project root directory",
		},
		q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
		i = { "<cmd>Telescope bookmarks<cr>", "Bookmarks" },
		-- b = { "<cmd>Telescope buffers<cr>", "Buffers" },
		e = {
			"<cmd>lua require'telescope'.extensions.file_browser.file_browser({files=true,grouped=true,depth=1,hidden=true})<cr>",
			"file-browser-current",
		},
		s = { "<cmd>Telescope live_grep<cr>", "Grep" },
		E = { "<cmd>Telescope env<cr>", "Env" },
		l = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer lines" },
		h = { require("Drkknght.core.userFunctions").search_dotfiles, "search dotfiles" },
		a = { require("Drkknght.core.userFunctions").search_ansible, "search ansible-sync" },
		-- d = {"<cmd>lua require('plugins/telescope-config').search_dir()<cr>","dotfiles"},
	},

	-- fzf
	f = {
		name = "fzf",
		f = { "<cmd>FzfLua files<cr>", "find files fzf" },
		t = { "<cmd>FzfLua lsp_document_symbols<cr>", "show lsp symbols in fzf" },
		o = { "<cmd>FzfLua oldfiles<cr>", "find old files fzf" },
		R = { "<cmd>FzfLua resume<cr>", "resume fzflua" },
		k = { "<cmd>FzfLua keymaps<cr>", "show keymaps in fzflua" },
		d = { require("Drkknght.core.userFunctions").open_dir_fzf, "open directory via fzf in oil" },
		g = { "<cmd>FzfLua git_files<cr>", "find git files" },
		m = { "<cmd>FzfLua helptags<cr>", "find git files" },
		s = { "<cmd>FzfLua live_grep<cr>", "grep fzf" },
		c = { "<cmd>FzfLua colorschemes<cr>", "colorschemes" },
		b = { "<cmd>FzfLua blines<cr>", "fzf lines buffers" },
		l = { "<cmd>FzfLua lines<cr>", "fzf lines search on all buffers" },
		r = { "<cmd>FzfLua resume<cr>", "fzf resume" },
		h = { require("Drkknght.core.userFunctions").open_dotfiles_fzf, "find files fzf from dotfiles directory" },
		a = { require("Drkknght.core.userFunctions").open_ansible_fzf, "find files fzf from dotfiles directory" },
		e = { ":lua require('fzf-lua').files({cwd = '~'})<CR>", "find files fzf from home directory" },
		w = { "yiw<bar><cmd>FzfLua blines<cr><bar><ESC>pi", "paste" },
	},

	-- Terminal
	t = {
		name = "Terminal",
		n = { ":lua _NODE_TOGGLE()<cr>", "Node terminal" },
		m = { ":lua _GLOW()<cr>", "Glow" },
		u = { ":lua _NCDU_TOGGLE()<cr>", "NCDU terminal" },
		t = { ":lua _HTOP_TOGGLE()<cr>", "Htop terminal" },
		p = { ":lua _PYTHON_TOGGLE()<cr>", "Python terminal" },
		g = { ":lua _LAZYGIT_TOGGLE()<cr>", "Lazygit terminal" },
		l = { ":lua _LUA_TOGGLE()<cr>", "Lua terminal" },
		f = { ":lua _FLOAT()<cr>", "Float terminal" },
		h = { ":lua _HORIZONTAL()<cr>", "Horizontal terminal" },
		v = { ":lua _VERTICAL()<cr>", "Vertical terminal" },
	},

	--debugger
	x = {
		name = "debbuger",
		x = { ":lua require('dapui').toggle()<cr>", "toggle dap ui " },
		c = { ":lua require('dap').continue()<cr>", "continue dap " },
		b = { ":lua require('dap').toggle_breakpoint()<cr>", "toggle breakpoint" },
		r = { ":lua require('dap').open({reset = true})<cr>", "reset dap" },
		s = { ":lua require('dap').repl.open()<cr>", "open repl" },
		o = { ":lua require('dap').step_over()<cr>", "step over" },
		i = { ":lua require('dap').step_into()<cr>", "step into" },
		a = { ":lua require('dap').step_out()<cr>", "step outside" },
	},
}

-- call which key
which_key.setup(setup)
which_key.register(mappings, opts)
