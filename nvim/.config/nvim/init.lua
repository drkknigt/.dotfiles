-- basic files to load the editor config
require("Drkknght.Plugins.lazy-nvim")
require("Drkknght.core.settings")

-- lazy load config files
vim.api.nvim_create_autocmd('User', {
    pattern = 'VeryLazy',
    callback = function()
        require("Drkknght.core.autocmds")
        require("Drkknght.core.userFunctions")
        require("Drkknght.Plugins.neovide")
        require("Drkknght.core.keymaps")

        -- lazy load statusline and winbar
        vim.opt.statusline = require("Drkknght.core.userFunctions").get_winbar("status")
        vim.opt.winbar = require("Drkknght.core.userFunctions").get_winbar("global")
    end
})
