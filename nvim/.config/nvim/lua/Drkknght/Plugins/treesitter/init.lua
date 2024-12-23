----------------------------------- treesitter ---------------------------------------

-- setup treesitter
require("nvim-treesitter.configs").setup({
	-- ensure_installed can be "all" or a list of languages { "python", "javascript" }
	indent = {
		enable = true,
	},
	matchup = {
		enable = true,
		include_match_words = true,
	},
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
		enable_rename = true,
		enable_close = true,
		enable_close_on_slash = true,
		filetypes = { "html", "xml" },
	},
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {'violet','orange','red','white','#5ec4ba','#8688fc','#6be069',}, -- table of hex strings
		colors = {
			"Gold",
			"Orchid",
			"LawnGreen",
			"DodgerBlue",
			"Cornsilk",
			"Salmon",
			"Cyan",
		},
		-- termcolors = {} -- table of colour name strings
	},
	-- install treesitter parsers
	ensure_installed = {
		"vim",
		"python",
		"lua",
		"bash",
		"clojure",
		"go",
		"c",
		"html",
		"css",
		"cpp",
		"typescript",
		"javascript",
		"perl",
	},
	sync_install = false,

	highlight = { -- enable highlighting for all file types
		enable = true, -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
		-- disable = { "lua" },
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true, -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
		keymaps = {
			init_selection = "<c-space>",
			node_incremental = "<c-space>",
			scope_incremental = "<c-s>",
			node_decremental = "<c-backspace>",
		},
	},
	textobjects = {
		--     swap = {
		--         enable = true,
		--         swap_next = {
		--             ["<leader>a"] = "@parameter.inner",
		--         },
		--         swap_previous = {
		--             ["<leader>A"] = "@parameter.inner",
		--         },
		-- },
		-- These are provided by
		select = {
			enable = true, -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined here:
				-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects/blob/master/queries/c/textobjects.scm
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["aq"] = "@conditional.outer",
				["iq"] = "@conditional.inner",
				["ar"] = "@loop.outer",
				["ir"] = "@loop.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				-- ["ab"] = "@block.outer",
				-- ["ib"] = "@block.inner",
				-- ["as"] = "@statement.outer",
				-- ["iS"] = "@statement.inner",
			},
		},
		lsp_interop = {
			enable = true,
			border = "single",
			peek_definition_code = {
				["<leader>lf"] = "@function.outer",
				["<leader>lc"] = "@class.outer",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]f"] = "@function.outer",
				["]c"] = "@class.outer",
				["]q"] = "@conditional.outer",
				["]r"] = "@loop.outer",
				["]s"] = "@statement.outer",
			},
			goto_next_end = {
				["<leader>nf"] = "@function.outer",
				["<leader>nc"] = "@class.outer",
				["<leader>nq"] = "@conditional.outer",
				["<leader>nr"] = "@loop.outer",
				["<leader>ns"] = "@statement.outer",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
				["[c"] = "@class.outer",
				["[q"] = "@conditional.outer",
				["[r"] = "@loop.outer",
				["[s"] = "@statement.outer",
			},
			goto_previous_end = {
				["<leader>mf"] = "@function.outer",
				["<leader>mc"] = "@class.outer",
				["<leader>mq"] = "@conditional.outer",
				["<leader>mr"] = "@loop.outer",
				["<leader>ms"] = "@statement.outer",
			},
		},
	},
	refactor = {
		highlight_definitions = {
			enable = true,
			-- Set to false if you have an `updatetime` of ~100.
			clear_on_cursor_move = true,
		},
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "<leader>lR",
			},
		},
		navigation = {
			enable = true,
			keymaps = {
				goto_definition = "gnd",
				list_definitions = "gnD",
				list_definitions_toc = "gO",
				goto_next_usage = "<C-*>",
				goto_previous_usage = "<C-#>",
			},
		},
		context_commentstring = {
			enable = false,
		},
	},
})

local map = vim.api.nvim_set_keymap
map("n", "]w", ":lua require('ts-node-action').node_action()<cr>", { noremap = true, silent = true })
-- iswap
