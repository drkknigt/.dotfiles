FZF_MAPPINGS = {
	-- fzf
	{ "<leader>f", group = "Fzf" },
	{ "<leader>ft", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "show lsp symbols in fzf" },
	{ "<leader>fm", "<cmd>FzfLua helptags<cr>", desc = "find git files" },
	{ "<leader>fd", require("Drkknght.core.userFunctions").open_dir_fzf, desc = "open directory via fzf in oil" },
	{ "<leader>fo", "<cmd>FzfLua oldfiles<cr>", desc = "find old files fzf" },
	{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "find files fzf" },
	{ "<leader>fR", "<cmd>FzfLua resume<cr>", desc = "resume fzflua" },
	{ "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "show keymaps in fzflua" },
	{ "<leader>fg", "<cmd>FzfLua git_files<cr>", desc = "find git files" },
	{ "<leader>fs", "<cmd>FzfLua live_grep<cr>", desc = "grep fzf" },
	{ "<leader>fc", "<cmd>FzfLua colorschemes<cr>", desc = "colorschemes" },
	{ "<leader>fb", "<cmd>FzfLua blines<cr>", desc = "fzf lines buffers" },
	{ "<leader>fl", "<cmd>FzfLua lines<cr>", desc = "fzf lines search on all buffers" },
	{
		"<leader>fh",
		require("Drkknght.core.userFunctions").open_dotfiles_fzf,
		desc = "find files fzf from dotfiles directory",
	},
	{
		"<leader>fa",
		require("Drkknght.core.userFunctions").open_ansible_fzf,
		desc = "find files fzf from dotfiles directory",
	},
	{
		"<leader>fw",
		require("Drkknght.core.userFunctions").open_plugins_fzf,
		desc = "find files in plugins dir",
	},
	{
		"<leader>fe",
		":lua require('fzf-lua').files({cwd = '~'})<CR>",
		desc = "find files fzf from home directory",
	},
	{ "<leader>fr", "yiw<bar><cmd>FzfLua blines<cr><bar><ESC>pi", desc = "paste" },
}

return FZF_MAPPINGS
