local map_func = vim.keymap.set
MISC_MAPPINGS = {
    { "<leader>p", group = "misc" },

    -- { "<leader>a", "<cmd>:ISwap<cr>",                                 desc = "swap variables in list or array or tables" }, -- swap variables in list or array,
    { "<leader>e", require("Drkknght.core.userFunctions").toggle_oil, desc = "Explorer" }, -- open file explorer
    {
        "<leader>r",
        function()
            require("Drkknght.core.userFunctions").code_runner("float")
        end,
        desc = "run code",
    }, -- run code
    {
        "<leader>,",
        require("Drkknght.core.userFunctions").open_previous_session,
        desc = "search Buffers",
    },
}

return MISC_MAPPINGS
