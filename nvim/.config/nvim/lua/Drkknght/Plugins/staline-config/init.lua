local t = require("staline.config").true_colors
local lsp_signs = (function()
	local lsp_details = ""

	for type, sign in pairs({ Error = " ", Info = " ", Warn = " ", Hint = " " } or {}) do
		local count = #vim.diagnostic.get(0, { severity = type })
		local hl = t and "%#Diagnostic" .. type .. "#" or " "
		--local number = count > 0 and hl..sign..count.." " or ""
		local number = hl .. sign .. count .. " "
		lsp_details = lsp_details .. number
	end

	return lsp_details
end)()

require("staline").setup({
	defaults = {
		left_separator = " ",
		right_separator = " ",
		cool_symbol = " ", -- Change this to override defult OS icon.
		full_path = false,
		mod_symbol = "  ",
		lsp_client_symbol = " ",
		style = "slant",
		line_column = " Line %l/%L  col %c  %p%% ", -- `:h stl` to see all flags.
		fg = "white", -- Foreground text color.
		bg = "#3b0825", -- Default background is transparent.
		-- bd = "None",
		inactive_color = "#303030",
		inactive_bgcolor = "none",
		true_colors = true, -- true lsp colors.
		font_active = "bold", -- "bold", "italic", "bold,italic", etc
		branch_symbol = " ",
	},
	mode_colors = {
		n = "purple",
		i = "red",
		c = "#e27d60",
		v = "gray", -- etc..
	},
	mode_icons = {
		n = "Normal  ",
		i = "Insert  ",
		c = "Command  ",
		v = "Visual  ", -- etc..
	},
	sections = {
		left = { "- ", "-" .. lsp_signs, "-mode", " ", "branch" },
		mid = { "file_name" },
		right = { "cool_symbol", "lsp_name", "-line_column" },
	},
	special_table = {
		NvimTree = { "NvimTree", " " },
		packer = { "Packer", " " }, -- etc
	},
	lsp_symbols = {
		Error = " ",
		Info = " ",
		Warn = " ",
		Hint = " ",
	},
})
