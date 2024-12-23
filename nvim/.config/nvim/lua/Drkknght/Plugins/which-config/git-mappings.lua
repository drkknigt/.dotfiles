GIT_MAPPINGS = {
	-- git
	{ "<leader>g", group = "Git" },
	{ "<leader>gg", "<cmd>Git<cr>", desc = "open Git Fugitive" },
	{
		"<leader>gw",
		"<cmd>lua require 'gitsigns'.setqflist('all')<cr>",
		desc = "list all changes in the current repo",
	},
	{ "<leader>ga", "<cmd>lua require 'gitsigns'.setqflist()<cr>", desc = "list all changes in the current file" },
	{ "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "list git-Blame" },
	{ "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
	{ "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
	{ "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
	{ "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
	{ "<leader>gf", "<cmd>lua require 'gitsigns'.stage_buffer()<cr>", desc = "Stage buffer" },
	{ "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
	{ "<leader>gi", "<cmd>Git<cr>", desc = "see git status in telescope" },
	{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout and list git branch in telescope" },
	{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit in telescope" },
	{ "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "use git-Diff" },
}

return GIT_MAPPINGS
