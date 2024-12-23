TELESCOPE_MAPPINGS = {
	-- Telescope
	{ "<leader>s", group = "Telescope" },
	{ "<leader>st", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Symbols outline" },
	{ "<leader>sm", "<cmd>Telescope help_tags<cr>", desc = "Symbols outline" },
	{
		"<leader>sd",
		require("Drkknght.core.userFunctions").open_dir_telescope,
		desc = "open directory in oil via telescope",
	},
	{ "<leader>so", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
	{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "find files" },
	{ "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
	{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
	{ "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
	{
		"<leader>sp",
		"<cmd>lua require'telescope.builtin'.find_files({prompt_title='Search files Project Root',cwd = '$PROJECT_ROOT',hidden=true})<cr>",
		desc = "Search files from Tmux project root",
	},
	{
		"<leader>sg",
		"<cmd>lua require'telescope.builtin'.live_grep({prompt_title='Live Grep Project root',cwd = '$PROJECT_ROOT',hidden=true})<cr>",
		desc = "live grep from Tmux project root",
	},
	{
		"<leader>sr",
		"<cmd>lua require'telescope'.extensions.file_browser.file_browser({files=true,grouped=true,depth=1,hidden=true,cwd = '$PROJECT_ROOT'})<cr>",
		desc = "Open tmux project root directory",
	},
	{ "<leader>sq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" },
	{ "<leader>si", "<cmd>Telescope bookmarks<cr>", desc = "Bookmarks" },
	{
		"<leader>se",
		"<cmd>lua require'telescope'.extensions.file_browser.file_browser({files=true,grouped=true,depth=1,hidden=true})<cr>",
		desc = "file-browser-current",
	},
	{ "<leader>ss", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
	{ "<leader>sE", "<cmd>Telescope env<cr>", desc = "Env" },
	{ "<leader>sl", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer lines" },
	{ "<leader>sh", require("Drkknght.core.userFunctions").search_dotfiles, desc = "search dotfiles" },
	{ "<leader>sa", require("Drkknght.core.userFunctions").search_ansible, desc = "search ansible-sync" },
	{ "<leader>sw", require("Drkknght.core.userFunctions").search_plugins, desc = "search ansible-sync" },
	-- d = {"<cmd>lua require('plugins/telescope-config').search_dir()<cr>","dotfiles"},
}
return TELESCOPE_MAPPINGS
