require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
	},
	numbers = "buffer_id",
	indicator_icon = "} ",
	left_trunc_marker = "",
	right_trunc_marker = "",
	offsets = {
		{
			filetype = "NvimTree",
			text = "File Explorer",
			highlight = "Directory",
			text_align = "left",
		},
	},
	show_buffer_icons = true,
	highlights = {
		fill = {
			guibg = "#2A2A2A",
		},
	},
	separator_style = "slant",
})
