LAZY_MAPPINGS = {

    { "<leader>p",  group = "lazy-nvim" },
    {
        "<leader>pz",
        "<cmd>n ~/.config/nvim/lua/Drkknght/Plugins/lazy-nvim/plugins.lua<cr>",
        desc = "open plugin configs",
    },
    { "<leader>ps", "<cmd>luafile %<cr>",    desc = "source lua file" },
    { "<leader>pi", "<cmd>Lazy install<cr>", desc = "Lazy run install clean and update" },
    { "<leader>pu", "<cmd>Lazy update<cr>",  desc = "Lazy Update" },
    { "<leader>pc", "<cmd>Lazy clean<cr>",   desc = "Lazy-clean" },
    { "<leader>pp", "<cmd>Lazy home<cr>",    desc = "open lazy-nvim" },
    { "<leader>pt", "<cmd>StartupTime<cr>",  desc = "see startuptime for neovim" },
    {
        "<leader>pd",
        "<cmd>BrowseSnapshots<cr>",
        desc = "change directory to snapshot directory for laz in nvim/snapshots ",
    },
    {
        "<leader>pb",
        require("Drkknght.core.userFunctions").backup_lazy_fzf,
        desc = "backup lazy lock and restore lazy",
    },
    -- },
}

return LAZY_MAPPINGS
