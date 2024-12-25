TERMINAL_MAPPINGS = {
	-- Terminal
	{ "<leader>t", group = "terminal" },
	{
		"<leader>tn",
		function()
			require("Drkknght.core.userFunctions").make_term("node", "float")
		end,
		desc = "Node terminal",
	},
	{
		"<leader>tm",
		function()
			require("Drkknght.core.userFunctions").make_term("glow -p", "float")
		end,
		desc = "Glow markdown reader",
	},
	{
		"<leader>tt",
		function()
			require("Drkknght.core.userFunctions").make_term("htop", "float", function()
				vim.api.nvim_set_keymap(
					"t",
					"q",
					[[<C-\><C-n><bar>:q!<cr>:lua print(" ")<cr>]],
					{ silent = true, noremap = true }
				)
			end)
		end,
		desc = "Htop terminal",
	},
	{
		"<leader>tp",
		function()
			require("Drkknght.core.userFunctions").make_term("python3", "float")
		end,
		desc = "Python terminal",
	},
	{
		"<leader>tg",
		function()
			require("Drkknght.core.userFunctions").make_term(
				"lazygit -ucf ~/.dotfiles/lazygit/.config/lazygit/config.yml",
				"float",
				function()
					vim.api.nvim_set_keymap(
						"t",
						"q",
						[[<C-\><C-n><bar>:q!<cr>:lua print(" ")<cr>]],
						{ silent = true, noremap = true }
					)
				end,
				1.2,
				0.9
			)
		end,
		desc = "Lazygit terminal",
	},
	{
		"<leader>tl",
		function()
			require("Drkknght.core.userFunctions").make_term("lua", "float")
		end,
		desc = "Lua terminal",
	},
	{
		"<leader>tf",
		function()
			require("Drkknght.core.userFunctions").make_term("zsh", "float")
		end,
		desc = "Float terminal",
	},
	{
		"<leader>th",
		function()
			require("Drkknght.core.userFunctions").make_term("shell")
		end,
		desc = "Float terminal",
	},
	{ "<leader>th", ":split | term<cr>", desc = "Horizontal terminal" },
	{ "<leader>tv", ":vert term<cr>", desc = "Vertical terminal" },
}
return TERMINAL_MAPPINGS
