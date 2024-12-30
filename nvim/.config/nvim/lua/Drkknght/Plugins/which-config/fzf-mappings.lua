FZF_MAPPINGS = {
	-- fzf
	{ "<leader>f", group = "Fzf" },
	{
		"<leader>ft",
		function()
			require("fzf-lua").lsp_document_symbols({
				fzf_opts = { ["--border-label"] = " LSP Document symbols " },
				prompt = "  ",
			})
		end,
		desc = "show lsp symbols in fzf ",
	},
	{
		"<leader>fd",
		function()
			require("Drkknght.core.userFunctions").open_dir_fzf(math.floor(vim.api.nvim_win_get_height(0) / 2.3))
		end,
		desc = "open directory via fzf in oil",
	},
	{
		"<leader>fo",
		function()
			require("fzf-lua").oldfiles({
				fzf_opts = { ["--border-label"] = " Oldfiles " },
				prompt = "  ",
			})
		end,
		desc = "find old files fzf",
	},
	{ "<leader>fR", "<cmd>FzfLua resume<cr>", desc = "resume fzflua" },
	{
		"<leader>fm",
		-- "<cmd>FzfLua git_files fzf_opts.--border-label=git-files prompt=<Space><Space><cr>",
		function()
			require("fzf-lua").helptags({
				fzf_opts = { ["--border-label"] = " Help " },
				prompt = "  ",
			})
		end,
		desc = "help",
	},
	{
		"<leader>fk",
		-- "<cmd>FzfLua git_files fzf_opts.--border-label=git-files prompt=<Space><Space><cr>",
		function()
			require("fzf-lua").keymaps({
				fzf_opts = { ["--border-label"] = " key maps " },
				prompt = "  ",
			})
		end,
		desc = "search keymaps",
	},
	{
		"<leader>fg",
		-- "<cmd>FzfLua git_files fzf_opts.--border-label=git-files prompt=<Space><Space><cr>",
		function()
			require("fzf-lua").git_files({
				fzf_opts = { ["--border-label"] = " git-files " },
				prompt = "  ",
			})
		end,
		desc = "find git files",
	},
	{
		"<leader>fs",
		function()
			require("fzf-lua").live_grep({
				fzf_opts = { ["--border-label"] = " live grep " },
				prompt = "  ",
			})
		end,
		desc = "live grep",
	},
	{
		"<leader>fc",
		function()
			require("fzf-lua").colorschemes({
				fzf_opts = { ["--border-label"] = " colorscheme " },
				prompt = "  ",
			})
		end,
		desc = "colorschemes",
	},
	{
		"<leader>fb",
		function()
			require("fzf-lua").blines({
				fzf_opts = { ["--border-label"] = " lines " },
				prompt = "  ",
			})
		end,
		desc = "fzf lines buffers",
	},
	{
		"<leader>fl",
		function()
			require("fzf-lua").lines({
				fzf_opts = { ["--border-label"] = " buffer-lines " },
				prompt = "  ",
			})
		end,
		desc = "fzf lines search on all buffers",
	},
	{
		"<leader>fh",
		function()
			require("Drkknght.core.userFunctions").open_dotfiles_fzf()
		end,
		desc = "find files fzf from dotfiles directory",
	},
	{
		"<leader>fa",
		function()
			require("Drkknght.core.userFunctions").open_ansible_fzf()
		end,
		desc = "find files fzf from dotfiles directory",
	},
	{
		"<leader>fw",
		function()
			require("Drkknght.core.userFunctions").open_plugins_fzf()
		end,
		desc = "find files in plugins dir",
	},
	{
		"<leader>ff",
		function()
			require("Drkknght.core.userFunctions").fzf_search_files("current")
		end,
		-- ":lua require('fzf-lua').files({cwd = '~'})<CR>",
		desc = "find files fzf from home directory",
	},
	{
		"<leader>fe",
		function()
			require("Drkknght.core.userFunctions").fzf_search_files("Home")
		end,
		-- ":lua require('fzf-lua').files({cwd = '~'})<CR>",
		desc = "find files fzf from home directory",
	},
}

return FZF_MAPPINGS
