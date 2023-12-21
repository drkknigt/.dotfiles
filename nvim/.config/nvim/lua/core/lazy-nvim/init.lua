local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
local opts = {
	performance = {
		rtp = {
			---@type string[] list any plugins you want to disable here
			disabled_plugins = {
				"tohtml",
				"tutor",
				"ftplugin",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"gzip",
				"zip",
				"zipPlugin",
				"tar",
				"rplugin",
				"tarPlugin",
				"getscript",
				"getscriptPlugin",
				"vimball",
				"vimballPlugin",
				"2html_plugin",
				"logipat",
				"rrhelper",
				"spellfile_plugin",
				"matchit",
				"matchparen",
				"logiPat",
				"rrhelper",
			},
		},
	},
	-- lazy can generate helptags from the headings in markdown readme files,
	-- so :help works even for plugins that don't have vim docs.
	-- when the readme opens with :help it will be correctly displayed as markdown
}
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	-- startup time and optimization plugins

	{
		"dstein64/vim-startuptime",
		event = "VeryLazy",
		-- commit = "cb4c112b9e0f224236ee4eab6bf5153406b3f88b",
	},

	-- better escape mode
	{
		"max397574/better-escape.nvim",
		event = "VeryLazy",
		config = function()
			require("better_escape").setup({
				mapping = { "jk", "kj" },
				timeout = 201,
			})
		end,
	},

	--nvim tree for file navigation like vscode
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		event = "VeryLazy",
		config = function()
			require("Plugins.nvimtree-config")
		end,
	},

	-- themes for neovim
	{
		"luisiacc/gruvbox-baby",
		event = "BufEnter",
		config = function()
			require("core.color-config")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		event = "VeryLazy",
	},
	{
		"Mofiqul/vscode.nvim",
		event = "VeryLazy",
	},
	{
		"folke/tokyonight.nvim",
		event = "VeryLazy",
	},
	{
		"nvimdev/zephyr-nvim",
		event = "VeryLazy",
	},
	{
		"catppuccin/nvim",
		event = "VeryLazy",
	},
	{
		"shaunsingh/nord.nvim",
		event = "VeryLazy",
	},
	{
		"loctvl842/monokai-pro.nvim",
		event = "VeryLazy",
		config = function()
			require("monokai-pro").setup()
		end,
	},
	{
		"xero/miasma.nvim",
		event = "VeryLazy",
	},
	-- This tiny plugin adds vscode-liek pictorgrams to neoivm built in lsp

	-- completion resources

	{
		"hrsh7th/nvim-cmp",
		event = "CursorHold",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"winston0410/cmd-parser.nvim",
			"ray-x/cmp-treesitter",
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "rafamadriz/friendly-snippets" },
				version = "1.*",
				-- build = "make install_jsregexp",
			},
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			pcall(require, "Plugins.cmp-config")
		end,
	},

	-- debugger protocol

	{ "mfussenegger/nvim-dap", event = "CursorHold" },
	{ "Pocco81/DAPInstall.nvim", event = "CursorHold" },

	-- fuzzy finders and telescope

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		event = "CursorHold",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-file-browser.nvim",
			"dhruvmanila/telescope-bookmarks.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-project.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("Plugins._telescope-setting")
		end,
	},
	{
		"ibhagwan/fzf-lua",
		event = "CursorHold",
		dependencies = {
			{ "junegunn/fzf", build = "./install --bin", event = "CursorHold" },
			"vijaymarupudi/nvim-fzf",
		},
		config = function()
			require("Plugins.fzflua")
		end,
	},

	-- lsp -sgnature for functions and methods
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		config = function()
			require("Plugins.signature")
		end,
	},

	-- lsp progress
	{
		"j-hui/fidget.nvim",
		event = "BufReadPre",
		branch = "legacy",
		config = function()
			require("fidget").setup({})
		end,
	},

	{
		"kylechui/nvim-surround",
		event = "CursorHold",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	-- developer icons to display icons and fonts related to programming

	{ "kyazdani42/nvim-web-devicons", event = "CursorHold" },
	{ "ryanoasis/vim-devicons", event = "CursorHold" },

	-- treesitter for syntax parsing and highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"JoosepAlviste/nvim-ts-context-commentstring",
			{
				"mizlan/iswap.nvim",
				event = "CursorHold",
				config = function()
					require("Plugins/iswaaap-config")
				end,
			},
			"nvim-treesitter/nvim-treesitter-refactor",
			"mfussenegger/nvim-ts-hint-textobject",
			"windwp/nvim-ts-autotag",
			"p00f/nvim-ts-rainbow",
		},
		config = function()
			require("Plugins.treesitter")
		end,
	},

	-- hop for easy motion
	{
		"phaazon/hop.nvim",
		event = "CursorHold",
		config = function()
			require("hop").setup()
		end,
	},

	-- status line with lua
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		event = "VeryLazy",
		config = function()
			require("Plugins.lualine-config")
			-- vim.api.nvim_set_hl(0, "Statusline", { bg = "Black" })
		end,
	},

	-- matchup
	{
		"andymass/vim-matchup",
		event = "VeryLazy",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "status" }
		end,
	},

	-- tab bar line
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "kyazdani42/nvim-web-devicons",
		event = "VeryLazy",

		config = function()
			require("Plugins.tabbar-config")
		end,
	},

	-- insert or delete brackets, parens, quotes in pair

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("Plugins.autopairs-config")
		end,
	},

	-- whichkey is  a lua plugin for neovim that displays a popup with possible key bindings of the command you started typing.

	{
		"folke/which-key.nvim",
		event = "CursorHold",
		config = function()
			require("Plugins.which-config")
		end,
	},

	-- hex  and color highligher
	{
		"norcalli/nvim-colorizer.lua",
		event = "InsertEnter",
		config = function()
			require("Plugins.colorizer-config")
		end,
	},

	-- flaoting terminal
	{
		-- "akinsho/toggleterm.nvim",
		"voldikss/vim-floaterm",
		version = "*",
		event = "CursorHold",
		config = function()
			require("Plugins.terminal-config")
		end,
	},

	-- neovim commenter
	{
		"numToStr/Comment.nvim",
		event = "CursorHold",
		config = function()
			require("Plugins.comment-config")
		end,
	},

	-- An implementaiont of the Popup API from vim in Neovim.
	{ "nvim-lua/popup.nvim", event = "VeryLazy" },

	-- plugin to install language serves with ease
	--
	{
		"williamboman/mason.nvim",
		event = "CursorHold",
		-- build = ":MasonUpdate",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = "CursorHold",
		config = function()
			require("Plugins.lsp-config")
		end,
	},

	-- This tiny plugin adds vscode-liek pictorgrams to neoivm built in lsp
	{ "onsails/lspkind.nvim", event = "CursorHold", event = "VeryLazy" },

	-- tags and symbols in the file

	-- {
	-- 	"simrat39/symbols-outline.nvim",
	-- 	event = "CursorHold",
	-- 	config = function()
	-- 		require("symbols-outline").setup()
	-- 	end,
	-- },

	{
		"hedyhli/outline.nvim",
		event = "CursorHold",
		config = function()
			-- Example mapping to toggle outline
			-- vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

			require("outline").setup({
				-- Your setup opts here (leave empty to use defaults)
			})
		end,
	},
	-- indent line
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		config = function()
			require("Plugins.indentline-config")
		end,
		main = "ibl",
		opts = {},
	},

	-- null-ls server for autocomplete,linting, formatting and hover
	{
		"nvimtools/none-ls.nvim",
		event = "CursorHold",
		config = function()
			require("Plugins.null-config")
		end,
	},

	-- goto-preview for lsp
	{
		"rmagatti/goto-preview",
		event = "CursorHold",
		config = function()
			require("Plugins.goto-config")
		end,
	},

	-- git plugins
	{
		"lewis6991/gitsigns.nvim",
		tag = "release",
		event = "CursorHold",
		config = function()
			require("Plugins.gitsigns-config")
		end,
	},

	-- run code
	{
		"is0n/jaq-nvim",
		event = "CursorHold",
		config = function()
			require("Plugins.jaq-config")
		end,
	},

	-- preety quickfix window and easier navigation and basic auto cmds and user defined functions
	{
		"kevinhwang91/nvim-bqf",
		event = "CursorHold",
		config = function()
			require("bqf").setup({
				preview = {
					winblend = 0,
				},
			})
			require("core.autocmds")
			require("core.userFunctions")
			vim.api.nvim_set_hl(0, "Statusline", { bg = "Black", fg = "gray" })
		end,
	},

	-- code window
	{
		"gorbit99/codewindow.nvim",
		event = "VeryLazy",
		config = function()
			local codewindow = require("codewindow")
			codewindow.setup({
				show_cursor = true,
				exclude_filetypes = { "NvimTree", "Outline", "TelescopePrompt", "fzf", "qf" },
			})
			codewindow.apply_default_keybinds()
		end,
	},
	-- ai code completion

	-- {
	-- 	"Exafunction/codeium.vim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		vim.keymap.set("i", "<C-_>", function()
	-- 			return vim.fn["codeium#Accept"]()
	-- 		end, { expr = true })
	-- 		-- vim.keymap.set("i", "<c-q>", function()
	-- 		-- 	return vim.fn["codeium#CycleCompletions"](1)
	-- 		-- end, { expr = true })
	-- 		-- vim.keymap.set("i", "<c-,>", function()
	-- 		-- 	return vim.fn["codeium#CycleCompletions"](-1)
	-- 		-- end, { expr = true })
	-- 		-- vim.keymap.set("i", "<c-x>", function()
	-- 		-- 	return vim.fn["codeium#Clear"]()
	-- 		-- end, { expr = true })
	-- 	end,
	-- },

	-- tabout plugin
	{
		"abecodes/tabout.nvim",
		event = "InsertEnter",
		config = function()
			require("tabout").setup({
				tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
				backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
				act_as_tab = true, -- shift content if tab out is not possible
				act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
				default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
				default_shift_tab = "<C-d>", -- reverse shift default action,
				enable_backwards = true, -- well ...
				completion = true, -- if the tabkey is used in a completion pum
				tabouts = {
					{ open = "'", close = "'" },
					{ open = '"', close = '"' },
					{ open = "`", close = "`" },
					{ open = "(", close = ")" },
					{ open = "[", close = "]" },
					{ open = "{", close = "}" },
				},
				ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
				exclude = {}, -- tabout will ignore these filetypes
			})
		end,
	},
	{
		"ckolkey/ts-node-action",
		event = "CursorHold",
		dependencies = { "nvim-treesitter" },
	},

	{
		"mbbill/undotree",
		event = "VeryLazy",
	},

	{ "jghauser/mkdir.nvim", event = "VeryLazy" },
	{ "Bekaboo/dropbar.nvim", event = "VeryLazy" },

	-- jump fast with flash

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = require("Plugins.flash-plugin"),

		-- stylua: ignore
		keys = {
			{
				"[w",
				mode = { "n", "o", "x" },
				function()
					require("flash").jump({})
				end,
				desc = "Flash",
			},
			{
				"[t",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"[a",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"[z",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
		},
	},

	-- run commands in tmux
	{ "christoomey/vim-tmux-runner", event = "VeryLazy" },

	-- compile code inside nvim window
	{
		"ej-shafran/compile-mode.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "m00qek/baleia.nvim", tag = "v1.3.0" },
		},
		opts = {
			-- you can disable colors by uncommenting this line
			-- no_baleia_support = true,
			split_vertically = true,
			default_command = "ls",
		},
	},

	-- run llms in nvim
	{
		"David-Kunz/gen.nvim",
		opts = {
			model = "stablelm-zephyr:3b-q2_K", -- The default model to use.
			display_mode = "float", -- The display mode. Can be "float" or "split".
			show_prompt = false, -- Shows the Prompt submitted to Ollama.
			show_model = true, -- Displays which model you are using at the beginning of your chat session.
			no_auto_close = false, -- Never closes the window automatically.
			init = function(options)
				pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
			end,
			-- Function to initialize Ollama
			command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body",
			-- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
			-- This can also be a lua function returning a command string, with options as the input parameter.
			-- The executed command must return a JSON object with { response, context }
			-- (context property is optional).
			list_models = "<function>", -- Retrieves a list of model names
			debug = false, -- Prints errors and the command which is run.
		},
	},
}, opts)
