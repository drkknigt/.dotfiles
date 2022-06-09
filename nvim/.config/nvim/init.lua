-- disable_built_ins
vim.g.did_load_filetypes = 1
vim.g.do_filetype_lua = 1
local present, impatient = pcall(require, "impatient")
if present then
	impatient.enable_profile()
end
local disabled_built_ins = {
	"ftplugin",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
	"matchparen",
	"logiPat",
	"rrhelper",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

-- general config loading

require("settings")
require("packer-config")
if present then
	require("userFunctions")
	require("autocmds")
	--    require('color-config')
	require("keymaps")
	require("userPlugins")
end
