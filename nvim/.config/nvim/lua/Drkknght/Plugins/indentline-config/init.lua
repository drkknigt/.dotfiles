-- vim.opt.termguicolors = true
-- vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])
vim.cmd([[highlight IndentBlanklineContextChar guifg=yellow gui=nocombine]])

require("ibl").setup({
	indent = {
		char = "┊",
	},
	-- scope = {
	-- 	enabled = true,
	-- },
	whitespace = {
		remove_blankline_trail = true,
	},
	exclude = {
		filetypes = {
			"lspinfo",
			"packer",
			"checkhealth",
			"help",
			"man",
            "oil",
			"",
		},
	},
	scope = {
		enabled = true,
		-- highlight = { "SpecialKey", "SpecialKey", "SpecialKey" },
		show_start = false,
		include = {
			node_type = { ["*"] = { "*" } },
		},
	},
	-- char_highlight_list = {
	--     "IndentBlanklineIndent1",
	--     "IndentBlanklineIndent2",
	--     "IndentBlanklineIndent3",
	--     "IndentBlanklineIndent4",
	--     "IndentBlanklineIndent5",
	--     "IndentBlanklineIndent6",
	-- },
	-- show_current_blankline = " ",
	-- show_current_context = true,
	-- show_current_context_start = false,
})
