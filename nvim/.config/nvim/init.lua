-- disable_built_ins
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
require("lazy-nvim")

-- general config loading

require("settings")
--require("packer-config")
require("keymaps")
require("autocmds")
require("color-config")
require("userFunctions")
