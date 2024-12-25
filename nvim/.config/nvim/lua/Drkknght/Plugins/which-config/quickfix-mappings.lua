QUICKFIX_MAPPINGS = {
	-- quickfix list

	{ "<leader>q", group = "Quicfix list" },
	{
		"<leader>qw",
		":exe 'silent grep! <cword> %' | exe 'copen'<cr>",
		desc = "find word under the cursor and list in quickfix list",
	},
	{ "<leader>qq", "<cmd>copen<cr>", desc = "Quickfix open" },
	{ "<leader>qe", "<cmd>cclose<cr>", desc = "Quickfix close" },
	{ "<leader>ql", "<cmd>lopen<cr>", desc = "LocationList open" },
	{
		"<leader>qf",
		"yiw<bar><cmd>FzfLua lines<cr><bar><ESC>pi",
		desc = "see current word under cursor in fzf buffer",
	},
	{ "<leader>qo", "<cmd>lclose<cr>", desc = "LocationList close" },
}

return QUICKFIX_MAPPINGS
