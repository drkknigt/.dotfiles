local utils = {}
local M = {}
function utils.is_empty(s)
	return s == nil or s == ""
end

function utils.get_buf_option(opt)
	local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
	if not status_ok then
		return nil
	else
		return buf_option
	end
end
local navic = require("nvim-navic")

vim.api.nvim_set_hl(0, "WinBarFilename", { fg = "gray" })
vim.api.nvim_set_hl(0, "WinBarContext", { fg = "gray" })

M.winbar_filetype_exclude = {
	"help",
	"startify",
	"dashboard",
	"packer",
	"neogitstatus",
	"NvimTree",
	"Trouble",
	"alpha",
	"lir",
	"Outline",
	"spectre_panel",
	"toggleterm",
}

local excludes = function()
	if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
		vim.opt_local.winbar = nil
		return true
	end
	return false
end

local function get_modified()
	if utils.get_buf_option("mod") then
		local mod = ""
		return mod .. " " .. "%*"
	end
	return "%*"
end

local function get_location()
	local location = navic.get_location()
	if not utils.is_empty(location) then
		return "%#WinBarContext#" .. ">" .. " " .. location .. "%*"
	end
	return ""
end

function M.get_winbar()
	if excludes() then
		return ""
	end
	if navic.is_available() then
		local fn = vim.fn
		local file_name, file_ext = fn.expand("%:t"), fn.expand("%:e")
		local icon, icon_color = require("nvim-web-devicons").get_icon_color(file_name, file_ext, { default = true })
		vim.api.nvim_set_hl(0, "WinBarSeparator", { fg = "gray" })
		local hl_group = "FileIconColor" .. file_ext
		vim.api.nvim_set_hl(0, hl_group, { fg = icon_color })
		return "%#"
			.. hl_group
			.. "#"
			.. "%="
			.. icon
			.. " "
			.. "%#WinBarSeparator#"
			.. "%t"
			.. " "
			.. get_modified()
			.. get_location()
			.. " "
			.. "%*"
	else
		return "%#WinBarSeparator#" .. "%=" .. " " .. get_modified() .. "%#WinBarSeparator#" .. " " .. "%*"
	end
end

return M
