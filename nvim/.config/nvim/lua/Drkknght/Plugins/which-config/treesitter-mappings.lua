local TREESITTER_MAPPINGS = {
    -- selections
    {
        "af",
        function()
            require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "select / copy / delete outside function object"

    },

    {
        "if",
        function()
            require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "select / copy / delete inside function object"
    },
    {
        "ac",
        function()
            require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "select / copy / delete outside class object"
    },

    {
        "ic",
        function()
            require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "select / copy / delete inside class object"
    },
    {
        "ar",
        function()
            require "nvim-treesitter-textobjects.select".select_textobject("@loop.outer", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "select / copy / delete outside loop object"
    },
    {
        "ir",
        function()
            require "nvim-treesitter-textobjects.select".select_textobject("@loop.inner", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "select / copy / delete inside loop object"
    },
    {
        "aq",
        function()
            require "nvim-treesitter-textobjects.select".select_textobject("@conditional.outer", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "select / copy / delete outside conditional object"
    },
    {
        "iq",
        function()
            require "nvim-treesitter-textobjects.select".select_textobject("@conditional.inner", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "select / copy / delete inside conditional object"
    },
    {
        "aa",
        function()
            require "nvim-treesitter-textobjects.select".select_textobject("@parameter.outer", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "select / copy / delete outside parameter object"
    },
    {
        "ia",
        function()
            require "nvim-treesitter-textobjects.select".select_textobject("@parameter.inner", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "select / copy / delete inside parameter object"
    },

    -- swap objects
    {
        "<leader>an",
        function()
            require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
        end,
        mode = "n",
        desc = "swap next parameter inside function ( treesitter objects )"
    },
    {
        "<leader>ap",
        function()
            require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.inner"
        end,
        mode = "n",
        desc = "swap previous parameter inside function ( treesitter objects )"
    },
    {
        "<leader>aN",
        function()
            require("nvim-treesitter-textobjects.swap").swap_next "@parameter.outer"
        end,
        mode = "n",
        desc = "swap parameter with next parameter of next function ( treesitter objects )"
    },
    {
        "<leader>aP",
        function()
            require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.outer"
        end,
        mode = "n",
        desc = "swap parameter with previous parameter of next function ( treesitter objects )"
    },
    {
        "<leader>fn",
        function()
            require("nvim-treesitter-textobjects.swap").swap_next "@function.inner"
        end,
        mode = "n",
        desc = "swap  function code with next function inner ( treesitter objects )"
    },
    {
        "<leader>fp",
        function()
            require("nvim-treesitter-textobjects.swap").swap_previous "@function.inner"
        end,
        mode = "n",
        desc = "swap  function code with previous function inner ( treesitter objects )"
    },
    {
        "<leader>fN",
        function()
            require("nvim-treesitter-textobjects.swap").swap_next "@function.outer"
        end,
        mode = "n",
        desc = "swap  function with next function outer ( treesitter objects )"
    },
    {
        "<leader>fP",
        function()
            require("nvim-treesitter-textobjects.swap").swap_previous "@function.outer"
        end,
        mode = "n",
        desc = "swap  function with previous function outer ( treesitter objects )"
    },

    -- jumps

    {
        "]f",
        function()
            require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
        end,
        mode = "n",
        desc = "goto next function declaration start"
    },
    {
        "[f",
        function()
            require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
        end,
        mode = "n",
        desc = "goto previous function declration start"
    },
    {
        "<leader>nf",
        function()
            require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
        end,
        mode = "n",
        desc = "goto end of next function"
    },
    {
        "<leader>mf",
        function()
            require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
        end,
        mode = "n",
        desc = "goto end of previous function"
    },
    {
        "]c",
        function()
            require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
        end,
        mode = "n",
        desc = "goto next class"
    },
    {
        "[c",
        function()
            require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
        end,
        mode = "n",
        desc = "goto previous class"
    },
    {
        "<leader>nc",
        function()
            require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
        end,
        mode = "n",
        desc = "goto end of next class"
    },
    {
        "<leader>mc",
        function()
            require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
        end,
        mode = "n",
        desc = "goto end of previous class"
    },
    {
        "]q",
        function()
            require("nvim-treesitter-textobjects.move").goto_next_start("@conditional.outer", "textobjects")
        end,
        mode = "n",
        desc = "goto next conditional"
    },
    {
        "[q",
        function()
            require("nvim-treesitter-textobjects.move").goto_previous_start("@conditional.outer", "textobjects")
        end,
        mode = "n",
        desc = "goto previous conditional"
    },
    {
        "<leader>nq",
        function()
            require("nvim-treesitter-textobjects.move").goto_next_end("@conditional.outer", "textobjects")
        end,
        mode = "n",
        desc = "goto end of next conditional"
    },
    {
        "<leader>mq",
        function()
            require("nvim-treesitter-textobjects.move").goto_previous_end("@conditional.outer", "textobjects")
        end,
        mode = "n",
        desc = "goto end of previous conditional"
    },
    {
        "]r",
        function()
            require("nvim-treesitter-textobjects.move").goto_next_start("@loop.outer", "textobjects")
        end,
        mode = "n",
        desc = "goto next loop"
    },
    {
        "[r",
        function()
            require("nvim-treesitter-textobjects.move").goto_previous_start("@loop.outer", "textobjects")
        end,
        mode = "n",
        desc = "goto previous loop"
    },
    {
        "<leader>nr",
        function()
            require("nvim-treesitter-textobjects.move").goto_next_end("@loop.outer", "textobjects")
        end,
        mode = "n",
        desc = "goto end of next loop"
    },
    {
        "<leader>mr",
        function()
            require("nvim-treesitter-textobjects.move").goto_previous_end("@loop.outer", "textobjects")
        end,
        mode = "n",
        desc = "goto end of previous loop"
    },
    {
        "]s",
        function()
            require("nvim-treesitter-textobjects.move").goto_next_start("@statement.outer", "textobjects")
        end,
        mode = "n",
        desc = "goto next statement"
    },
    {
        "[s",
        function()
            require("nvim-treesitter-textobjects.move").goto_previous_start("@statement.outer", "textobjects")
        end,
        mode = "n",
        desc = "goto previous statement"
    },
    {
        "<leader>ns",
        function()
            require("nvim-treesitter-textobjects.move").goto_next_end("@statement.outer", "textobjects")
        end,
        mode = "n",
        desc = "goto end of next statement"
    },
    {
        "<leader>ms",
        function()
            require("nvim-treesitter-textobjects.move").goto_previous_end("@statement.outer", "textobjects")
        end,
        mode = "n",
        desc = "goto end of previous statement"
    }

}

return TREESITTER_MAPPINGS
