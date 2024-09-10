------------------------------------ which-key ------------------------------------------

-- setup which key
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

-- whcich key opts
local setup = {
	preset = "modern",
	delaty = 0,
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

	{ "<leader>a", "<cmd>:ISwap<cr>", desc = "swap variables in list or array or tables" }, -- swap variables in list or array,
	{ "<leader>e", require("Drkknght.core.userFunctions").toggle_oil, desc = "Explorer" }, -- open file explorer
	{ "<leader>r", "<cmd>Jaq<cr>", desc = "run code" }, -- run code

	{
		"<leader>o",
		"<cmd>lua require('telescope.builtin').buffers({ layout_strategy = 'vertical', layout_config = { width = 0.4, height = 0.5, anchor = 'SE' }, })<cr>",
		desc = "search Buffers",
	},

	-- 	-- ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },,

	-- lazy-nvim
	{

		{ "<leader>p", group = "lazy-nvim" },
		{
			"<leader>pz",
			"<cmd>n ~/.config/nvim/lua/Drkknght/core/lazy-nvim/plugins.lua<cr>",
			desc = "open plugin configs",
		},
		{ "<leader>ps", "<cmd>luafile %<cr>", desc = "source lua file" },
		{ "<leader>pi", "<cmd>Lazy install<cr>", desc = "Lazy run install clean and update" },
		{ "<leader>pu", "<cmd>Lazy update<cr>", desc = "Lazy Update" },
		{ "<leader>pc", "<cmd>Lazy clean<cr>", desc = "Lazy-clean" },
		{ "<leader>pp", "<cmd>Lazy home<cr>", desc = "open lazy-nvim" },
		{ "<leader>pt", "<cmd>StartupTime<cr>", desc = "see startuptime for neovim" },
		{
			"<leader>pd",
			"<cmd>BrowseSnapshots<cr>",
			desc = "change directory to snapshot directory for laz in nvim/snapshots ",
		},
		{
			"<leader>pr",
			require("Drkknght.core.userFunctions").backup_lazy,
			desc = "backup lazy lock and restore lazy",
		},
		-- },
	},

	--
	{
		-- git
		{ "<leader>g", group = "Git" },
		{ "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit" },
		{
			"<leader>gw",
			"<cmd>lua require 'gitsigns'.setqflist('all')<cr>",
			desc = "list all changes in the current repo",
		},
		{ "<leader>ga", "<cmd>lua require 'gitsigns'.setqflist()<cr>", desc = "list all changes in the current file" },
		{ "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "list git-Blame" },
		{ "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
		{ "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
		{ "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
		{ "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
		{ "<leader>gf", "<cmd>lua require 'gitsigns'.stage_buffer()<cr>", desc = "Stage buffer" },
		{ "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
		{ "<leader>gi", "<cmd>Git<cr>", desc = "see git status in telescope" },
		{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout and list git branch in telescope" },
		{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit in telescope" },
		{ "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "use git-Diff" },
		{
			"<leader>gq",
			require("Drkknght.core.userFunctions").open_git_telescope,
			desc = "open directory in oil via telescope",
		},
	},

	--
	{
		-- quickfix list

		{ "<leader>q", group = "Quicfix list" },
		{
			"<leader>qw",
			":exe 'silent grep! <cword> %' | exe 'copen'<cr>",
			desc = "find word under the cursor and list in quickfix list",
		},
		{ "<leader>qq", "<cmd>copen<cr>", desc = "Quickfix open" },
		{ "<leader>qe", "<cmd>cclose<cr>", desc = "Quickfix close" },
		{ "<leader>ql", "<cmd>lopen<cr>", desc = "LocationList open" },
		{
			"<leader>qf",
			"yiw<bar><cmd>FzfLua lines<cr><bar><ESC>pi",
			desc = "see current word under cursor in fzf buffer",
		},
		{ "<leader>qo", "<cmd>lclose<cr>", desc = "LocationList close" },
	},

	--
	{
		-- lsp
		{ "<leader>l", group = "lsp" },
		{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
		{
			"<leader>ld",
			"<cmd>lua vim.diagnostic.setloclist()<cr>",
			desc = "list Document Diagnostics in quickfix list",
		},
		-- c = { "<cmd>Codeium Enable<cr>", "enable codeium" },
		-- b = { "<cmd>Codeium Disable<cr>", "disable codeium" },
		{ "<leader>lx", "<cmd>silent !chmod +x %<cr>", desc = "make current file executable" },
		{
			"<leader>lw",
			"<cmd>lua vim.diagnostic.setqflist()<cr>",
			desc = "list Workspace Diagnostics in quickfix list",
		},
		-- f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		{ "<leader>li", "<cmd>LspInfo<cr>", desc = "lsp Info" },
		{ "<leader>lI", "<cmd>Mason<cr>", desc = "Mason-Installer Info" },
		-- j = {
		-- "<cmd>lua vim.diagnostic.goto_next({scope='line',float={border='single'}})<CR>",
		-- "Next Diagnostic",
		-- },
		{ "<leader>lk", "<cmd>pwd<cr>", desc = "current directory name" },
		{ "<leader>lh", "<cmd>cd $PROJECT_ROOT<cr>", desc = "change director to root directory of tmux session" },
		{ "<leader>lp", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", desc = "goto-preview" },
		{ "<leader>ll", "<cmd>LspStart<CR>", desc = "Start lsp" },
		{ "<leader>lq", "<cmd>LspStop<CR>", desc = "Stop lsp" },
		{ "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "document references" },
		{ "<leader>lg", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "document implementation" },
		-- r = { "<cmd>Lspsaga rename<cr>", "Rename" },
		-- f = { "<cmd>Lspsaga lsp_finder<cr>", "lsp finder" },
		{ "<leader>ls", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", desc = "list Document Symbols in quickfix list" },
		{
			"<leader>le",
			"<cmd>lua vim.diagnostic.open_float(0,{scope='line',border='single'})<cr>",
			desc = "list document errors in quickfix list",
		},
		{
			"<leader>lS",
			"<cmd>lua vim.lsp.buf.workspace_symbol()<cr>",
			desc = "list workspace Symbols in quickfix list",
		},
		{ "<leader>lu", "<cmd>UndotreeToggle<cr>", desc = "show undo tree log" },
		-- S = {
		--   "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
		--   "Workspace Symbols",
		-- },
	},

	--
	{
		-- Telescope
		{ "<leader>s", group = "Telescope" },
		{ "<leader>st", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Symbols outline" },
		{ "<leader>sm", "<cmd>Telescope help_tags<cr>", desc = "Symbols outline" },
		{
			"<leader>sd",
			require("Drkknght.core.userFunctions").open_dir_telescope,
			desc = "open directory in oil via telescope",
		},
		{ "<leader>so", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
		{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "find files" },
		{ "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
		{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
		{ "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
		{
			"<leader>sp",
			"<cmd>lua require'telescope.builtin'.find_files({cwd = '$PROJECT_ROOT',hidden=true})<cr>",
			desc = "Search files from Tmux project root",
		},
		{
			"<leader>sg",
			"<cmd>lua require'telescope.builtin'.live_grep({cwd = '$PROJECT_ROOT',hidden=true})<cr>",
			desc = "live grep from Tmux project root",
		},
		{
			"<leader>sr",
			"<cmd>lua require'telescope'.extensions.file_browser.file_browser({files=true,grouped=true,depth=1,hidden=true,cwd = '$PROJECT_ROOT'})<cr>",
			desc = "Open tmux project root directory",
		},
		{ "<leader>sq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" },
		{ "<leader>si", "<cmd>Telescope bookmarks<cr>", desc = "Bookmarks" },
		{
			"<leader>se",
			"<cmd>lua require'telescope'.extensions.file_browser.file_browser({files=true,grouped=true,depth=1,hidden=true})<cr>",
			desc = "file-browser-current",
		},
		{ "<leader>ss", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
		{ "<leader>sE", "<cmd>Telescope env<cr>", desc = "Env" },
		{ "<leader>sl", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer lines" },
		{ "<leader>sh", require("Drkknght.core.userFunctions").search_dotfiles, desc = "search dotfiles" },
		{ "<leader>sa", require("Drkknght.core.userFunctions").search_ansible, desc = "search ansible-sync" },
		-- d = {"<cmd>lua require('plugins/telescope-config').search_dir()<cr>","dotfiles"},
	},

	--
	{
		-- fzf
		{ "<leader>f", group = "Fzf" },
		{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "find files fzf" },
		{ "<leader>ft", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "show lsp symbols in fzf" },
		{ "<leader>fo", "<cmd>FzfLua oldfiles<cr>", desc = "find old files fzf" },
		{ "<leader>fR", "<cmd>FzfLua resume<cr>", desc = "resume fzflua" },
		{ "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "show keymaps in fzflua" },
		{ "<leader>fd", require("Drkknght.core.userFunctions").open_dir_fzf, desc = "open directory via fzf in oil" },
		{ "<leader>fg", "<cmd>FzfLua git_files<cr>", desc = "find git files" },
		{ "<leader>fm", "<cmd>FzfLua helptags<cr>", desc = "find git files" },
		{ "<leader>fs", "<cmd>FzfLua live_grep<cr>", desc = "grep fzf" },
		{ "<leader>fc", "<cmd>FzfLua colorschemes<cr>", desc = "colorschemes" },
		{ "<leader>fb", "<cmd>FzfLua blines<cr>", desc = "fzf lines buffers" },
		{ "<leader>fl", "<cmd>FzfLua lines<cr>", desc = "fzf lines search on all buffers" },
		{ "<leader>fr", "<cmd>FzfLua resume<cr>", desc = "fzf resume" },
		{
			"<leader>fh",
			require("Drkknght.core.userFunctions").open_dotfiles_fzf,
			desc = "find files fzf from dotfiles directory",
		},
		{
			"<leader>fa",
			require("Drkknght.core.userFunctions").open_ansible_fzf,
			desc = "find files fzf from dotfiles directory",
		},
		{
			"<leader>fe",
			":lua require('fzf-lua').files({cwd = '~'})<CR>",
			desc = "find files fzf from home directory",
		},
		{ "<leader>fw", "yiw<bar><cmd>FzfLua blines<cr><bar><ESC>pi", desc = "paste" },
	},

	{
		-- Terminal
		{ "<leader>t", group = "terminal" },
		{ "<leader>tn", ":lua _NODE_TOGGLE()<cr>", desc = "Node terminal" },
		{ "<leader>tm", ":lua _GLOW()<cr>", desc = "Glow" },
		{ "<leader>tu", ":lua _NCDU_TOGGLE()<cr>", desc = "NCDU terminal" },
		{ "<leader>tt", ":lua _HTOP_TOGGLE()<cr>", desc = "Htop terminal" },
		{ "<leader>tp", ":lua _PYTHON_TOGGLE()<cr>", desc = "Python terminal" },
		{ "<leader>tg", ":lua _LAZYGIT_TOGGLE()<cr>", desc = "Lazygit terminal" },
		{ "<leader>tl", ":lua _LUA_TOGGLE()<cr>", desc = "Lua terminal" },
		{ "<leader>tf", ":lua _FLOAT()<cr>", desc = "Float terminal" },
		{ "<leader>th", ":lua _HORIZONTAL()<cr>", desc = "Horizontal terminal" },
		{ "<leader>tv", ":lua _VERTICAL()<cr>", desc = "Vertical terminal" },
	},
	--
	{
		--debugger
		{ "<leader>x", group = "debugger" },
		{ "<leader>xx", ":lua require('dapui').toggle()<cr>", desc = "toggle dap ui " },
		{ "<leader>xc", ":lua require('dap').continue()<cr>", desc = "continue dap " },
		{ "<leader>xb", ":lua require('dap').toggle_breakpoint()<cr>", desc = "toggle breakpoint" },
		{ "<leader>xr", ":lua require('dap').open({reset = true})<cr>", desc = "reset dap" },
		{ "<leader>xs", ":lua require('dap').repl.open()<cr>", desc = "open repl" },
		{ "<leader>xo", ":lua require('dap').step_over()<cr>", desc = "step over" },
		{ "<leader>xi", ":lua require('dap').step_into()<cr>", desc = "step into" },
		{ "<leader>xa", ":lua require('dap').step_out()<cr>", desc = "step outside" },
	},
}

-- call which key
which_key.setup(setup)
which_key.add(mappings)
