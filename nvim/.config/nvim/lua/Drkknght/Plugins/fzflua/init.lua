-- setup fzf-lua

local actions = require("fzf-lua.actions")
require("fzf-lua").setup({
	global_resume = true, -- enable global `resume`?
	-- can also be sent individually:
	-- `<any_function>.({ gl ... })`
	global_resume_query = true, -- include typed query in `resume`?
	winopts = {
		-- split         = "belowright new",-- open in a split instead?
		-- "belowright new"  : split below
		-- "aboveleft new"   : split above
		-- "belowright vnew" : split right
		-- "aboveleft vnew   : split left
		-- Only valid when using a float window
		-- (i.e. when 'split' is not defined)
		height = 0.85, -- window height
		width = 0.80, -- window width
		row = 0.35, -- window row position (0=top, 1=bottom)
		col = 0.50, -- window col position (0=left, 1=right)
		-- border argument passthrough to nvim_open_win(), also used
		-- to manually draw the border characters around the preview
		-- window, can be set to 'false' to remove all borders or to
		-- 'none', 'single', 'double' or 'rounded' (default)
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		fullscreen = false, -- start fullscreen?
		hl = {
			normal = "Normal", -- window normal color (fg+bg)
			border = "Normal", -- border color (try 'FloatBorder')
			-- Only valid with the builtin previewer:
			cursor = "Cursor", -- cursor highlight (grep/LSP matches)
			cursorline = "CursorLine", -- cursor line
			title = "file", -- preview border title (file/buffer)
			-- scrollbar_f = 'PmenuThumb',    -- scrollbar "full" section highlight
			-- scrollbar_e = 'PmenuSbar',     -- scrollbar "empty" section highlight
		},
		preview = {
			-- default     = 'bat',           -- override the default previewer?
			-- default uses the 'builtin' previewer
			border = "border", -- border|noborder, applies only to
			-- native fzf previewers (bat/cat/git/etc)
			wrap = "nowrap", -- wrap|nowrap
			hidden = "hidden", -- hidden|nohidden
			vertical = "up:55%", -- up|down:size
			horizontal = "right:40%", -- right|left:size
			layout = "flex", -- horizontal|vertical|flex
			flip_columns = 120, -- #cols to switch to horizontal on flex
			-- Only valid with the builtin previewer:
			title = true, -- preview border title (file/buf)?
			scrollbar = "float", -- `false` or string:'float|border'
			-- float:  in-window floating border
			-- border: in-border chars (see below)
			scrolloff = "-2", -- float scrollbar offset from right
			-- applies only when scrollbar = 'float'
			scrollchars = { "█", "" }, -- scrollbar chars ({ <full>, <empty> }
			-- applies only when scrollbar = 'border'
			delay = 100, -- delay(ms) displaying the preview
			-- prevents lag on fast scrolling
			winopts = { -- builtin previewer window options
				number = true,
				relativenumber = false,
				cursorline = true,
				cursorlineopt = "both",
				cursorcolumn = true,
				signcolumn = "no",
				list = true,
				foldenable = false,
				foldmethod = "manual",
			},
		},
		on_create = function()
			-- called once upon creation of the fzf main window
			-- can be used to add custom fzf-lua mappings, e.g:
			--   vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", "<Down>",
			--     { silent = true, noremap = true })
		end,
	},

	keymap = {
		-- These override the default tables completely
		-- no need to set to `false` to disable a bind
		-- delete or modify is sufficient
		builtin = {
			-- neovim `:tmap` mappings for the fzf win

			["<F1>"] = "toggle-help",
			["<F2>"] = "toggle-fullscreen",
			-- Only valid with the 'builtin' previewer
			["<F3>"] = "toggle-preview-wrap",
			["<C-o>"] = "toggle-preview",
			-- Rotate preview clockwise/counter-clockwise
			["<F5>"] = "toggle-preview-ccw",
			["<F6>"] = "toggle-preview-cw",
			["<C-z>"] = "preview-page-down",
			["<C-u>"] = "preview-page-up",
			["<S-l>"] = "preview-page-reset",
		},
		fzf = {
			-- fzf '--bind=' options
			["ctrl-d"] = "abort",
			["ctrl-u"] = "unix-line-discard",
			["ctrl-f"] = "half-page-down",
			["ctrl-b"] = "half-page-up",
			["ctrl-a"] = "select-all",
			["ctrl-e"] = "end-of-line",
			["ctrl-g"] = "toggle-all",
			-- Only valid with fzf previewers (bat/cat/git/etc)
			["f3"] = "toggle-preview-wrap",
			["f4"] = "toggle-preview",
			["shift-down"] = "preview-page-down",
			["shift-up"] = "preview-page-up",
		},
	},
	actions = {
		-- These override the default tables completely
		-- no need to set to `false` to disable an action
		-- delete or modify is sufficient
		files = {
			-- default action opens a single selection
			-- or sends multiple selection to quickfix
			-- replace the default action with the below
			-- to open all files whether single or multiple
			-- ["default"]     = actions.file_edit,
			["default"] = actions.file_edit_or_qf,
			["ctrl-s"] = actions.file_split,
			["ctrl-v"] = actions.file_vsplit,
			["ctrl-t"] = actions.file_tabedit,
			["ctrl-f"] = actions.file_sel_to_qf,
		},
		buffers = {
			["default"] = actions.buf_edit,
			["ctrl-s"] = actions.buf_split,
			["ctrl-v"] = actions.buf_vsplit,
			["ctrl-t"] = actions.buf_tabedit,
		},
	},

	fzf_opts = {
		-- options are sent as `<left>=<right>`
		-- set to `false` to remove a flag
		-- set to '' for a non-value flag
		-- for raw args use `fzf_args` instead
		["--ansi"] = "",
		["--prompt"] = " ",
		["--info"] = "default",
		["--preview-window"] = "size:50%",
	},
	previewers = {
		cat = {
			cmd = "cat",
			args = "--number",
		},
		bat = {
			cmd = "batcat",
			args = "--style=numbers,changes --color always",
			theme = "Monokai Extended Origin", -- bat preview theme (bat --list-themes)
			config = nil, -- nil uses $BAT_CONFIG_PATH
		},
		head = {
			cmd = "head",
			args = nil,
		},
		git_diff = {
			cmd_deleted = "git diff --color HEAD --",
			cmd_modified = "git diff --color HEAD",
			cmd_untracked = "git diff --color --no-index /dev/null",
			-- pager        = "delta",      -- if you have `delta` installed
		},
		man = {
			cmd = "man -c %s | col -bx",
		},
		builtin = {
			syntax = true, -- preview syntax highlight?
			syntax_limit_l = 0, -- syntax limit (lines), 0=nolimit
			syntax_limit_b = 1024 * 1024, -- syntax limit (bytes), 0=nolimit
		},
	},
	-- provider setup
	files = {
		-- previewer      = "bat",          -- uncomment to override previewer
		-- (name from 'previewers' table)
		-- set to 'false' to disable
		-- prompt            = 'Files❯ ',
		prompt = " ",
		multiprocess = true, -- run command in a separate process
		git_icons = true, -- show git icons?
		file_icons = true, -- show file icons?
		color_icons = true, -- colorize file|git icons
		-- executed command priority is 'cmd' (if exists)
		-- otherwise auto-detect prioritizes `fd`:`rg`:`find`
		-- default options are controlled by 'fd|rg|find|_opts'
		-- NOTE: 'find -printf' requires GNU find
		-- cmd            = "find . -type f -printf '%P\n'",

		cmd = "fdfind --type f -H --follow --exclude .git --exclude .config --exclude .wine",
		-- find_opts         = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
		rg_opts = "--color=never --files --hidden --follow -g '!.git'",
		fdfind_opts = "--color=never --type f --hidden --follow --exclude .git .config .mozilla .wine",
		-- find_opts         = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
		-- rg_opts           = "--color=never --files --hidden --follow -g '!.git'",
		-- fd_opts           = "--color=never --type f --hidden --follow --exclude .git",
		actions = {
			-- inherits from 'actions.files', here we can override
			-- or set bind to 'false' to disable a default action
			["default"] = actions.file_edit,

			--       ["ctrl-i"]       = "toggle-all",
			-- custom actions are available too
			["ctrl-y"] = function(selected)
				print(selected[1])
			end,
		},
	},
	git = {
		files = {
			prompt = "GitFiles❯ ",
			cmd = "git ls-files --exclude-standard",
			multiprocess = true, -- run command in a separate process
			git_icons = true, -- show git icons?
			file_icons = true, -- show file icons?
			color_icons = true, -- colorize file|git icons
			-- force display the cwd header line regardles of your current working
			-- directory can also be used to hide the header when not wanted
			-- show_cwd_header = true
		},
		status = {
			prompt = "GitStatus❯ ",
			cmd = "git status -s",
			previewer = "git_diff",
			file_icons = true,
			git_icons = true,
			color_icons = true,
			actions = {
				-- actions inherit from 'actions.files' and merge
				["right"] = { actions.git_unstage, actions.resume },
				["left"] = { actions.git_stage, actions.resume },
			},
		},
		commits = {
			prompt = "Commits❯ ",
			cmd = "git log --pretty=oneline --abbrev-commit --color",
			preview = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
			actions = {
				["default"] = actions.git_checkout,
			},
		},
		bcommits = {
			prompt = "BCommits❯ ",
			cmd = "git log --pretty=oneline --abbrev-commit --color",
			preview = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
			actions = {
				["default"] = actions.git_buf_edit,
				["ctrl-s"] = actions.git_buf_split,
				["ctrl-v"] = actions.git_buf_vsplit,
				["ctrl-t"] = actions.git_buf_tabedit,
			},
		},
		branches = {
			prompt = "Branches❯ ",
			cmd = "git branch --all --color",
			preview = "git log --graph --pretty=oneline --abbrev-commit --color {1}",
			actions = {
				["default"] = actions.git_switch,
			},
		},
		icons = {
			["M"] = { icon = "M", color = "yellow" },
			["D"] = { icon = "D", color = "red" },
			["A"] = { icon = "A", color = "green" },
			["R"] = { icon = "R", color = "yellow" },
			["C"] = { icon = "C", color = "yellow" },
			["?"] = { icon = "?", color = "magenta" },
			-- override git icons?
			-- ["M"]        = { icon = "★", color = "red" },
			-- ["D"]        = { icon = "✗", color = "red" },
			-- ["A"]        = { icon = "+", color = "green" },
		},
	},
	grep = {
		prompt = "Rg❯ ",
		input_prompt = "Grep For❯ ",
		multiprocess = true, -- run command in a separate process
		git_icons = true, -- show git icons?
		file_icons = true, -- show file icons?
		color_icons = true, -- colorize file|git icons
		-- executed command priority is 'cmd' (if exists)
		-- otherwise auto-detect prioritizes `rg` over `grep`
		-- default options are controlled by 'rg|grep_opts'
		-- cmd            = "rg --vimgrep",
		cmd = "rg --vimgrep --hidden --column --line-number --no-heading --color=always --smart-case --max-columns=512",
		rg_opts = "--vimgrep --column --line-number --no-heading --color=always --smart-case --max-columns=512",
		grep_opts = "--binary-files=without-match --line-number --recursive --color=auto --perl-regexp",
		-- 'live_grep_glob' options:
		glob_flag = "--iglob", -- for case sensitive globs use '--glob'
		glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
	},
	args = {
		prompt = "Args❯ ",
		files_only = true,
		-- actions inherit from 'actions.files' and merge
		actions = { ["ctrl-x"] = actions.arg_del },
	},
	oldfiles = {
		prompt = "History❯ ",
		cwd_only = false,
	},
	buffers = {
		prompt = "Buffers❯ ",
		file_icons = true, -- show file icons?
		color_icons = true, -- colorize file|git icons
		sort_lastused = true, -- sort buffers() by last used
		actions = {
			-- actions inherit from 'actions.buffers' and merge
			-- by supplying a table of functions we're telling
			-- fzf-lua to not close the fzf window, this way we
			-- can resume the buffers picker on the same window
			-- eliminating an otherwise unaesthetic win "flash"
			["ctrl-x"] = { actions.buf_del, actions.resume },
		},
	},
	lines = {
		previewer = "builtin", -- set to 'false' to disable
		prompt = "Lines❯ ",
		show_unlisted = false, -- exclude 'help' buffers
		no_term_buffers = true, -- exclude 'term' buffers
		fzf_opts = {
			-- do not include bufnr in fuzzy matching
			-- tiebreak by line no.
			["--delimiter"] = vim.fn.shellescape("]"),
			["--nth"] = "2..",
			["--tiebreak"] = "index",
		},
		-- actions inherit from 'actions.buffers'
	},
	blines = {
		previewer = "builtin", -- set to 'false' to disable
		prompt = "BLines❯ ",
		show_unlisted = true, -- include 'help' buffers
		no_term_buffers = false, -- include 'term' buffers
		fzf_opts = {
			-- hide filename, tiebreak by line no.
			-- ["--delimiter"] = vim.fn.shellescape("[:]"),
			["--with-nth"] = "2..",
			["--tiebreak"] = "index",
		},
		-- actions inherit from 'actions.buffers'
	},
	colorschemes = {
		prompt = "Colorschemes❯ ",
		live_preview = true, -- apply the colorscheme on preview?
		actions = { ["default"] = actions.colorscheme },
		winopts = { height = 0.55, width = 0.30 },
		post_reset_cb = function()
			-- reset statusline highlights after
			-- a live_preview of the colorscheme
			-- require('feline').reset_highlights()
		end,
	},
	quickfix = {
		file_icons = true,
		git_icons = true,
	},
	lsp = {
		prompt_postfix = "❯ ", -- will be appended to the LSP label
		-- to override use 'prompt' instead
		cwd_only = false, -- LSP/diagnostics for cwd only?
		async_or_timeout = 5000, -- timeout(ms) or 'true' for async calls
		file_icons = true,
		git_icons = false,
		lsp_icons = true,
		severity = "hint",
		icons = {
			["Error"] = { icon = "", color = "red" }, -- error
			["Warning"] = { icon = "", color = "yellow" }, -- warning
			["Information"] = { icon = "", color = "blue" }, -- info
			["Hint"] = { icon = "", color = "magenta" }, -- hint
		},
	},
	file_icon_padding = "",
	file_icon_colors = {
		["lua"] = "blue",
	},
})
