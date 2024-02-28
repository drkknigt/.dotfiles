------------------------------------------- lua-line ------------------------------------------

-- setup lualine
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end
local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

--   git add
--   git mod
--   git remove
--   git ignore
--   git rename
--   error
--   info
--   question
--   warning
--   lightbulb

-- lualine options

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info", "hint" },

	symbols = { error = " ", warn = " ", info = "  ", hint = " " },
	-- symbols = { error = "  ", warn = "  " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local mode = {
	"mode",
	fmt = function(str)
		local dict = {}
		dict["NORMAL"] = "Normal 󱗆 "
		dict["INSERT"] = "Insert  "
		dict["VISUAL"] = "Visual 󱊁 "
		dict["COMAND"] = "Command  "
		return dict[str]
	end,
}
local lspserver = {
	"lspserver",
	fmt = function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if client.name ~= "null-ls" and filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = " LSP:",
	color = { fg = "#ffffff", gui = "bold" },
	gui = "bold",
}

local filetype = {
	"filetype",
	icons_enabled = true,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}
local fileformat = {
	"fileformat",
	icons_enabled = true,
	symbols = { unix = "" },
}

-- cool function for progress
local progress = function()
	local current_line = tostring(vim.fn.line("."))
	local total_lines = tostring(vim.fn.line("$"))
	-- local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	-- local line_ratio = current_line / total_lines
	-- local index = math.ceil(line_ratio * #chars)
	return string.format("%s %02d/%02d", "", current_line, total_lines)
	-- return chars[index]
end

local column_no = function()
	return string.format("%s %02d", "", tostring(vim.api.nvim_win_get_cursor(0)[2] + 1))
end

local spaces = function()
	return string.format(" %s %s", "{}", vim.api.nvim_buf_get_option(0, "shiftwidth"))
end

-- lualine setup main
lualine.setup({
	options = {
		icons_enabled = true,
		theme = "ayu_mirage",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "toggleterm", "oil" },
		always_divide_middle = true,
		-- globalstatus = true,
	},
	sections = {
		lualine_a = { branch, diagnostics, color = blue },
		lualine_b = { mode },
		lualine_c = {},
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { lspserver, diff, fileformat, spaces, "encoding", filetype },

		lualine_y = { column_no },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
