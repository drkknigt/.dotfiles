------------------------------------ which-key ------------------------------------------

-- setup which key
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

-- whcich key opts
local setup = {
    preset = "modern",
    layout = {
        -- height = { min = 4, max = 25 },          -- min and max height of the columns
        -- width = { min = 20, max = 50 },          -- min and max width of the columns
        -- spacing = 3,                             -- spacing between columns
        -- align = "left",                          -- align columns left, center or right
        width = { min = 20 },
        spacing = 3,
    },
}


-- which key mappings
local mappings = {
    -- miscillaneous mappings
    require("Drkknght.Plugins.which-config.misc-mappings"),

    -- lazy package manager mappings
    require("Drkknght.Plugins.which-config.lazy-mappings"),

    -- git mappings
    require("Drkknght.Plugins.which-config.git-mappings"),

    -- quickfix mappings
    require("Drkknght.Plugins.which-config.quickfix-mappings"),

    -- lsp mappings
    require("Drkknght.Plugins.which-config.lsp-mappings"),

    -- telescope mappings
    require("Drkknght.Plugins.which-config.telescope-mappings"),

    -- fzf mappings
    require("Drkknght.Plugins.which-config.fzf-mappings"),

    -- terminal mappings
    require("Drkknght.Plugins.which-config.terminal-mappings"),

    -- debugging mappings
    require("Drkknght.Plugins.which-config.debugger-mappings"),

    -- buffer mappings
    require("Drkknght.Plugins.which-config.buffer-mappings"),

    --treesiutter mappings
    require("Drkknght.Plugins.which-config.treesitter-mappings")
}

-- call which key
which_key.setup(setup)
which_key.add(mappings)
