local fn = vim.fn
local present, impatient = pcall(require, "impatient")

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.api.nvim_command("packadd packer.nvim")
	-- vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window

packer.init({
	-- profile = {
	--     enable = true,
	--     threshold = 1
	-- },
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- install all the plugins

return require("packer").startup({
	function(use)
		-- My plugins here
		-- packer manages itself

		use("wbthomason/packer.nvim")

		-- startup time and optimization plugins

		use("lewis6991/impatient.nvim")
		use({ "nathom/filetype.nvim" })
		use("dstein64/vim-startuptime")

		-- winbar file info

		-- better escape mode
		use({
			"max397574/better-escape.nvim",
			event = "CursorHold",
			config = function()
				require("better_escape").setup({
					mapping = { "jk", "kj" },
					timeout = 101,
				})
			end,
		})

		-- gruvbox-baby theme

		use({
			"luisiacc/gruvbox-baby",
			"folke/tokyonight.nvim",
			-- event = "BufEnter",
			-- config = function()
			-- require("color-config")
			-- vim.api.nvim_command("luafile ~/.config/nvim/lua/color-config/init.lua")
			-- vim.api.nvim_command("luafile ~/.config/nvim/lua/userPlugins/lualine-config/init.lua")
			-- end,
		})

		-- vim matchup to match pairs and language constructs

		-- staline
		-- use({
		-- 	"tamton-aquib/staline.nvim",
		-- 	event = "BufEnter",
		-- 	config = function()
		-- 		require("userPlugins.staline-config")
		-- 	end,
		-- })

		-- compeltion resources

		use({
			"hrsh7th/nvim-cmp",
			after = "lspkind.nvim",
			config = function()
				pcall(require, "userPlugins.cmp-config")
			end,
		})
		use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
		use({ "winston0410/cmd-parser.nvim", after = "nvim-cmp" })
		use({ "ray-x/cmp-treesitter", after = "nvim-cmp" })

		-- snippet engine

		use({
			"L3MON4D3/LuaSnip",
			after = "lspkind.nvim",
			-- config = function()
			-- 	require("userPlugins.cmp-config")
			-- end,
		})

		-- snippet completion

		use({ "saadparwaiz1/cmp_luasnip", after = "lspkind.nvim" })

		-- some friendly-snippets form vscode-like

		use({ "rafamadriz/friendly-snippets", after = "lspkind.nvim" })

		-- debugger protocol

		use({ "mfussenegger/nvim-dap", event = "CursorHold" })
		use({ "Pocco81/DAPInstall.nvim", event = "CursorHold" })

		-- fuzzy finders and telescope

		use({
			"nvim-telescope/telescope.nvim",
			requires = { { "nvim-lua/plenary.nvim" } },
			after = "telescope-fzf-native.nvim",
			config = function()
				require("userPlugins._telescope-setting")
			end,
		})
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", after = "telescope-file-browser.nvim" })
		use({ "nvim-telescope/telescope-file-browser.nvim", after = "telescope-bookmarks.nvim" })
		use({ "dhruvmanila/telescope-bookmarks.nvim", after = "telescope-ui-select.nvim" })
		use({ "nvim-telescope/telescope-ui-select.nvim", after = "telescope-project.nvim" })
		use({ "nvim-telescope/telescope-project.nvim", event = "CursorHold" })

		use({ "junegunn/fzf", run = "./install --bin", event = "CursorHold" })
		use({
			"ibhagwan/fzf-lua",
			requires = { "kyazdani42/nvim-web-devicons" },
			after = "nvim-fzf",
			config = function()
				require("userPlugins.fzflua")
			end,
		})
		use({ "vijaymarupudi/nvim-fzf", after = "fzf" })

		-- lsp -sgnature for functions and methods

		use({ "ray-x/lsp_signature.nvim", event = "CursorHold" })

		-- mkdir for nvim

		use({
			"jghauser/mkdir.nvim",
			event = "CursorHold",
			config = function()
				require("mkdir")
			end,
		})

		-- lsp progress

		use({
			"j-hui/fidget.nvim",
			event = "BufReadPre",
			config = function()
				require("fidget").setup({})
			end,
		})
		-- surround text objects with chars

		use({ "machakann/vim-sandwich" })

		-- developer icons to display icons and fonts related to programming

		use({ "kyazdani42/nvim-web-devicons", after = "telescope.nvim" })
		use({ "ryanoasis/vim-devicons", after = "telescope.nvim" })

		-- treesitter for syntax parsing and highlighting

		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

		use({ "nvim-treesitter/nvim-treesitter-textobjects" })
		use({ "JoosepAlviste/nvim-ts-context-commentstring" })
		use({ "mizlan/iswap.nvim" })
		use({ "nvim-treesitter/nvim-treesitter-refactor" })
		use({ "mfussenegger/nvim-ts-hint-textobject" })
		--    config = function()
		--        require 'userPlugins.iswaaap-config'
		--    end

		-- auto complete tag

		use({
			"windwp/nvim-ts-autotag",
			event = "InsertEnter",
			config = function()
				require("userPlugins.treesitter")
			end,
		})

		-- colors for brackets

		use({
			"p00f/nvim-ts-rainbow",
			event = "InsertEnter",
			config = function()
				require("userPlugins.treesitter")
			end,
		})

		-- hop for easy motion

		use({
			"phaazon/hop.nvim",
			event = "CursorHold",
			config = function()
				require("hop").setup()
			end,
		})

		-- status line with lua

		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			event = "VimEnter",
			config = function()
				require("userPlugins.lualine-config")
				-- vim.api.nvim_set_hl(0, "Statusline", { bg = "Black" })
			end,
		})

		-- matchup
		use({
			"andymass/vim-matchup",
		})
		-- tab bar line
		use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" }) --,event = 'BufEnter',
		--     config = function()
		--         require('userPlugins.tabbar-config')
		--     end
		-- }

		-- nerdtree alternative for file navigation

		use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons", -- optional, for file icon
			},
			event = "CursorHold",
			config = function()
				require("userPlugins.nvimtree-config")
			end,
		})

		-- insert or delete brackets, parens, quotes in pair

		use({
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = function()
				require("userPlugins.autopairs-config")
			end,
		})

		-- whichkey is  a lua plugin for neovim that displays a popup with possible key bindings of the command you started typing.

		use({
			"folke/which-key.nvim",
			event = "CursorHold",
			config = function()
				require("userPlugins.which-config")
			end,
		})

		-- hex  and color highligher

		use({
			"norcalli/nvim-colorizer.lua",
			event = "CursorHold",
			config = function()
				require("userPlugins.colorizer-config")
			end,
		})

		-- flaoting terminal

		use({
			"akinsho/toggleterm.nvim",
			tag = "v1.*",
			event = "CursorHold",
			config = function()
				require("userPlugins.terminal-config")
			end,
		})

		-- neovim commenter

		use({
			"numToStr/Comment.nvim",
			event = "CursorHold",
			config = function()
				require("userPlugins.comment-config")
			end,
		})

		-- library to implement plugins
		use({ "nvim-lua/plenary.nvim" })

		-- This plugin allows for declaratiely configuring, launching, and initializing language serves you have installed on your system

		use({
			"neovim/nvim-lspconfig",
			after = "mason.nvim",
			config = function()
				pcall(require, "userPlugins.lsp-config")
			end,
		})

		--  -- An implementaiont of the Popup API from vim in Neovim.

		use({ "nvim-lua/popup.nvim", after = "mason.nvim" })

		--  -- plugin to install language serves with ease

		use({ "williamboman/mason.nvim", event = "CursorHold" })
		use({ "williamboman/mason-lspconfig.nvim", event = "CursorHold" })
		--
		-- This tiny plugin adds vscode-liek pictorgrams to neoivm built in lsp
		--
		use({ "onsails/lspkind.nvim", event = "CursorHold" })
		--
		-- tags and symbols in the file

		use({
			"simrat39/symbols-outline.nvim",
			event = "CursorHold",
			config = function()
				require("symbols-outline").setup()
			end,
		})
		-- use {'simrat39/symbols-outline.nvim'}
		--
		-- indent line

		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "CursorHold",
			config = function()
				require("userPlugins.indentline-config")
			end,
		})
		--
		-- load files faster

		-- null-ls server for autocomplete,linting, formatting and hover

		use({
			"jose-elias-alvarez/null-ls.nvim",
			event = "CursorHold",
			config = function()
				require("userPlugins.null-config")
			end,
		})

		-- lsp saga gives ui to certain lsp task

		use({
			"glepnir/lspsaga.nvim",
			branch = "main",
			event = "CursorHold",
			config = function()
				-- require("userPlugins.lspsaga-config")
				local saga = require("lspsaga")
				saga.init_lsp_saga({
					symbol_in_winbar = {
						enable = true,
						show_file = true,
						file_formatter = "%:.",
					},
				})
			end,
		})

		-- goto-preview for lsp

		use({
			"rmagatti/goto-preview",
			event = "CursorHold",
			config = function()
				require("userPlugins.goto-config")
			end,
		})

		-- git plugins

		use({
			"lewis6991/gitsigns.nvim",
			tag = "release",
			event = "CursorHold",
			config = function()
				require("userPlugins.gitsigns-config")
			end,
		})

		-- run code

		use({
			"is0n/jaq-nvim",
			event = "CursorHold",
			config = function()
				require("userPlugins.jaq-config")
			end,
		})

		-- show lsp code actions signs

		-- preety quickfix window and easier navigation

		use({
			"kevinhwang91/nvim-bqf",
			event = "CursorHold",
			config = function()
				require("bqf").setup()
			end,
		})

		-- harpoon for quick naviation to important files

		-- Automatically set up your configuration after cloning packer.nvim

		-- Put this at the end after all plugins
		if PACKER_BOOTSTRAP then
			require("packer").sync()
		end
	end,
	-- config = {
	--     profile = {
	--         enable = true,
	--         threshold = 1
	--     }
	-- }
})
