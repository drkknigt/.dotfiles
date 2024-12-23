local api = vim.api
local color = "#ffffff"
local modes = {
	["n"] = "NORMAL 󱗆",
	["no"] = "NORMAL󱗆",
	["v"] = "VISUAL 󱊁",
	["V"] = "VISUAL LINE 󱊁",
	[""] = "VISUAL BLOCK 󱊁",
	["s"] = "SELECT 驪",
	["S"] = "SELECT LINE 驪",
	[""] = "SELECT BLOCK 驪",
	["i"] = "INSERT ",
	["ic"] = "INSERT ",
	["niI"] = "INSERT-NORMAL ",
	["R"] = "REPLACE ",
	["Rv"] = "VISUAL REPLACE ",
	["c"] = "COMMAND ",
	["cv"] = "VIM EX ",
	["ce"] = "EX ",
	["r"] = "PROMPT ",
	["rm"] = "MOAR",
	["r?"] = "CONFIRM ",
	["!"] = "SHELL ",
	["t"] = "TERMINAL ",
}

local file_types = {
	["Jaq"] = 1,
	["TelescopePrompt"] = 1,
	["oil"] = 1,
}

local function mode()
	local current_mode = vim.api.nvim_get_mode().mode
	return string.format(" %s  ", modes[current_mode]:upper())
end

-- local function update_mode_colors()
-- 	local current_mode = vim.api.nvim_get_mode().mode
-- 	local mode_color = "%#StatusLineAccent#"
-- 	if current_mode == "n" then
-- 		mode_color = "%#StatuslineNormal#"
-- 	elseif current_mode == "i" or current_mode == "ic" then
-- 		mode_color = "%#StatuslineInsert#"
-- 	elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
-- 		mode_color = "%#StatuslineVisual#"
-- 	elseif current_mode == "R" then
-- 		mode_color = "%#StatuslineReplace#"
-- 	elseif current_mode == "c" then
-- 		mode_color = "%#StatuslineCmdLine#"
-- 	elseif current_mode == "t" then
-- 		mode_color = "%#StatuslineTerminal#"
-- 	end
-- 	return mode_color
-- end

-- local function filepath()
-- 	local fpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h")
-- 	if fpath == "" or fpath == "." then
-- 		return " "
-- 	end
--
-- 	return string.format(" %%<%s/", fpath)
-- end

-- local function filename()
-- 	local fname = vim.fn.expand("%:t")
-- 	if fname == "" then
-- 		return ""
-- 	end
-- 	return fname .. " "
-- end

-- local function lsp()
-- 	local count = {}
-- 	local levels = {
-- 		errors = "Error",
-- 		warnings = "Warn",
-- 		info = "Info",
-- 		hints = "Hint",
-- 	}
--
-- 	for k, level in pairs(levels) do
-- 		count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
-- 	end
--
-- 	local errors = " %#statuslineError#: " .. count["errors"]
-- 	local warnings = " %#statuslineWarnings# " .. count["warnings"]
-- 	local hints = " %#statuslineHints# " .. count["hints"]
-- 	local info = " %#statuslineInfo# " .. count["info"]
-- 	-- return errors .. warnings .. hints .. info .. "%#Normal#"
-- 	return string.format("%s%s%s  %s%s", "%#diagnosticstatusline#", errors, warnings, info, hints)
-- end

local function file_type_icon()
	local file_type = vim.bo.filetype
	local icon = require("nvim-web-devicons").get_icon_by_filetype(file_type) or ""
	local icon = string.format("%s%s", "%#iconsstatusline#", icon)

	-- local icon = "%#iconsstatusline# %{WebDevIconsGetFileTypeSymbol()}"
	if file_types[file_type] ~= 1 then
		_, color = require("nvim-web-devicons").get_icon_color(file_type)
	end
	api.nvim_set_hl(0, "iconsstatusline", { bg = "Black", fg = color })
	local file_type = "%#filetypestatusline#" .. vim.bo.filetype
	return string.format(" %s %s ", icon, file_type)
end

local function lineinfo()
	return "%#statuslinecolinfo# %02p󰏰    %02l/%02L "
end

local function lspserver()
	local msg = "No Active Lsp"
	local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
	local clients = vim.lsp.get_clients()
	if next(clients) == nil then
		return string.format("  LSP: %s  ", msg)
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if client.name ~= "null-ls" and filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			-- return client.name
			return string.format("  LSP: %s  ", client.name)
		end
	end
	return string.format("  LSP: %s  ", msg)
end

local git_status = function()
	local git_info = vim.b.gitsigns_status_dict
	if not git_info or git_info.head == "" then
		return ""
	end
	local added = git_info.added and ("%#GitSignsAddstatus#: " .. git_info.added .. "  ") or ""
	local changed = git_info.changed and ("%#GitSignsChangestatus#: " .. git_info.changed .. "  ") or ""
	local removed = git_info.removed and ("%#GitSignsDeletestatus#: " .. git_info.removed .. "  ") or ""
	return table.concat({
		"%#GitStatusline#  ",
		git_info.head,
		"   ",
		added,
		removed,
		changed,
		" ",
	})
end

Statusline = {}

Statusline.current = function()
	local file_type = vim.bo.filetype
	local buf_type = vim.bo.buftype
	if file_type == "runner" or buf_type == "terminal" then
		return file_type or "empty"
	end
	return table.concat({
		-- update_mode_colors(),
		mode(),
		git_status(),
		"%r",
		"%#filenamestatus#",
		" %t ",
		"%m",
		"%=%#StatusLineExtra#",
		"%=",
		"%#lspstatusline#",
		lspserver(),
		file_type_icon(),
		lineinfo(),
		" %02c",
	})
end

return Statusline

-- vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, { command = "setlocal statusline=%!v:lua.Statusline.active()" })
