BUFFER_MAPPINGS = {
    {
        "<leader>bo",
        require("Drkknght.core.userFunctions").kill_buffers,
        desc = " Delete all buffers except current one",
        silent = true,
    },
    {
        "<leader>be",
        require("Drkknght.core.userFunctions").kill_empty,
        desc = "Delete all empty buffers",
        silent = true,
    },
    {
        "<leader>bb",
        ":RunTmux ",
        desc = "Run commands in tmux pane",
        silent = false,
    },
    {
        "<leader>bl",
        require("Drkknght.core.userFunctions").run_tmux_pane_lines,
        desc = "Run current lines under cursor in tmux pane",
        silent = true,
    },
    {

        "<leader>br",
        ":Compile ",
        desc = "Run commands in nvim vertical window",
        silent = false,
    },
    {
        "<C-k>",
        function()
            require("Drkknght.core.userFunctions").change_buffer("bnext")
        end,
        desc = "goto next buffer",
        silent = true,
    },
    {
        "<C-j>",
        function()
            require("Drkknght.core.userFunctions").change_buffer("bprevious")
        end,
        desc = "goto previous buffer",
        silent = true,
    },
}

return BUFFER_MAPPINGS
