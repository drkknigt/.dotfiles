local PLUGINS = {} -- table to load plugins

--------------------------------plugin definitions--------------------------------

-- lazy load custom files
local custom = {
	"Drkknght",
	dir = "/home",
	config = function()
		require("Drkknght.core.autocmds")
		require("Drkknght.core.userFunctions")
		require("Drkknght.Plugins.neovide")
		require("Drkknght.core.keymaps")
		-- lazy load statusline and winbar
		vim.api.nvim_set_hl(0, "Statusline", { bg = "Black", fg = "gray" })
		vim.opt.statusline = require("Drkknght.core.userFunctions").get_winbar("status")
		vim.opt.winbar = require("Drkknght.core.userFunctions").get_winbar("global")
	end,
	event = "VeryLazy",
}

-- profile startuptime
local vim_staruptime = {
	-- https://github.com/dstein64/vim-startuptime

	"dstein64/vim-startuptime",
	event = "VeryLazy",
	-- commit = "cb4c112b9e0f224236ee4eab6bf5153406b3f88b",
}

--oil.nvim for editing file system like normal buffer

local oil = {
	-- https://github.com/stevearc/oil.nvim
	"stevearc/oil.nvim",
	event = "VeryLazy",
	config = function()
		require("Drkknght.Plugins.oil-config")
	end,
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

------------------------------- themes for neovim ---------------------------

local gruvbox_baby = {
	-- https://github.com/luisiacc/gruvbox-baby
	"luisiacc/gruvbox-baby",
	event = "BufEnter",
	config = function()
		require("Drkknght.core.color-config")
	end,
}

-- completion resources via nvim-cmp

local cmp = {
	-- https://github.com/hrsh7th/nvim-cmp
	-- https://github.com/hrsh7th/cmp-buffer
	-- https://github.com/hrsh7th/cmp-nvim-lsp
	-- https://github.com/hrsh7th/cmp-path
	-- https://github.com/hrsh7th/cmp-cmdline
	-- https://github.com/winston0410/cmd-parser.nvim
	-- https://github.com/ray-x/cmp-treesitter
	-- https://github.com/L3MON4D3/LuaSnip
	-- https://github.com/saadparwaiz1/cmp_luasnip
	-- https://github.com/rafamadriz/friendly-snippets
	"hrsh7th/nvim-cmp",
	event = "CursorHold",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"winston0410/cmd-parser.nvim",
		"ray-x/cmp-treesitter",
		"amarakon/nvim-cmp-buffer-lines",
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
			version = "2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		pcall(require, "Drkknght.Plugins.cmp-config")
	end,
}

-- debugger protocol

local nvim_dap = {
	-- https://github.com/mfussenegger/nvim-dap
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
	},
	event = "VeryLazy",
	config = function()
		require("Drkknght.Plugins.dap-config")
	end,
}

-- fuzzy finders and telescope

local telescope = {
	-- https://github.com/nvim-telescope/telescope.nvim
	-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
	-- https://github.com/nvim-telescope/telescope-file-browser.nvim
	-- https://github.com/dhruvmanila/telescope-bookmarks.nvim
	-- https://github.com/nvim-telescope/telescope-ui-select.nvim
	-- https://github.com/nvim-telescope/telescope-project.nvim
	-- https://github.com/nvim-lua/plenary.nvim
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
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
		require("Drkknght.Plugins.telescope-setting")
	end,
}

local fzf_lua = {
	-- https://github.com/ibhagwan/fzf-lua
	-- https://github.com/junegunn/fzf
	"ibhagwan/fzf-lua",
	event = "CursorHold",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("Drkknght.Plugins.fzflua")
	end,
}

-- lsp -sgnature for functions and methods
local signature = {
	-- https://github.com/ray-x/lsp_signature.nvim
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	config = function()
		require("Drkknght.Plugins.signature")
	end,
}

-- surround text objects with chars with nvim-surround

local nvim_surround = {
	-- https://github.com/kylechui/nvim-surround
	"kylechui/nvim-surround",
	event = "VeryLazy",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	config = function()
		require("Drkknght.Plugins.surround")
		-- Configuration here, or leave empty to use defaults
	end,
}

-- developer icons to display icons and fonts related to programming

local nvim_web_devicons = {
	-- https://github.com/kylechui/nvim-web-devicons
	"kyazdani42/nvim-web-devicons",
	event = "CursorHold",
}

-- treesitter for syntax parsing and highlighting

local nvim_treesitter = {
	-- https://github.com/nvim-treesitter/nvim-treesitter
	-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
	-- https://github.com/mizlan/iswap.nvim
	-- https://github.com/nvim-treesitter/nvim-treesitter-refactor
	-- https://github.com/windwp/nvim-ts-autotag
	-- https://github.com/HiPhish/rainbow-delimiters.nvim
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "VeryLazy",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			config = function()
				vim.g.skip_ts_context_commentstring_module = true
			end,
		},
		{
			"mizlan/iswap.nvim",
			event = "VeryLazy",
			config = function()
				require("Drkknght.Plugins/iswaaap-config")
			end,
		},
		"nvim-treesitter/nvim-treesitter-refactor",
		"windwp/nvim-ts-autotag",
		"HiPhish/rainbow-delimiters.nvim",
	},
	config = function()
		require("Drkknght.Plugins.treesitter")
	end,
}

-- matchup
local matchup = {
	-- https://github.com/andymass/vim-matchup
	"andymass/vim-matchup",
	event = "VeryLazy",
	config = function(_, opts)
		local ok, cmp = pcall(require, "cmp")
		if ok then
			cmp.event:on("menu_opened", function()
				vim.b.matchup_matchparen_enabled = false
			end)
			cmp.event:on("menu_closed", function()
				vim.b.matchup_matchparen_enabled = true
			end)
		end
		vim.g.matchup_matchparen_offscreen = { method = "popup" }
		require("match-up").setup(opts)
	end,
}

-- insert or delete brackets, parens, quotes in pair

local nvim_autopairs = {
	-- https://github.com/windwp/nvim-autopairs
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		require("Drkknght.Plugins.autopairs-config")
	end,
}

-- whichkey is  a lua plugin for neovim that displays a popup with possible key bindings of the command you started typing.

local which_key = {
	-- https://github.com/folke/which-key.nvim
	"folke/which-key.nvim",
	event = "CursorHold",
	config = function()
		require("Drkknght.Plugins.which-config")
	end,
}

-- hex  and color highligher
local nvim_colorizer = {
	-- https://github.com/norcalli/nvim-colorizer.lua
	"norcalli/nvim-colorizer.lua",
	event = "InsertEnter",
	config = function()
		require("Drkknght.Plugins.colorizer-config")
	end,
}

-- neovim commenter
local comment = {
	-- https://github.com/numToStr/Comment.nvim
	"numToStr/Comment.nvim",
	event = "CursorHold",
	config = function()
		require("Drkknght.Plugins.comment-config")
	end,
}

-- plugin to install language serves with ease and setup lsp
--
local mason = {
	-- https://github.com/williamboman/mason.nvim
	-- https://github.com/williamboman/mason-lspconfig.nvim
	"williamboman/mason.nvim",
	event = "CursorHold",
	-- build = ":MasonUpdate",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
}
local nvim_lspconfig = {
	-- https://github.com/neovim/nvim-lspconfig
	"neovim/nvim-lspconfig",
	event = "CursorHold",
	config = function()
		require("Drkknght.Plugins.lsp-config")
	end,
}

-- This tiny plugin adds vscode-liek pictorgrams to neoivm built in lsp
local lspkind = {
	-- https://github.com/onsails/lspkind.nvim
	"onsails/lspkind.nvim",
	event = "VeryLazy",
}

-- indent line

local indent_blankline = {
	-- https://github.com/lukas-reineke/indent-blankline.nvim
	"lukas-reineke/indent-blankline.nvim",
	event = "VeryLazy",
	config = function()
		require("Drkknght.Plugins.indentline-config")
	end,
	main = "ibl",
	opts = {},
}

-- null-ls server for autocomplete,linting, formatting and hover
local null_ls = {
	-- https://github.com/nvimtools/none-ls.nvim
	"jose-elias-alvarez/null-ls.nvim",
	event = "CursorHold",
	config = function()
		require("Drkknght.Plugins.null-config")
	end,
}

-- goto-preview for lsp
local goto_preview = {
	-- https://github.com/rmagatti/goto-preview
	"rmagatti/goto-preview",
	event = "CursorHold",
	config = function()
		require("Drkknght.Plugins.goto-config")
	end,
}

-- git plugins
local gitsigns = {
	-- https://github.com/lewis6991/gitsigns.nvim
	"lewis6991/gitsigns.nvim",
	tag = "release",
	event = "CursorHold",
	config = function()
		require("Drkknght.Plugins.gitsigns-config")
	end,
}

local vim_fugitive = {
	-- https://github.com/tpope/vim-fugitive
	"tpope/vim-fugitive",
	event = "VeryLazy",
}

-- preety quickfix window and easier navigation and basic auto cmds and user defined functions
local nvim_bqf = {
	-- https://github.com/kevinhwang91/nvim-bqf
	"kevinhwang91/nvim-bqf",
	event = "VeryLazy",
	config = function()
		require("bqf").setup({
			preview = {
				winblend = 0,
			},
			func_map = {
				open = "o",
				openc = "<CR>",
			},
		})
	end,
}

-- tabout plugin
local tabout = {
	-- https://github.com/abecodes/tabout.nvim
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
}
local ts_node_action = {
	-- https://github.com/ckolkey/ts-node-action
	"ckolkey/ts-node-action",
	event = "VeryLazy",
	dependencies = { "nvim-treesitter" },
}

-- jump fast with flash

local flash = {
	-- https://github.com/folke/flash.nvim
	"folke/flash.nvim",
	event = "CursorHold",
	opts = require("Drkknght.Plugins.flash-plugin"),

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
}

-- run commands in tmux
local vim_tmux_runner = {
	-- https://github.com/christoomey/vim-tmux-runner
	"christoomey/vim-tmux-runner",
	event = "VeryLazy",
}

-- compile code inside nvim window
local compile_mode = {
	-- https://github.com/ej-shafran/compile-mode.nvim
	-- https://github.com/m00qek/baleia.nvim
	-- https://github.com/nvim-lua/plenary.nvim
	"ej-shafran/compile-mode.nvim",
	branch = "latest",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		---@type CompileModeOpts
		vim.g.compile_mode = {
			-- to add ANSI escape code support, add:
			baleia_setup = false,
			default_command = "pwd",
			ask_about_save = false,
		}
	end,
}

-- run llms in nvim
local llm_gen = {
	-- https://github.com/David-Kunz/gen.nvim
	"David-Kunz/gen.nvim",
	event = "VeryLazy",
	opts = {
		model = "llama3.2", -- The default model to use.
		host = "localhost", -- The host running the Ollama service.
		port = "11434", -- The port on which the Ollama service is listening.
		quit_map = "q", -- set keymap for close the response window
		retry_map = "<c-r>", -- set keymap to re-send the current prompt
		init = function(options)
			pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
		end,
		-- Function to initialize Ollama
		command = function(options)
			local body = { model = options.model, stream = true }
			return "curl --silent --no-buffer -X POST http://"
				.. options.host
				.. ":"
				.. options.port
				.. "/api/chat -d $body"
		end,
		-- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
		-- This can also be a command string.
		-- The executed command must return a JSON object with { response, context }
		-- (context property is optional).
		-- list_models = '<omitted lua function>', -- Retrieves a list of model names
		display_mode = "float", -- The display mode. Can be "float" or "split".
		show_prompt = false, -- Shows the prompt submitted to Ollama.
		show_model = true, -- Displays which model you are using at the beginning of your chat session.
		no_auto_close = false, -- Never closes the window automatically.
		debug = false, -- Prints errors and the command which is run.
	},
}

-- utility plugins
utility_plugins = {
	vim_staruptime,
	oil,
	nvim_surround,
	nvim_bqf,
	flash,
	matchup,
}

-- plugins for themes and editor look
theme_aesthetic_plugins = {
	gruvbox_baby,
	nvim_web_devicons,
	indent_blankline,
}

-- fuzzy finders
fuzzy_finder_plugins = {
	telescope,
	fzf_lua,
}

-- load plugins for treesitter
treesitter_plugins = {
	nvim_treesitter,
	ts_node_action,
	nvim_autopairs,
	nvim_colorizer,
	which_key,
	tabout,
	comment,
}

-- lsp plugins
lsp_plugins = {
	mason,
	nvim_lspconfig,
	lspkind,
	nvim_dap,
	null_ls,
	goto_preview,
	cmp,
	signature,
}

-- git plugins
git_plugins = {
	gitsigns,
	vim_fugitive,
}

-- runners and ai
runners_ai_plugins = {
	vim_tmux_runner,
	compile_mode,
	llm_gen,
}

-- plugins to load
PLUGINS = {
	custom,
	utility_plugins,
	theme_aesthetic_plugins,
	fuzzy_finder_plugins,
	treesitter_plugins,
	lsp_plugins,
	git_plugins,
	runners_ai_plugins,
}
return PLUGINS
