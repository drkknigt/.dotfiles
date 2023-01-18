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
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	-- startup time and optimization plugins

	{ "dstein64/vim-startuptime", event = CursorHold },

	-- better escape mode
	{
		"max397574/better-escape.nvim",
		event = "CursorHold",
		config = function()
			require("better_escape").setup({
				mapping = { "jk", "kj" },
				timeout = 101,
			})
		end,
	},

	--nvim tree for file navigation like vscode
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		event = "CursorHold",
		config = function()
			require("userPlugins.nvimtree-config")
		end,
	},
	-- themes for neovim

	{ "luisiacc/gruvbox-baby", "folke/tokyonight.nvim", lazy = false, priority = 1000 },

	-- This tiny plugin adds vscode-liek pictorgrams to neoivm built in lsp

	{ "onsails/lspkind.nvim", event = "CursorHold" },

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
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			pcall(require, "userPlugins.cmp-config")
		end,
	},

	-- debugger protocol

	{ "mfussenegger/nvim-dap", event = "CursorHold" },
	{ "Pocco81/DAPInstall.nvim", event = "CursorHold" },

	-- fuzzy finders and telescope

	{
		"nvim-telescope/telescope.nvim",
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
			require("userPlugins._telescope-setting")
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
			require("userPlugins.fzflua")
		end,
	},

	-- lsp -sgnature for functions and methods
	{ "ray-x/lsp_signature.nvim", event = "CursorHold" },

	-- lsp progress
	{
		"j-hui/fidget.nvim",
		event = "BufReadPre",
		config = function()
			require("fidget").setup({})
		end,
	},

	-- surround text objects with chars
	{ "machakann/vim-sandwich" },

	-- developer icons to display icons and fonts related to programming

	{ "kyazdani42/nvim-web-devicons", event = "CursorHold" },
	{ "ryanoasis/vim-devicons", event = "CursorHold" },

	-- treesitter for syntax parsing and highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "CursorHold",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"JoosepAlviste/nvim-ts-context-commentstring",
			{
				"mizlan/iswap.nvim",
				event = "CursorHold",
				config = function()
					require("userPlugins/iswaaap-config")
				end,
			},
			"nvim-treesitter/nvim-treesitter-refactor",
			"mfussenegger/nvim-ts-hint-textobject",
			"windwp/nvim-ts-autotag",
			"p00f/nvim-ts-rainbow",
		},
		config = function()
			require("userPlugins.treesitter")
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
		event = "BufEnter",
		config = function()
			require("userPlugins.lualine-config")
			-- vim.api.nvim_set_hl(0, "Statusline", { bg = "Black" })
		end,
	},

	-- matchup
	{
		"andymass/vim-matchup",
		event = "CursorHold",
	},

	-- tab bar line
	{
		"akinsho/bufferline.nvim",
		version = "v2.*",
		dependencies = "kyazdani42/nvim-web-devicons",
		event = "BufReadPre",

		config = function()
			require("userPlugins.tabbar-config")
		end,
	},

	-- insert or delete brackets, parens, quotes in pair

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("userPlugins.autopairs-config")
		end,
	},

	-- whichkey is  a lua plugin for neovim that displays a popup with possible key bindings of the command you started typing.

	{
		"folke/which-key.nvim",
		event = "CursorHold",
		config = function()
			require("userPlugins.which-config")
		end,
	},

	-- hex  and color highligher
	{
		"norcalli/nvim-colorizer.lua",
		event = "CursorHold",
		config = function()
			require("userPlugins.colorizer-config")
		end,
	},

	-- flaoting terminal
	{
		"akinsho/toggleterm.nvim",
		version = "v1.*",
		event = "CursorHold",
		config = function()
			require("userPlugins.terminal-config")
		end,
	},

	-- neovim commenter
	{
		"numToStr/Comment.nvim",
		event = "CursorHold",
		config = function()
			require("userPlugins.comment-config")
		end,
	},

	-- This plugin allows for declaratiely configuring, launching, and initializing language serves you have installed on your system
	--        {
	--			"neovim/nvim-lspconfig",
	--			event = "CursorHold",
	--			config = function()
	--				require("userPlugins.lsp-config")
	--			end,
	--		},

	-- An implementaiont of the Popup API from vim in Neovim.
	{ "nvim-lua/popup.nvim", event = "CursorHold" },

	-- plugin to install language serves with ease
	--
	{
		"williamboman/mason.nvim",
		event = "CursorHold",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",

			{
				"neovim/nvim-lspconfig",
				config = function()
					require("userPlugins.lsp-config")
				end,
			},
		},
	},

	-- This tiny plugin adds vscode-liek pictorgrams to neoivm built in lsp
	{ "onsails/lspkind.nvim", event = "CursorHold" },

	-- tags and symbols in the file

	{
		"simrat39/symbols-outline.nvim",
		event = "CursorHold",
		config = function()
			require("symbols-outline").setup()
		end,
	},

	-- indent line
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "CursorHold",
		config = function()
			require("userPlugins.indentline-config")
		end,
	},

	-- null-ls server for autocomplete,linting, formatting and hover
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "CursorHold",
		config = function()
			require("userPlugins.null-config")
		end,
	},

	-- lsp saga gives ui to certain lsp task
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		event = "CursorHold",
		config = function()
			-- require("userPlugins.lspsaga-config")
			require("lspsaga").setup({})
		end,
	},

	-- goto-preview for lsp
	{
		"rmagatti/goto-preview",
		event = "CursorHold",
		config = function()
			require("userPlugins.goto-config")
		end,
	},

	-- git plugins
	{
		"lewis6991/gitsigns.nvim",
		tag = "release",
		event = "CursorHold",
		config = function()
			require("userPlugins.gitsigns-config")
		end,
	},

	-- run code
	{
		"is0n/jaq-nvim",
		event = "CursorHold",
		config = function()
			require("userPlugins.jaq-config")
		end,
	},

	-- preety quickfix window and easier navigation
	{
		"kevinhwang91/nvim-bqf",
		event = "CursorHold",
		config = function()
			require("bqf").setup()
		end,
	},
})
