----------------------------------- treesitter ---------------------------------------
local nvim_treesitter = require("nvim-treesitter")
local installed_table = require("nvim-treesitter").get_installed()

local ensure_installed = {
    "vim",
    "python",
    "lua",
    "bash",
    "clojure",
    "go",
    "c",
    "html",
    "html_tags",
    "ecma",
    "css",
    "cpp",
    "typescript",
    "javascript",
    "jsx",
    "perl",
}


if #installed_table ~= #ensure_installed then
    nvim_treesitter.install(ensure_installed)
end

-- setup treesitter
nvim_treesitter.setup()


-- auto-tag
require('nvim-ts-autotag').setup({
    opts = {
        -- Defaults
        enable_close = true,          -- Auto close tags
        enable_rename = true,         -- Auto rename pairs of tags
        enable_close_on_slash = false -- Auto close on trailing </
    },
    -- Also override individual filetype configs, these take priority.
    -- Empty by default, useful if one of the "opts" global settings
    -- doesn't work well in a specific filetype
    per_filetype = {
        ["html"] = {
            enable_close = true
        },
        ["xml"] = {
            enable_close = true
        }
    }
})

-- local map = vim.api.nvim_set_keymap
-- map("n", "]w", ":lua require('ts-node-action').node_action()<cr>", { noremap = true, silent = true })
-- -- iswap
