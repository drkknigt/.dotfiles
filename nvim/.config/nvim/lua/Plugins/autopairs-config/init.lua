-------------------------------- autopairs ----------------------------------------

-- setup config autopairs
require("nvim-autopairs").setup({
	check_ts = false,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		-- java = false,
	},
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
	fast_wrap = {
		map = "<C-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0, -- Offset from pattern match
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		manual_position = true,
		highlight = "Search",
		highlight_grey = "Comment",
	},
})

-- create autopairs on selecting item from cmp menu
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
