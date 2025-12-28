--------------bootstrap lazy--------------------------

-- clone lazy nvim if not cloned already
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

-- opts for lazy
local opts = {
    performance = {
        cache = {
            enabled = true,
        },
        reset_packpath = true,
        rtp = {
            ---@type string[] list any plugins you want to disable here
            disabled_plugins = {
                "tohtml",
                "tutor",
                "ftplugin",
                "netrw",
                "netrwPlugin",
                "netrwSettings",
                "netrwFileHandlers",
                "gzip",
                "zip",
                "zipPlugin",
                "tar",
                "rplugin",
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
            },
        },
    },
}

-- load plugins to load/install
local plugins = require("Drkknght.Plugins.lazy-nvim.plugins")
vim.opt.rtp:prepend(lazypath)

-- setup lazy
require("lazy").setup(plugins, opts)
