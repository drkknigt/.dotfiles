------------------------------------------------------ jaq ----------------------------------

-- setup jaq
require("jaq-nvim").setup({
	-- Commands used with 'Jaq'
	cmds = {
		-- Default UI used (see `Usage` for options)
		behaviour = {
			default = "float",
			startinsert = true,
			wincmd = false,
			autosave = false,
		},

		-- Uses external commands such as 'g++' and 'cargo'
		external = {
			typescript = "deno run %",
			javascript = "node %",
			markdown = "glow %",
			python = "python3 %",
			rust = "rustc % && ./$fileBase && rm $fileBase",
			cpp = "g++ % -o $fileBase && ./$fileBase",
			c = "gcc % -o $fileBase && ./$fileBase",
			go = "go run %",
			sh = "sh %",
			lua = "lua5.3 %",
			sh = "bash %",
			bash = "bash %",
			zsh = "zsh %",
			java = "java %",
		},

		-- Uses internal commands such as 'source' and 'luafile'
		internal = {
			-- lua = "luafile %",
			vim = "source %",
		},
	},

	-- UI settings
	ui = {
		-- Start in insert mode

		-- Floating Window settings
		float = {
			-- Floating window border (see ':h nvim_open_win')
			border = "double",

			-- Num from `0 - 1` for measurements
			height = 0.8,
			width = 0.8,

			-- Highlight group for floating window/border (see ':h winhl')
			border_hl = "FloatBorder",
			float_hl = "Normal",

			-- Floating Window Transparency (see ':h winblend')
			blend = 0,
		},

		terminal = {
			-- Position of terminal
			position = "bot",

			-- Size of terminal
			size = 10,
		},
		toggleterm = {
			position = "horizontal",
			size = 10,
		},

		quickfix = {
			-- Position of quickfix window
			position = "bot",

			-- Size of quickfix window
			size = 10,
		},
	},
})
