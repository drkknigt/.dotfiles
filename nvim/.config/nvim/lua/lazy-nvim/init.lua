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
		event = "VeryLazy",
		config = function()
			require("userPlugins.nvimtree-config")
		end,
	},

	-- themes for neovim

	{
		"luisiacc/gruvbox-baby",
		event = "BufEnter",
		config = function()
			require("color-config")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		event = "VeryLazy",
		-- config = function()
		-- require("color-config")
		-- end,
	},
	{
		"Mofiqul/vscode.nvim",
		event = "VeryLazy",
		-- config = function()
		-- require("color-config")
		-- end,
	},
	{
		"folke/tokyonight.nvim",
		event = "VeryLazy",
		-- config = function()
		-- require("color-config")
		-- end,
	},
	{
		"nvimdev/zephyr-nvim",
		event = "VeryLazy",
		-- config = function()
		-- require("color-config")
		-- end,
	},
	{
		"catppuccin/nvim",
		event = "VeryLazy",
		-- config = function()
		-- require("color-config")
		-- end,
	},
	{
		"shaunsingh/nord.nvim",
		event = "VeryLazy",
		-- config = function()
		-- require("color-config")
		-- end,
	},
	{
		"loctvl842/monokai-pro.nvim",
		event = "VeryLazy",
		config = function()
			require("monokai-pro").setup()
		end,
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
			pcall(require, "userPlugins.cmp-config")
		end,
	},

	-- debugger protocol

	{ "mfussenegger/nvim-dap", event = "CursorHold" },
	{ "Pocco81/DAPInstall.nvim", event = "CursorHold" },

	-- fuzzy finders and telescope

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
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
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		config = function()
			require("userPlugins.signature")
		end,
	},

	-- lsp progress
	{
		"j-hui/fidget.nvim",
		event = "BufReadPre",
		config = function()
			require("fidget").setup({})
		end,
	},

	-- surround text objects with chars
	-- {
	-- 	"machakann/vim-sandwich",
	-- 	event = "CursorHold",
	-- 	config = function()
	-- 		vim.cmd([[ runtime macros/sandwich/keymap/surround.vim ]])
	-- 		vim.cmd([[let g:sandwich_no_default_key_mappings = 1 ]])
	-- 		vim.g.sandwich_no_default_key_mappings = 1
	-- 	end,
	-- },

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
		event = "VeryLazy",
		config = function()
			require("userPlugins.lualine-config")
			-- vim.api.nvim_set_hl(0, "Statusline", { bg = "Black" })
		end,
	},

	-- matchup
	{
		"andymass/vim-matchup",
		event = "VeryLazy",
		config = function()
			vim.g.mathcup_matchparen_offscreen = { mehtod = "popup" }
		end,
	},

	-- tab bar line
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "kyazdani42/nvim-web-devicons",
		event = "VeryLazy",

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
		event = "InsertEnter",
		config = function()
			require("userPlugins.colorizer-config")
		end,
	},

	-- flaoting terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
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
			require("userPlugins.lsp-config")
		end,
	},

	-- This tiny plugin adds vscode-liek pictorgrams to neoivm built in lsp
	{ "onsails/lspkind.nvim", event = "CursorHold", event = "VeryLazy" },

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
		event = "VeryLazy",
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
	-- {
	-- 	"glepnir/lspsaga.nvim",
	-- 	branch = "main",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		-- require("userPlugins.lspsaga-config")
	-- 		require("lspsaga").setup({
	--
	-- 			ui = {
	-- 				-- currently only round theme
	-- 				theme = "round",
	-- 				-- this option only work in neovim 0.9
	-- 				title = true,
	-- 				-- border type can be single,double,rounded,solid,shadow.
	-- 				border = "single",
	-- 				winblend = 0,
	-- 				expand = "",
	-- 				collapse = "",
	-- 				preview = " ",
	-- 				code_action = "💡",
	-- 				diagnostic = "🐞",
	-- 				incoming = " ",
	-- 				outgoing = " ",
	-- 				colors = {
	-- 					--float window normal background color
	-- 					normal_bg = "None",
	-- 					--title background color
	-- 					title_bg = "None",
	-- 					red = "#e95678",
	-- 					magenta = "#b33076",
	-- 					orange = "white",
	-- 					yellow = "#f7bb3b",
	-- 					green = "#afd700",
	-- 					cyan = "#36d0e0",
	-- 					blue = "#61afef",
	-- 					purple = "#CBA6F7",
	-- 					white = "#d1d4cf",
	-- 					black = "gray",
	-- 				},
	-- 				kind = {},
	-- 			},
	-- 		})
	-- 	end,
	-- },

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

	-- preety quickfix window and easier navigation and basic auto cmds and user defined functions
	{
		"kevinhwang91/nvim-bqf",
		event = "CursorHold",
		config = function()
			require("bqf").setup()
			require("autocmds")
			require("userFunctions")
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

	-- {
	-- 	"SmiteshP/nvim-navic",
	-- 	event = "VeryLazy",
	-- },
	-- {
	-- 	"utilyre/barbecue.nvim",
	-- 	name = "barbecue",
	-- 	event = "VeryLazy",
	-- 	version = "*",
	-- 	dependencies = {
	-- 		"SmiteshP/nvim-navic",
	-- 	},
	-- 	opts = {
	-- 		---Whether to attach navic to language servers automatically.
	-- 		---
	-- 		---@type boolean
	-- 		attach_navic = true,
	--
	-- 		---Whether to create winbar updater autocmd.
	-- 		---
	-- 		---@type boolean
	-- 		create_autocmd = true,
	--
	-- 		---Buftypes to enable winbar in.
	-- 		---
	-- 		---@type string[]
	-- 		include_buftypes = { "" },
	--
	-- 		---Filetypes not to enable winbar in.
	-- 		---
	-- 		---@type string[]
	-- 		exclude_filetypes = { "netrw", "toggleterm" },
	--
	-- 		modifiers = {
	-- 			---Filename modifiers applied to dirname.
	-- 			---
	-- 			---See: `:help filename-modifiers`
	-- 			---
	-- 			---@type string
	-- 			dirname = ":p:~",
	--
	-- 			---Filename modifiers applied to basename.
	-- 			---
	-- 			---See: `:help filename-modifiers`
	-- 			---
	-- 			---@type string
	-- 			basename = "",
	-- 		},
	--
	-- 		---Whether to display path to file.
	-- 		---
	-- 		---@type boolean
	-- 		show_dirname = true,
	--
	-- 		---Whether to display file name.
	-- 		---
	-- 		---@type boolean
	-- 		show_basename = true,
	--
	-- 		---Whether to replace file icon with the modified symbol when buffer is
	-- 		---modified.
	-- 		---
	-- 		---@type boolean
	-- 		show_modified = false,
	--
	-- 		---Get modified status of file.
	-- 		---
	-- 		---NOTE: This can be used to get file modified status from SCM (e.g. git)
	-- 		---
	-- 		---@type fun(bufnr: number): boolean
	-- 		modified = function(bufnr)
	-- 			return vim.bo[bufnr].modified
	-- 		end,
	--
	-- 		---Whether to show/use navic in the winbar.
	-- 		---
	-- 		---@type boolean
	-- 		show_navic = true,
	--
	-- 		---Get leading custom section contents.
	-- 		---
	-- 		---NOTE: This function shouldn't do any expensive actions as it is run on each
	-- 		---render.
	-- 		---
	-- 		---@type fun(bufnr: number, winnr: number): barbecue.Config.custom_section
	-- 		lead_custom_section = function()
	-- 			return " "
	-- 		end,
	--
	-- 		---@alias barbecue.Config.custom_section
	-- 		---|string # Literal string.
	-- 		---|{ [1]: string, [2]: string? }[] # List-like table of `[text, highlight?]` tuples in which `highlight` is optional.
	-- 		---
	-- 		---Get custom section contents.
	-- 		---
	-- 		---NOTE: This function shouldn't do any expensive actions as it is run on each
	-- 		---render.
	-- 		---
	-- 		---@type fun(bufnr: number, winnr: number): barbecue.Config.custom_section
	-- 		custom_section = function()
	-- 			return " "
	-- 		end,
	--
	-- 		---@alias barbecue.Config.theme
	-- 		---|'"auto"' # Use your current colorscheme's theme or generate a theme based on it.
	-- 		---|string # Theme located under `barbecue.theme` module.
	-- 		---|barbecue.Theme # Same as '"auto"' but override it with the given table.
	-- 		---
	-- 		---Theme to be used for generating highlight groups dynamically.
	-- 		---
	-- 		---@type barbecue.Config.theme
	-- 		theme = "auto",
	--
	-- 		---Whether context text should follow its icon's color.
	-- 		---
	-- 		---@type boolean
	-- 		context_follow_icon_color = false,
	--
	-- 		symbols = {
	-- 			---Modification indicator.
	-- 			---
	-- 			---@type string
	-- 			modified = "●",
	--
	-- 			---Truncation indicator.
	-- 			---
	-- 			---@type string
	-- 			ellipsis = "…",
	--
	-- 			---Entry separator.
	-- 			---
	-- 			---@type string
	-- 			separator = "",
	-- 		},
	--
	-- 		---@alias barbecue.Config.kinds
	-- 		---|false # Disable kind icons.
	-- 		---|table<string, string> # Type to icon mapping.
	-- 		---
	-- 		---Icons for different context entry kinds.
	-- 		---
	-- 		---@type barbecue.Config.kinds
	-- 		kinds = {
	-- 			File = "",
	-- 			Module = "",
	-- 			Namespace = "",
	-- 			Package = "",
	-- 			Class = "",
	-- 			Method = "",
	-- 			Property = "",
	-- 			Field = "",
	-- 			Constructor = "",
	-- 			Enum = "",
	-- 			Interface = "",
	-- 			Function = "",
	-- 			Variable = "",
	-- 			Constant = "",
	-- 			String = "",
	-- 			Number = "",
	-- 			Boolean = "",
	-- 			Array = "",
	-- 			Object = "",
	-- 			Key = "",
	-- 			Null = "",
	-- 			EnumMember = "",
	-- 			Struct = "",
	-- 			Event = "",
	-- 			Operator = "",
	-- 			TypeParameter = "",
	-- 		},
	-- 	},
	-- },
	-- {
	-- 	"VidocqH/lsp-lens.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("lsp-lens").setup()
	-- 	end,
	-- },
}, opts)
