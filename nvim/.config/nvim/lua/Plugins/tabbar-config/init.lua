require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",

		numbers = "buffer_id",
		indicator = {
			icon = "| ",
			sytle = "icon",
		},
		left_trunc_marker = "",
		right_trunc_marker = "",
		separator_style = "slant",
		show_buffer_icons = true,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
			},
		},
	},
	highlights = {
		fill = {
			bg = "#2A2A2A",
		},
		tab_selected = {
			fg = "red",
			bg = "white",
		},
	},
})
