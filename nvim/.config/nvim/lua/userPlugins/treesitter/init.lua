require("nvim-treesitter.configs").setup({
	-- ensure_installed can be "all" or a list of languages { "python", "javascript" }
	indent = {
		enable = true,
	},
	matchup = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	indent = {
		-- enable = true,
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

	ensure_installed = { "python", "lua", "bash", "javascript", "clojure", "go", "c", "html", "css", "cpp" },

	highlight = { -- enable highlighting for all file types
		enable = true, -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
		-- disable = {"vim"},
		additional_vim_regex_highlighting = true,
	},
	incremental_selection = {
		enable = true, -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
		-- keymaps = {                       -- mappings for incremental selection (visual mappings)
		--   init_selection = "grN",         -- maps in normal mode to init the node/scope selection
		--   node_incremental = "grn",       -- increment to the upper named parent
		--   scope_incremental = "grc",      -- increment to the upper scope (as defined in locals.scm)
		--   node_decremental = "grm",       -- decrement to the previous node
		-- }
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
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ak"] = "@conditional.outer",
				["ik"] = "@conditional.inner",
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
				["<leader>df"] = "@function.outer",
				["<leader>dF"] = "@class.outer",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]f"] = "@function.outer",
				["]c"] = "@class.outer",
				["]k"] = "@conditional.outer",
				["]r"] = "@loop.outer",
				["]s"] = "@statement.outer",
			},
			goto_next_end = {
				["<leader>nf"] = "@function.outer",
				["<leader>nc"] = "@class.outer",
				["<leader>nk"] = "@conditional.outer",
				["<leader>nr"] = "@loop.outer",
				["<leader>ns"] = "@statement.outer",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
				["[c"] = "@class.outer",
				["[k"] = "@conditional.outer",
				["[r"] = "@loop.outer",
				["[s"] = "@statement.outer",
			},
			goto_previous_end = {
				["<leader>mf"] = "@function.outer",
				["<leader>mc"] = "@class.outer",
				["<leader>mk"] = "@conditional.outer",
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
				smart_rename = "<leader>lr",
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
-- iswap
