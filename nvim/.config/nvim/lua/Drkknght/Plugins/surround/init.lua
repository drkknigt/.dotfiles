-- local input = require("nvim-surround.input")
-- local functional = require("nvim-surround.functional")
--
-- local M = {}
--
-- ---@type user_options
require("nvim-surround").setup({
    keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "ys",
        -- normal_cur = "ysx",
        -- normal_line = "yss",
        normal_cur_line = "ySS",
        visual = "S",
        visual_line = "gS",
        delete = "ds",
        change = "cs",
        change_line = "cS",
    },
    surrounds = {
        ["("] = {
            add = { "( ", " )" },
        },
        [")"] = {
            add = { "(", ")" },
        },
        ["{"] = {
            add = { "{ ", " }" },
        },
        ["}"] = {
            add = { "{", "}" },
        },
        ["<"] = {
            add = { "< ", " >" },
        },
        [">"] = {
            add = { "<", ">" },
        },
        ["["] = {
            add = { "[ ", " ]" },
        },
        ["]"] = {
            add = { "[", "]" },
        },
        ["'"] = {
            add = { "'", "'" },
        },
        ['"'] = {
            add = { '"', '"' },
        },
        ["`"] = {
            add = { "`", "`" },
        },
        ["i"] = { -- TODO: Add find/delete/change functions
            add = function()
                local left_delimiter = M.get_input("Enter the left delimiter: ")
                local right_delimiter = left_delimiter and M.get_input("Enter the right delimiter: ")
                if right_delimiter then
                    return { { left_delimiter }, { right_delimiter } }
                end
            end,
        },
        ["t"] = {
            add = function()
                local user_input = M.get_input("Enter the HTML tag: ")
                if user_input then
                    local element = user_input:match("^<?([^%s>]*)")
                    local attributes = user_input:match("^<?[^%s>]*%s+(.-)>?$")

                    local open = attributes and element .. " " .. attributes or element
                    local close = element

                    return { { "<" .. open .. ">" }, { "</" .. close .. ">" } }
                end
            end,
        },
        ["T"] = {
            add = function()
                local user_input = M.get_input("Enter the HTML tag: ")
                if user_input then
                    local element = user_input:match("^<?([^%s>]*)")
                    local attributes = user_input:match("^<?[^%s>]*%s+(.-)>?$")

                    local open = attributes and element .. " " .. attributes or element
                    local close = element

                    return { { "<" .. open .. ">" }, { "</" .. close .. ">" } }
                end
            end,
        },
        ["f"] = {
            add = function()
                local result = M.get_input("Enter the function name: ")
                if result then
                    return { { result .. "(" }, { ")" } }
                end
            end,
        },
    },
    aliases = {
        ["a"] = "a",
        ["b"] = "b",
        ["B"] = "B",
        ["r"] = "r",
        ["q"] = "q",
        ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
    },
    highlight = {
        duration = 0,
    },
    move_cursor = "sticky",
})
